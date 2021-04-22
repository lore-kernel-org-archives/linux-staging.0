Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7DC2F83
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:08:49 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MbizQ-1l4Bcx3tS2-00dBtZ; Thu, 22 Apr 2021 22:08:38 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 00/10] staging: vchiq_arm: address TODO list
Date: Thu, 22 Apr 2021 22:07:46 +0200
Message-Id: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:T2QNCZZ2NkA+SAZCeehAE2Gp6u/HdEgMFL9wIE94fltreLPUhKx
 jM1OvIaFVx0aaP8zdHm+dXPEyX/L8Zhn5quUO47URwL0yy5MMUszIkFX5oYUM9RZHiW9H/u
 y1f0LTCBxqB88BqKLNbjKBsrSKvEmPh55joQM7++xU4EXdfMRntTuWgL6knhkHaKP0gID/v
 hKAqz5v6jA7bctaQ7Jyxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c7ZqFm9J1is=:DRn21kaPxdOwZqWUZ/dvkr
 58VvJuiHn/ocNF0b3ezDnfGB7teqPPg6+yRslk57JjhRry8zT8SjFL9xU2hKK2WdNjpl63OEk
 V+TJLTFbjgOB1SU3yn51zGA3uGee+yVfLwwn4Nr9zYuyLbWgBf+U+Jyhn7+RG4Byx1zQmhEKJ
 wQXyuPQCDBNc5yCsgSz/OEHB4F+pPo1zdht14jnag2zLU3+K+ZTVH68f83eSShnuqLKv4Rnlg
 vcjrRK6PrCEh/bS1asEGpi4dr3yFU/dPqriJKgjswSNiBB8jl9v4b5cMPGXb09l5tPrq8cWQ+
 xh5ijWyVxlEqmwpPGj0aZAQNTwLYoBB/z5cLcq5sdj91ZYC3Q+1v+5CHNpWACrhs9JALHRDAt
 94szHz1ZFgLc3h+ccdVLSYEY6TJwBBY2w9Cr8UCKcO/2sp8SbVhh5YhWnRnGC9+c/Gmv7rW+N
 t4hny2DKVipNpN6KpDqMuwj7/gbt4fu02/wWT/ntqLqw+TuE9Im+QIZT4tviT4WDM9ruR+Jvx
 CybO2F98d99kxbB0RAOpVE=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series mostly addresses the following points from the TODO list:
- Get rid of custom function return values
- Reformat core code with more sane indentations

Additionally this addresses some issues reported by checkpatch.pl 

Stefan Wahren (10):
  staging: vchiq_arm: avoid crashing the kernel
  staging: vchiq_core: break early in vchiq_close_service_internal
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

