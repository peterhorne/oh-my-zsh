function stfu() {
    1=${1-staging}
    curl -X DELETE -d "environment=$1&user=capistrano" http://musicglue-hubot.herokuapp.com/hubot/deployments;
    echo "You can now deploy to $1 again";
}

function deploy-status() {
    php -r "\$envs = json_decode(file_get_contents('http://musicglue-hubot.herokuapp.com/hubot/deployments'), true); if(empty(\$envs)) { echo \"No-one is currently deploying\\n\"; } else { foreach (\$envs as \$env) { echo \"{\$env['user']} is deploying to {\$env['env']}\\n\"; } }"
}
