Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39CCE546;
	Thu,  7 Mar 2024 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709792622; cv=none; b=NL/Fe46mwImUtKkXrf2juImR/vsTa3vCFseX/ufJSREZaYstTIbYE8WIji7k+qM4Ae/X9u/PRKkLxzVQI5SF5LfBsqDt/FZ8oJL1jyVii1lk96FE+sav2U2kII/6pPvzZA0FLNX8siiAuknMjAWM78B4zA9Vs46QBs3uKxADiiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709792622; c=relaxed/simple;
	bh=VyRK4zhUcY41vCC+re8Sdmxb0b94qcYKUUivA0sTlEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WLVg0iDXPUMTH7ciDjYts2KMo1U89sT6Rs9/eCPZg1alz4SR6gBIDJo/E+tVTXeeNYPiDvCQfJjtYYChUtmhJmd39q6bSTTqjc84NAcfCWNIQ10ywSqCRQX54wcAzj1rI2F7KIJjXNHtq9+qViek2nbf63dnELxjxR6cCtJmMBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPKAcghb; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPKAcghb"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso671631a12.0;
        Wed, 06 Mar 2024 22:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709792619; x=1710397419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kr8RJqSBb5lCgL3O3n25TCcW3SnVl/XP7dX108YWunY=;
        b=aPKAcghbUvlbW/LnftSR27kwIPfvVfjvQvRt9C5FWmw/7vRoSuiOxBUhY7Y/KA9rQ1
         kls9PNQy6XGYcivH98wIIG+MAqrUMx3OAHOKdXsQrffPoQT0eFlMZrukclxiKbjAqXdd
         GAGDALUNvvKP5VmFcKEztf5CigRUc3zXlIvlIUxAF4W8SJaSeuLIuwCyOZt+5dxsUnhg
         gHIWFXvcbYLkMt+EprOmHR8W+ZBZv7uBzFjqPBpGn3aeztXf7qkTH1+U2d0rPgAMQ5OX
         X7nxQsFTguafrG193udbfJfoO+dMetJNjg3H16L6qoj5nIaHe2HDkHNJ0kN4/Fey7hv9
         PHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709792619; x=1710397419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr8RJqSBb5lCgL3O3n25TCcW3SnVl/XP7dX108YWunY=;
        b=GhPxcPodrzkChYUgBfPJINYuiWShPyX/2UFDQ+AAIFxncYfozgWhg0JJbjHoFq+8U0
         DRfWPVDqSHVMuNzuKws6eWzLVltT+IqBrzw1Y4JbEt9ZBcAWVqt8f4l3uAdPgiyc/9F7
         UjlFxSLM4qTKOFkfIF2A96JHuxqCAodPsSP0wqUoXlgGcuIGqMueHCnErFrzv8ehEibJ
         YkCYa0ktpmVHlTu71uq/Yowkon8y3iGDcJkXVFu4COR0Fx6ZCo2zeZDju4NO54WNVtWj
         THwZpZikY60zIQPNPak7v/EeOIA5EgWkzrKzL4wRYPSF5sfOASssRkkyRgoBdWL/CSxk
         9oNA==
X-Forwarded-Encrypted: i=1; AJvYcCVKnW/RSCmGHoQ7wNDajPKMx2GfTzfFAbNrVx5faND0Hw4CNXYNltqgomQnDV7OuGQdAT12iUGJlkZFNFyPqGB4+7VjLuMavqqpkFXRtn0zCg7qD4i64yfwyMSh6Y1QbcdnsQx3g44AFA==
X-Gm-Message-State: AOJu0YxC9iTSCFrVNBS+1p2VqDA2COxglW10IdsJYMBWhVmSw7K2p9Q1
	1+MlXTegWuziTHkdx7m9ReW8zI7suVCgybOzy3soi/QaGBqbAW1R
X-Google-Smtp-Source: AGHT+IGnwjPJ3bDjAouI+nTExO9NKjFuWsRIc2C0dsXGzz87/JbjDaBLgKZRpSXlBr9WQ8jAyQHpbQ==
X-Received: by 2002:a05:6402:8d0:b0:568:a18:2eb3 with SMTP id d16-20020a05640208d000b005680a182eb3mr1305517edz.11.1709792618957;
        Wed, 06 Mar 2024 22:23:38 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id fg5-20020a056402548500b005679143295fsm2442525edb.58.2024.03.06.22.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 22:23:38 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] Staging: sm750fb: Rename variable sii164SetPower
Date: Tue,  5 Mar 2024 22:39:25 +0000
Message-Id: <20240305223925.38869-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164SetPower to sii164_set_power to silence
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index e568c210e2bd..c12df1f9fb00 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -20,7 +20,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164_get_chip_string,
-		.set_power = sii164SetPower,
+		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
--
2.25.1

