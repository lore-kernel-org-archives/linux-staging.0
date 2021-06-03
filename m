Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9486D1B
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:53 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MPXxi-1m2UaA0VaU-00MZwY; Thu, 03 Jun 2021 17:50:48 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 00/16] staging: vchiq_arm: code clean-up part 3
Date: Thu,  3 Jun 2021 17:49:49 +0200
Message-Id: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:5cdF/Qke+QfuZTGGmQThpI7w+t7XkNhCKT+hGj39YWna9r0d+uy
 JHoQ6OQL0XMFsWlh3GWZAamEbr3NkphbA0w7tw1ghon3CKF5HJ9zixzS3gPb7m38GbVK3ir
 +oQp71t9ZyNP75nSSpVYFQtvS8u+BPbMAgqaOy1pT+YvSqjVOEXC71ELLKlL3JNFLnrzA3q
 vgazsMIvJTALSu+gZKDSw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WVR7tXwjNIE=:QgU1sPe8OCGyMrHbN/BJ9f
 eDOnLabhB+7Z9MRUONrjWd3DMvWqtaqvUvpwzNeAL7qkWJysKD6jv2en3e1XjASx1//smnnbD
 qa24RUjMw1vA9dcJRPw/auQUr4c2JnyfIAmx36BaZjhkEseXxzgfTL+lV0Pe85JqLTIBY3Xrz
 qc50LxQ/oxZvir2Qsdsq1+CT7FkSy1LB2t3lmKlkFrLQBGIAc+0o6tRVc1Tv8oZIwK9zYFsQZ
 O2yvX1TvTv6Z1GrIy/s47deBgCTHztMVZNr/L99xcIoRXd1KaR1TKdJ3mLsoupgMLCpwWH1wI
 8ZAnA1a5YXT6iF8IkG1ZsTsSwjDtVbPkFsjVewuMSsPQo9vdO/miubl2ascVuz/oUErDy43z4
 3Gwa2B4ArSWAc/azDB+7QFotuU6POJDf7nrqVmI5XZZ4FlwCTnNyZ/kz5ZBLcwj575aOv/Xh8
 EwsV0kQYdxmF17hmxiMbwDk6orkPJqRfYZHQiSSgr/4HyaTC3T+a4s/yAhUr42CijsuRKpEsX
 2hBu+Hd6DUPHxHjIpkl6rM=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series mostly addresses the code readability. Additionally it contains
a fix for a change from my last series.

Stefan Wahren (16):
  staging: vchiq_core: fix logic in poll_services_of_group
  staging: vchiq_arm: introduce free_bulk_waiter
  staging: vchiq_core: move internals to C source
  staging: vchiq_core: get the rid of IS_POW2
  staging: vchiq_core: get the rid of vchiq_static_assert
  staging: vchiq_core: put spaces around operators
  staging: vchiq_core: avoid precedence issues
  staging: vchiq_core: use define for message type shift
  staging: vchiq_core: introduce message specific make macros
  staging: vchiq_core: simplify WARN_ON conditions
  staging: vchiq_arm: tidy up service function naming
  staging: vchiq_core: introduce process_free_data_message
  staging: vchiq_core: reduce indentation in parse_open
  staging: vchiq_core: store message id in local variable
  staging: vchiq_connected: move EXPORT_SYMBOL below the right function
  staging: vchiq_core: introduce handle_poll

 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |  71 ++-
 .../interface/vchiq_arm/vchiq_connected.c          |   2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 606 ++++++++++++---------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |  79 +--
 4 files changed, 375 insertions(+), 383 deletions(-)

-- 
2.7.4

