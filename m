Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03A12BEAC;
	Thu,  7 Mar 2024 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818185; cv=none; b=MWlIEgK3c4wZVa8ovF7jdkenfZQdqHzxYcY0H/XpcdHdgLYBp8GhFYN3O0G2+Flgb7SCM4CJPBSC9jNC+qnOllR6eJBcAfUNZv3+6QFkNBIuZItuCDzm8FhGWNXVTQdjgFu+a1dPykghkRxJQO2pV57EwmLX1oSe8/THlL3wNKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818185; c=relaxed/simple;
	bh=zujPJK/Xr3fQOTKwzhRad9c7ckVjL7hyZaoDcN1VjC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kEXdFeA5Ho2Nh9zvijFRRimx+OcldtXrTALyYXHaf1u6MV2nLfvcgA4lhsQ603/f4kMiN3a5fKU6nK4twhs1whvzuVOWjmrhlfD4LPDAeY7CWh6HxeSaxPC7zctyYNft2RgrUYRbbM9N1ewrVpAeasuYnef7ozz9RhPNTaGJAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVqtD/m4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVqtD/m4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a44665605f3so113331966b.2;
        Thu, 07 Mar 2024 05:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818182; x=1710422982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeNgc+3jBWHDXoOgmnanP9YfCs0BE2p+PLnajoRa2gI=;
        b=CVqtD/m4gXF7uGais4b8iMNiVEY3e+AzTwNgDVn4OyV79s8BiQu3ISK46WfBIxPYN/
         dC65X75tMk2IXnhQEIt+0ToN17ebm+vhJZsjNNsfsPVUgbmT2UzH1WV5gqUlH8qKGCJQ
         P2Pt0WerWXNL7myPi1A4Q/P+YfmLITLAwY+dnmZF91xlnPXskxcsg3i36NREef2dicfE
         Uw6Vh9vgIOBZ3W08b1FSk7/QUFrNl5wIqBCDyZF8RpMHXpNImRKX72JPqIYjOrfNo7qy
         Bagm3fkC2a/s+4owIHiOCSSRBFr3+PbpPWWCvZOlY5QQXln5EvHDzg1g8+B0EnDDyS8J
         UY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818182; x=1710422982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeNgc+3jBWHDXoOgmnanP9YfCs0BE2p+PLnajoRa2gI=;
        b=UukOPwdWdTg8IXSDdZH1KFDUp4Rs35tWiONx68huo/1Sy4moaI+6oCFr+SUgVXtv98
         TDryr6MlFmy9N1j80fKPqKiKbJz/8pRdX+7+9mpKDFDSzFL3xAQeJaZCsjLSIBNmwGKi
         VVsyZymF31vyKUCgZjWKYJQYasWhOOKBJSOyimYDqISnrAGKWLL5x2G1tQ54LI7NJAxS
         D7A/yypF3ThIeoYQ/fV98HpbX9k2TXNfUwQUw5OB6ioBwuK8NMhIrq9alS4AdbpYNfRv
         q3JXGuom9k8VrnSMhYteGBtrkFa65fJMc1CNJTrAnrXOcC6HB2KsoIv+r9ItXVOx2tQ5
         klYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxqq0W6hnePtypUR1EuGFnEZ0SMT3PEp9RT3IKvTkEyALEiiWa6AnXuvRsNQtIduoic8+jibhrLwhJARIDJ6BHOF+CzA8GC0J11ikMGfzr1IjsJ/MlTDNPwjuo3PA4e4Btky48SToQtA==
X-Gm-Message-State: AOJu0Yyj/683w8rjtpUxAqo4Rq97fEgKCrg/nk+7UVGBhN4yEw4X4tiJ
	7ht7AP5T6j0JHb/QJ0FV9Veb05nGOLBGNdO1K7NcK16X+N/SNERl1tATrm0gmw4=
X-Google-Smtp-Source: AGHT+IE1jmYit1D4NkASl0e/p8cxxyhoLTO3YOgGIyjhzUfWGSogGEN0yYC4FqPqOyl9ob5q9npKcg==
X-Received: by 2002:a17:906:27d9:b0:a45:c8cb:b8b6 with SMTP id k25-20020a17090627d900b00a45c8cbb8b6mr1939396ejc.17.1709818181727;
        Thu, 07 Mar 2024 05:29:41 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:41 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 3/8] Staging: sm750fb: Rename variable sii164SetPower
Date: Wed,  6 Mar 2024 05:44:53 +0000
Message-Id: <20240306054458.102288-4-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
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
V2: Added the patch to a series.
    Fixed errors within the patch.
    Compiled the kernel

V3: Reverted a commit in the same patch series


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

