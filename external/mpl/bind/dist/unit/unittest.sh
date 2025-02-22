#!/bin/sh
KYUA=
UNITTESTS=tests
CMOCKA_MESSAGE_OUTPUT=TAP
export CMOCKA_MESSAGE_OUTPUT

status=0
if [ -n "${UNITTESTS}" ] && [ -f Kyuafile ]
then
	echo "S:unit:$(date)"
	echo "T:unit:1:A"
	echo "I: unit tests (using kyua)"
	${KYUA} -v parallelism="${TEST_PARALLEL_JOBS:-1}" --logfile kyua.log --loglevel debug test --results-file "${KYUA_RESULT:-NEW}"
	status=$?

	${KYUA} report --results-file "${KYUA_RESULT:-LATEST}"

	if [ "${status}" -eq "0" ]
	then
		rm -f kyua.log
		echo "R:PASS"
	else
		echo "R:FAIL"
	fi
	echo "E:unit:$(date)"
fi
exit ${status}
