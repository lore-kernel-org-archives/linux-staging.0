Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4F72
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:39 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N0WPK-1lMPOG0NhE-00wVMy; Sun, 25 Apr 2021 12:51:28 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 00/11] staging: vchiq_arm: address TODO list
Date: Sun, 25 Apr 2021 12:50:52 +0200
Message-Id: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:mzONbrdr3TRmVHuScGQSy/GUXxPa9co+kNNV8PmSI+VAY677MIU
 pNn85rlGw58brp358TxO1p/9JJ/6oYHnu6shX6pMScWpjZDw4u9TGK0uqpdMRw5T4wYOOPI
 2YUrqirUNQuimhuFrp7VJ8OoQEEmZTjGwKMjjI1wvXFfSmU+TU6bH+rL2ZcbiUhxxXUZ/0T
 N5yFXDs9dUCNXQSxbIaQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+GwnbLyeBvQ=:vPaRwCirUjn57oGHot2GCz
 sqcOCgEUeiyp1+u24M/bM8ZPKAIUoa29bjdgJFqcsLRPb+mShz9PH2ul5l6tdWb51I5ErHeK5
 naQfCKJASncAekuK9eVovT/D1shQiOk9taXuF0RA3xTmbNOy9FXf/PnDpapBlh04VyWc2JZDQ
 fatgx8f2IiUrV1Ye2dPOZEFl20W60HEw3qhxjAbj9jhosWyxbR4kILSB4UR4DhszECYFPAmfN
 /6iIJ3MvlNFgZRRQDMh6luNF08COdwfZWhYdvPHrzAEnVGeLqnYefpwzxaNo9EI8pSv/iwqw6
 sCJ/IDZ1TH2pQ4MOrE9h8ktxa6zJoPQrDLx/1k4i2TO3Ft0LszBZhyEQ6jufAJfuvc+Xyp+Uy
 djYTbs9FvdriIw6H32LZ7MOUDOvPKYqP0hwX4oEhlEj8bCeH2Me/mE0Zb3P75jhqySAqNp43D
 IiDhnqGPMZT9nCtYnkaKx0iAYza4jlmxJ4HZE9ydEzZqxlm77SBAZiORtsXRlIMAiyz6/aQvR
 z0zP/BIL1uKMj8WNXWVICE=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series mostly addresses the following points from the TODO list:
- Get rid of custom function return values
- Reformat core code with more sane indentations

Additionally this addresses some issues reported by checkpatch.pl 

Changes in V2:
- move unrelated changes in patch 2 into separate one (found by Fabio)
- change default error to EINVAL for vchiq_set_service_option (found by Nicolas)

Stefan Wahren (11):
  staging: vchiq_arm: avoid crashing the kernel
  staging: vchiq_core: break early in vchiq_close_service_internal
  staging: vchiq_core: return early in do_abort_bulks
  staging: vchiq_core: introduce get_bulk_reason
  staging: vchiq_core: Drop unnecessary check in notify_bulks
  staging: vchiq_arm: drop return value of vchiq_arm_init_state
  staging: vchiq_2835_arm: drop enum vchiq_status
  staging: vchiq_arm: drop enum vchiq_status from vchiq_*_internal
  staging: vchiq_core: drop vchiq_status from vchiq_set_service_option
  staging: vchiq_core: drop vchiq_status from vchiq_initialise
  staging: vchiq_core: drop vchiq_status from vchiq_init_state

 .../interface/vchiq_arm/vchiq_2835_arm.c           |  23 ++-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |  75 ++++----
 .../vc04_services/interface/vchiq_arm/vchiq_arm.h  |   2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 191 +++++++++++----------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |  12 +-
 5 files changed, 158 insertions(+), 145 deletions(-)

-- 
2.7.4

