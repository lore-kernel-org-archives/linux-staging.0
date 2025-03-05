Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6455C250C13
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190364; cv=none; b=p21G+9HFmLk8B1vdXu8q6yFrieSnfQDlP4qj2almmqcZWfYko43GL05xmDMRdkJYk8zcXdTSWTnzhmFf4rsfyPh/E9e7MuWUNsw2SCLIawOeZ+4U4omZd7xd/2jX0UVWaLrpQOhaKcTgCcPyjpX0851Q9bXuBVZE/svbCHnsvXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190364; c=relaxed/simple;
	bh=sPIjwemLxkj6a9SRgASP7zlJ2AGGs36MMsMMo1SWiQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOqteNnvgKxMROwD4HojsCTzLsKY5MMcCHou09nFMOoYr12bDG0kLqWGYgytlN5f7FM7uWgSa1B/ln2asR1ferWn5huNY+0KvVbit88Da37hncrOIaPpHj+wYML0EyFO+NIEfIZ6zknm6bao5KtUna+AK67LRA/r+Z6FPxLaKo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOzsklHt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOzsklHt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2238d965199so75488655ad.2
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741190362; x=1741795162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7CqsHn5bokc3+NcDk3/lA+pgZAOj6766/BLvejkqbU=;
        b=bOzsklHtTVpFQqB8OzZolkuFHQrkjVuk1Nm8AyFMbM22eq2rilr3GCVg/NH41KBLUJ
         SveKwRHewjacvsW5/XM5QRP9/iWHQi5puDwnV36qcm6sBs18+mP9lZlvJhmzHQ0k4fKu
         3pQiuCr+nMRsWGVn+D+euXx/4Gx3Shbfgmlk2rPNYZ18Lgbk2E0uQjscDoTjo3ufEjJD
         6Eiw+uQmAd7kb6qPaYhvo+XB/Ceju8wfk2bJVCFMId7wL1mgA6IlF1kA7gprvF9nKfr3
         ryVMEppOAz/L/tZWILU0InlawG/7MiZM/384C0a0g2mQNIkhQh1HaY0QqhRvJnf64p/2
         Kwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190362; x=1741795162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7CqsHn5bokc3+NcDk3/lA+pgZAOj6766/BLvejkqbU=;
        b=V1higTy1+581uxx+c72jxwB3iNj6FHues3yn1UF8HMnqPUC9DE+TncA/TksMYt3gSB
         lMgju62LluPFcNuaX63RpBgiLIRusokYkAimSSzB7gKbaW99aPF1KgecMe0C8PEEjyET
         TknJ/PERLFN2piTxUznkGAxJIww6Bl8dq0wfSNNooDWI5Ufx207ytrBiB+sC++HOoh5R
         ridxv2zFw9IikjKzJuDxAeOqtV5qDy5ksuDsWyEzbutauL87buEqy3KCV+XBMspdj6ZP
         QJwjA4Ut8ifOnigmhQkJj5izRxr7lb4W2k2e9qR4K2wgkHp6oK/xLiwGikGs1HDji321
         cYFw==
X-Forwarded-Encrypted: i=1; AJvYcCXaH9oXfnx2uAsL6jukkszEUmth/bnixZSuCRo5rW7MApioGW5CbB2Dxmzae7+IzyI1IIRMMYMfK97mlXvl@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1rmPhMIWq8WVV89ha/H9oQj/HuckvprUBOa3kRRmISUHtcj7P
	NbY0bLFvMyqyaA+pDSr13MpEiFHYuOf/QlPOBkY1gN3V3Ck0bhSOid0r+eDhHcU=
X-Gm-Gg: ASbGncvjP79TU/9eE8EZ4sPcHHCzB+m7j7S0I4UBHo/ZDpHrtvtWyu2WNVkhlrhAj8U
	xmp4FNvjWuFzx4i5qyMr7ZMX5/cC5C22nLj+NgLCa7Qg4dJ+XgTdEVPt+k5CeT9EOmBDxE6w91b
	l1MOOXJiDB65RCyXCj923kJaHk8l7my6GNoACeaPG8FbuXL/2BRUDu2vVnh9old7tWrJO+n1/OT
	wUXYprdhWlwOoT/Ib9d1ZTmgg2ogE6/HNO0QM3Gn/C/bdNOttZTmAc3Uyg6xa2AFd44i1dzMPWD
	ppLjb15z+3Gv3XvwOgCu5+rZRNgu3aiEwahtJuRD7giCacqPUJQC8fqayeeVRhRPM8c=
X-Google-Smtp-Source: AGHT+IFRhZMcPG+j/Bvhc6eaaBbKGPiO9odO+NpCBvKjt6DDu0TCzAMrD8Y/zSal1OHpJpvffdLc3A==
X-Received: by 2002:a17:903:fa7:b0:223:5525:6239 with SMTP id d9443c01a7336-223f1d0fe68mr64532755ad.38.1741190362551;
        Wed, 05 Mar 2025 07:59:22 -0800 (PST)
Received: from fedora.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f9d96sm114914245ad.54.2025.03.05.07.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:22 -0800 (PST)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lars@metafoo.d,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH 1/2] iio: accel: adis16203: Use units.h macros for measurements
Date: Wed,  5 Mar 2025 20:59:11 +0530
Message-ID: <20250305155712.49833-3-simeddon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305155712.49833-2-simeddon@gmail.com>
References: <20250305155712.49833-2-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded microvolt and degree values with MILLI macros from
linux/units.h. Also fixed typo in comment (1.22mV->0.22mV).

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 drivers/staging/iio/accel/adis16203.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index c1c73308800c..ac4b28bcd766 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
+#include <linux/units.h>
 
 #define ADIS16203_STARTUP_DELAY 220 /* ms */
 
@@ -173,10 +174,10 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 		case IIO_VOLTAGE:
 			if (chan->channel == 0) {
 				*val = 1;
-				*val2 = 220000; /* 1.22 mV */
+				*val2 = 220 * MILLI; /* 0.22 mV */
 			} else {
 				*val = 0;
-				*val2 = 610000; /* 0.61 mV */
+				*val2 = 610 * MILLI; /* 0.61 mV */
 			}
 			return IIO_VAL_INT_PLUS_MICRO;
 		case IIO_TEMP:
@@ -185,7 +186,7 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 			return IIO_VAL_INT_PLUS_MICRO;
 		case IIO_INCLI:
 			*val = 0;
-			*val2 = 25000; /* 0.025 degree */
+			*val2 = 25 * MILLI; /* 0.025 degree */
 			return IIO_VAL_INT_PLUS_MICRO;
 		default:
 			return -EINVAL;
-- 
2.48.1

