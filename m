Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F5B2CA8
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:00 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M89XH-1nGO2i3ux1-005F0Z; Sun, 23 Jan 2022 21:02:52 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 00/18] staging: vchiq_arm: minor adjustments
Date: Sun, 23 Jan 2022 21:02:05 +0100
Message-Id: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:/ggID+UUVAnVbdvkOfY5Z/fij2BhtO1k/eetAfhZBwMGDXjbJyc
 xW8ZjnevdM+udQ2UfcxUAWL09C4Ky5BP9XmRmV4LNCw/KY/+v1ngjW+GPIUFDyccX9qn92/
 HklsGkZdIJQUW+EvKotNpRdvLI2JqhHJXJS5cOgSSQlCEGidYfE2/+/3Gw54Q0aAwkoJBCB
 YUk79ISxnbSTdmMnnykpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5dL0NeF8kjo=:M9c3YD6glIp78vADsBRYar
 xQWvI03EOy3XdHFHlBITyO/Oip+nAhEXE7dY8p3lUnaC0L88h/zJyLAOVcDL8pchDUySj1Rns
 /Gj6OPR/6v/AqDOlXMRaA5QB5GtyDmEql97iJxiuCYY4A/UFJgUVC1aXzL/FdDjyQwWY8dqgu
 u8x5ESeow4QHxbnQmY6FbanI+bVGJSC/ujwseQNRAy1GB560/CjffuxccFtX1Gyf92NPh2QmG
 6try3X5wQAXeX2WJR6K0Qn8lRaWfo0Ituco5UzrJN2onET17OYLMw2MMq7SLkJcgRL3alSwpx
 EjwQbEZvEGVkFoX92Ep5qvevyw5+CcFYyMRk8jT/36oYK2r2prmDWrwiGekG1ogC5CTW9v03n
 utcAZt5A2g22f2P96xKKklidR/1oLlyaPeUwOhlH2ad9O9Xu5w3Tm2R8JRE9yZcd3t2sP8BM3
 Y+hURNQRT9n2vgqWQ9IQsnKL1HLncB664Mcnloiv140wbgQqDYbF/peFQKowk8oUFafqP0U1B
 BJSS2a0JUYMlfseknQtT4KCo6Jw79lK9Doac2e1Qno1pXmeD4A7DBH3jcvcIPLO0FSF5kRg+t
 iC8pYe41f5xZiKyfVPzFJH6wJawuGT4e5DyqtpxPwCpgzK2wlO4mRt6QOm6kTgsM1GX4Bfop8
 dHDd22Za0TT+O9y2OgqgdIpPHgMUylPbr9Gtn7ql3k93TpGmDWZ0FMGMGR5jVb9qrEyyATvbq
 MeLmPOl1ty7u0zdo
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This is a loose collection of small adjustments to the VCHIQ code 
(mostly coding style, but also bugfixes).

Stefan Wahren (18):
  staging: vchiq_core: fix indentation in vchiq_log_dump_mem
  staging: vchiq_debugfs: get the rid of n_log_entries
  staging: vchiq_arm: introduce is_adjacent_block
  staging: vchiq: convert TODOs into unordered list
  staging: vchiq: drop completed tasks from TODO
  staging: vchiq: add message handling to TODO list
  staging: vchiq_core: fix type of parameter localport
  staging: vchiq_core: simplify vchiq_add_service_internal
  staging: vchiq_core: align return statements in msg_type_str
  staging: vchiq_core: drop prefix of vchiq_set_service_state
  staging: vchiq_core: reduce multi-line statements
  staging: vchiq_core: fix alignment
  staging: vchiq_core: avoid ternary operator for set_service_state
  staging: vchiq_core: use min_t macro
  staging: vchiq_arm: make vchiq_get_state return early
  staging: vchiq_arm: Avoid NULL ptr deref in
    vchiq_dump_platform_instances
  staging: vchiq_core: handle NULL result of find_service_by_handle
  staging: vchiq_dev: Avoid unnecessary alloc in
    vchiq_ioc_create_service

 drivers/staging/vc04_services/interface/TODO       |  56 +++------
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |  34 +++--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 137 +++++++++------------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |   2 +-
 .../interface/vchiq_arm/vchiq_debugfs.c            |   4 +-
 .../vc04_services/interface/vchiq_arm/vchiq_dev.c  |   7 +-
 6 files changed, 107 insertions(+), 133 deletions(-)

-- 
2.7.4

