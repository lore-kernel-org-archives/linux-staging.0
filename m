Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E02156676
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896218; cv=none; b=n8fQmVf2Io1Yuv5dWnp1Iiaf0nNoHa3RTOzeXWJ7Qru+jbtwcK3M1lo/MXVd8YA/WuCJpy4aMPhOZDtSkt9BU+uPnKWKIxw7/QgmSAmoXllXkBQ1xma7ChnvcjPrD1KPib1N/hH7YVHNTLpf3MDhsZx4DjcXPt5jfueuoyn2Aao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896218; c=relaxed/simple;
	bh=cgQO1UwCPIWBof6xKNlDEdY6kW2vr7t1iwZgCtqmWls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSyc71/TRRmVeqhiUT/q3LTzSTPLauQTilwmGZq84I4BfO832JW0b1rOWE9Iv6rlQ2NpYXs0eMGdHWroRKk6OUKPLmCE6BR40JvDhmRHSUvA1xa4BYhMAofgbGBjbJ4pfdNu+ptOj6ZrDzbk2WQMMK5avzl/xwgQJCpWSH/NyrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxvI4HRg; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxvI4HRg"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c984352742so369916a12.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728896215; x=1729501015; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZtKiNo2Id4aizdmJ3+JWafU0x2IXYEJ4ykrMWfdUD4=;
        b=dxvI4HRgbkt8G+yX+UQlyEYwOpG0iHecIU6RKzVxl0gSRsn0dp59wyehTtd79rUwrM
         1y7lT+zVnJdRZkWeq0TF5Cy/CrY0K7KWIF2QKeEj0TG9szmbwLPba8v3w/8mqjRzSjPX
         DX51wbhQ+8nrYL7aqntHNBm7pylROMgGG5sorr9MkFJ8xnV3OxMjc6JihIPUDsUHHIQL
         3cpf3FLpwmtvdFBF7aguTxyidS0yz9mbRkLdH0ufSqY2YeOAdShxH57IvPTOqkeKNfJH
         F5yYi+VkX4nFJnup6MagVmM8T2bde/zuh3LVq+KRxEF3QGBb3KUwhUKayCWSn4dav9Yy
         8+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896215; x=1729501015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZtKiNo2Id4aizdmJ3+JWafU0x2IXYEJ4ykrMWfdUD4=;
        b=wEorU9Q/Gmv4nOTQ34Qxjh0HIYpNbqNGpiVCW53ocGRfVdTvzeevz5ukStM3+ME4Az
         o6rjXlvYOAgYN1CwQOv5K6Nb8VR9CTwqFOIjtm+ToENWrwF3arYg8U2MLBZgZUj9Ppxb
         cI7jN0taFkW6z7+ahCqZWn9jbn/XmXJ0k6zEJUOdbkX6C8EFsVkZSpdJLNtW0SDgMnM2
         137SGGDq4BUom1u6efASMQNuVANWR/M/CWYv4q5lnYW+cNRYSD4JL9hqi4xrJWiz+uWC
         osEB35YvAl1DaJb6SS0/vBfPMl8Wog5OKoqeDZpqSJuho/6FDtg++oJWwOzjsAQ/dxn5
         HdmA==
X-Forwarded-Encrypted: i=1; AJvYcCVyBTJX6ii7FsOvzxzg7bjzfSTMWpWG1Dsv6D/OWHzSUeee7rUCurcegy874YS6qt4dCpKgvjPjwj5E7qi6@lists.linux.dev
X-Gm-Message-State: AOJu0YxhR7wmO0tCdF8FLjg1xPzuU3PhKqMCAYk1kLrsokxkTWCjfSg7
	ZI8EqXZn8MmoaSF3DjASxx7D9VkaQrQzfk5HarHSyyAytWD6uM7Q
X-Google-Smtp-Source: AGHT+IE4Tebx2zedc1mf+9ffSBCm5CEIg+axVw0KgnFRYtSFdJGxxHajwNWdgYanJ3YncO+DPc1FjA==
X-Received: by 2002:a05:6402:42d1:b0:5c4:14fe:971e with SMTP id 4fb4d7f45d1cf-5c948d58e4bmr8108654a12.23.1728896214496;
        Mon, 14 Oct 2024 01:56:54 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d2296sm4635091a12.15.2024.10.14.01.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:56:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 14 Oct 2024 10:56:37 +0200
Subject: [PATCH v2 2/2] staging: vchiq_arm: Fix missing refcount decrement
 in error path for fw_node
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-vchiq_arm-of_node_put-v2-2-cafe0a4c2666@gmail.com>
References: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>
In-Reply-To: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stefan Wahren <wahrenst@gmx.net>, Umang Jain <umang.jain@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896207; l=1950;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=cgQO1UwCPIWBof6xKNlDEdY6kW2vr7t1iwZgCtqmWls=;
 b=z8dlOAj/8FIYM9IbUkY70cYe7S9l19ri5R7gxEkCqRIXIL34pJkUIGwLA8NJtm6fID+dxXhB9
 l+cV2UsHREeCPEOwnnztwEcLzm2lYoVDIPK3cOQXJLAOnaP4gIN5z+0
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
index 81b2887d1ae0..bf2024929d07 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1332,7 +1332,6 @@ MODULE_DEVICE_TABLE(of, vchiq_of_match);
 
 static int vchiq_probe(struct platform_device *pdev)
 {
-	struct device_node *fw_node;
 	const struct vchiq_platform_info *info;
 	struct vchiq_drv_mgmt *mgmt;
 	int ret;
@@ -1341,8 +1340,8 @@ static int vchiq_probe(struct platform_device *pdev)
 	if (!info)
 		return -EINVAL;
 
-	fw_node = of_find_compatible_node(NULL, NULL,
-					  "raspberrypi,bcm2835-firmware");
+	struct device_node *fw_node __free(device_node) =
+		of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
 	if (!fw_node) {
 		dev_err(&pdev->dev, "Missing firmware node\n");
 		return -ENOENT;
@@ -1353,7 +1352,6 @@ static int vchiq_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mgmt->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
-	of_node_put(fw_node);
 	if (!mgmt->fw)
 		return -EPROBE_DEFER;
 

-- 
2.43.0

