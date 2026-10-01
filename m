Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F305335A4
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889304; cv=none; b=kVYf8t1OILtFVrfMC5r5mdCFFCTlpA1i+pqWXTTvaUeQSRfKPOym14Euy3IChiX7vgmIWKenbpZi6cQKu09yXikAhpgg5J5sGPtlGiz9PEl9yyArVbhLDmVr8uM1O5Xy0d2tufuaDr2PZtRL7Y9KbrGcb8LMyjxlDftO7/+Pg04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889304; c=relaxed/simple;
	bh=BlM4I36z6bhiXInG6xUzWTewHXmRYA9d2vHYlqTqc2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwpcMpJrv7pNG4ifiJM46e9zjKGK3c0ZpzSMCyPUv7TpbryP4vkZY581fZ4eyRwe6UR/r2gVKszO3fXJlTOXM3Isbm5ShWpyE/GB15/xgnZkbsInXwR3kRgfX8NmV7GswiKsRWpiltq623UdxwTZn3+t0VGKiBB6Y2436zSDM/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XA/jxNTm; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XA/jxNTm"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-149d5ec8e96so1794176c88.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 14:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790889302; x=1791494102; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZksoCsYbeBUOZimGQEpylXwSQkeR+dlL9oiy1lwzdCA=;
        b=XA/jxNTm9KJEl2pouNeDjTZXDxQlhT5t28Wx/qUS4wpa9sDb+e4Zo97Mflavx74X6b
         fBigcVFJ1FgCsc8KFQsDFetuRyHAS9sgLtIJk7Gg5+usXNgqmaKPKKDxEjvDJ7SfmzjB
         MML/3Gtj1/FxJLd7F1WsYlLyUZIER0jx3KjUuSyVwbqwCs/X8rp7J80UxaSIJBT5mehx
         +GQGV8x7/L/6cQp6zJsNLCj4h2hNfGlLQM5KiGQKZ9TbF3S8qwyIRBowgwSKpXiEEGmM
         vAlwTKgFEzYFjZVYw0qEnQS2tKAbwk67CoqoDstVC1FdtB7WSijG5a+18ibroFaHjPHv
         bW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889302; x=1791494102;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZksoCsYbeBUOZimGQEpylXwSQkeR+dlL9oiy1lwzdCA=;
        b=qM0R/HegSci4fmwcSsUibFe6u43GtO+HnkCokNMF6iBBEGJ4sxn1Ix6TvE1jru0vRz
         SX1VodqZSULuwdVO5sBsJ/YI6ClMVt1jrnHaNT5dOoIu3FNNpWGwbXOXKOj9HQ9FjQ1Y
         mBtecIjaLrTX6oCsJxhM1KUFdpqsKfY9TD86v4wa/UY31luhIat2/fKSEW5KvN31XdWO
         77F7gSRh5EKf+vWMH5KwYW/YCB52tWZ1hHyYPt2CSOkrXSrd8rVUn6Rq6Y3D4q0K9FX3
         rDl4GTEzniLBdxYNwvexJy+foToXGplXWI6wcjSOiCuaDgMmVXVJhsvE4/9zJuD3DOxt
         E5pA==
X-Forwarded-Encrypted: i=1; AKwUvBwmQI0k9cNIRkOwiF5fzzSXDO3iO2bx9xkv9jn5NQXVUokETi1W17rVD94l7OF15Zcl2SVOeeTL3ja3+Qf9@lists.linux.dev
X-Gm-Message-State: AFuF++nYlk+qhGV3yVjiOVMhRnKVG8xaRST2jHALdet/CoR5ODC7h5dq
	BfvZ+WXo4Ttl8cVj5Gm0HoXdc5nyBAcVjZpDda3B2Bi4lAmU4CT9G9enejRjQL5jWnMC8MDr
X-Gm-Gg: AYBFou0qI3i0h5w3+yKaqVjD79ZTt834BbTeOwBBZ+LvgEa8nhWChwy58ojEZBX6R+w
	NGhJmv+7fuUT6ryMW3UMHsiYAFtdRIlREaAKQQGTFWt8hEdHdjI8yiV6brzNOr8Usbk7J8G40Mx
	QtDNjN4ClVdTeLArGPYoEuAHuX5ZG99h7fcUUdqiQhlc677qiUuov0nP2Rpkwrw3TQavCQRQHV5
	xgGvJLtma8d33j67Rad9i7sxvZYn5cyGATJK2bSt3GLqpZneJ9r0DEa8u2nALZcy1YhfKC8zA5Y
	ayZfoXxw2SZ80VuSMyhCiu+/mdeZ6K1BlCCaSqQbvS4s0B2LxBsMtP+9rmmWaBeIvedtq4uHaP3
	srgi6sA2cUeZAqD+HqJKRZFj01pOz1scPh30QceIE3Ef6Pu8z0dXr2vlnX+OTq7ctz6JiQvsS9K
	MTGGU7OazVnVwBsT48Gcc+c0wRfcMELWKpFQOI3bxEwhlNYV6TLTU=
X-Received: by 2002:a05:701b:420c:20b0:143:5266:48ee with SMTP id a92af1059eb24-14f5d1b790bmr474903c88.42.1790889300697;
        Thu, 01 Oct 2026 14:15:00 -0700 (PDT)
Received: from arlo ([72.235.71.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm925268eec.1.2026.10.01.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 14:15:00 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:14:58 -1000
From: Raiden Horner <raidenhornerdev@gmail.com>
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: audio: Fix no terminating newline in sysfs
 emit
Message-ID: <ar7NUjfCOwtHRTuv@arlo>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Terminating newlines added to adhere kernel coding standards
and reduce noise when debugging with checkpatch.

Reported by checkpatch:

WARNING: SYSFS_EMIT: return sysfs_emit(...) formats should include a terminating newline

Signed-off-by: Raiden Horner <raidenhornerdev@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..98b12b77aa9f 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -158,7 +158,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
+	char * const envp[] = {
 		name_string,
 		vid_string,
 		pid_string,
-- 
2.47.3

