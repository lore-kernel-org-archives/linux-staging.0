Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D022FB8
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:37 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M27ix-1lkSfI0s0n-002WYR; Sat, 15 May 2021 21:11:21 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 12/20] staging: vchiq_arm: add blank line after declarations
Date: Sat, 15 May 2021 21:10:51 +0200
Message-Id: <1621105859-30215-13-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:d8cW/zaHdw8WWe82xCNrPlINalbsbIUTJNJPToH8NZUBLNDFJJc
 sVxNWz5KUoyhEzoKjjE0fuCEvSmxjNfD/jbQydmvFTMVDUJjBflWU7FUyhxrD7ugnX6n4O0
 WzzttMOEbEfSPL3sarKv5/xdX+Upiv7RgF5nxmM2KPHWPFIDgJD4rM91Vw4IPfVYt+rouLa
 zXz0Ax1OqIBkYJGXbJwOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p09y4zJ/jD0=:1p+V71hJmlPFLCoCzlrUeo
 WtrRfyApQ06y0osXvIKnwhKbtIIU2dhW4aAanxyDgl/GB36NjzSTiOTRcYT5oBs/gAKn3U82+
 DmR6RdW/deLv6zu7nsSIg8/P9ISw1cFjU9hb9zuwF8nZjOuLgsDdseZaYzyziEzxMpcPmWUZk
 USJftdZuMO9vGcdTcpkz/G0ThfEHiGnzybxaWHARBREa7sHZx7YRDrK8lmqo+ldKxQOW8qL0C
 x7/0rhcDtdoGYxY0/RLSVgFdbd9eMyzcN/uNAeB/yCzyK448bJGDXbI9KNS2CpMMRg3VO4f7F
 eGlpkwTtnMDxksA/CISqQ4u6Z/mdBKnHxj8FvN2IfEOI6cBrOMDRkNdzObv/yhwjtEZzkODi7
 S5OLk9EGXobg54XH5WaL7cGC5p/vmq0yKlPSQzFircu7f3tYuvpG/QD+jPVJlw4u+FB8AnvsA
 4Evoh4E2PwwtvyHfHtdHVmz6sXYqaCk1XTKMtBq0QJGi7Fe3SmXAcSt/kw32p7tc/EtXzwpS2
 cZ1I7jHPd14UEhAgUyVwu4=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Improve the readability by add a blank line after declarations. This
was found with checkpatch.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c     | 3 +++
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f2f948c..c08a950 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1019,6 +1019,7 @@ static inline int vchiq_get_user_ptr(void __user **buf, void __user *ubuf, int i
 	if (in_compat_syscall()) {
 		compat_uptr_t ptr32;
 		compat_uptr_t __user *uptr = ubuf;
+
 		ret = get_user(ptr32, uptr + index);
 		if (ret)
 			return ret;
@@ -1026,6 +1027,7 @@ static inline int vchiq_get_user_ptr(void __user **buf, void __user *ubuf, int i
 		*buf = compat_ptr(ptr32);
 	} else {
 		uintptr_t ptr, __user *uptr = ubuf;
+
 		ret = get_user(ptr, uptr + index);
 
 		if (ret)
@@ -1798,6 +1800,7 @@ static long
 vchiq_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = compat_ptr(arg);
+
 	switch (cmd) {
 	case VCHIQ_IOC_CREATE_SERVICE32:
 		return vchiq_compat_ioctl_create_service(file, cmd, argp);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index da550b6..8f3d9cb 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -35,6 +35,7 @@ static struct vchiq_debugfs_log_entry vchiq_debugfs_log_entries[] = {
 	{ "susp", &vchiq_susp_log_level },
 	{ "arm",  &vchiq_arm_log_level },
 };
+
 static int n_log_entries = ARRAY_SIZE(vchiq_debugfs_log_entries);
 
 static int debugfs_log_show(struct seq_file *f, void *offset)
-- 
2.7.4

