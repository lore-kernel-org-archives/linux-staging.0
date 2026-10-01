Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD851614B
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858617; cv=none; b=MmP6T/PpovGn9nmRljhEbtD2cWeRVlbgSC77+VSjwd/tUR5UNUuA7fw91rF/V7GACGyivt53ymQCSGbsqBHnh6wwZbBOJSX0RaRjGfFn1gT8SSQNd93YgeVdTNPNJH/zfNgqOrc33q4c22H43mhjSrCuQWEWFDBYrfHz0JYzqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858617; c=relaxed/simple;
	bh=hgzVgbEXYAzSMccatg/97jlA6K+7oGBVssxvgLXE/68=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type; b=mI5SOwQGZLBvmNGwcOJHmmZckh0spqkARdyzE5zCkBgOS+CCJkogPM+lmCCSw8BxGtczp2klEWgvznsnuEmsukMIUSR5ngBW0Yx69riETvrCc2eifz7+Gu0KMhmBRaJsYJjVO6pfgThcNlVN2+VrxVTw9/Ta2sW76qsWMf9pUjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/lCqBcA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/lCqBcA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso29528205ad.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790858615; x=1791463415; darn=lists.linux.dev;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tvu2hRA4oyTYZwQUazHXBts8ApL9ik7R8u4heAAFKmg=;
        b=l/lCqBcAZ94B82Jr/Nhv8tHA6EnK4NuGpoBBMKBccP9sCKoB4nDw91mQbz6OGAXQyO
         XguIppR/3p0wIJ/noGGkX/NpFxVb9woi12e8rd4T5JvxeEomwowey2RN3u0WNsj8tJUg
         GVJjclibc44K1zY4XasQH0iuSwJjohfc0PZI/3D5/PFEqOkay/wMe2gMc+QmVudzOI5Q
         UXMxyDZjZEJrkuTrzYrpm3u/R0uGDhQr+ShmBnMX8RlUVK7PwBm+NDcbiqITvoqVOpe6
         koeC+YIpUM6QIAUfwLic4ssG2a1lCS8tKnUEnqFw4GR19yZbSfW9SJ7OBFhy7LM54pY8
         GiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858615; x=1791463415;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tvu2hRA4oyTYZwQUazHXBts8ApL9ik7R8u4heAAFKmg=;
        b=1SL62FOPJ9Bg9sBDDNvKeq0JMg+l7gaU1SF4s0ZQaxebjNNUbiMwvRbi/8o2sBNbXP
         J3Nqspo6fM6j5qycyTH7a+3stdngit2Y7kvrHZaCxf0CaxY9bUEhfjAEh/PKEc/U8c6h
         MxoxC6sJ6KCKD/8YNx8B7n95v8jLhsoR9fDIREgDUvKOdn8LatWC/gBvNyavJwgyV8Cb
         9IpNic+vW4gJFR4lLfxnwi080RjVb29TRJE48UAcYya31hQQOturkDRpM/Tfph6jdtg3
         P2AJRm4hWMcMIT3yOMSRUhUmghaGll7zAPWquGJ5OGCpSvpqvKmmlQN2OYhJn95gzhDz
         7YZA==
X-Forwarded-Encrypted: i=1; AKwUvBzjZ51QAY4t9cQ6wemZaaHp/CnXdJUwqEnLrNcBotsKIZ+cHmhJGkdRWMws/3X0VPwo7qxl74mdEa0ocxoL@lists.linux.dev
X-Gm-Message-State: AFq9FYLPBMtyPjhzrYIUjvRV/ZH7QMU029IYaLBdy7ZaigPVeky9Fi/M
	DwMEJp6oFiCDMJkycOJPlEK88ZaO3Khvci6CLfOGXSkeir21CcH1/aC/
X-Gm-Gg: AYBFou1VrI6vqpTXqsEGmb2anUzf7JO7dgkmnY9yNYaRkHnLOlDq/iADwkumubTn7s6
	oTj62baVq8ACok+HEtjiKAYftmfj9dqdqf4WhkyZJ6lifgk/ET+9S7wus6Xbxs7VZITPDr/oNZB
	uS3Ewcv+fJQ7VhWQnCpfcXGGcVpybAbIP6sNZDPctIsB+5JOppQDhge7n9yDRU4cbGMzGn8CFgP
	dIL1MEOpejwVBJm1auDWLLRfW9hnGvfWDdb9CDlO1rMoBXie87K6c90FKPowN5PM7an/1IJOV9Z
	Hn5QLBVqLKb3f0p/dV8iv/psAAXvWgd4xsCPIp9NT8nwnXu3KbDvNKqq9TCNMh3zYIug3Po0nUu
	2LODqB5BoVRlwmORKuh41WPSe59z4v4FH7NghXXOk0RO0D/pDGWT/MTAwIhnrsh+seVxCk2Jmah
	3akBeqoCyox74qqw8TPbZAmYoBtBI+LQkSz6j1fkIwwV/U9SKBdXW5qdK6D7sInWAmggz7lkvmo
	Nbtgw==
X-Received: by 2002:a17:902:c411:b0:2dd:ad74:6d16 with SMTP id d9443c01a7336-2e2e4a2c6c0mr33995985ad.28.1790858615041;
        Thu, 01 Oct 2026 05:43:35 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40e0:105d:d3e7:fb70:9cf0:37:32ba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099923dsm9899375ad.26.2026.10.01.05.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:43:28 -0700 (PDT)
Message-ID: <6abe5570.5b65f4c6.2632fe.6f95@mx.google.com>
Date: Thu, 01 Oct 2026 05:43:28 -0700 (PDT)
From: Ronit Gupta <ronitgupta138@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: audio_manager_module: Add missing newlines to sysfs_emit() formats
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
User-Agent: git-send-email/hermes-agent

According to Documentation/filesystems/sysfs.rst, sysfs attribute values
should terminate with a single newline character.

Add missing trailing '\n' characters to the format strings of all
sysfs_emit() calls in gb_audio_module_*_show() attribute callbacks.

Signed-off-by: Ronit Gupta <ronitgupta138@gmail.com>
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
2.43.0

