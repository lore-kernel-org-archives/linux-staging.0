Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B6423BD1D
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 01:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787447699; cv=none; b=AvdZc8mYl2p55ZPRrqFf8+yyB0js/BaWOTw5aS5eBOPINb95r2LjQMzmjw8oMcAEdvDjZX3M9Jag5NANAobgF0sXxtJh25t9wXcyjE5RJA9Cp/sdY4eziqlPr7jXeu3Yi/ZUU9bLyUxTaS2CXpiMS97NNwWITSeAkZTdwSnu7a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787447699; c=relaxed/simple;
	bh=tT4yBBQ3etUBJphKDsvz9pg87jTHp1Qblxy/JC33qJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKcq67w3WEPLADaQhbNOtWVgH9HOoFzTciz1Tn8LjPXXwXg298tTkCzSr/idrx8V51YQDJCid/KjyUEB+Df/WgrgRBsf5SuVihcBOPDB85A18P1qLM+m9j8++pmmSP+HYPaQuWIvGqSZzmcAhEYDhskqQUeR+dnFTed0k4EzWsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIEnZB7m; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIEnZB7m"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso2316208b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 18:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787447697; x=1788052497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=icfwprUEUanikdJMBWuOf1YPxovprj8GA3Z2Thb9FHc=;
        b=AIEnZB7mDjXqOhA/cwj6sIBfSjhzuinlhLFrQJo6iM4ZFLg1vnYFTRI3uPXoYZupVE
         QuLuUtuf9DfyV8kAbYAg/gLumk2fBu94i3wkNjbVxhEIO0L7EsxOUUXdFgl7DLOGgaB0
         +eCghlVe4igzfYAtCCeePngB223BS4TjiAtb0KlEyrrudZcThAZ38vTKuZ2Z5o8K+bba
         pi4YSnXhVgPZMoOJP9L0NOSyu6MiWfuN3//SOH8CDxZJwV18RP92EMMjTg6ulkeqkkCC
         /R8UZjQz7d3ERTbuSo6y00ZJRw1Cl15bTVAsyXYFU26C56QIpV638hUkSS+tnmk0wspI
         egWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787447697; x=1788052497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icfwprUEUanikdJMBWuOf1YPxovprj8GA3Z2Thb9FHc=;
        b=sFmlQohhlGL6evZ2kiPwNV427zkMgZOEf+NgCbZwXMxQLIMwZiEH6Bbpurmf2sJLmf
         NJZ8HRxgHwQVNqgwj+oV1Hfc5HNZH2RBTVwdLDKeMo7hvRqQ4mzemC8dBeWEWP2cEH8C
         ZC7cruqa9TXwVq5v0VXUuVawL1/WLmbWlRAoLImSu4nXb/u0+GfeCssQA/aV4YCYEFrp
         Hxy7aM3SINrW/qYvTONBYyxySAPNBSFXxbswXS8wHYOdbxyTJa+okV/HCLunOQkXeOkg
         xiIEdG6SY6x3ka69HEzfSlyjV/CdRRLM+k2MiZVLJh23mLfZyjLGd5fC70PYva7FBUYo
         JKhA==
X-Forwarded-Encrypted: i=1; AHgh+RppABECL1PVXlX1xsk5pPs7ysB1nIr+WEo85EEC1u1HKicm+EvKhxQWHWLoCoM12HDCd5Mk3qXb4P6QTQbO@lists.linux.dev
X-Gm-Message-State: AFuF++kMAJ9h/ENr58ZN5U8EBAdwxDBR/mc259xvw2rdUEaGxxKngc6r
	lkjsP0IGqCT3wEoU+NjvQVtof1ZDB3Zt0SrLN8ez8P9eYIkEag3corPz
X-Gm-Gg: AR+sD11zdDV/AO/DpjxLCq6UBoZRv8P6FdMKPXHrj14jjlKXGjr1JwQnVjbxGSPu1Sv
	sw5f5DOv5wUAxJbV/MEOy25Bu863XdkC3ItBcjWE79awBFUqB6uBxLcAaZ75LZXbdkeNwKxTKAu
	o1+OyEx0+UQPU5lr/Xnb5e8TMBgfSd151/X1ABEv2gb7kE3kr7GAD+DCaz1iUG/ploPY58AiaF7
	8Mx1l2jVeN8OlCbRpwHrA+ymd/J2iABY4roHL+F9Nw4dEAl069Jooc9CoIqX4qFvbJKO7oSgR08
	qeXMHQMctRZ9uLo1PhybtHPyBUtp5F0MUxR5Tcm/qKKzMq8FCI+wXFY8iNow7d2R+kuDg0phwUk
	N/Tmr4UeVSer9sa/kPErcvaxP/gsVRZQ9BoDgiK5C1G3ZhG/wP2Vo/+sOOMtOaDkkODD6vZjO5F
	ENqKH3WGWtNIUzI7RLA6Anw6OO/XYZL/vpBauZ6TYjxZLQf9g7ixjmwrdy/rhlqCyTuXvORVvFG
	sBq+7y7/JlqBkVc8VEw08XcOaGhjgy04j0LhuTH66VHAqrFdVPdlPc=
X-Received: by 2002:a05:6a00:c488:b0:852:131f:b9d2 with SMTP id d2e1a72fcca58-852131fbcccmr8492487b3a.2.1787447697323;
        Sat, 22 Aug 2026 18:14:57 -0700 (PDT)
Received: from kosugisouta-ThinkPad-X13-Gen-6 ([2409:11:3cc0:3700:3766:31a2:df7a:f8f3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef09489sm918903b3a.15.2026.08.22.18.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 18:14:56 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kosugi Souta <k.souta0926@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager: add missing newlines in sysfs show
Date: Sun, 23 Aug 2026 10:14:24 +0900
Message-ID: <20260823011424.30697-1-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs show functions should terminate output with a trailing
newline. Add the missing '\n' to the six show functions in
audio_manager_module.c.

Compile tested only.

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
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
2.53.0

