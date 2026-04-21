Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4571F39D6D5
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759755; cv=none; b=QkFF5h1gCiv2xD/wPzqHBUfyxkvly9YBL+EiDtJES6zSpxGbBl3pdSMD7jScfNrF81SVLkD8pOTRnYLpCbHpm1XTBvBqMkRiW8HMsSUcnVve8oAffy5uK1koR6pKG/FuoWlpl4p12kBBCvCuqMJZDx1kniOdJvfCw4LioDfsHUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759755; c=relaxed/simple;
	bh=Uki0VyIZzWUgEtTUOFrRDxzi83GZ+WYr6QhD2SFJK58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g00Z4sKV1i2Iwxwm7dUFYXBU+cJtJlkQILih1xi8j6T9ze2zOLhvKVVztv5yqx1PMfdLhlDskHpm/1wzmdkMzdjUW2ABBTDJvpVwnCps6AQjfhVprfPRrvE+B8hKFvlolqWA912Znx1eqLOlQv0dW6KFCFjEBTuAUzeit7bU5UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rx3JLFM7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rx3JLFM7"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab232cc803so19048635ad.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776759754; x=1777364554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/hj4BKK23dESNGIUvYCIJ9j5Rat32Tto+NKgW2HPuo=;
        b=rx3JLFM7MAf3y7n2eL0ioYyffFToW5GP53V6qdgYGicnUcB8GKvpe5K+fWmudaqhIK
         FYP1LU5iWbSke/s0WfFzA2tDwPV2qSn9QRSNzSgPpAu85YJRY5ZowsuGycreTJc2XqIU
         9EXkS/K1cIhWmct3PUt3W7sPaU9Pg/jdlada+s6EKSWO4vEplzzlLYCUTd4L1XzQfAxm
         EOPpUqsvc+eZMTto/DdosBVNJ1ULmzgouJaKBArW5QkLvQgtDb0Prsunp3nlvZsl+CXH
         FzXdivpxxtZ+cJw6KylVzP0Yo/uKjVfFqfl0qzruBBTbNUp4sHIYUaz5HC5tJFLypMin
         oilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759754; x=1777364554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/hj4BKK23dESNGIUvYCIJ9j5Rat32Tto+NKgW2HPuo=;
        b=PRYKkoR7taynZtxzLWnN96G45IB83a4Sb4mMwYV4C1T/AlBXyxNso5D5CCqeGDo4dS
         j0DWvBVUT4LOIEbbUPGedOcNV2jP3WnhMiLrD6C5rvQuDKY/pxu11ooQuHZVooR9ktZW
         i2lzJhBm/tUfIu/JwzGmpZWQ5Ay67BZB2cNzP87UPE0qvkeYZMWiA/DrEUNMQtHjz8kN
         K5pYK2p9Yhy7HHB+9HdCPbrl2KQTC0wIzlxDQynpJfnUnJnbsdjzBkRGJFd37/oXQbIz
         3lQN2bTRLFAXuHsr8IKNaZ9fnVW0ov318Trhp7cn2Gji7zkOqKNO4aXfQgRB9+dWFLbx
         RwTg==
X-Forwarded-Encrypted: i=1; AFNElJ/hMaCOczPOut8us3kxVyU9g3pTD8lPev6YH2ukTEFHpGOn6Fr/0Ov9qzbt6hP1GlrHss3IUFaKMv9f5boI@lists.linux.dev
X-Gm-Message-State: AOJu0YysAQSahk6VBH1zYLSYfBBZV0o4BNBkLY1QOjvd9hZjLyeHSLSE
	od0Ia0wZxxkL/NrxYQWgj+Rn+L0q3zDWYC2pXJ5KeqUcpf6SpIkmTgk6
X-Gm-Gg: AeBDiev1iiePpyy20GzRyZ0VyobOq7us3sdf87ZwKqhjcRSZ3Ajbn5cv2b7sm3Y3pKG
	O+TtCSmJcgjckEbYFEuEyPyw8oxGe/0Duy51AhXgWXh2FucCjwYb8/HjWI6bkEL5HWiYLHkKqO1
	VYIFum3q6pSOfvlcINOVNJPsBmc2oqNiNDO4FCnPUAgLDql+fHjm3ZnjiJ67Clh4SEEh26wxk79
	p1ZpDCNRPvLbatsd68e7Xm1jCWkZKh2mbpBDUfe1neXNrpmoNtp2li0cNCMsnNiTjPY6964h3BM
	eD/bCkbLOKQahyDlxAjbPZ8lit1rjSIu7T6mWbAZO2fEdpkEc5Y3q3GBx+i0O8Sta5uX/aOSXZF
	G8ijAZJzf6AtYKo7SXK1800xNZlqsON+DIPqNbuEWVMGuHWMppYRvdVk8TwCtRD/sWvFxH/m1Ya
	u/P6FkEJ9FkdlBbS2L6/ofYiG0B29u434xMwq3mSGPablvrBT1nTp7
X-Received: by 2002:a17:903:200d:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2b5f9ffa730mr130394005ad.30.1776759753630;
        Tue, 21 Apr 2026 01:22:33 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab2114bsm121369215ad.60.2026.04.21.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:22:33 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: andy.shevchenko@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	debjeetbanerjee48@gmail.com
Subject: [PATCH v3] media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Tue, 21 Apr 2026 13:52:11 +0530
Message-ID: <20260421082211.74041-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
References: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI2 source pad format was set by blindly copying the sink pad
format, regardless of whether the sink pad is receiving a DPCM-compressed
mbus code. This was marked with a FIXME comment.

When a sensor transmits DPCM-compressed data over MIPI CSI-2 (e.g.
MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8), the Atom ISP hardware decompresses it
before passing it to the ISP pipeline. Therefore the source pad must
expose the uncompressed format (e.g. MEDIA_BUS_FMT_SGRBG10_1X10), not
the compressed one.

atomisp_subdev_uncompressed_code() already implements this mapping via
the compressed_codes[] table in atomisp_subdev.c, which pairs each
DPCM mbus code with its uncompressed counterpart. For codes that are not
DPCM-compressed, the function returns the code unchanged, so this change
is a no-op for all non-DPCM formats.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v3:
- Drop "staging:" prefix in subject (per Andy Shevchenko)

v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..e723304bec80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,10 +107,17 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/* FIXME: DPCM decompression */
-	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
-						  CSI2_PAD_SINK);
-
+	/*
+	 * The source pad must expose the uncompressed format even when the sink
+	 * pad receives DPCM-compressed data. The hardware decompresses DPCM
+	 * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
+	 * so propagate the sink format but map the mbus code to its uncompressed
+	 * equivalent. atomisp_subdev_uncompressed_code() returns the code
+	 * unchanged for formats that are not DPCM-compressed.
+	 */
+	*actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
+	actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
+	*ffmt = *actual_ffmt;
 	return 0;
 }
 
-- 
2.53.0

