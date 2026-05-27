Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD853B8127
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779916479; cv=none; b=qrS8zH4nVBKMmMzZlCadnaTPevjl3D0T1KjjXMQQCnQOi3h84+HhOo5cOxEoZToh95PoJMsjRNU4arVBEQn7KDfob1LU0Cvx59lzKpsqlNKptnWK3qXYLCQATw8RWMrZ2xOD6vnZVSIe0GgeH7NHYTpYsTiR0Jmhn4X/qs6ECbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779916479; c=relaxed/simple;
	bh=MVFXmjQsFKUFFqrx1qrfysx+EGOFN57ApxSniif0aAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pv2mG3cbo+Nbo1I/kPqp5elo0uHRbKDugy9ACX0L8i578Y6xv+p425N5Uwg1MUYwcO0NQv7g6vIE1LaZDyDDQUJh99xvhI7J5gUkHEZSbHoQ825j2AH6pzGiF89bOtc2oFcRC4UzOjOGBTMxWpA+lIQS9lV+YgJq4nZMaaiYrgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eW0nWUK+; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW0nWUK+"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-57516e08474so9101125e0c.3
        for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 14:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779916477; x=1780521277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Dju1WH+MAUl5DfrttmQ/rdSD2W+/yKAwSuBJTV89aM=;
        b=eW0nWUK+TUcQDhxYL3ElYFlR+yjB5b0JWUvPKtV5IqojIu7bdDnjR3ttQhI7q78jKJ
         fnKitIoFB3BEqCq+SWs/qr2B2AluDa8Wprm/rMaKXGFbNGJ628FtB201WlWIvHgq3meQ
         Z9y+GdJMI0jdLv8Fku0XIyH1HH17CxpUiLu7Hjw1mzrW5vTsf9XOMGbJ0uX3hyknUT4D
         G6XlHnU3CscgBmzIXeKqK/f3+Pt/kYAfNKzOCwx8HFyAYqDZo0a19bYjQ02PTJ7bWHV/
         9zr6okhUmul0OQaBdTkV33Q5mUHDIpXvsCw5MZJGJB94aqKg70wXluBKA7JSsMl6oWBK
         v8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779916477; x=1780521277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Dju1WH+MAUl5DfrttmQ/rdSD2W+/yKAwSuBJTV89aM=;
        b=pcDr7Ft5GQuRaOjSPiYOy95j56YS+dtgCVX20w75enjRGGYa+PiyHbEsgBAPHTHDrK
         BqYtJKFhTon4X87ufq/ha4rLHrIYk+JCOjVtNW9sMf4qIauY+Sg2BhQ5qL7WcKCS1GZY
         bzrc4xhRfwCauhd7ow9+KMxZXR/kCV+cdl1IEx/jr3M1c83jSwPElhP9eX1QXXn1Dpv/
         Dl7+ZNWEtNI92UpOOLX4tkjxZXktMIint9gr/4bazUNMcbWp5pD7tQHrNV3jIFs2Zp4M
         CoiwcH9QZ9A79OMSstyr64rIHMt8uz5WDuH8hRTGUhQBwvcrrePU6wJAnRGNb90er97u
         VKWA==
X-Forwarded-Encrypted: i=1; AFNElJ/tKmYjYdPZrrzdKIjDSKjanDIUTRLSsiTZpW8V0Mahbn5HaWox/5Cx1gr7s3QKx8eQFGqTj6HsU592bq17@lists.linux.dev
X-Gm-Message-State: AOJu0YwTwLSXIljX5mh79hMLEUieTh1rsFl8bIGiS5R63ZN9Kf1b99u2
	wbkS3EBEf7n8fTm0U9CNg3h9PoPIBvcD15d1khr/pTVj2j93Dlj4onrX
X-Gm-Gg: Acq92OH1+swR6om02LB22q5MF+z8aIjaRTGDRvw+nZJUna//tAAbP74HLZ9IjpGjDjm
	RGJjmMq+lR4BRcVoPCVdfoPVWpjzayNRgYaSU0T72qjS0Bcw5SFYPVBpNOpjTFQXnpsMRssT0F0
	elhrhlBUriseEr7kK4iTEaMF3vJ0ogV1w9aFmdXK0lhbD59RmivHglCc1g1JVDmRwkO7VrQq3Iq
	bHgwUuccC2knRMkSHwAAzdhGxJrYzJUN5uOaB9W03NgZU1vIog75osctnmqOUDoYJ13row02C5u
	L8aclSL16gr6TJ8L/6R40d8gNTTUhRABTqFPvZv0FfhjVHZ37d6MU/8j4LKE6F52IIzhdfyoe2S
	JKErCLKTiYqjZvB+OKt5RcBNcMRwKjfMiioINIt/Dz8CIxe0dzuFoJJgzMhnFocr0R6cOfoBaj9
	dfr/zir3BMRFI/0y8aGuyHLDb5zfEcNAR9w607xj/eTfisiy1y5BkxuuCsnKRhfCMERo5iO6t+T
	AJWr/1zozOcDG50QwPIFD0=
X-Received: by 2002:a05:6122:320f:b0:575:352f:ead0 with SMTP id 71dfb90a1353d-5865fcf8663mr14015375e0c.6.1779916477301;
        Wed, 27 May 2026 14:14:37 -0700 (PDT)
