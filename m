Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B656741;
	Mon, 18 Mar 2024 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710788792; cv=none; b=UZhKFULdijDbEzEk23tCQbc4nhS7rY12fURhGizoKwVARDP7ugzy+YOuAVadIeTy5RUd9u8ZYnyeeo5a4sj2IYIkBsmcLM7BtDGyeYXElcBEHLWtZGPADSg0ZyCu8iQATLBcUAekk3l7IZx6HuWSfcitoFTNK97TUzkL8p1CW+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710788792; c=relaxed/simple;
	bh=NEx2g4n6ufqCzilttVyJiiBJGnoeUzvPlQCp0qHeo88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UbS57H+OX+syuQ1nSpgwjZSpaT8GXqiBoVL2gZKYY/amoiMl+CZ/tr4ZoIPw7gU5086KWsYE9ZAcZO//Aes2diayXOnVWEQlvw0jjqF9YS0PGaT4JAldU96v5vXfZBPhlb+fZSTU6hw9OgXiSo5aUtA8zwRHto9RHZZ+MSKzfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrIyiXqA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrIyiXqA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dd9568fc51so36860965ad.2;
        Mon, 18 Mar 2024 12:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710788790; x=1711393590; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3t/6qBY8GxMhzpyZRZVOzzJ2aUCI4p/xA2HtoPwjz48=;
        b=HrIyiXqAf89p0w2vnU6C53kDWtQzCA4ZbGynyE4vOBrAhCoBMiSePbLmzImg/dAqQt
         0+h2HcQIN6X2XsRo5vZjosufx3E9Ip76XMqTkXAv47lBrSL3YEAxjIuEmoKzlA7mp1cc
         eiiGPtj5DKtarm/hFWEjWx8QLSzKJ+eQtztxXzFXeTrStodXQQjQDiZFZO9qor51G2AL
         gjNDVkwvDRPHPy0G1fqUMX1XCoAQ4zhPMt5TpCen9p73aPDbvyJLeaH6/g0KvGK69ukE
         nLAhBOo9SN57fDifWx7zs2ElOzME3TtfQsrF8OCbcigTGoANiGkfzQXeDJikgXhuzpQy
         ckww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710788790; x=1711393590;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3t/6qBY8GxMhzpyZRZVOzzJ2aUCI4p/xA2HtoPwjz48=;
        b=YNxtvmqwiODam0s7JXhQOlqNt7N4JafXQ5TnYlHwIxCXOhSUlDvPeeRVWvUKJaYBIm
         IDxXrQKg1KsklQxWN4xJNofSd5UHubBjk8NP9uTmSv0ZlZ62EQb0jvvT7kDqbiwpAfVI
         NcD33u/KRiOQ5Ei8Ehyx0oGKKSyELyxqO6XXnyB0J3D9cwerQIrPJpyA165gqv/OQXcm
         qMhMqIE0T2lGfTy2Z7DAY1gvcLgZTNgAoatopLX9rEHytBhgp9jBTjsV/ER2haj0fG8Z
         VWv4fMJvd+QsvuxZ/jujSX0NmrFr4LhNV0hIv5Gw5/tWIjQ7vh/KX49WXqdyjhjso9DZ
         2Mqg==
X-Forwarded-Encrypted: i=1; AJvYcCV42O0+Fiz+/0bA8gJB0mrfxgodP/Z1K5SUWe4IuoDfsZeBxLfLRf3cBRw+0F+ZN3nEAL9C/GeLl9eg7UGxoVgdGFIiE6kXtm175UEuIg==
X-Gm-Message-State: AOJu0YzklF3GMop6F6eyP/Ewoip1sQSh/n6YN/cF1YX+LPabQpF92mmu
	JyEfkr0fM23XrLIfLinpJ6raSnk0Tzast8zo5kP8ytMDPp1Rtq/pnHtJmxOKuqQ=
X-Google-Smtp-Source: AGHT+IHNcRSrETZMOBGBIJjxlTUKxhM+HgSfC4f7xoyv8I+epdayrvnayaKoLUuqEnsrvYN/c5dUzg==
X-Received: by 2002:a17:902:bcc4:b0:1dd:9da3:59ff with SMTP id o4-20020a170902bcc400b001dd9da359ffmr559461pls.42.1710788789789;
        Mon, 18 Mar 2024 12:06:29 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.68])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902c40a00b001defa97c6basm6416769plk.235.2024.03.18.12.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 12:06:28 -0700 (PDT)
Date: Tue, 19 Mar 2024 00:36:25 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v6] staging: greybus: Constify gb_audio_module_type
Message-ID: <ZfiQsZBrHfImIJfc@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Constify static struct kobj_type gb_audio_module_type to prevent
modification of data shared across many instances and to address the
checkpatch warning that "gb_audio_module_type" should be const. The
"gb_audio_module_type" struct is only used in one place:
err = kobject_init_and_add(&m->kobj, &gb_audio_module_type, NULL, ...
so checkpatch is correct that it can be made const.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

---
Changes in v6: refined commit message as per suggestions

Changes in v5: added more details as per feedback.

Changes in v4: added more details verifying the change.

Changes in v3: added the message that verifies the change,
as suggested by Julia

Changes in v2: incorporated changes in commit message
as suggested by Alison
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 5f9dcbdbc191..4a4dfb42f50f 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -144,7 +144,7 @@ static struct attribute *gb_audio_module_default_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gb_audio_module_default);
 
-static struct kobj_type gb_audio_module_type = {
+static const struct kobj_type gb_audio_module_type = {
 	.sysfs_ops = &gb_audio_module_sysfs_ops,
 	.release = gb_audio_module_release,
 	.default_groups = gb_audio_module_default_groups,
-- 
2.40.1

