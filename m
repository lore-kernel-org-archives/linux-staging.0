Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935440;
	b=Na104RJIs5q0koCgQ6MSXrWOaKWdLub+V8Z/oFEDffqLRoUg7aTFwn1dq2cUe4jAUXfW
	 iEId2DtqTjO5RjHh6mhEU9o2UZ1tbKpap/q4sdaEHP7+bF9Z0N18cIQyojIdMkmLE1TVH
	 UjEYJosQGvi3z84+0tI0/llQyQftImtZIQvRUlBFu8lzSSy96cpkTYAlORH9ILTSNy3Q0
	 7T9ACkPjhByg97+T1txtrw2M7kDDzxnk3w4jNxnZnhY0JokGxUkZ6pKH55ZwNnPloUucM
	 tGTIWmr7LfxgG/1+vWx+b5o3KzVaaD+9iJ7LJZhvIR/5n17daZpm44SrwiNCZ2nA0wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i88WEJdRAzSrZ0XFqkiPRY32+2W0cYtqx6CNsJcFnvY=;
	b=oEFkHg5vyVW4QEf1NrpNwWsEV7q5vHl6He5in8dHAOCKuYsFom/3tHaFgUlFh1eRl8xw
	 dn5JzVyDdRfcPm7srZxsynFH4XhI0uqOKrHXr5q0eJ5f53L8ls+0rESUKYHdW8et2vhiK
	 UKBHszVhu0OZMRNXoktLpi2wVPR1mt3fNqx+di7rEBUXDEoLooXGXYgtYY7DsWAd7MUV+
	 deetTxuXpi+Wjv6hSPEL0iYvYqzyhX2aLGW9dzK9NKskPu9RFSXpDldK3cy2BrokaD5uz
	 YZ+qml3LaxHkHkSVk0ZRzuV69KebgaHVKvq+1w0q+YzDXeRysYcWMdKcFg0sQemcg2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ugi2nP0S;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869F3606A8A9
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 17:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869F3606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ugi2nP0S
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67c58f18765so3950401d50.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935439; x=1795540239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i88WEJdRAzSrZ0XFqkiPRY32+2W0cYtqx6CNsJcFnvY=;
        b=Ugi2nP0S5OBgIYMumfteUXsyXSd1F1BFv3K10tGReGldBCKNaBHqG+iIZ55Ripdah1
         LYqAMy/fbNFBVGiCOb+4TeuDhf8l1vOmo/+QtuefsgRX9W0rhegGG8OYgu+8Pqnrimt/
         HMp2AN+XN2MfAt1vLVCvg14nO7jdjecFE8jceLzQA8yuyOhYyGkkWI87Kg3lh5pzq2tf
         BJew0OfvxjC/rx1qL9KyXLgIiscReGaDCVkGdu+d/7hs7j1JXd9pO/F7oD/o2j5/KnHP
         ymwzs0jZy/Hfhby98N2mnissdbPJruKxQDOzkuKIkzc/TLwoonbXVxNu1Q5/eLika8YX
         j/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935439; x=1795540239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i88WEJdRAzSrZ0XFqkiPRY32+2W0cYtqx6CNsJcFnvY=;
        b=HNWpzIzOBrMFSRBQH1JXLQRd+mYn4vLN55xaYCad+xfLJ6pNomrQJvH6Y/W5zMk8Kr
         Fv+s/xPUOMtCIIsRziLnzTvVPPkrGx+gESh/yBsa2jItuQGucXAcjlE1030z9I2k6RyL
         fWEClpTwKP07h+JyEzdEFvWviFFlGBZpQfKnhNTZwLwN+QXoBFGoXNVGQExqFXVje6SO
         74c32Vh4Eb/DAF1OVtyxbUjJe6dvTiB6bcpFuG1Z8OxOEPxPImACvwVmoNLRMIuOt4sl
         EQMuQV4/M6zbuzrmI9ywMd3NO1/5hD8mr8SUTK2mHMLt90XqY9h7AmNE+rJqMGxdw/uj
         4xaQ==
X-Forwarded-Encrypted: i=1; AL+hErHkn3uxPzNmoX8mL85zyK9cwhHiknhkpqHAAcBStHDgCXD57HpCL26fOoFUD967sSbLdD/lPOirr3QLSL1u@lists.linux.dev
X-Gm-Message-State: APuU4Z8wY1RMXSr4IZPczunqxdSghSQun8mfskVRs/w/NIkPnN7z4Xmt
	I2RgA4BiBK6ANyqVOXNO9eQWxzcP1X3kiEwCkjjyHe8Zzx76Bpoz4LIJ
X-Gm-Gg: AZFdTZe+/mD9qb2OTuo+NVGGjvW/7spV9Vt4P3wfEUXfrtVvpoyunfb62t+HaGwSGHC
	Tmfshp7X5H0LiqSr2i+c4VjM1D3lMdE4F2xytzzNzXEF6Iesjh2XGnJ3QFKgl56osBc9ESrRl2u
	tgoNQm9oNlCBxAgbUntlWA94CjHC/1Fxqm8X+niN9tbfgT+5LW6senIePu3r8d/Iru0QuN3kNHi
	4qt/EmZg+6988dV/g0n7KInPisZhfBUOUvnys9MIUsFk/7eJfb5XsBUnCXZoFI0BG2+SNrgtnlY
	A+dSEa2zm7s0+jiosaE1aXc1Icpjq/oeSSIbQ2Me2sSY7v/OPab/hE6rAuLiRPPf/m8rkZMqARp
	Jgq4Nm9wZgVIE283DJ1zllkm3Ga50CDUc/5aZLCft8PkloI8oK+izA7H31iU20qffL3z+FtMqi7
	HKzKHENIGwD+hoFaKPWwKZC5iiPsziBG3PaD7bdEg/t/BpdH/T/40S/RslX9SCAPDd6u0zW6kpS
	+yNbldSvBvNGO75GcQcz+f5MH3cJ0Ue+Xgz0ODCYjOrL2v5SK3JcZ9FMn+JjMcPK0rG/38r4T3K
	x3CGzbIteAb2AjL3SC6GM7yKVxfSjfH+SarsYmJ6pwYiTyiVZVrnFRzbHyEfB1PUkLAU55NmJCk
	pCZTTLO3GWysV9E7wpQuqonmeFesL2uc=
X-Received: by 2002:a05:690e:128a:b0:67c:1268:ca92 with SMTP id 956f58d0204a3-67dd3d4bb0bmr121166d50.2.1794935439287;
        Tue, 17 Nov 2026 09:10:39 -0800 (PST)
Received: from Alone ([2407:1400:aa0f:8050:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd404a37asm115116d50.20.2026.11.17.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:38 -0800 (PST)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager_module: add terminating newlines to sysfs output
Date: Tue, 17 Nov 2026 22:55:15 +0545
Message-ID: <20261117171015.218177-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The sysfs show callbacks for name, vid, pid, intf_id, ip_devices and
op_devices print their value without a trailing newline, so a read
from userspace runs into the next line.  Other sysfs attributes end
with a newline.

Add the missing newlines.  No functional change beyond the output
format.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
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
2.56.1

