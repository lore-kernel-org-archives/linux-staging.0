Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053C83C2787
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646584; cv=none; b=qk+vcGN7XFIOA9RRCVMGFTZtTFWKw6qyH8j6Ehpp0Xge4Pt0iCgJfK7DuaxOmcp+kp+m9rzr5XwNKtkVrQhsr+pNGKeMAC87nyO1GbfG5A4ey8ORBwgZjBU8tVoQfqVpImpr82LMJ4zei5tRfty6bV7fYCbdEPKty2nSI6GsxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646584; c=relaxed/simple;
	bh=OI4NP/H5Tu98kAYcNthFp1AzOnt//uoeLqCrWwLp4CM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qf+oRtqaSb0ofmOfJVWzy1P0DCm1OAQZIXTeMkGeQdMJiNnNY3gTTTO36ZXTcOhP38dIdd3RHtOACA5/QhMPespFQ8AL5I6PWaQQvFqysgFviD1lkD2JRGWSjKoRw3Xh/9rMZxD6GSIXmD/EzKSfoTaFOM3aKG3EHsQe5nhX0hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Brg6tunU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Brg6tunU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so871563b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 07:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777646582; x=1778251382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO72bdGdZwejIJb7TOURovIvs6tmJN/3DIyI5HlYHnk=;
        b=Brg6tunUHz3w51A22kjgv1godj2CpmRvgDzdLov6gzz8NYvVh83Mldj6dUGSJkpJCp
         mPbXGN9gGqA1SpMOcXlT8ge71D/8LKrZwBnlxuLz4ODIhn+1SOa8w+9QGSfxA0r4zyQ2
         /ec8/ounGu/m1QdjVnhOkUke6VxyqMrg3nIKI+aILuEFaCO6NKMHXkoZ8BhOzOMylTyI
         HELJlyMJd9XFmCKimMn3ZU9+BAqgQOWsBzvLCYhmSs+ntocJnmB+SLaf+XFpBFW8TgsP
         3ePYmweGQX76+fG9b/kk/a5Ves4+LLhzx94XQk4B2+ALyLB9ASDN2W29cnwMtkOY/+9Q
         45gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777646582; x=1778251382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO72bdGdZwejIJb7TOURovIvs6tmJN/3DIyI5HlYHnk=;
        b=jUffnXENv9EFMVKE2C8EJbdJxtUkxp0Qt0kT8juv924EPz4K5uYKQrOkQn9+RxuJdd
         h5tyrcADAeWoGOaejO+1mUwHO6OnLBWc9AWGcplzFUOprah2HgE3LS7fu0BBYK+FLfNE
         yZgq617fhR0oK9m9ekFQlzgIsoD8ZT+NLDswGw1VIosDN6YTU3o+68JNy3F56bQ6gjB6
         xWmFHpi7e2/jJXtwbR5nugnAEgzD53y3seaXelMoHuBkWpxcAwMVTEQGESkku1Q3bJmT
         Xdwk9syW7Q0pFLDToeKXfROlj7lj0x+hNV47sGygAroDS8Z8jUWVKeu0/UUxGOnZf9Fy
         rP1A==
X-Forwarded-Encrypted: i=1; AFNElJ8MzwhpKD7rroKXN/C6ofUeKjY//vk1/UIsU+B4DILU8/hA9ecSGfmO3xud9lZEEu5wX/h0KFtC0+Y0jNb8@lists.linux.dev
X-Gm-Message-State: AOJu0YycAshMbPwr7FZ2mw85uXflNaUQxlhs6h4S1Htug4dyXJBN3tt/
	zvlze9R3RWz8Q42XVEdqKT8iuVq9TDsg57LUxzde7NvOPrFsnkJX99fv
X-Gm-Gg: AeBDiet1Gb0AaeJ78rVwScNXF2aESKxa89K3rPoqMaO3DOw9erYpD9aj4ool5EBmF6R
	1Ju7yiodNNBwheg2owThugCx04TVnnB3cCNOxgDzmFd37QSKx2fxHTfMHB2a+I3HfGILfRfEe2s
	QT1LPqqhBht7OibeeVpaMVum06quZ4yQA9D+xAvIh0R2fk6nAmm1wTqMXBNHRJ/D6ociJF7aHxm
	JDtI0xS2wtuoqK8vQKMQSfiazhJPugYD964YvFh8ztqgsp33KdiXjsb7jZiH6FZGP/pLYvORFVa
	C53x05qyxNOyNmX6sE6IziHyl2EpkmgPEXObf6sXe2/67kpF/JuKj8Tcgzda9qDNrBGHlX0J7bA
	NnbFAq4MPuspp4pIlWDnndYiI5oWa+lKKAeIOHl1hApOQWrDNA7+4Wc559uNdvRlU5q4m+S/N7i
	48Za4sYiQqSsUXMCzfRQs/p+/KXszh3mHPnw3mBMMrNcukHmceaWvu47MRnnUyUAxjLA1YuOImC
	cMsH5KCKpspv3mu6Bd1wmu8ufxYDav+Zfu71Biz9iOm
X-Received: by 2002:a05:6a00:391c:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-834fdcc4b03mr8472519b3a.46.1777646582202;
        Fri, 01 May 2026 07:43:02 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b5b921sm3498062b3a.54.2026.05.01.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:43:01 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH v2] staging: greybus:add missing newline in sysfs show() output
Date: Fri,  1 May 2026 20:12:08 +0530
Message-ID: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sysfs show() functions should return newline-terminated
strings.Add missing newline to sysfs_emit() format string.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
----
v2:
-Remove "no functional changes" from the description as per
Greg's feedback.
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
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
-- 
2.43.0

