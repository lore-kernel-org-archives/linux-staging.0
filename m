Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4830C154
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900505; cv=none; b=G2+E21ApTglPzxjbDxp/G4ZQxQiDqPVwlIwHErFJt7ScqBsepOTfHJLsRL9SZr94gMUDzbV20Lwt4JHHmzQ8jSS5QqJZIuolcJgAbwW7/sGCOkG4YJstpfNONgRCH3W99fFLl38q7xIuUm4oYrmuVnjpKnI0e2iG0z4YWTtbbso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900505; c=relaxed/simple;
	bh=utmkuniuLpo18pWup44FYTVFklhk48jlZdlvxZ/GH/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7CbTM605uYpaNRkcseLtyy1r16cfMQV3yeGuFl6ChT2/ZhO8QulYcGqzsj6DxKIG28jeXPGjTTO4CN2KW61x2bVBU20ZRhtDvLRZas194regOv1k0+UIWuomb2L2YY5+WucHtexj7aj3NvqkRXtDd8Zdl98LNnKSdaSF9qcv9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/a8eby2; arc=none smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/a8eby2"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-39b131e4739so1847371fa.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900502; x=1783505302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ve87m66CbtYn0ME68VgYzOlZYR5ZxN2qfiIFruO9uTw=;
        b=U/a8eby2pXfHlG9QRNcrWZyiF0Yq5PAWZTalbYJpj6t/tq4+wh9NUyniSmqTFa2zfV
         7uiJQm7WzL1iYWdLX7Wg4xUyftdk1i3jtYklqHk2EcSadn1uVFi6SkU99vbP4dG+6SU9
         79r9s9YAly8YpIux84b9yAgMViGRtLM46Wwz1EPeX0qWC2Pc6WAodlgIG95e9+i0z0hQ
         VQssdiwI+sep253Qp3avL489o8/0/WU9RnBJcxs5JUSwtZKrvbVDYmq9MlwhRd7LWKOw
         k07mQaJMiXCn7qZChCnACMPv/MaHUGcRWwAbYxE8aXMehNwCrlHMPjRgl5TBEVjrkN5g
         aL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900502; x=1783505302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve87m66CbtYn0ME68VgYzOlZYR5ZxN2qfiIFruO9uTw=;
        b=UBTsvhDHuiJewruClYHkQAdIvkG2jSbCookqLHS8hvDG1Ge3QF1TqbiJg8Ir6MrGwP
         q/eCXapT/kdGawCT5N2h700udzFOO9a1RZuH04vFc4BR/JEYFwanQUYrZnRZMIVxBiog
         n9XBx0KqvG/FkFMW6xax0VvfG0ncJiIU1OMVy4etLpMMrjzCKQgskHd/5Lw6hloow/Ht
         jmN1fVKy0Lg67ZIUHTwek4lExos5frKa+k+i3xDJzMbrBJvM8Zqw2lPTK2HHkbtIP3Zt
         z/sg6T3CNEzu8Gxf8MsdcA5tAeJDjVwCu9hJVG9tKwsBvJkNkGuKR0KOhLTuk8daBDfM
         tJ2A==
X-Forwarded-Encrypted: i=1; AHgh+Rr6jnv5Da6XQiOTyJwY4JpkiP0nh6UgfzRwENszofH5DCJUObh8Oi4x1QKz7iFDhTGhIGF8ll9VuMrwiVIN@lists.linux.dev
X-Gm-Message-State: AOJu0YwM5rfvRTWyKZMcXRyph1xwVpLqizY/CVDGkCdZC8etz+9kNjiD
	dmnoc92Sblrh/1EGGMooYQ7Apu5M/txeOAmBVLqJy0hq6t6EEN5sfv+a
X-Gm-Gg: AfdE7cmgJC0pvC/SfyuqDbVAEj0gQV+APWZWNDwhPt2NOMkgAZ3cywRAoFoyOsD2xyO
	kpqHCP9hpSvx4reiHGCPViOUAGyvA7zlvPbyc3WaGixm9ldufzRugh1AIsNbu40I6GNefdWHZcS
	1JmiWyxTrM15ABGjV1FSg7mLI0MvraXBPMq1n/yq98GoMmeb46rg/2Hu4yKJHukElXqv3m6IGCj
	ZfPJzfMhhuS8EKK18f44oC5v1bdPbVcNIqPMhvlBbsfwMvDAB/PYvUIi8iMVyHUI7iR9gvTi39D
	vr1Z6mYj5Yot7FNmlyh2tb+s7bss6UPAquZbNTEHcLz23GMm9yEaNnglopVhXSIiDoEbbdCuDuZ
	Br1Zh7Oac0uoRxfkrnJIFgP728oFeHkudzs9MXb7UG9ryfuPkYVAhVhx/Dc2I7Dowo9jTyLyYI8
	HqV1fCf2lZ1+6g1RkZ3Oj1Lt/2k7FRQg==
X-Received: by 2002:a05:6512:6887:b0:5ae:c210:1a24 with SMTP id 2adb3069b0e04-5aec679794dmr154572e87.6.1782900502156;
        Wed, 01 Jul 2026 03:08:22 -0700 (PDT)
Received: from myhost.localdomain ([89.253.29.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe345d1bsm1168072e87.35.2026.07.01.03.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:08:21 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ruziev Miraly <miraly.dev@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager_module: add missing newlines to sysfs_emit
Date: Wed,  1 Jul 2026 15:08:14 +0500
Message-ID: <20260701100814.30509-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing terminating newlines to sysfs_emit() format strings
to comply with sysfs documentation and satisfy checkpatch.pl.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
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
2.54.0

