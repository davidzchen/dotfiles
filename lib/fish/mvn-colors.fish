
# Wrapper function for Maven's mvn command.
function mvn
	# Filter mvn output using sed
	command mvn $argv | \
	    sed -e "s/\(\[INFO\]\ \-.*\)/$TEXT_BLUE$BOLD\1/g" \
                -e "s/\(\[INFO\]\ \[.*\)/$RESET_FORMATTING$BOLD\1$RESET_FORMATTING/g" \
                -e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/$BOLD$TEXT_GREEN\1$RESET_FORMATTING/g" \
                -e "s/\(\[WARNING\].*\)/$BOLD$TEXT_YELLOW\1$RESET_FORMATTING/g" \
                -e "s/\(\[ERROR\].*\)/$BOLD$TEXT_RED\1$RESET_FORMATTING/g" \
                -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/$BOLD$TEXT_GREEN Tests run: \1$RESET_FORMATTING, Failures: $BOLD$TEXT_RED\2$RESET_FORMATTING, Errors: $BOLD$TEXT_RED\3$RESET_FORMATTING, Skipped: $BOLD$TEXT_YELLOW\4$RESET_FORMATTING/g"

	# Make sure formatting is reset
	echo -ne $RESET_FORMATTING
end

set -x MAVEN_OPTS "-Xmx512m -XX:MaxPermSize=128m"
