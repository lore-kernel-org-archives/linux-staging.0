Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6830119CC06
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585791; cv=none; b=PqfO5NRzddY+sY8fZl0IV7CLTo1Ms1LRaZ7ZG2PAGqRGKqWLc5Lo0a/04hKhM9SDkRnpqBalLziCtaPLjAPEsqBUugxYAtdBr/sG4Kxqh4ZtrTBQQwIeZKLx4cj5S68u3dZI3Ba9c6MkLTCFpJjbnIClGvWkBF+HA8d1SFPsfHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585791; c=relaxed/simple;
	bh=S7a8wX9Yexy2sv2AYTieFKxnvfJmcnoAKN16sspLSGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gV7rh1AVvBzpK6Gb8XZdSI20DqP0AHgQQirslsGO7mrfuf3NKUTbWOKBJFDCbS06Fv1F603PCmP6xjQ8M3Pc5kYlM4ulJuW4u52fsifxOXDwAjdrFcRBcjc0BIG1Tt5WsRmQtzMosDT+GxYz6tDbeTdPtqe1Xp4q9ikREWYgngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPSRk+M1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPSRk+M1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216325f516fso12498025ad.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585790; x=1736190590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLKyEu22nnn6LeqdD3A+og9HGlmTSWryEARLiqriBEs=;
        b=GPSRk+M17WqJhXY2Jyr5vF2gPRQQERTKxtaKvUpU4aqySVuZ3JbHvi5IAVFl8WRPQz
         urKq+BeSCOHWCKyDJ7jA2cBgGBU/PwMtEwbMQZ5PDUpkfcVH++KSRei0/YwszribhPeL
         TTLUS3/txgoph/dJjns+apMipVgr8MngeXa4Ka6NsIPJmRyiqn/rgHDfKyxY6LGxcyyu
         pSbkiFWooHS3e4rYpaMHgH/l9PFNvVU64u5+2J2LuKItP9A4dAeUlaEsgaSmtmvfImoC
         ZM9tm8pdo3VmU1ZJ4raPSngvLYGGqiN2EVcZzwVB0O0bnqEYdk6JMsdFmoKPBbyzENgd
         38uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585790; x=1736190590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLKyEu22nnn6LeqdD3A+og9HGlmTSWryEARLiqriBEs=;
        b=q4j5/G5tP/D3jRCp1eaY5AkqGpMVd1OA+7wePilRXzCtqGuJOMf3b0ADWNgzNhXuLo
         YuDfzFu7IhDf/MOxXoYP27G9rNKeNtpImdC6drZU7vZXTXEZipm025Cpbs3df0RVeLu8
         VjUfOal1TE8IDTblWdW2FOLsAi+4lRMaefsP/e7iqVboU/Iis46G4wNIjKStYGv2G3VY
         S91HwUCU0+5N/1hvD6YtgAIMtGmckXuvGG4ye1GJRzSSmCHwOZf1jAnTaOByZUHmMd2i
         Dp3kpFyCQuB6LGOTzgAfYcH/oLM9Ej+UtJiUgFDm4ZNqsyDn8leZr1qbMsC8t/gCXp2o
         uejA==
X-Forwarded-Encrypted: i=1; AJvYcCWKwcHAktKOQ6laF6BA4WQO3UgKVTslsxwh6jZD4jJExBTgSymGih2si2XGwYn5I35Hd+DE/P7PUfOA+u47@lists.linux.dev
X-Gm-Message-State: AOJu0YwO2x5eH8pYkXafCWaMH4Zsph2aI/eF0SJiohQRqCVMXdaZWzpN
	0HebqWJ7wEuMFTMqK1RDIrLX+55PDaO8tTV6oMCquouwdrs/lSz3
X-Gm-Gg: ASbGnctNsqqr4DyPB3O8VF+ndhI4N2Is4Fd5RBAFOiPF7T7J0BYirynYSF67j4URt68
	RkcwNJdVGWo//zei0zEdDj9uVCMgeH9lTZn114yhlR8ILhkO2B8EbvwMRQo6yotAmEo+VYGwC+T
	GJnN3u0Ax0ubPwndrd62pVogOSQSPqH9Q7g0d3+A61zNfCPfxrXWoaCuhLwmhlwd4GQCoFPklJt
	0Hpl2MX8uyoFK+KjK7etyTOPvR+c2hBYqI7v/N7vaCRKd6S1kHeduo=
X-Google-Smtp-Source: AGHT+IETBKn1g7dh/TqzXpdQ9VNn+VSziUBcWMQBOqCxTYoBaRx9cGA1TzG/PUhWcDrlHOhE7tfxHQ==
X-Received: by 2002:a17:902:f644:b0:215:94ef:6071 with SMTP id d9443c01a7336-219e6f2707amr187942205ad.14.1735585789667;
        Mon, 30 Dec 2024 11:09:49 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:09:49 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 03/15] staging: gpib: agilent_82357a: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:23 +0530
Message-Id: <20241230185633.175690-4-niharchaithanya@gmail.com>
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

The usb_register() function can fail and returns an error value which
is not returned. The function gpib_register_driver() can also fail
which can result in semi-registered module.

In case gpib_register_driver() fails unregister the previous usb driver
registering function. Return the error value if gpib_register_driver()
or usb_register() functions fail. Add pr_err when registering driver
fails also indicating the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 .../staging/gpib/agilent_82357a/agilent_82357a.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index bf05fb4a736b..261fb6d2e991 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1691,12 +1691,24 @@ static struct usb_driver agilent_82357a_bus_driver = {
 static int __init agilent_82357a_init_module(void)
 {
 	int i;
+	int ret;
 
 	pr_info("agilent_82357a_gpib driver loading");
 	for (i = 0; i < MAX_NUM_82357A_INTERFACES; ++i)
 		agilent_82357a_driver_interfaces[i] = NULL;
-	usb_register(&agilent_82357a_bus_driver);
-	gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
+
+	ret = usb_register(&agilent_82357a_bus_driver);
+	if (ret) {
+		pr_err("agilent_82357a: usb_register failed: error = %d\n", ret);
+		return ret;
+	}
+
+	ret = gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("agilent_82357a: gpib_register_driver failed: error = %d\n", ret);
+		usb_deregister(&agilent_82357a_bus_driver);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1

