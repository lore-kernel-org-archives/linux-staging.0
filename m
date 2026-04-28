Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94E33AD9B
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395441; cv=none; b=UnI8BUcb/p+XhQO9+VxlJr8jgrZ6tOwzWX5F8OF3nk4kPX0/av742zeRWTk+etAfIIRqCO3o+2hgY/x3D1nr1+JwpGHYU8SSWA1iDNaYA8D9v45cWUStndyiD0AIc5Qtyg1b0ojM+PR5yhNaiincJ6nh449suj1m6d2m3noMCtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395441; c=relaxed/simple;
	bh=BVSzmo/MPr3Pb1LofysZD9miRmecuUu8SXgUuZjWfyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cs8Hyyxo2rJHZVb51ZSw9gWsQZ6Jb1n5YdhLEapIiHyLcbtRN1CXZUZMW7zoT+fPIuCBfldZHh3RVs3nNKEGp9MuFk4ZhI+eufWOjKusSnFESJti7zDdNco7uGbuypMZW8KDS/qfw9wOG+AD2cLdJWuX5N6SWH8lLVjgCnM9qBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrWgOqG5; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrWgOqG5"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso10383292a91.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777395440; x=1778000240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNIfAFIh9VUEeZyZ7+5hHhr7ZygZVo9QnMVxJndWS1U=;
        b=PrWgOqG5WBexhL6Q38WIo1A8ZJ4z13DqH5/YaMelh6uc5CAJMfGYpDCA+Eb87xGHzA
         a2Xg8KaEV1bHphtubknefJq5UK6cT7cPR/488lLVogyf1tKNtU3UctfJJA38JaW7Xpj/
         VAPH+qpDgmjc2nLNjIOpNWthzyiPu0BQuXi9R755KFRbvKMVr6Y/vRWVzdEYp9ymqY5r
         QvMDSK7A+m7d+RETzWmETDIBODRN5iQkRsKBFA3qeKRL/dPzphzNnLjln2yUyUGCIutV
         t6dBatv0r1abUFUeaYLxOX6Kfc/RjB0RqhsSSFCwi2dYhcleOQVdBYC48HWwpygau6lF
         pliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395440; x=1778000240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNIfAFIh9VUEeZyZ7+5hHhr7ZygZVo9QnMVxJndWS1U=;
        b=O+Gnx41RligIoQCYI7iePUXK7mGX2O+eBPaN7VtLeGkDzsaFFo8J0idOLw1d3XRsoc
         E0zcJBDQ+0OTOYGjxdkSIXFUCPq4t2mWMuMpLmSkkzshjIF9/2G9+KazX4NTw9/mp4j1
         HsMtH0VXdjj0JQ6OG9QSriulgaVz+t3Eqt3zP7M681/HxAv4xjRc4xkmmle+DfkXAsvD
         bYfsZ8NeQFRvwxpJ45M00T9pWhyTrJt2OY4tZIip7j1/MCtW3/W0n1RmbQtdVDk4mfnp
         IbQ7an3jIfweVWIKcIHjcmR6YhJBlAMfyEi/4qGP+eCfrnmYp1lCanJYDcVwW5r2cUJe
         WXjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dRD+a5x9LR1g0Arqtc7RWJOxfqid89YGoqf+Lp93UVI71/lhi0JsyetED63IJ28cqKEfQ0dAcdYn4zwMf@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1jEHgmIgDeEQo2l+Af0XPA9WWySAjAb3C+7498IOashLfkdP5
	i4kxeoWzV4xSRLNS4Q5CHnv4C5l5eHCnqm2C7nf4kIy2DJM3x3WQgB2G
X-Gm-Gg: AeBDiesd4dpMciOlTa5Q1bC9Y5U7alJPpTVlMmIOmeQjv4txzXqKWvoXCmNU+HxgTbN
	wUaW/11gd1UW79g7CQ68EJf0TOBSMbQB0pTOHcEmBHO3C5fWF+EJyxj2LVJcS/ljSyxk40p2OVz
	m2NiVhAD7qx1Vygw9hun3nekpTH5yKIr/oEVANTfvy6JPlqd3FWovZ+v9ZSUv2dVl5jzthmFQNN
	2GwwIQPGHig4Hip2Q6FeHsUNePBggYXyF4/PEuCEidNS2OM7F7mG2j77x/0HgOzXOEHhAhzb2TF
	2h+gqS8fEC7dU98FqofVcUFz4hmuNML/8MnlglC0ZN5c2erfSwf5d/Avk4ana0KNdriyol2u3FL
	JCdA3WR0I9HF3PMwJkgSz2f3Xvvi5OnCxwzQvTDf8iui4J76bziW9dDTA3ePdR9DAtjrbhhW4//
	MTCqaxj1ayHvFag3upEmuDUf/g+VEwYSQoijMqRxMoyOySko+7
X-Received: by 2002:a17:90b:1a92:b0:35b:e56e:a17e with SMTP id 98e67ed59e1d1-364920a55e8mr3951141a91.17.1777395439948;
        Tue, 28 Apr 2026 09:57:19 -0700 (PDT)
Received: from ubuntu.. ([49.205.39.136])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-364a0109e6asm238590a91.2.2026.04.28.09.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:57:19 -0700 (PDT)
From: Ajith P V <ajithpv.linux@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: greybus: add missing newline to sysfs_emit
Date: Tue, 28 Apr 2026 16:57:08 +0000
Message-ID: <20260428165708.3565022-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs attribute is missing a terminating newline.
According to the kernel documentation for sysfs, attributes should
be terminated by a newline to follow standard userspace conventions.

Fix the formatting by adding a '\n' to the sysfs_emit string.
This resolves the checkpatch warning:
"return sysfs_emit(...) formats should include a terminating newline"

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
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
2.43.0

