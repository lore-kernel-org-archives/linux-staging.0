Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530B76EB4A
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728816162; cv=none; b=dmKQ/gU/LGTxmZ4151ADmFhGQUTrU4Mhne7MjyxpxjHK7LUYcoWdQBEzG0RsFePvhQT2wVIh8YHe2vwjAtixV8TrQ0AtpQeBja52VDuZYjMKLLxTDeiUWyaHzAnQma94FnD0UiNqblirAfdEUQIweYSZw95q0XEe/a+mkVBj0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728816162; c=relaxed/simple;
	bh=RvVa1Hdz0npBvLce7iPzTIjWN+LlLgRw3t8ryHuP8Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LXbm9KqszzAe6t0lUDvjyZEKLVy+QeSbNSaGVPqvdvtnQdBUBZYBKqaGSTGAJDBQgvWwRNVphpS+Am4AeSyHP6mY+1rZ7qCuuGN0hZAIUKHXkNBLPaA8Xx2csGEhj/05LC2mnVnrA12eBE2ht7kR9LBqiFTxLFnBtOSQ62TOsCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv3uJQma; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv3uJQma"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4311fd48032so13344955e9.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728816158; x=1729420958; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sI0NVFrf3pRuZLAIx9mivd2k+klWW713Wqz1uXcf1I4=;
        b=cv3uJQma1d5obrHHkIRTn8jqqqYfIzg5LgsbAMqqG2pdJjpj6CwqWXcivsZ7hS3Iht
         lLQ7GSCSAKotFXambEjO3z8xDMJTb7g5Ti6JjFXLKI85xN8Pv7SfIAP9snpORNRZfFjR
         x/UNhu+aD351XSqFN6S5yaflbmH6hpOiQu+zdaeMBQ0q5sdk2YqgiQelYUZq8micwJIi
         QLEEWuFMXOylwQbsoC6JVpQ0NSjKegqxyys8NyuLbb56KZPa5cji+XyDsGwofh2hsgBk
         Kw00BImgQ3Wg9nTa6RPxoV7oXLvlXWNea4URS/xwbKvjrlEN39ZBuOUzNgdLvhHElVH1
         y80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728816158; x=1729420958;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI0NVFrf3pRuZLAIx9mivd2k+klWW713Wqz1uXcf1I4=;
        b=nWavvB2JjgFP4DNVSkfaQBFSIb+dwWtYMv0LCP6W+jE+1FHCGcjz6HkvDPGXK+j6s1
         +C0+DYbT7J22PLNAsydraQEBkYMECw++dfC+7ngkkMtZoaEIoU/iCLPfycOA58Fq62nI
         UU/Mt8Bkqv5wqo13ZFFvSj1f1ogsTW2UVD/NI3BjxOVBzdn7OMyQJNRbcUtd5qgP25+W
         qBQwWjjI3RwUI7MDjBCO0AkAalm3pHKvI3VHuqFvBWh50LYMYVfwGk1yfKDsszdczzU7
         worMTB1hcUzaP24Kf11y29CUEpzydbYytr88W5Py6k/mleMD+HwHexXXR+hHKqABSEEG
         ts3w==
X-Forwarded-Encrypted: i=1; AJvYcCWQIw241NUeW0XjNi7flNStv/SNfvXM5HOBl0GkMZxvOQnwl92e7wiVdryDbRqRNpdG2xbzaWnHB0JP5bqB@lists.linux.dev
X-Gm-Message-State: AOJu0YwqyZYzeoWkAqSW//+u2jJWEXN7BwyJCo+Zz0Vk6kcVyfKDunOn
	0nbUjS4vFwwgw25WpOgNHg2JJmW+5RUnQR1s5EnLJWvsxc9DwU6MgxK3C/kGvQU=
X-Google-Smtp-Source: AGHT+IGufmCYtx1yjlM7P4W+1+XvlivxR/a4dbQTa29lFsAyi/NYHTq2CdMAlBpQXoURmLlJxn9+RA==
X-Received: by 2002:a05:600c:1f8c:b0:430:c3a5:652a with SMTP id 5b1f17b1804b1-4311ded53cbmr62215745e9.12.1728816157942;
        Sun, 13 Oct 2024 03:42:37 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-01f9-6cb5-d67b-9d29.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:1f9:6cb5:d67b:9d29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d70b4462sm120913475e9.30.2024.10.13.03.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 03:42:36 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 13 Oct 2024 12:42:32 +0200
Subject: [PATCH] staging: vchiq_arm: Fix missing refcount decrement in
 error path for fw_node
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIABekC2cC/x3MTQqAIBBA4avErBO0X+gqETLkWLNIS0uC6O5Jy
 2/x3gORAlOEoXggUOLI3mWosoB5RbeQYJMNlawaJVUt0rzyoTFswlvtvCG9X6foJLaEiNb0EnK
 7B7J8/99xet8P1l9UCWcAAAA=
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stefan Wahren <wahrenst@gmx.net>, Umang Jain <umang.jain@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728816154; l=2125;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=RvVa1Hdz0npBvLce7iPzTIjWN+LlLgRw3t8ryHuP8Y4=;
 b=dZJuhHm54XpgX1j7LLyPpshdmuzxcgLz23pgRbrWVZwDHB9bpO03XnysqoYVpQtJCGkni0cTr
 qRM3Pxgi1HIDmf8HV3buNwX3ZwQ1Q1xohQbNo14frQOy1FR4vcIeAH/
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

An error path was introduced without including the required call to
of_node_put() to decrement the node's refcount and avoid leaking memory.
If the call to kzalloc() for 'mgmt' fails, the probe returns without
decrementing the refcount.

Use the automatic cleanup facility to fix the bug and protect the code
against new error paths where the call to of_node_put() might be missing
again.

Cc: stable@vger.kernel.org
Fixes: 1c9e16b73166 ("staging: vc04_services: vchiq_arm: Split driver static and runtime data")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 27ceaac8f6cc..792cf3a807e1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1332,7 +1332,8 @@ MODULE_DEVICE_TABLE(of, vchiq_of_match);
 
 static int vchiq_probe(struct platform_device *pdev)
 {
-	struct device_node *fw_node;
+	struct device_node *fw_node __free(device_node) =
+		of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
 	const struct vchiq_platform_info *info;
 	struct vchiq_drv_mgmt *mgmt;
 	int ret;
@@ -1341,8 +1342,6 @@ static int vchiq_probe(struct platform_device *pdev)
 	if (!info)
 		return -EINVAL;
 
-	fw_node = of_find_compatible_node(NULL, NULL,
-					  "raspberrypi,bcm2835-firmware");
 	if (!fw_node) {
 		dev_err(&pdev->dev, "Missing firmware node\n");
 		return -ENOENT;
@@ -1353,7 +1352,6 @@ static int vchiq_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mgmt->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
-	of_node_put(fw_node);
 	if (!mgmt->fw)
 		return -EPROBE_DEFER;
 

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241013-vchiq_arm-of_node_put-60a5eaaafd70

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

