Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF633C09ED
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 07:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765373; cv=none; b=dHJRwaYUP9v7/d/nsfvSUG4mM/WU+MBTI9cSSl5oYhxO+C/6rDrCLKuoZ0NdpBKtuLzqh7FjI4R6+8OX50rniUssKrMbefqoPnOVkBpWm7YNXOghDRGLMIOwdhMbjmRN3BcKsDwNrKylA5nvZc6P9mNE9OgHUqCxIhS5aJOCLpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765373; c=relaxed/simple;
	bh=3rf8WCArGfJnJ5YqNTKjZyWh5tuPcbn/lII/ch9ILbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DNy4bQ5sOqTbxUosozCbAfpuJmPrJ1+LJcvB7x3B6F5CgQXpDFRR59Yuhb8aCXCFAqWTw5jbgjQ1ddSWpqkbv14ZtJP2t+mwKFSUxXBmuxIdkT+ziFFyDDeHg/GQBRuUfAJH8EZokR4OqVWX2PEffcubnrKZPCTrLYSxKGqpBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pniQAdgj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pniQAdgj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so1850058f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788765366; x=1789370166; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tGILImqdihdoegOmNJ3w6PKKrtUiUtdllHhJypF5GI=;
        b=pniQAdgjv9zIIy4Mtypq6Ma6I5Z+s1dFeohxL8eZXfremDuIpPvzsEkUJ4SDiB5UtY
         hJk0UsCZOiyw4y3n/AgS1IgfGgiYPnC6W5XWqYCV0htQUFImcNNLrm6VeGalMYS5qt9z
         bmU0Mh9kDNgBG9mfKu2EsZLFA2LN85wHQKpNPtQgnQ1vEOKBciuKvXrcpLBV7R4Cth87
         AF71G5+wP3hhJkV3vs07p3ZGuRexbgdGBQ2EuBdYZ2oHvOnEqCP/ipI9ypJDN1rS2ZOz
         bLstLfjuUmqV2Rd2P4fPIDtTmxta1N8lPs8dMu13wI5vYEaiWJUbTSEQOwW4AkAAbVkl
         XlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765366; x=1789370166;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1tGILImqdihdoegOmNJ3w6PKKrtUiUtdllHhJypF5GI=;
        b=tWZ8D8bnN1cKlOIo6kpBIO9MUmKLQEaVut8hb0KqLHgb7F92Q1tCM/kLyfCtZ/+fz0
         WebHV1aZ0tuA0W2jcbsCELrdWIRNA0dBmtjl9nPvc5kEHwdth2b81C03K1461W0jcCeT
         gsCjhj+kNgRxxrsp/MS0Z8AwgZL3ihw+LQ2SkV39yesEaaRCMNjfalo388Hq/ObQEFcC
         B5kwCs5e9hH1Gm56eDBHrh2mVh2NGp5bsByCmCOrD2qllgSTUBfJpqOjwQk6DY85AvHL
         6tlyChOYp4O2BJrsJs8yORLBtzbRoUtrT35wUTAUL7HYqY+eJkmVnWKtmP3mEh3sBsuq
         kXyQ==
X-Gm-Message-State: AFuF++kd9CL5ylT56fyAMi0UWRq8QvFYTBEUPpXUowGGHUr1OXUk+X5S
	SOarLuVwWjJGw7ooF8jNSZOfoxq4WI/b0nW3fBZbApdumeTQPoVrNtDmhuZfQxl5cdHpiCqy
X-Gm-Gg: AYBFou16UIyAF5Iln3P8WK0usoJ/J+NuhsKUSRGoEN/Oo3dWpMKReRn058Z/ODtANi6
	nVrK+DoqXSJghplptPW8nbxir+/pWqoUZXla/KJ6XYzawGO+uC2U07NjQ71+2/K5YKagVzyjuuR
	gxEd9RjwhG9RG4OZcg5xQhw/cP53n0crblTT0ST03mjQvWGI+T/8BD6Cp/N+HMkz5DTMzZXXdU6
	zGxJQNq3mlWlOv+qxfBdx+3j5VPL2KRt6u78vV5JcUEWx2s45U5maTNseULpe2oID3baYlBQkLB
	wuShd8aid7ZdFzD3gV//Zd0njOj/BSmFIaic2vx2Hpt9+18qt79D//ys6vamX96L6jjPqNGztNc
	GiP/LUtIfoSMOH/TOYwYLPMcZVXgUUYGFJAZB8hieofZJ7OaZXMSNgUmYn7E8rCkKDa4tWcAp+3
	VnUYIOqBxKenkSXPZKe4kHgFG8kZxArpZWdTSfaP8FhSdq2b4xXk/QLnVjnDLyrsxYGOgE1Haz6
	swrfUil8S+9uAsaoBr/5+w4mlfntue1gwjcCqo=
X-Received: by 2002:a5d:59c9:0:b0:485:8420:26d with SMTP id ffacd0b85a97d-48587057223mr41470378f8f.8.1788765365778;
        Mon, 07 Sep 2026 00:16:05 -0700 (PDT)
Received: from nixos.tail6917ec.ts.net ([95.15.165.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm25175989f8f.3.2026.09.07.00.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:16:05 -0700 (PDT)
From: tuxdevv <denizgozen61@gmail.com>
To: linux-staging@lists.linux.dev
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Deniz=20G=C3=B6zen?= <denizgozen61@gmail.com>
Subject: [PATCH] staging: greybus: fix missing newline in sysfs_emit() format strings
Date: Mon,  7 Sep 2026 10:15:25 +0300
Message-ID: <20260907071525.43505-1-denizgozen61@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Deniz Gözen <denizgozen61@gmail.com>

The show functions for the audio module's name, vid, pid, intf_id,
ip_devices and op_devices sysfs attributes pass format strings to
sysfs_emit() without a trailing newline. Per sysfs conventions each
attribute should return content terminated by '\n', and checkpatch.pl
flags all six calls as missing the terminator.

Add the missing '\n' to each format string.

Signed-off-by: Deniz Gözen <denizgozen61@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2..5737f2a32 100644
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
2.55.0

