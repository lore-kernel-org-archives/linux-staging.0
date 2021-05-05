Received: from h04.kommunity.net (h04.kommunity.net [138.201.86.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125B70
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 16:10:55 +0000 (UTC)
Received: from notebook.fritz.box (p4fc26c70.dip0.t-ipconnect.de [79.194.108.112])
	by h04.kommunity.net (Postfix) with ESMTPSA id 6326BF81A12;
	Wed,  5 May 2021 18:10:47 +0200 (CEST)
Authentication-Results: h04.kommunity.net;
	spf=pass (sender IP is 79.194.108.112) smtp.mailfrom=alec@vc-celle.de smtp.helo=notebook.fritz.box
Received-SPF: pass (h04.kommunity.net: connection is authenticated)
From: Alexander Vorwerk <alec@vc-celle.de>
To: gregkh@linuxfoundation.org
Cc: arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	christian@brauner.io,
	hridya@google.com,
	surenb@google.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexander Vorwerk <alec@vc-celle.de>
Subject: [PATCH] staging: android: make file_operations struct const
Date: Wed,  5 May 2021 18:10:15 +0200
Message-Id: <20210505161015.10278-1-alec@vc-celle.de>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Fix the following type of checkpatch warning:
"WARNING: struct file_operations should normally be const"

Signed-off-by: Alexander Vorwerk <alec@vc-celle.de>
---
 drivers/staging/android/ashmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index 8ee4320a5dc6..8ff2794b08e3 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
 
 static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	static struct file_operations vmfile_fops;
+	static const struct file_operations vmfile_fops;
 	struct ashmem_area *asma = file->private_data;
 	int ret = 0;
 
-- 
2.17.1

