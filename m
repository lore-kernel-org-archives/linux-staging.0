Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195740;
	b=C2gpr1YTOdNRrfrVfpKn3eA8QJnyxVb+csfkXDMajdbC7qmTv44k+MNWXGI8ZixRSoo3
	 8xRchdR6Je6ceKfTDq+jqT1F32OUwV2rcxaHx6O+XMybZ/4dl8W3c4+N8wHfDXFNwleAf
	 Vdb+Pyz7lkeqeoxx+T77lhrXqM48l9HRKjKeo5dbKRddbisHzboCwpVdrH160LetZa86+
	 8LfOsHgyT5mUpMbdrDrDHyBxLUhpkiE6j8/6l8TVmAddBISqCe4HFqfffp28yx6OBaSas
	 d66eyNOk7R6TKQootDINmeSOG+btKzHPSwVk1z0dWc8xUSOQ+IVpL/ehCMKVoRQ1/vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VDRRIAOPMvAyme5rrZYSdHK5HezA3cmZQYqbZeADUVQ=;
	b=jobZl1/ZZOwccpX+Cp5vE9WE1nM2FuMqB8YE/V9BDAYV9gRDeQYtoy64WbZyvtteZmSV
	 DL5kAP7CS6YYjoDxupDFXbPqaqeZDF07z+lUbVuXd0TLpES/4lVkcCB+U614goxuX5zx4
	 uhfT3YTm/C9kmvaHaDnl3W3vRq5oh9ZJ+qBHiQpt9bGGzlBmNVAZaU1P5e3NOV3ZI/br3
	 FTZZ7nTUXA3E945wJzkxFJqKDtVcsw7SU68KFGdiknkQTGzqCNjyzpvDl/tk2esXaYGut
	 HuvoPkOg87O7w0ulb96gu4ZENzBRn/kUKKrRz0Z1Z9bVHFBKe/x1ua3mQKH1wUwaBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCF8twlU;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C21606A321
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 03:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCF8twlU
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso106056a12.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 19:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794195739; x=1794800539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDRRIAOPMvAyme5rrZYSdHK5HezA3cmZQYqbZeADUVQ=;
        b=MCF8twlUB3SqdmELK9gNbc2mjDjJ5/hkuhBTvxvThN5SzkyT7Py6Edpp3w7QAp+WOS
         ElQFkn3hEPR1KDd4fskAvrdiek5BnKzRUHe+TLrF8KfMwnuUXFGBGNBZ2+cKt5yXCVE6
         i59DuxnXPQJnTjETLnCokKrdCdUeZogDfj7m9QJDqySGRZaFYwGwRisi/OH5NXG1Y1y+
         grBDJOt1D1QCQuO4tn/tKjplWNCSvEgPpqTDhFNJSAdeZHmeu9YuI/fX6+QxDodbK8L+
         0m4YkFkYHUNvWcPnOnHHQRdcrED/xXYbCAsRD8pXEmk41W4MV/2GU3EgZLwH4dvVGf8W
         VyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794195739; x=1794800539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDRRIAOPMvAyme5rrZYSdHK5HezA3cmZQYqbZeADUVQ=;
        b=Ptfjl3yX5XYjiqMIB87AYx0mdCZ/frckoe2HHe5JvKCtZAVMZbsV6YP0AnzPOOkDU4
         miWrZgjus+e8/Q+SNvN6RJGbYh3YHLacWlFCY4VzLyR6WPKRdiwBauEQRYXJ7eB4gZZ8
         LsWru04dR9ZX/Dv+CONSVEqFAeKoR+QfJlJzMBEF5hjlEubaYAnumPQQJNZRlYnES0jJ
         Ad5a7ZnBmk8DvSxUyD25xB47fhANTjd9DAyzzx203XpD2UPLMW/qFq/G2iK/IX3YIsAf
         6U5hH3z6ZYCcp40OYbskj4pfkaQTVKLoqkpC9fox+bY2YhfT7swuGIkWF8g9Sw9KJwRd
         fWDQ==
X-Forwarded-Encrypted: i=1; AL+hErFyFV4TNbamDHL+lRfgduNg3V2O4Ze8s03IXSgkYSu26QOrhWiZ8nd67t1tK3Xl63hg/608VrBLSUytxVLc@lists.linux.dev
X-Gm-Message-State: APuU4Z90H00TODuAQv6FqZ6wvapznDn3bOh++E8UXoepsFqO2wq+C0Qp
	34skgCA9dDLpyVCyJcQ+shDGhaKnU72adL7GMoyh0Yz7jBK/Ox3Ci6gh
X-Gm-Gg: AYBFou3L8x/Now15GpHgT/U+9QDK817j5U8tOQO9auE9dpH7mrNQI8q78gkALSoI9aX
	rkl11fmv83M5FiPbxlpx5C6j4aRQl8SKE7E8lDJ6c1bEXDV5/SkrvTPdsaVCBC1qp+i1Kvt8G5z
	4TwUvUddeWnDtBzAPuOmbEeoYTcaTEQb1SZ2SdGEUIdONTSLzef8oYX2++ShgzODw5c6vvZU39m
	twPnC7wL2npffF0IqdNtS3guybfJT7YXqsnkblVbV1YxysjzA/JY9Fn0GoB69Dj/2nBNwqfwwXN
	LsNLO1fplqmP8LCvct+1FG8a1P/zEZqxdEpTLeksaCt6AyloNquoPPt0opzf5GUcBWnT7rsC/Tn
	GAgoJVbASYM64kxiyNfw+hyG/m9bwKZ6iGZ//XaM1YXmsHPcaIUwUBUC5iL439hotA9RzLnHnjU
	YhSYyqPlH8jCIOBSxn4cuqzuheK8hPc/cncBQZnRLrzm58VP/10EIT9bx7nk//whOL385jBefYm
	DyFZYlVyRiaw/1hNyOEgCUyZRd2CrBb00+6cK3tCs4iMgwe9pIEDywMs5izTwpFvZUUdDhHhhq5
	PThUcDWRSf9IEDy6jUHSkWI6Ob3/LFMqSxL8EwnGuElliPLQWjMMy24Jj8w40YYQcAlzMw==
X-Received: by 2002:a17:90b:4b83:b0:3b0:a3eb:759b with SMTP id 98e67ed59e1d1-3b12d3300famr2937645a91.23.1794195738942;
        Sun, 08 Nov 2026 19:42:18 -0800 (PST)
Received: from lenoq.localdomain ([49.43.114.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103435561sm5174399a91.3.2026.11.08.19.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:42:18 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH] staging: greybus: add missing newline in sysfs_emit
Date: Mon,  9 Nov 2026 03:41:26 +0000
Message-ID: <20261109034126.402391-1-singhpriyanshu9838@gmail.com>
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

Add  newline '\n' to sysfs_emit() format strings to
resolve checkpatch.pl warnings.

Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
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

