Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03741862A
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379932; cv=none; b=s2+49cLBcqFswLaK/iOHR0oVWgLVzLqrDPfXVMD7sHsLUSGny8jvWuodjNaU1nAs4hsTG5t9isjx8eZHI8uqrSVVJ1rp2z1n2AJuSiPMMKGPU7+J0neAlDd6NFxjSC1UA58J+xiVWM0IBvhVc8iH5s1LHngs5LEyKn87QvVYtbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379932; c=relaxed/simple;
	bh=GCJhAe/J6VZ9Wv9LgjzUPMhOzz41QbSC3rZTbxdrdm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IwwJhybzKlD6c5rPQDfcrb8fdM5BKYri1trTJVCqkBKI8VqCFdBxRSyYo0Ny7G91Qz2H3Zd/E+cDdhfDPcKsb1+YPckRGuQ96s6YGyZIDrYd4UgZNgBxUI7tpghfeWGg0GqVaUwptomlsFRAT38xuG4B41zpsmxFrGMCINAMvD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7+iMaaS; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7+iMaaS"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-662bf1dab83so2490126d50.3
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782379930; x=1782984730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAlswXrpXqVa8xQmYn9npsXvvbYrfLYth35evUaV8k8=;
        b=V7+iMaaSNCqgjLZD0QPui27IK+W99fq25NRcE8ZDxAmuYtC16J1ozfuyMBxKNXGkXY
         uG0GIdXLsFDJx7Ph74FNcvw2T1OfyS+bXjHeoBO4NYkEzj1Qn8wHcW2NlmgpneV55hFL
         /a2BEMTW0u0WW0toNKKV5NjgPoyLRc7c2c9u0lnJD4xz26L1gMT6Da4P+q7619J4ex6N
         rK8YsrIsBr4kQ3hDDZTSOWxRrOlVCH+MKVdTYJAstmB/p36C3glZfYh2wmrDm0dh6TN2
         Ez637mfZLM38N5aeaWOxX/8oN2GfP5crMbdX65U273nuSGj1kXtwzBAVq7lzbSXcXr1h
         97/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379930; x=1782984730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAlswXrpXqVa8xQmYn9npsXvvbYrfLYth35evUaV8k8=;
        b=U8dYQIEJoC7Wsr7d0bd34apWOevxn6Gy9DuFcq8qwDaydD9yR4tYgN1QXu6mPSzo1v
         OQjWnEy27ZDBbaMDpekFwNwue4AJqfjMLgaOdjgOa8RIA4fE7nkagwxsmj9yHZjXDH4y
         VEQuGnelvw9FXoVHFkFckTGGe3sfNVslROi7Co06jZ55+huV4rfCBR6p0Nuff5uMmMdN
         Zp8n0WSOmiXqfAjTyqE4aVP+tCIysBrGMPDKEQrcx5+6dT8ZoTCNetLmrMcJQK0UHADh
         MPvrQ4/lIg2OJ2nIGopojCsWvI3dQSBPtL3e5OpiRJ+8TwcskaObaTxHL+D4oAMAjAj1
         q+sg==
X-Gm-Message-State: AOJu0YzqZ594ydxq/UDEI6OtcN4bndMa5cEEvgviK2zI2RD2GMeCW2k/
	mSZeOeEvGlFe/W8/96YV/i//qrWiDpUSDTd7Gj8idZ3JZnXInk/3pMqa
X-Gm-Gg: AfdE7ck8dCKTH5n22hN4cz6mk3bxQdRRReRwYeM9fvNrRxtE+pIwoS3H4QT6JxYL59/
	7kOknbfTRDiqISbuBkz72HHVQKFV1n3anKyAyeyNMkoQHK/E5UJhlW6Pr6X82muh0PQ/4XWzBYr
	2DAiOs1en0akjy1bytQWYOHyqWtN+T8OHbyVWOgcOWuvQ+novWlDgCJX87Ee8TbIMH4ojDnWawT
	yNURU6GgeM3HnZSFex/wAUpvef0Nvc3s+ymBcs0RQ75Swoh5Jl3kTuCmuRwwcqHN0xQCI3t4eD1
	YTWSt4zAFOx/RtSFt2Z94r7p4U2LebTzxPsmdfHhxuDL9BVYo0HzDGEWGiqtkXe9pVBEfkTnLbK
	PJL12vHsA29rkiWGmPiWeJuDUtZ45k8PqHyweINJvspr7CVcR6d+C0dStKo3Fu/1xGRvZvOxnAE
	3lGprYZFBD5E9Rd14t9Kk78fcViw==
