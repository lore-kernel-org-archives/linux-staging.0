Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B811738F95E
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921736; cv=none; b=aRpf4e6FuTcXNrLe7cZZ7oNOSfRpGJ7bGKeiLbIeZl1jjbxrTbY7gUbVd28X7lwt3WsstMctZ7T8V+uONNGvh8srhaFCemoDR/JNApazs3pGZ3n2Ck1i9N7Fuu2/kTYHQHOdSqBUk2AY/hraGzWF/xHUnEv0gtur2jeM/tjUi0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921736; c=relaxed/simple;
	bh=JUiUzabyePhuSj+i+hRICxzD74qG7YCEqOwub/6eTkE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJuPDsrPdz0FhGtJhduPJfyrygKT757mclBJ0ZdrauBRAAaARqbU50E1lJxFZSPh3sDUGji3/Opp0zeTqDI46ts54E8E/0UqE3op2IiCFX0eR3uuvN/SO66CCuF3HhcsK+rv3CHe4xt/mGpreNCITJMGKku1HxX0Kbw69ks8pTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG+5DpiN; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG+5DpiN"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128d2e3074fso660418c88.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921735; x=1774526535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cx0qCYEgpEY0APyH3BW58E7QngJ1Y7p1bZt4MgX1Fjw=;
        b=mG+5DpiNGd532Bfw3NFOs4ZS+MI6BfP/tMDLInElhwaH8TmjMoLZ0lMYNExJq6C2Qr
         YoQZwhgnba6Gb3ywiX1ReiiSnsApT04UNyX+TBmU19AE3oCf0pcXBIU2JgiILwldrERB
         ADKEct0gP+yTCW4c+n2mKkMJYuzScrSQrmQmtOruFgUtd5F5+xTa7aIYJOmKxkgIOcX0
         TEJyMDW4EBwjkfRTLAKEgA0sVlulUUnPIrBgLWw4ZPWhrVECkA4W6yaG4wdr8YMN6ThE
         GyD+tpsXtwUi7hqLEszHM78a3TJlARC4L774d1WHcXyB5+LACggfUYVhxDwsuIoDeGv9
         FQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921735; x=1774526535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx0qCYEgpEY0APyH3BW58E7QngJ1Y7p1bZt4MgX1Fjw=;
        b=fPl9CI7ckEhJ3lSTKWmGYdlgH18x6XAltg+a3hHhTQ4WW+4UB9p3TqOh/PyfkJ6poM
         xmlzWd3JjpPyt6kXfdaEWoSCKzDQiuabdEZwPfITF0IBhWR2VTusCSh/ZTI7GULV6GZJ
         TIZjc6K6S+2RHCNZqZ7kUeTXYE392TbtakG+vMHLkN8BwpcxKjBnIgc82PHSf2pqeVl1
         sLUSoteZWBVuGY6EipLDgEUBbc9aGsu/mJVUhfTb/MOehhk7pWRgd7F/8d2a1vcJkZrd
         AA3EUjTkuDzudI8k6etQ2BbN7F8wzlZItpwmZ/w7OUBhYktwpAcdhoWhE3Dwqol8gSJl
         MkqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9sG+ouD0N7SvneMz5b415jUC4W7FUTsYeZb/WkBwvYste2Vv0b18mj7XHjF4HH5NwwJXDGUUOFqmVT/Co@lists.linux.dev
X-Gm-Message-State: AOJu0YxaZjv2daJQZcQOzPG2GWUFlY6w24GA9ukMztOSeb2XiMGoCoqP
	/NFbl0o/SeTnfDsPNSEuyQwdwhmOKhmnz17aCg0mOzkvSO+OrYIYM1sN
X-Gm-Gg: ATEYQzynMzLA4eCD9b9kXE41EEXbVOy0sbrm6A/YksdLTdCn7BJFmljoRPbIHwvslNi
	+hzLeBRMnotnRHNFgIQNIVtOyQQfQnC++kyIU3KJvBeSSq7suHUswue4QqmG3ZkIH0CTqqymSTl
	gmfa4fNCZwyxYPCGHFEq5PuEuid0fK0O+M0KSbpAM5nFwp3PVPrpApi/1BN6B5cKtOj4IjZ3AVL
	x0GVi9t0d1HPEkbWSw64LPHUALbPiMBSgU73hWd9cb6WXKcDWv1dS9nhM8BSGOU/w4nh01mTF43
	3OvVXrDRHrqeiSZquw0ZOzfKrHqi5/QDDXB4Sz8nrg8LzPEO5Qy6V54fhw56lA+kL0I+rSzdNQv
	1xlRpz8ZBA3rVNXBlLx5uERTGOkt85yXIqOZOeTlBAPZnoiJ833otZ4zPW6klwSWtd+SZVcrqnZ
	boJSpc9g51wptw8eyZpmctV5NIKHN2+09S
X-Received: by 2002:a05:7022:692:b0:128:d375:f1d4 with SMTP id a92af1059eb24-129a7160854mr3759174c88.28.1773921734412;
        Thu, 19 Mar 2026 05:02:14 -0700 (PDT)
Received: from localhost.localdomain ([149.102.251.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a7153051sm6311253c88.0.2026.03.19.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:02:13 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: audio: use sysfs_emit() in show functions
Date: Thu, 19 Mar 2026 12:02:01 +0000
Message-Id: <20260319120201.25210-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in all sysfs attribute show
functions. sysfs_emit() is aware of the sysfs buffer page size limit
and should be used instead of sprintf() for sysfs show callbacks to
prevent potential buffer overflows.

Also add the missing trailing newline to each output, which is the
standard convention for sysfs attributes.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index e87b82ca6..f22ee73eb 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sprintf(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.33.0

