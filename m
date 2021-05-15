Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE952FB4
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:23 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQ5aw-1m42mU3HLE-00M7sU; Sat, 15 May 2021 21:11:18 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 00/20] staging: vchiq_arm: more code clean-up
Date: Sat, 15 May 2021 21:10:39 +0200
Message-Id: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:qJOmVOr30YEDrd59c2zFUWiy9ehWyj5sMTAuBHkqvBuFmHOhSQT
 icALD7s6h5wuNjAOmv2Nh+mJYAA5lgyQEkgBsibf371ysd222vcRNagY3XUBh4827zwygVx
 VhxMB9yngXxjQahW7qZb6M/Kh4t1n3gFyElvbw33fFJrtHZoaNAdQ5RxG4m2s2LPkr2bwrh
 YGKs8gX4g/1l2KjBpo3kA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TBUkR6gmz+o=:N4Q5Qo0s89786oTixHVNOW
 O4SOSVXj4J2NFYC7B1Ycfw3/QsUoYEsusn+KkYwZ6Q3P7Ae86GxSDHrvYWk876lBSfTG3vdZ/
 xQ0Pi1GYH0KEQ29ZEZ1SJG8CwOK5LZ4PKwyBrJBSTU2Um9TaEtCDTQYSz3hxfbGnnI1c7G9Rw
 FgJqXK2geR50hq5kI5/hNJOvKzgzWNzSYdQpHTdEIpJYyIgyya/6T9vpY20jpM6BZ8i2icXgv
 pFS3bBebgEf9H2pkNf+8cF0q8yA3Ux19IbAA32cdMcAHbjESGa/Dqsd1uTfJSGmBv8ydPQwVJ
 6DCadrnmfweIKLyRoOYh6b+iGUnkinSqefkwjaXziMJZhYNLREc77u4d2y08KCwI7RHR72Gdi
 GoiN0wZIAR3CFktdnACWRnaRC7xeRhxhPPAa6LPplaA6OADokl9rbwHr2xrwwN9BZr1UTunZR
 U0kIgRZ+XQ/uuGVxwDsEzzukUZ8lNPu3miUwOLcIZTK7Iaaekf3dPVCYRkHPtLTDqWrm5UYxm
 fumtHuyVj+oNWHI0LZWbX8=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series mostly addresses the code readability. Additionally it contains
a follow-up patch for a change from my last series.

Stefan Wahren (20):
  staging: vchiq_core: fix return type of vchiq_init_state
  staging: vchiq_core: drop unnecessary release_count
  staging: vchiq_core: separate postfix increment
  staging: vc04_services: remove __VCCOREVER__
  staging: vchiq_arm: balance braces for if-else statements
  staging: vchiq_core: introduce poll_services_of_group
  staging: vchiq_core: avoid indention in poll_services_of_group
  staging: vchiq_arm: Use define for doorbell irq
  staging: vchiq_arm: drop ftrace-like logging
  staging: vchiq_arm: Prefer kzalloc(sizeof(*waiter)...)
  staging: vchiq_arm: drop non-beneficial comments
  staging: vchiq_arm: add blank line after declarations
  staging: vchiq_arm: re-arrange function header
  staging: vchiq_core: reduce indention in release_service_messages
  staging: vchiq_core: fix comment in vchiq_shutdown_internal
  staging: vchiq_arm: make vchiq_shutdown_internal return void
  staging: vchiq_arm: Avoid unnecessary line breaks
  staging: vchiq_core: introduce parse_message
  staging: vchiq_core: introduce defines for close_recvd
  staging: vchiq_core: introduce defines for retry_poll

 drivers/staging/vc04_services/Makefile             |   2 +-
 .../interface/vchiq_arm/vchiq_2835_arm.c           |   4 +-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 175 ++--
 .../interface/vchiq_arm/vchiq_connected.h          |   8 -
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 897 +++++++++++----------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |   2 +-
 .../interface/vchiq_arm/vchiq_debugfs.c            |   6 +-
 7 files changed, 513 insertions(+), 581 deletions(-)

-- 
2.7.4

