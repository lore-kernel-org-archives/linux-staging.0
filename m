Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C0199240
	for <linux-staging@lists.linux.dev>; Thu,  5 Sep 2024 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725535680; cv=none; b=oZT51C0HkxpyBd50p9jn410NuayiUIFMTl9kkYLChKayiciBMm+g32AgX8/scq8mKot94Pngrr9mHt5dB+rNoQgtxy19Kzu4a8S7vp2AnXkomYECzAdGa6I4uotTmS0LLi2Q6/Jx1CjN1kfenptzFy2o/CsAJTkUKT4ZARpR1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725535680; c=relaxed/simple;
	bh=+jABMERXQN5KTk8oMEuhXLCBTTpd6MUgesfngcUhsWE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iIhdQWL4xqirR30JJOCS4k4gSzftzT/zzLv2ax76dHXN7YaclMYveycNOJE4m4Nz9VCErZuK2OWzImc4aClSbJFLO60tfK0SlYh7Bl01BjSQRol6XS5ttvHZJb8ebftYBjmt0VpiEGSdUj0ay+U47fACmL6S3pcT208RS1YiCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzBV/jgX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzBV/jgX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d87182874fso78385a91.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Sep 2024 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725535679; x=1726140479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+CyzlaX7v1ZWBjca1vTn1xo6TzAjHdC3F714KL1PH3U=;
        b=mzBV/jgXTxo8zPx0H2tThGMTgUJHyFQO6CMi1volZd3vJubYWfzzINPAIbi+hn3qTC
         VOR7YDxQlcA9H9zQXIE5QptT7t+EHuTAtB8Q+nw2a1NpF902cEP5/fLefVa8TzPfrsfq
         QbxotVBXLq+nmHW/JuarUR949Uw6oZ3jmZR40lI4OIk/Pkllqsb2Naltctw9Vzuimh70
         RlRIL7/gy2zkaou44ih7DCXwmpGFDfnV9YDAXhcM/57V+DkcL7lW69v9fYkcJMgBMjaB
         BpYZewQSaWpVpv50jaCivxgEK20piWSn7QfMppS7MLhJ/HQ09jDcOoum27CYSQPLeWNF
         3Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725535679; x=1726140479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CyzlaX7v1ZWBjca1vTn1xo6TzAjHdC3F714KL1PH3U=;
        b=DiUTsMkhp0QSRLZJV6r2LcFm84nR/+u59rFi3w5VcX/igwtE6cvQFyzSwQV3ROOT/w
         THSLvqsT+r4vrEormv+9iJtY6PInoInnmrfB29eRftrsCjZWW+ifLk9/R6Vj1+DNJx9h
         TrBFKOCRW6cXCYtHJPiVV5u81Y42AcEL2P/ZMBDIhvK9vOj7iojpjZPI/V2NFkyOO3m2
         95CV+HJKeBgZgxOyqjFC7YDe15YAu6j7vykFXUjxeiyPCO2DZDYQJeKktu9jBkqtNrqe
         WPdymQBI/+9IwXK9/xayp3SWexsEYGo7YjbRBWRFBXuSDu9TdSK50kbXOriiEcvR7xIO
         tuMg==
X-Forwarded-Encrypted: i=1; AJvYcCUrrNOMGoMR2LvIjqPIU7tF9uFDr6bQp/yLSvdRikpFMFMmqO5DkM3TrHFM0+41IyGsGKzArHd5uGukPm6M@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6/VKZrpWON8XKW9AGbiXTw9mHOiFR1RVsZNA0HB32fW9szVtS
	7Apm6Tw8ZoDfNF6vjdNIKME4+jwQD/PykFWnxVdk24Dq3U3XqIid
X-Google-Smtp-Source: AGHT+IFYh5wXTwNDatXldUZFMomOBR35HgUGuo4YSeLso2Z9EFhRWFovy68CskujILszB1NPTyf13w==
X-Received: by 2002:a17:90b:4f8b:b0:2d8:e7ef:7d23 with SMTP id 98e67ed59e1d1-2d8e7ef8144mr7285337a91.4.1725535678797;
        Thu, 05 Sep 2024 04:27:58 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da509e97e3sm6651162a91.19.2024.09.05.04.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 04:27:58 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: include: Fix spelling mistake in rtl8723b_hal.h
Date: Thu,  5 Sep 2024 17:12:20 +0545
Message-Id: <20240905112720.3141-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index f9ecd9047d52..e6d6e9de5474 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -38,7 +38,7 @@ struct rt_firmware {
 
 /* This structure must be carefully byte-ordered. */
 struct rt_firmware_hdr {
-	/*  8-byte alinment required */
+	/*  8-byte alignment required */
 
 	/*  LONG WORD 0 ---- */
 	__le16 signature;  /* 92C0: test chip; 92C, 88C0: test chip;
-- 
2.34.1