Received: from VitalNet.localdomain (186.232.16.162.vitalnetprovedor.com.br. [186.232.16.162])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9638fe279aesm763183241.6.2026.05.27.14.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:14:36 -0700 (PDT)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH] vme_user: tighten slave window bounds and validate offsets
Date: Wed, 27 May 2026 18:14:24 -0300
Message-ID: <20260527211425.569038-1-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Limit slave read/write operations to the allocated buffer size to
prevent out-of-bounds access when a slave window is
configured larger than its buffer.
Treat zero-sized windows and invalid file positions as errors,
and reject VME_SET_SLAVE requests that exceed the slave buffer.
This makes the user access driver more robust and avoids
silent EOF on invalid offsets.

Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 11e25c2f6..ca65cb57c 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -181,6 +181,7 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
 	unsigned int minor = iminor(file_inode(file));
 	ssize_t retval;
 	size_t image_size;
+	size_t max_size;

 	if (minor == CONTROL_MINOR)
 		return 0;
@@ -189,16 +190,24 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,

 	/* XXX Do we *really* want this helper - we can use vme_*_get ? */
 	image_size = vme_get_size(image[minor].resource);
+	if (!image_size) {
+		mutex_unlock(&image[minor].mutex);
+		return -EINVAL;
+	}
+
+	max_size = image_size;
+	if (type[minor] == SLAVE_MINOR && max_size > image[minor].size_buf)
+		max_size = image[minor].size_buf;

 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if ((*ppos < 0) || (*ppos >= max_size)) {
 		mutex_unlock(&image[minor].mutex);
-		return 0;
+		return -EINVAL;
 	}

 	/* Ensure not reading past end of the image */
-	if (*ppos + count > image_size)
-		count = image_size - *ppos;
+	if (*ppos + count > max_size)
+		count = max_size - *ppos;

 	switch (type[minor]) {
 	case MASTER_MINOR:
@@ -224,6 +233,7 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
 	unsigned int minor = iminor(file_inode(file));
 	ssize_t retval;
 	size_t image_size;
+	size_t max_size;

 	if (minor == CONTROL_MINOR)
 		return 0;
@@ -231,16 +241,24 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
 	mutex_lock(&image[minor].mutex);

 	image_size = vme_get_size(image[minor].resource);
+	if (!image_size) {
+		mutex_unlock(&image[minor].mutex);
+		return -EINVAL;
+	}
+
+	max_size = image_size;
+	if (type[minor] == SLAVE_MINOR && max_size > image[minor].size_buf)
+		max_size = image[minor].size_buf;

 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if ((*ppos < 0) || (*ppos >= max_size)) {
 		mutex_unlock(&image[minor].mutex);
-		return 0;
+		return -EINVAL;
 	}

 	/* Ensure not reading past end of the image */
-	if (*ppos + count > image_size)
-		count = image_size - *ppos;
+	if (*ppos + count > max_size)
+		count = max_size - *ppos;

 	switch (type[minor]) {
 	case MASTER_MINOR:
@@ -394,6 +412,9 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
 				return -EFAULT;
 			}

+			if (slave.size > image[minor].size_buf)
+				return -EINVAL;
+
 			/* XXX	We do not want to push aspace, cycle and width
 			 *	to userspace as they are
 			 */
---
 drivers/staging/vme_user/vme_user.c | 37 ++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 11e25c2f6..ca65cb57c 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -181,6 +181,7 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
 	unsigned int minor = iminor(file_inode(file));
 	ssize_t retval;
 	size_t image_size;
+	size_t max_size;
 
 	if (minor == CONTROL_MINOR)
 		return 0;
@@ -189,16 +190,24 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
 
 	/* XXX Do we *really* want this helper - we can use vme_*_get ? */
 	image_size = vme_get_size(image[minor].resource);
+	if (!image_size) {
+		mutex_unlock(&image[minor].mutex);
+		return -EINVAL;
+	}
+
+	max_size = image_size;
+	if (type[minor] == SLAVE_MINOR && max_size > image[minor].size_buf)
+		max_size = image[minor].size_buf;
 
 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if ((*ppos < 0) || (*ppos >= max_size)) {
 		mutex_unlock(&image[minor].mutex);
-		return 0;
+		return -EINVAL;
 	}
 
 	/* Ensure not reading past end of the image */
-	if (*ppos + count > image_size)
-		count = image_size - *ppos;
+	if (*ppos + count > max_size)
+		count = max_size - *ppos;
 
 	switch (type[minor]) {
 	case MASTER_MINOR:
@@ -224,6 +233,7 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
 	unsigned int minor = iminor(file_inode(file));
 	ssize_t retval;
 	size_t image_size;
+	size_t max_size;
 
 	if (minor == CONTROL_MINOR)
 		return 0;
@@ -231,16 +241,24 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
 	mutex_lock(&image[minor].mutex);
 
 	image_size = vme_get_size(image[minor].resource);
+	if (!image_size) {
+		mutex_unlock(&image[minor].mutex);
+		return -EINVAL;
+	}
+
+	max_size = image_size;
+	if (type[minor] == SLAVE_MINOR && max_size > image[minor].size_buf)
+		max_size = image[minor].size_buf;
 
 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if ((*ppos < 0) || (*ppos >= max_size)) {
 		mutex_unlock(&image[minor].mutex);
-		return 0;
+		return -EINVAL;
 	}
 
 	/* Ensure not reading past end of the image */
-	if (*ppos + count > image_size)
-		count = image_size - *ppos;
+	if (*ppos + count > max_size)
+		count = max_size - *ppos;
 
 	switch (type[minor]) {
 	case MASTER_MINOR:
@@ -394,6 +412,9 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
 				return -EFAULT;
 			}
 
+			if (slave.size > image[minor].size_buf)
+				return -EINVAL;
+
 			/* XXX	We do not want to push aspace, cycle and width
 			 *	to userspace as they are
 			 */
-- 
2.53.0

