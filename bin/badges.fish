#!/usr/bin/env fish

if [ -n "$GLAPT" ]
  set -l latest_tag_badge_id "97740"

  set -l latest_tag (string trim (curl --silent --compressed --request GET "https://gitlab.com/api/v4/projects/"$CI_PROJECT_ID"/repository/tags?order_by=name&sort=desc" | jq -Mcr '[.[]  | .name] | map(select(startswith("v"))) | .[0]'))

  echo "Latest tag: $latest_tag"

  if [ -n "$latest_tag" ]
    set -l image_url "https://img.shields.io/badge/latest-"$latest_tag"-informational?style=flat-square"
    set -l tag_branch_url "https://gitlab.com/%{project_path}/tree/$latest_tag"

    curl --request PUT \
      --compressed \
      --header "PRIVATE-TOKEN: "$GLAPT \
      --data-urlencode "id="$CI_PROJECT_ID \
      --data-urlencode "badge_id="$latest_tag_badge_id \
      --data-urlencode "link_url="$tag_branch_url \
      --data-urlencode "image_url="$image_url \
      "https://gitlab.com/api/v4/projects/"$CI_PROJECT_ID"/badges/"$latest_tag_badge_id \
      | jq
  else
    echo "Nothing to do for now."
  end
else
  echo "Nothing to do for now."
end
