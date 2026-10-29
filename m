Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279492;
	b=xSPBi46oB2aNUCdyCKl4YVcq14pzsnc6WCxKxVxVvJH9xQfQEVQ6+4PHCpuuGf2K8Z20
	 VZmtb5MDWd49DL3oFT+vIyjfUXsk6aZWkZDCKmn+Rgo34wiHaOJRXETQHulWq8d4Jlqzj
	 f2hM51kToNHkKQiPanV0emTNCydzBDJ9Ib39hjdSxiit3Kz3BC0MynZHK7ZulrNm81g5L
	 bEeItLmz30Ops2Om0QTroIWnrk+oprTJ03LBtxhbr/aWg7KGENGKdR1cjaXrUv32ccYoT
	 3y86Ms6u0yrMaNk0cP5cz7lf/Ued7z37v3z57D/prVeFkhoUyBYylwOGo9rJ+L59d8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JYvguxWw9XKF1WQMW0Z0UUNA8IkuNdwUSuFinOvaoN0=;
	b=s3CWa8BgzRyeAmqkG3MLs5vHwOn8xegv7b5Yb5hS+1ky5dpIflQ+tmjwyAgOmQCBrBxT
	 oSeGI8B3/OOZDZP1EzPtgFFWJ4Z23EYBuYf6cWy20PiBbIqy1Od4XFh1knupRzfan0EXU
	 +/5L14vvnDSnsOwCRhI3aW2cpZKm7VmX8pq0tN6pj4bgNrCln7s5y8jHWIMZBB/Epi/Qg
	 H7jjgPm9Rw27obLBM+8PhSXmRBweO3DMLRIruzsYjTkHW5wyRZOIs2ynEh5XCIgWjsFHB
	 z9Ah7Ydcq2/8MALScQCE3exZFr7U5rGHLouZrj1HEFuXfN09yKrNiqi8G7f8T+Eb01A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d/WoMWQ0";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F33606A31D
	for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 13:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F33606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d/WoMWQ0
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1563947f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279490; x=1793884290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYvguxWw9XKF1WQMW0Z0UUNA8IkuNdwUSuFinOvaoN0=;
        b=d/WoMWQ0HpFQFUQrwDcXog0/LHHQM918r7+6Zoh85NWj6ELURfdyHXOImau+JTMxSr
         8Og6/Eu9GWMOQx4XGGVNz5vFficoCi31ueMC643I84h/t3qyVOJDzs79F/sdRYWJRcPU
         FKXiRNC3Au3SJn8hFK5QjFcxMGasW4D2GtIfGP2xHXF5Mh/ONmsomMTcb8NdhxUmRmG7
         R+d6DptOi2v2/Ri5WGr9R5MfDTfCdtW4r50QnsaL4NPuRNgu0ekZN6hqrJHNKZS6nAeA
         2z3zqxW4XLy06Mmb8xSAcnmE38K6FLMflC2bUJRhhR3avLziPe7dg+5IaCSQWdIZybn4
         2gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279490; x=1793884290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYvguxWw9XKF1WQMW0Z0UUNA8IkuNdwUSuFinOvaoN0=;
        b=U9SwmEjA7nm2kg3JsXDxUh4WfoWEE71tY3zdCLbzK5zZnKuhnTxv/EZ/vBELJxQQ3x
         q+BoL15sTHxI4RqvSzwn+hxbZcg5WXtipR9o22SAGFBSv5qhs0IXKLj11dNLCmWVj0p2
         MlMTA1UekzUf8yvNG+flwcBT0HmiONCYWSQXMY+q5eafmqWZR3LyWUyP8AKE9CHmUo4s
         exO7McIa90dTk73vRDKURaI6NyUjT+/ZNOkh5FmWIImUCvgMZSa0HxWCBz6gaRYZWP+d
         1L9svxyYzoTkV4+8dKwtw0qHr1FXXi6ziuMtbjbqWMmfr+O8/I7yP4h1TVJeq1V4m+at
         HqWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5B374sc2b4ylsjtqUNsVXlgtYTR1Q+X0qoMVN87KY4V9YpMzk7wdZtyViXRGULhsKrqXhaugBx9SOBucd@lists.linux.dev
X-Gm-Message-State: AFq9FYLxHYvdJKj35tfulTJr+AxGBUWUfaEtvUE/7SrujG/TeG04ITxA
	300MnfQRMv/yRSjSDGKfDKVBKg9yvD9TLc/wIIfjWviLJH3weGrITilr
X-Gm-Gg: AYBFou0Dwh0HK4KcSx/hpsEMS6N3qvKnB4LvHw3lByTBLXm69PzjyKDn/j4UdPK9AbO
	v+2h5AVzDQHYEuzZJ2beM4Lr1/fb0OAYU7ILvsvZpLASCcoDjEnsh8GFrja6fcVMV1H3QSmN+e4
	Tfr7dXeOld3Qo+hEdKi+VZplCulWX8q9cOQqmkIzvBOBk5tE63jkJIz/26GxcXo3ok0PMqgtEg4
	tYP91PjVhoJfDPX+lOM4NsVX86wwPxqPOd/rg970zYdSiyB3H9wkk6G6llQlP/HyDLvyBQMwajR
	6XWxbyiOBNYptWF4NruHgrVOG0r+vSN18Mme6AzCwMzX/tp1BzSsbhoZJK8o6/JXJCTd/yz4JAZ
	BdSqmcfuYRnydLx45wQIYZC/I8snIUskHYqXSp4bMw0GxOzmlOVm1AahX7iSnTMxduasEt74xaU
	9Q4nU1/A8bk8XjJuPNFHtp5oPLGpyLAMOTnOJ7FMUs97mZkCRX4nBr5vAzKqcwLh0wA5+NxotzI
	o5KGbzImkYFL+teY6HZ8BPSUIyz+NkEH2Cqz4dhYzor5bZg3MzV9eMj6YyJoFw9RFjdRVWHHfyA
	FwVsLNXCM5gXlfo7SR3Vr6364MOre15VDR5Ym5cwOtbT+3tmbWdhYyLq3zH+YdZ4yuQ=
X-Received: by 2002:a05:6000:2c13:b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48e5d5e2521mr13055765f8f.49.1793279490117;
        Thu, 29 Oct 2026 06:11:30 -0700 (PDT)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm31899557f8f.58.2026.10.29.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:11:29 -0700 (PDT)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] staging: greybus: audio: add missing newline to sysfs_emit()
Date: Thu, 29 Oct 2026 14:11:22 +0100
Message-ID: <20261029131122.167464-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The sysfs show() callbacks must emit a trailing newline. Commit 14c91651df34
("staging: greybus: audio: Use sysfs_emit in show functions") converted them
to sysfs_emit() but dropped the newline. Restore it.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
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
2.47.3

