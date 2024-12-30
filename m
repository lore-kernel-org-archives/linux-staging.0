Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1F01ACEC1
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585811; cv=none; b=eL8LtkbjBPS/NcO9+JLGQb/ZJYV+ZLUN3Wmi1N6FLTKNorgX3hCfUvdH2V/3iBoj1IQ7HPIqpsiqG2UO6WVTZ3WYdC60Yy7gl+EZ6mg5RAdLXk5Lrwwzd0RKjtXmLZTn6L9MePUrCV1hKD2b2/h9Qsl1ZvalAgl9WB0913vaz7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585811; c=relaxed/simple;
	bh=K6pjky9Ek+SsXugaEvIVw+NDXMsgVeIBpUzxf1GYqic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fkKpkPLNEh0dajgPTo5COZCACxGPy5hG3WokYYPwSVu+iE4UyzqR3LGgytuhi8S1hcQrUbnsQPH5rKxdRdyioN9hRCIDKQM8php8F9qkiwkOq4E3vp5XslXmRwdHPsHD5EeEcnAxH9M+IZjMKKUHEOV7yEncvLej1l3GaC9r/T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQkDdbIF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQkDdbIF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2162f968cd7so11594545ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585808; x=1736190608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M468sUTraHS5kC5PSlnNFUa8bcgzq60Ww60qpx627NE=;
        b=OQkDdbIFjB1HB581gSPu7FvIO94I54Sg6wnLZ32zKZmCDCDcyZ3+tOhVfB1kaPM7JY
         KJ6faIA8/q4sfkATOEaYZzvyfCMB7vmHIeyMiVfDTiKlQgmoNPTrEQGHHVn0qeZzWBSU
         dH2guWW2Li0TPwTjpXswx6gqrLc4fbL8G+KctA/4AgrYx4jpQ3W3yELF3LFm675Q1Y06
         zQexy1ci4sCaXVHDwUlEpgzMy54dUepdPcqsoUg7MZkz6BxB4NHQ1N1RrX7X7QQ2aVd6
         5kMAOonycoZebX9usEg8MF79uwSCHbdddWI/GeWSwD0OLKg7j6uXzGLLIlUkGtZc8rxr
         Nmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585808; x=1736190608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M468sUTraHS5kC5PSlnNFUa8bcgzq60Ww60qpx627NE=;
        b=icIwjr7LBaWrQnmK53uwJndZT/qoI/gqcpwgOdn2+A6BDbB/bBX5d/bQxC1lv1TbCz
         x26F6rVwjS7PPpZb5JkD2VdeF4uQdOCcm2VN3o+Ikcy8oGsR6DKZ0D9jrORzUhDR+c6Z
         E3yb9MH+6nTuQGS3NqRCNfYcMwUNBPbJtNif+v+evksqEjUhIY/O1ZpCPPSxxt27V74b
         NybAwXSKMccOqRH7SW7YwCvTruyYg2LwcKJWNZEzOrGi5oVkQ2pg3Rr2GmaklRH2No4j
         DNe2Kww9nB+juZwlTLeLD74ACauC/6ribHXSHsCV3vIaZLSEoepDzoA0GUN0KiKfHLTy
         mrXA==
X-Forwarded-Encrypted: i=1; AJvYcCXunJhOW2kCWyG2sHVNqxYg+rtZme2LeYnE+MQnYEusyrWfVPxS5GkCJiKwrt7jibWLQpqmIbcarnXRcN/z@lists.linux.dev
X-Gm-Message-State: AOJu0YxzbJJFDNV9wyFK2Xu8UQs2+3ABF1aY6aZ4lXAoXpouTCHUcX2/
	O/L4q5/v+YUtaaOoHtCsA8wImArbF8h0uJc9oh/IZ+4myRcLCFiF
X-Gm-Gg: ASbGncsLwmQF8kIhcu5cCsdEtEVGBGNby0RQpK/dpyJyz4VSsba6DglMTsf6CV/2qVX
	Xo4R4EaDmazAwkfZnLRCkSJUakdby71irvYZhoclGxKIHOhvO4LFdHD0kwxGqKgvjeFrX7TkLt9
	FjljriYYUKMjss4/O+1mM25Xl7hq65ZbpCHfHYxuZ3D58F3sIdLxuHfDGQ3fwzMQZ2A/PREhEGS
	LbspBKYSs6dELCGX1BfmtGPDy0EnDRNxrY3sGGQcJgTpq44mAPpr6Y=
X-Google-Smtp-Source: AGHT+IHt3vajaSu5hkKlS/aNe/nV1zyzO8BEmVLGz/v3Of8aTqXbYAMdXCmK7VNgLgBDFHoMns4PCQ==
X-Received: by 2002:a17:902:d4c9:b0:215:8d29:af0b with SMTP id d9443c01a7336-219e6f2706fmr192690715ad.14.1735585807835;
        Mon, 30 Dec 2024 11:10:07 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:10:07 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 10/15] staging: gpib: hp_82341: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:30 +0530
Message-Id: <20241230185633.175690-11-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230185633.175690-1-niharchaithanya@gmail.com>
References: <20241230185633.175690-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail, resulting in a
semi-registered module and does not return an error value if it
fails.

Return the error value if the first gpib_register_driver() fails
and if the second gpib_register_driver() fails unregister the first
gpib_register_driver() and return the error value. Add pr_err()
statements indicating the fail and the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 8ad1c885a9fb..4953dac1e177 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -807,8 +807,21 @@ MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
 
 static int __init hp_82341_init_module(void)
 {
-	gpib_register_driver(&hp_82341_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&hp_82341_interface, THIS_MODULE);
+	int ret;
+
+	ret = gpib_register_driver(&hp_82341_unaccel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("hp_82341: gpib_register_driver failed: error = %d\n", ret);
+		return ret;
+	}
+
+	ret = gpib_register_driver(&hp_82341_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("hp_82341: gpib_register_driver failed: error = %d\n", ret);
+		gpib_unregister_driver(&hp_82341_unaccel_interface);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

