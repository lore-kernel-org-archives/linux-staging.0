Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F9619ADA2
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585809; cv=none; b=iCneYSZg89qoq9Lzuj+i+PcfDo/U6O3zRFYoLrr5ml+N5kkU6P+HjiFdC6AX1msajG88tSz12GpmMM9WDEyVMK8JgUv2A7KvjmETMNwto135xANTH6W+YELnIbQpzzVfLrXWf3u1Kg+B19k+G7x5PMvPiYYvSgnsfbfDGzPFPDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585809; c=relaxed/simple;
	bh=KIq/1HTwCr8bZpAYFpCsqM7GAyYSayUNNC6SBL/Dnl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ALdOq3CL9590Hm/k0vb+nmA59s2lK4/LdZga3Te/4se5hfKXpajadtTd8rZIrlU9ghW1fpApkKKkbpBNnQRN6TW0XAexropHaKF4PIVX6uZDotfTzAlT0GScFtK+w31AoD2/q32NSeyTS+W+0/m24zaaHMZA3zYjuxBJuMNeF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoKiSK1a; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoKiSK1a"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2161d4b820bso11909915ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585805; x=1736190605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F8JnarUOADfyrzT5vkhrwhI8b5I1Xee7siqKCZEogU=;
        b=OoKiSK1a0m3OzyC73kqmmgeWbw4X66+SjIrUyENrpUnQKILji1uiajGiBNLmfxbire
         ayOffuaQ2Oc3hZuBQQpKbdvw8DXqFHCfqu0W3W6ZKmvV5aCWq+rXFU0n6p2aG4xPDkGc
         cS0/xgvaRyyoPb8IqWOVBPv9blAavBbka7+ygAd2NY3ikFrWpcKjMfugkVt/Saezekww
         e6v+qNa/1NWi/JUbqgXGx0FFo7Y46hFRAwLEdxRmBG1eunol3/hNbu99EHU1SnvICNjG
         OLPuZDoPQzzNEW23gx/BbPVePqSr+FGveNzblp/1DtGoVkBoo2XxDsp2zaZu9uxMrVfn
         H13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585805; x=1736190605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+F8JnarUOADfyrzT5vkhrwhI8b5I1Xee7siqKCZEogU=;
        b=CaffJvzum31rC9vDZ6xguW/TuGBvpWoVD2VUH000gpYbJSszqIyJQZKEtAorMCypP5
         T1Rro4jIOQfkbdkjskhGY8JEgRvXfnTP4xGyZDsIZHMIcSe8lNgaqZr1oZzp3+OC15S7
         7nbC97UvcbQ4swRj5rvdSQwXHUEGGhT6NX/mCR5ejSA4DDOnyIxmz+F3ZlmclecQMCGV
         +VeUTorGJ9i9LYnUKH5b99QFL4IrfjuyEHUiLOAAe4My6lflMLVZZq7syCLh/uHbI8kX
         ATQCbzM/Y3AqDn7lWWWV4XSBbX6ztNcFDR/K58zsZoRTdpTgXw4pJ/e3sUSZ/L2kFA42
         iJvA==
X-Forwarded-Encrypted: i=1; AJvYcCVZZoxrJDmMa9HrQa/Qv3z2gJSe/KrFKmlZG2zafMHThdkgUFY3DDox0NcPyKKjuUCA82ROmuOI6DldZd9A@lists.linux.dev
X-Gm-Message-State: AOJu0YxIiA3WoEgWWdzlGFB0RMae57ExjQpsyjqwjhfab+OOxKJQBU9g
	f/MBwW7ooyH/eCS226Nj3pO/CSZyB9pu4BF0+QrdwAj1OetqyMtoJZ4LlQ==
X-Gm-Gg: ASbGncuVVgP7ZO17aeEjCSQ1RrLO26elabO/sl5+YW1G2348Uej8x6a40VLnHSYOuP/
	33maDVt+E7DJTzc3VyeT9zmKTp1810eFou5dyx7P4GIeS+F9YX9W//5eWDlC657k/ThDXDFhsJn
	Vo0oLY62M67Abx4qIa0sdZqsMQblvJVmSTDg/vTsngAM9Fw7l+uPF+SmG/6tFE0bKEdWoWCDK35
	USru36JJgyPOxMeZxvgOUFHjH26UkNKTAdZa6b/ATAvRoTh1trif5s=
X-Google-Smtp-Source: AGHT+IGadNmCQAoIzPnrZyA0euZ/8t7aysPuNDsrCo0I5r1irNRk+V4RwjVeq8hyG8NXuYCoSQdW2w==
X-Received: by 2002:a17:902:f542:b0:215:b8b6:d2c4 with SMTP id d9443c01a7336-219e6e9a23amr190539625ad.4.1735585805271;
        Mon, 30 Dec 2024 11:10:05 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:10:04 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 09/15] staging: gpib: hp_82335: Return error value from gpib_register_driver()
Date: Tue, 31 Dec 2024 00:26:29 +0530
Message-Id: <20241230185633.175690-10-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails. Add pr_err()
statement indicating the fail and also the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 40afe42aea47..45157ad65d53 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -325,7 +325,13 @@ void hp82335_detach(gpib_board_t *board)
 
 static int __init hp82335_init_module(void)
 {
-	gpib_register_driver(&hp82335_interface, THIS_MODULE);
+	int result = gpib_register_driver(&hp82335_interface, THIS_MODULE);
+
+	if (result) {
+		pr_err("hp82335: gpib_register_driver failed: error = %d\n", result);
+		return result;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

