Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B51238C03
	for <linux-staging@lists.linux.dev>; Tue, 10 Jun 2025 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568845; cv=none; b=PGhp1zOIlwZsR9hxsNEvNkMYULmNIxOtcvc8LNW25JDaq8wy2vnDkH1jBYz93QIVFjT3PZxUIeUqmx+ZS4MP5ookn8VXe8dXfEe3h8pwX4d6lAcXjCNb1b9WJYK+MS3lDiWQ27uOTqHsCbSIJ9PBnrjcDrmq/EovnFZCq3U9UTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568845; c=relaxed/simple;
	bh=ntw2ey008iOZHteqPhoBSfK1i5W77BNCidxaLvGyUlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8lecVy+ic+WKUHF3CKx9Zx6wCKfE99xyELLP1jJ2IXrBMPrlQmi6+EXJUrXAUd3Y7l7kKBDgRKWxndvaGA9uGS6Ju0Z2ewAspd2NVCGsgcgjJ3XNy6A8fE8injeKn6ljP03TD4NA3EAybu15pwjwfRSc90C8/R1+WeH2J3pk+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UOtD7Qn2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UOtD7Qn2"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3368225f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Jun 2025 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749568842; x=1750173642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pedIUwRN3D7qvw8UIlmZrCckR2WX2CSjcTaVtRgsTAo=;
        b=UOtD7Qn2LBZxx96LbFCC4WG9OuZR4vS3neoXgC2FOd5wxUttsYn4SX5oi3FSVdIBhF
         lSP9fsBuXZgUeCoIUw01avrVUVh//7dNQrhvtSYAphew/y8nxSzvDAhEKHl9UVTSV3iU
         mID+fLopA7Ja+335vlJyjwz0wTldjy3jLefAKZea7XZhHAPG+CFru3rndNk8YZcqs57o
         z0epagBAjCH88TytnTxcWrRa5CAoxbz8mg1jmkoZjCTRD2cjgVshpFUGUgXW3HC/1C+G
         X/LRSsaji1xmjIUgPXnAxch4iCUFuY7TMEhArDIfvwpfEzyiJ/eBFG8d73iPbAqtJAew
         MBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568842; x=1750173642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pedIUwRN3D7qvw8UIlmZrCckR2WX2CSjcTaVtRgsTAo=;
        b=ipZHELypQjCdLVNjh9F4to+1aycBle3zT41NqZ6TtV7SS2MRNPkHXThhtVDJuuA/CX
         fp2so2eYsFR7rT4qYJdTn6UwcB/q+pGtySIs5Z1zioZKBJ043SkGc/xvYGxeHQd02kpS
         aRUy4z+l/QllKO6ZW4KUMhXaRcIHVpV9HmJ4Xlzhv2PDs3/inii72ctjcu8ftyrfrgeW
         sX81C8+X+0KvQiabSTtgY2xG0VYYCso449xG/PTjYw/JYyMeUvRgbLwGrWrO7x3+SY3Q
         wvyTs8B242c2kVm+fU2ry06363me49tSAJnMn3aacY0YE8ltlAEU6HsRugKdgdKtmBa+
         lKHg==
X-Forwarded-Encrypted: i=1; AJvYcCWzt+ESa/83HSFOOetg6mYSG57HnO5eXq+wwjv2m5fbjc54q/6uQgc/Wz2/pKdbZdGZ6Q+T7cw4FXc/RFL/@lists.linux.dev
X-Gm-Message-State: AOJu0YzEJdO70wgSUAIBvWdOXvp36sd48ZwV2K3JY7mYRB17qQQTts9Q
	eAuS2wevCTMwZ+I77CGSiEKjGgHvgjqXnvWya/sidvmO8tBkiVo/Vxvq7uoBG6EjfH4=
X-Gm-Gg: ASbGnctwYvb/0aRnDQIvowYnlz/NHATEjoCZw6GU4AlMlYMnN9uku0lhtFH+PwEWEm2
	zgxWdI8J/fA+5617Awko8fdvXkohCQgXkHtW5IeNr5RoNNsqjjeyChWbL4jkGufq2phtXiut4ID
	dhDv9KqpkrDahI9WHEwYZLzVYxcpH1i3yS2bHbjdtNnSRK88dDMeDtEyOH53fOB8P9DiJLtDlkQ
	yyacJJXQyrEYSBEyMt9/E9/IyWXW3NohiWijFwl7U6cWaJNybG4BtqiRHxMXv0DdNAO8zPMLxbY
	8XyRudvdFC/2VnGELpimlVK2ewXy52QHKaD1SmbuIBfcXSnmdykT+BCWDRy90J1cb301uno=
X-Google-Smtp-Source: AGHT+IFDGGWE1z6DBNuxPQdlOoATNSHUMRrZOzpLgsWsb9C2dYFqKHbu0/aBJ7qfKFllqnf+O89l6w==
X-Received: by 2002:a05:6000:4305:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a5319ba2bcmr13714922f8f.7.1749568842105;
        Tue, 10 Jun 2025 08:20:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm146708685e9.38.2025.06.10.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 08:20:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] staging: greybus: remove unnecessary GPIO line direction check
Date: Tue, 10 Jun 2025 17:20:36 +0200
Message-ID: <20250610152036.86099-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/staging/greybus/gpio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index f81c34160f720..1280530c8987a 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -192,12 +192,6 @@ static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 	struct gb_gpio_set_value_request request;
 	int ret;
 
-	if (ggc->lines[which].direction == 1) {
-		dev_warn(dev, "refusing to set value of input gpio %u\n",
-			 which);
-		return -EPERM;
-	}
-
 	request.which = which;
 	request.value = value_high ? 1 : 0;
 	ret = gb_operation_sync(ggc->connection, GB_GPIO_TYPE_SET_VALUE,
-- 
2.48.1

