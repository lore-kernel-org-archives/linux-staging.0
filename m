Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6A318BA8
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 21:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843810; cv=none; b=d7mrFuLPR0dvANFl9XTAzjmT+xPyWrzH0IQQTDYzJiUyFavU15Lt+jYmW6jJgQHVtoy5Fe+CLziRKbz+vqrvJSQuEpp/cmpt47oj9NLzb2Pit/gOi0oK3C7Jx02W/j6OgAXhGZ8FOJmDx3pPc6pyQuAtSg+S81UbiB01Gr8cfUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843810; c=relaxed/simple;
	bh=sgd+UDMAR0xiVT2O1rRObZpg48pJIQQItcB4PQGG0bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oH2z3UmR8IdmQtsNtwey8X9SeSNhheAn0AWWf4agcZCNER6xQuNhZEYX89KzYIr0eQo7idq5+74JveZTZ8xfphzW7MkGAcFmvBr5ebGve+Qo6y4aayB5/EM67rVNupGcmZNVZyBPWBBB9+V8aECHqifEZ8wxeFXgyO8HuA5OgF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ep4bqy/y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ep4bqy/y"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472326ca506so796890f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 14:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784843807; x=1785448607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAi92VA2SD7K7c9DV5WSLgZJS336Z6mkG21G4rkyq80=;
        b=Ep4bqy/yAbz2nh/8g7uYLCToL3x1X+PbxMLRVR46ITakjkhRaIo70fjIMAi2B2uzPS
         Ecjba/LbRbNRJYyehS23yw3X0ta0b0Hi6ll10P8bX9huKOp/3RVwt2KlobgrSsyLVqHB
         1fKB7YQtdROEVr9ux0oqOGbIxVUPxjElUQoq7xA50eNUAI/t3ynYpI4qxz9r4bKwWhP7
         kqQlDGO91ZzVF0FAMI5DrkNCuySUJwYUvtMHwKKV84iAudoW8ytIm7v1Kaz29WjHahJj
         Fw+bUhp5uT3hC8ylKg59/1NRJcJXPy/LAd331snA8tkB+9f4ZBvTWkD/I//s8egP1PoX
         4CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784843807; x=1785448607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAi92VA2SD7K7c9DV5WSLgZJS336Z6mkG21G4rkyq80=;
        b=CIXNrIoCFvkKplw1hAcrdqFTpQ2xwJW+/xSoY+m91xMYghl6YNboXBfiKv3eWij3QZ
         fT+n5WH5Ssvj7yznlVauufnXTAD7P97U6AmGVZrc2Gc0Lv1PcPmpOoDs2Dd9hoNkWol+
         +u6wO5Hntjvg1bz3vX6FhnS6q0owMbPRCo+sCwTpAFrl1hND4/cVfEz8wBSmjLEwkHPU
         NvnOLkFDF3MLsXbZ6nFbMgDuctP/QWD85fGio/I6AhNlVhgbw5GFqxlxXlTtqxz6b3mr
         p9WNdcNVG14KPBgG4FchOgWzSKFVZVXnVSyNlKstTDnGbs8MgNCrKPyTDg1qB70r/yTw
         xu4Q==
X-Forwarded-Encrypted: i=1; AHgh+RopOUEHwlSnl8zgxqJtUVZk6xG70IY+TbeuD3f034GH9/mtMRk2gU7zngGpOX2ZSMV75Vl1rsD9neoIlMxj@lists.linux.dev
X-Gm-Message-State: AOJu0YziCxmBTP+P1CXGb4JPsqMsFzR19vFXIHBNW4yzw4NWOvd5OWbu
	Hb0pVcpMgxXq1poBtND5HFlHxKioWSD4SfCSHIkfDD7aCkk2ae8rUZq9vcxdeTr0
X-Gm-Gg: AR+sD13Rl75tPY5egTsMaO5Pa5rs/xn6yD9rLH2K8klsH8+n0eWaTBlF7P4EQDeI/pk
	A8A+txvfNeuUfbQp+eogLR3Ha+MqVZFDl9aKiUMSjaar3BispnF92m1CFqdgMPH4MH28NNB9BAj
	b+zG5y1UnN1umAQtyQSpS3J5wRuueGxJd1JKsxwb4omoeGR5+jmhAMJZ//pskgB6UuzqErA6o+1
	i0jwCl0ylPAXiS7Xxab3wO1anpXJd7VGyIf21Bu0N3X6Tlkp5AQJxwy+PEWnOACEtjnyqO49ZrB
	/URGB8wahUS9lG+r5Bep60tiDis6weikhvESdHH9Yg4M2N9EvttHb0dIQU9tYrjx7VQhOaifrXd
	ovBIbpaGQ5LSyQtmy+zJGeK6RfhTqox372FJNkyeRV+/fcGd0jE2wJuZRNrv/RTIFel/Lwad0fg
	lrxDuDZMw=
X-Received: by 2002:a05:600c:548a:b0:495:641a:fffe with SMTP id 5b1f17b1804b1-49573d20b86mr55776255e9.39.1784843806865;
        Thu, 23 Jul 2026 14:56:46 -0700 (PDT)
Received: from 192.168.122.229 ([115.187.36.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm19856884f8f.31.2026.07.23.14.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:56:46 -0700 (PDT)
From: Joyeta Modak <joyetamdk@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Joyeta Modak <joyetamdk@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager: add missing newline in sysfs_emit
Date: Fri, 24 Jul 2026 03:26:10 +0530
Message-ID: <20260723215610.700701-1-joyetamdk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs should return a newline at the end of the
output buffer. The missing '\n' is added to all
sysfs_emit() calls in audio_manager_module.c to
follow the sysfs convention in Documentation/
filesystems/sysfs.rst

Found using ./scripts/checkpatch.pl --strict

Signed-off-by: Joyeta Modak <joyetamdk@gmail.com>
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