X-Received: by 2002:a53:ac86:0:b0:663:1af9:a30d with SMTP id 956f58d0204a3-66487f924f1mr1360474d50.48.1782379929873;
        Thu, 25 Jun 2026 02:32:09 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f785f6bsm1134148d50.6.2026.06.25.02.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:32:09 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] staging: vme_user: bound slave windows to DMA buffers
Date: Thu, 25 Jun 2026 11:31:37 +0200
Message-ID: <20260625093137.6589-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vme_user allocates a fixed PCI_BUF_SIZE coherent DMA buffer for each
slave image, but VME_SET_SLAVE passes the user-supplied size to
vme_slave_set() unchanged. An enabled window larger than PCI_BUF_SIZE lets
the bridge expose DMA addresses beyond the allocation.

The character device read/write paths also derive their bounds from
vme_get_size(), so the oversized programmed window can make
buffer_to_user() and buffer_from_user() access past
image[minor].kern_buf.

Reject enabled slave windows that do not fit in the backing buffer and use
the same capped size for slave read/write/llseek bounds. Also convert the
read/write limit checks to subtraction-based form so offset + count cannot
wrap around the image size check.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/staging/vme_user/vme_user.c | 38 ++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 11e25c2f6..24d3c6ec3 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -175,11 +175,22 @@ static ssize_t buffer_from_user(unsigned int minor, const char __user *buf,
 	return count;
 }
 
+static size_t vme_user_get_image_size(unsigned int minor)
+{
+	size_t image_size = vme_get_size(image[minor].resource);
+
+	if (type[minor] == SLAVE_MINOR)
+		image_size = min_t(size_t, image_size, image[minor].size_buf);
+
+	return image_size;
+}
+
 static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
 			     loff_t *ppos)
 {
 	unsigned int minor = iminor(file_inode(file));
 	ssize_t retval;
+	size_t offset;
 	size_t image_size;
 
 	if (minor == CONTROL_MINOR)
@@ -188,17 +199,19 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
 	mutex_lock(&image[minor].mutex);
 
 	/* XXX Do we *really* want this helper - we can use vme_*_get ? */
-	image_size = vme_get_size(image[minor].resource);
+	image_size = vme_user_get_image_size(minor);
 
 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if ((*ppos < 0) || ((u64)*ppos >= image_size)) {
 		mutex_unlock(&image[minor].mutex);
 		return 0;
 	}
 
+	offset = *ppos;
+
 	/* Ensure not reading past end of the image */
-	if (*ppos + count > image_size)
-		count = image_size - *ppos;
+	if (count > image_size - offset)
+		count = image_size - offset;
 
 	switch (type[minor]) {
 	case MASTER_MINOR:
@@ -223,6 +236,7 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
 {
 	unsigned int minor = iminor(file_inode(file));
 	ssize_t retval;
+	size_t offset;
 	size_t image_size;
 
 	if (minor == CONTROL_MINOR)
@@ -230,17 +244,19 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
 
 	mutex_lock(&image[minor].mutex);
 
-	image_size = vme_get_size(image[minor].resource);
+	image_size = vme_user_get_image_size(minor);
 
 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if ((*ppos < 0) || ((u64)*ppos >= image_size)) {
 		mutex_unlock(&image[minor].mutex);
 		return 0;
 	}
 
+	offset = *ppos;
+
 	/* Ensure not reading past end of the image */
-	if (*ppos + count > image_size)
-		count = image_size - *ppos;
+	if (count > image_size - offset)
+		count = image_size - offset;
 
 	switch (type[minor]) {
 	case MASTER_MINOR:
@@ -271,7 +287,7 @@ static loff_t vme_user_llseek(struct file *file, loff_t off, int whence)
 	case MASTER_MINOR:
 	case SLAVE_MINOR:
 		mutex_lock(&image[minor].mutex);
-		image_size = vme_get_size(image[minor].resource);
+		image_size = vme_user_get_image_size(minor);
 		res = fixed_size_llseek(file, off, whence, image_size);
 		mutex_unlock(&image[minor].mutex);
 		return res;
@@ -394,6 +410,10 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
 				return -EFAULT;
 			}
 
+			if (slave.enable &&
+			    (!slave.size || slave.size > image[minor].size_buf))
+				return -EINVAL;
+
 			/* XXX	We do not want to push aspace, cycle and width
 			 *	to userspace as they are
 			 */
-- 
2.54.0

