Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BD145A11
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367167; cv=none; b=q+09KccM0OX0V1yUUIAvLEvoEi3rIYstft1D2ADE1AdxoIa4JPTzvWt8ZD5zaRHJMHFyrKaxJfwM0u0fRLajmy3udK3diqrfR29TtZ6mgHUS2xklB7tCMjnumY3e5tRd588pWdk7GgG6jC8OFBkn4QXq0k94Sczl2FVEJ2cSEqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367167; c=relaxed/simple;
	bh=Xkj3OhYt0HsoR7LS8r60bpO4lP0pmIMbSAM1dLoqnkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kwNJ0rBmXWCR82ZKt+SMmsoS0be145dsC2MjN1SE8zINpdy3QTqkRBWS9WrTED/bDMlMV7FOAeQsBZos8nIQTJeNWKsERxr3jclKftRoan2vXEC6JZ3kuVJowF8HY/vonDXH2K69QbyA2j/qQiVHUK29fFTUfwGk16FEW6Gbi3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BT/adNCR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT/adNCR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2162b5d2e1fso12336345ad.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367165; x=1735971965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu+fa23bR/zX4SKFUNVb2wSGAsaVSctXfIzv3zCZzfM=;
        b=BT/adNCR+BfBzsgdU8vFwAQgbcm6Y0vPw7vk5yJ+chINHMuqOQvgy4pI2Rooi665Gd
         1LJbogru4VIpm9AE0fyTS1USFrzCmqarinota2ayXk4/HZeL8nngKdQFPu8MVMB4a0Wg
         IDt6/JmxJb+2VMBzOIJzfx81LCvY4VDBq1heee27sbU5pbAvBONk+TRkrCDnoje+KygO
         GjYu1MQcC+qi2jIsuXklLMuJdPm79xN8tg6MFUDUxZGCIRyp7YP/e8fRaqGrs5evR8d9
         JFO/V84S2M0DVRxtLJSgKGxmxVyexp1qYORFILBNBQPENH4cTrHiL1UEhPSvEGPpKNtc
         paKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367165; x=1735971965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu+fa23bR/zX4SKFUNVb2wSGAsaVSctXfIzv3zCZzfM=;
        b=Td9CbtrZoTbK1MeoxRiv4ytE3mn2n9gYtZhhgjJGXEM5o+BB2YpQmttC47N4mFLpCE
         ay1zo2YtgxC+4HZtb762iWWK3x6NYAX++VYSAuONUcaqv+Z4L/INjMf0LY6YyhHhZkgc
         D4hywKUw5OssRuLSOBrvABS1IFgES5z8beEy1ye8vU/a+pSSBR3BCtqbCXNU4x5KhRgo
         k9NHsBtF3cvPMUEKKZ0WcdKyvljeiu1FPlorKie3CIM7v6dRDC6hAtUAMpjip5ikf04d
         kO6HZX3iXjKJ/OmI6JhG9EixCTnObc3tTjfroyrEigWz+CnrGDOxqbitJ2vjcxC4OaPh
         kPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNHtThdTG/874Sw0uTu+TYu0v2U6+3h5BhB8ew2qQvmdyM0++rglrqrAMROJj6adbK8I3J5k6XVBnEbmzo@lists.linux.dev
X-Gm-Message-State: AOJu0YwSxev57+6GGw1BwZHjcML7HjXhjfYNq2YDF2MG8zVseggJP/Sx
	V9/aiB3wyeZgaYdqShDNb8jKpSO61TwfJqOYKbpKWKP5VYqGRunH
X-Gm-Gg: ASbGncsHTGbdNP/v9bKRh5doAWGFeq5kG0YTn81WXYTW0GdGgkoyojn4dgneHDg7Hsh
	lzbr0eIk1Htv6b7oUhGYoSRZdi1a2Bg06Xj5EXGwMaSPysqFeF/MAOc/dc7XLg1J7DGXVmHA6Y0
	3lRGlFY8BCYj44lVscPaHGH1kpUkJZ578aYFZjX2FM5fXHQUC1gwPOXGKTYFqA/fFE/kOc5onjP
	sCsFHvOPmstBiqyRzgMTDefIx77R2R2Jcs7LfHBaNtDnnxo8m7+Y4U=
X-Google-Smtp-Source: AGHT+IFvF6NazmgBMZtn6N3YueQInbnzxTDwbrKgIMEWlCqAUdHFmci1WI98dcBWquRlmr4b9CpDCg==
X-Received: by 2002:a17:903:2345:b0:215:435d:b41a with SMTP id d9443c01a7336-219e6e857b8mr150776455ad.1.1735367165378;
        Fri, 27 Dec 2024 22:26:05 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:05 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 09/15] staging: gpib: hp_82335: Return error value from gpib_register_driver()
Date: Sat, 28 Dec 2024 11:37:57 +0530
Message-Id: <20241228060800.107653-10-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228060800.107653-1-niharchaithanya@gmail.com>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 40afe42aea47..af8ddc173d12 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -325,7 +325,14 @@ void hp82335_detach(gpib_board_t *board)
 
 static int __init hp82335_init_module(void)
 {
-	gpib_register_driver(&hp82335_interface, THIS_MODULE);
+	int result = gpib_register_driver(&hp82335_interface, THIS_MODULE);
+
+	if (result) {
+		pr_err("hp82335: gpib_register_driver failed!\n");
+		return result;
+	}
+
+	pr_info("hp82335: module init is complete\n");
 	return 0;
 }
 
-- 
2.34.1

