Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A19168
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:02:59 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MNL2Y-1mwwHW2AkU-00OqMQ; Sun, 23 Jan 2022 21:02:52 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 02/18] staging: vchiq_debugfs: get the rid of n_log_entries
Date: Sun, 23 Jan 2022 21:02:07 +0100
Message-Id: <1642968143-19281-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:iAoH8h2sd2KgIjy8Iz5Mxm8pSP3/8b1K5aAA4tJjOq2CkhZA6Z8
 OejshRZCEl7C+ETmGd7CbvNIakJDWtnlHms3KlRjwi0RnnO9OkWse515BlVizr2kZAWqF3m
 kECkZuwT7Y+O5Jc7IsLxcKuNidQAUbr38FDsZ1Mj5fUJR/GJ4Bn9JezQtMjjlDwRhpDa915
 pFoAIOAc/ROixPKtbB7Qw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lP3cfYczJfg=:1QIx6gzOysaLi+V7xH2PN0
 rcREJmpO4LJ0BGFqRTgGmfrWvjmalbJ4ZfX7Ktd6DRXtqFj8wy3fy3JFcKq/utgX9/teCcO8H
 AO6BYBSDJGC5fwLsK+CntodA7pxNuZkuEaqLIp3ulE/hzfu3MZw96WSPtcU3c3bTBizINtBpx
 KAJy2GQlAUandy2w8uVT9tJtyJs1HmWCAf/BiiR9c/2yXm3WNyKd1w3875b4z2SAFWOsw+vzu
 yMHtIhzT35pl+meZG2SkmhmkLVX8yxBqt/mfgF/XjH6BysdqiiMmNcW6zeFv4TjA915/10mYD
 Zvvnz5BwXIR0CPAUfERQGM3fOxWlXS3CYu7TDTyUG9UOs8T2cLs3vmwr5c9HaE+QxizOnmMTK
 Re9oH8buGkPwcvnY84pDjTditKNG92lV0YJmKwo43fWoFxoRY6nUP2Kvw9KnvQZ8iyha998y0
 TDS46jBmVWHTxs7G/VwX3M1FHuefEfQWiQjgfORHKp2Q1v3HdHIvUfCXEjCNPbgT63dXEmKX7
 6sxgUE4DDART/4IJHwexLVS6AbZTCfCiOdcIbv/whOsJQzPLlkzJsUGzoVDjgFCJ1XK4bYdtN
 HnAunzDAsJfSsNuLgqoeSON7XdH/grjuEJYZmuakRNSjQS9Ti9e2yQnLXpPHjtVg0ZVMkk3El
 Ldhf76/nPVDSiGYcDa4vV+l0G92OzzNCRmo1rPJnbzoQig0mqwvA1DiIh9+Zk9dglaDW0Yfve
 2DOLhxtR7txkkZnN
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There is no need for this static variable, so use the macro directly.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index 8f3d9cb..dc667af 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -36,8 +36,6 @@ static struct vchiq_debugfs_log_entry vchiq_debugfs_log_entries[] = {
 	{ "arm",  &vchiq_arm_log_level },
 };
 
-static int n_log_entries = ARRAY_SIZE(vchiq_debugfs_log_entries);
-
 static int debugfs_log_show(struct seq_file *f, void *offset)
 {
 	int *levp = f->private;
@@ -216,7 +214,7 @@ void vchiq_debugfs_init(void)
 	/* create an entry under <debugfs>/vchiq/log for each log category */
 	dir = debugfs_create_dir("log", vchiq_dbg_dir);
 
-	for (i = 0; i < n_log_entries; i++)
+	for (i = 0; i < ARRAY_SIZE(vchiq_debugfs_log_entries); i++)
 		debugfs_create_file(vchiq_debugfs_log_entries[i].name, 0644,
 				    dir, vchiq_debugfs_log_entries[i].plevel,
 				    &debugfs_log_fops);
-- 
2.7.4

