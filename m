Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297998;
	b=goGfXNPK3zOi/Y9wVR6xqTcHUQt+NdGdK0ggLStFRElxK6OQoo7G/DdZc9Vuld9VGB2Q
	 9uFpVjp2N+4W5Nx6HVs62DeOQFdqaXVpsWnCUp0trnm+3o5UQo27ttyA0wvzd6KOl+7d2
	 fOBZAHrX87l9AkN/x7VuF9w4nbH++mLlGZDbRyfUBmg+OkaFiF5/kBo6w/hYiAK9Q8259
	 XhUPvmn54rX6AUiK18S2JYRbMU/EOUkxhQVtGZvKeCAt302fWPgf/Bt78/ZH7ejRQI5+q
	 LVbQYPddXFryzMR8b3nueXc62TCpeWCBEpKs36ZZ4a0J7OM8TonGps+8jiXiBjE1tHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iX/5kcgJLHYenTjEkqTynO0b70ye+PYgd2o/7R7g0Oc=;
	b=n66TlBg1Ghu54U1374PdWoQFFf0gvER3g8hNyPs8GQzezPi4MTD7uqO+0zoZqZ/3ctT8
	 DpCnw+Z8UMKqIKu8WJHjUD84fhRQUJixWr6NOfDiPau2n4JZzFa/yeELGKdXwmQnxItSe
	 Slxuu9oR6uDK5iBcMlrwB6x2UA4f5Co70nVWlvhhrmAEe4wSmO5qp6MQ0xY2fyJXL+fiJ
	 pkPKtCZREZXGAtEZoyEkMRxCZgxbFsqFe05FevoOiNzMt1mEmyxohEFlxgSw/HW0wlrI4
	 BuCKzDXhsc0iLtIktf14OSBpX1kgBqAnR7cpOcJ6wK/Tz4z4393c37AE2qo7qWKuDQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNRetcNi;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0123B606A31D
	for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 18:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0123B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNRetcNi
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4395d31228so391191166b.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 11:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297996; x=1793902796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iX/5kcgJLHYenTjEkqTynO0b70ye+PYgd2o/7R7g0Oc=;
        b=YNRetcNioRbw88kB8q0hzVCt+n2IH7gm5+0ajIiDW5nbpKEyAZacRw65KH0lRE5/l9
         xv1Mfi4Lfnr9ItChvZYFDPg1EmyQGGgxseZoNjF0JXuE/CEd1GHbOHzyzdlCcF6C9VVj
         4Gi+N7uqUL7eXKSrdzN3KXTnDcBzhIQcKlCDMlyXIoWU+BGvXLdHEmmrqnCniJiWQYoy
         woyvNOM6HhgJ96FMthr7vRrJtd7Gnk0KaHhUtBQT1BLdotQP2+RvUYxevD3LLNCivjFM
         hTzKjkLQHCJII3XIrgvzcLAIuU0sOztpmuD28kZ4BCIPRrARojlqBprDJ7SFgxggsOUw
         6+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297996; x=1793902796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iX/5kcgJLHYenTjEkqTynO0b70ye+PYgd2o/7R7g0Oc=;
        b=zmiNsjZ5sf3g1lTSRXszoGAaZd6IPwvKti/CDMOdijn3XzOGAp/voPXYKt0HqJfbK3
         safBeTWwNQvTseB71XDaZX0XS7OT7G3Zn6G4BSkekhVjZF7+v0c81+iybm23NpWr+a2s
         tp0t6zhhTpwIYU58l/2ck/toL/6woOWaE43laN8mYx6+TOb7XuDQOTzEyjqkyoIu5gWt
         +dHSVkvG53Xj+39yBj7+0LuLAr1aUkLQK93uKorTINT+H49O1V9wz4XOcnP7ebyPUp9A
         VDyNEW6crL7pkxxLVBxtO6BYAtcM4DWkJToVIHPqWqzS14BiRyFRwz81jcEizNZC+2FS
         zdEg==
X-Forwarded-Encrypted: i=1; AKwUvBzHpvcAqqHtz3sESkLKY4nAVjpe8SEJ/qb90JFVjr5QPI+uvhSOymaotQIU6x7d8goDCfjHNMpildPqP1S6@lists.linux.dev
X-Gm-Message-State: AFq9FYIQzTBDJZu47V+pcshf23qkQV/DSLk7MhpsS37xxpByxKFzfzjL
	TE6Nu3i3eDScM+3BScdXyo3x1wZMy9270nJrGdxHcxJ1wutEtXnM6B5W
X-Gm-Gg: AYBFou1J7jBzIk59GSwT4F6gwqHLPvBZqSfbmlwJHLkrPXT4b/i4vdYZsr4yMzRztxF
	nDY+8d2u8Kj1qb4gAskvLTCdY5iI5mX208ZWjZq8k4vQZZ5L/SHO3YwI3yY5wU6o0t9mcyMutEk
	b1vRFHgOiV9Ca4fNs7noSq6OJ0oLgMIMnuXGaMma67R3XJqTJz0QURMAYDgBYFYoYkjpswn0Q0U
	qlkwwKOxLlIBkmjR6QmJtFHF+m9kfYKgyKeTDT0XcvP7leVBUNvWWHEzzgf2QF/K4IxEJ+X7cIM
	A8tvKaS8oN4ybRri+oDNYFzE6hUpuHVJ7JAW84A+abvRmLXeLwmCZnz0tfGhKIomtjOGGnZDKRx
	4YL+QWUdC2f/njf7XpF5LxrCc3QYHfrF+LdG9T//Sb7bCNYPSVYW6S/BSKS+3Be+jCMYeYofgob
	pG/3YsdAVH0BkLW1iwOaFAIoljqYJDNCxKQL9bwkJTcZNXPWZWwfWwCaxYDFXlRZufqwJmAeaPT
	zZ3KId5qrhdy0Rnwa9yGy7UJLbbmYq+Tcd0PjdvGnae5vI2s/nf2t33egm9b8/kopckGcwLAsKG
	NE8IrMtr+v8u25YkeG45tVr1AQdbMzwpZa1XGL7p2E+sereThab2Sj3YT5demUSXMSu55mL1qWC
	WER5TstdVzW9LTZM32My+zis2wR7Pc5OVIvsU7R+DAsAc47UkIIALIYoeFWR7YU92
X-Received: by 2002:a17:906:448:b0:c41:1e13:8896 with SMTP id a640c23a62f3a-c49c635f4b8mr354049166b.28.1793297996159;
        Thu, 29 Oct 2026 11:19:56 -0700 (PDT)
Received: from maria-VMware-Virtual-Platform ([182.186.0.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca2de1b78sm10323466b.2.2026.10.29.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:19:55 -0700 (PDT)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager: Add newline to sysfs output
Date: Thu, 29 Oct 2026 23:19:40 +0500
Message-ID: <20261029181948.13121-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning:

WARNING: return sysfs_emit(. . .) formats should include a terminating
newline.

Add "\n" to the sysfs_emit() format strings of the name, vid, pid,
intf_id, ip_devices and op_devices attributes.

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
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

