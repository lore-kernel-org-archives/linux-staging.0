Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677C7372678
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781467; cv=none; b=N1kB/sDjYm1Xr+Y4s7sUHdIoXKY3oaungD47bMYxTtnUD3dBAZO2nx0ErQAl0yRZhWy45z+gt5yzerLO9rsNCCSNQSh0Qq4gum4nQoZFMuKxlp62g//jv9DPVZL2A2yMdWgB3j+iJNLiQbW4II2EWzXbl9fJsu6wpEIWHTIiVOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781467; c=relaxed/simple;
	bh=UFx1zfBhIFtNwm637rBCqONNfHs5cD5op/U4yfb32pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NipUijPRzMEXBv+toc/i/xGTWMG4nRO5cY/gkX8QJVLtC37FkXEvMLcGUvabySl87uzx6qSJbC3eLuAqxuNGJQtUfdwFdfa4VmSNu/zcphYCu0ptQt3Ma1G+8hUAsVTrzcbEAoQrlp5/NDSYeEhEsGtZuznK8Z7pZSAn6Y5JSiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2gUssYC; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2gUssYC"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2be1b5fe11cso5150296eec.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 23:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772781465; x=1773386265; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqNJET3JHiOSv7w1wEksf8FrxnvvCl8V1ojVMOruH/g=;
        b=J2gUssYClXfp/uTARQ0JBckb67lxZwWdIprdqMyXtc0KoqKYND2609X5FvwE+s/igs
         y7ZXPuOWoOCsjFs8FOa4kHO5bxT8cFRoB1jvqsXy63QFmStatTDWshYu0qav6oVGm0CJ
         j7jnzDGmaBpua/AG8vwZUpO/pSnKru7yZo/SHs59jbioDXfn3G3YF4UpeEExkz1l8Tvh
         UgQOp+4P2JNhZA2hW4YiY+Vnf0xhxC/hVeyfspvSE3XLq2fPuUauIcSgrCg/x2AERef6
         I7Lvkovi+/wTHdsrtJxiZMJm6Rdoh8qb0BxppOFWX/Yjz8EKS1k7+Co4pRVBrJ1TkzbA
         6u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781465; x=1773386265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqNJET3JHiOSv7w1wEksf8FrxnvvCl8V1ojVMOruH/g=;
        b=kf4xSMylsOIenAiScFJxVZqKh2883Y/IY58ZzV/Gb60S/ULk+CKC6/yQ0hoMGmmfIm
         +kSTB1+wE2FWQEXNLut1uUzPTOBRnDf16kkeRSd/GjFI74w79JhnCV3KkSmrHBeRhYUS
         qidswDANQGvWHkN55byrQmQcBp0xvwb4IsH8i9x8Ija7fM+fh7lNZwJ8eUymeQHFkEHR
         BWDMFEERKUIVY/IejZkHjzUNwdSVJOrbrB4Xc9QFMYCjEhxuG/vo8qutCbMoemY5RvvZ
         FdlNxbnwfDlE1UUZQRk4Tvi+EByaPqiqE6rgT3BKpU3BXcrIbCsmQi5+oPNM0ZpYtSnI
         hp7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvDi/bpMnLhRKrfcenyzNfRiRZqlAh80mSeX5OHuBLaA73rw7cnqHvw8Hn5Hb1TUSWNKBlBUdEUFjhKuQI@lists.linux.dev
X-Gm-Message-State: AOJu0YwBXsq3U4XFvIXDeNC7FuwoSz+ZaicBN4p7Rjs2cNONfRXdkHCZ
	SFrtQb8QW97c/ARXM0NbWGNXZHekd+1L5dYdqYwL6f58QX0N+r/CUp47
X-Gm-Gg: ATEYQzwcYrgze7CdQq7IcRuu6KS16AP67/xWm4uxUbFozq3OW6KSIUCPpEQqllsqwru
	qpnZ4ZiKccxO38qQZedH8bN3E1oRE4ILaiRM6zIKeN7f5X91mk7zKOCORg6IPb3nRFFkBiYAFqp
	31T+/WnPurQQ/sLTXszXI1jIcjdgcLw8XODPb3z+ty4Yn+HlPEzFJU+RSWGFyF6T2wkrjC4qeFK
	dByHHtRp0fUriUxeZK7aInWwZoW/5iDEl7qkvgemDGk34uvlX+APZFf5IVrY743MgSboe9KiQDV
	X9YE/7eV8Exnpod4OFUG3eWAaWoLlH+a0H47Y/Z1EaHjSYNIWb44GY1z+GzRUzNrht9thnDYTLm
	tIjfHXMDimaB5rSDQC8RLWDzlQUstkcWdrYLyBeRB1xg+RUCgA1yEmciBxHOffuzA/WsU++BLS4
	SYTv8llVfDLHPzdmtNn7472jk3MJ/tfCL1spdEZExDsb4EWDku
X-Received: by 2002:a05:7300:fd18:b0:2bd:afdb:72d7 with SMTP id 5a478bee46e88-2be4dfd0250mr383385eec.3.1772781465467;
        Thu, 05 Mar 2026 23:17:45 -0800 (PST)
Received: from [192.168.1.187] ([76.50.196.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96f25bsm545713eec.28.2026.03.05.23.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:17:44 -0800 (PST)
From: Michael Harris <michaelharriscode@gmail.com>
Date: Thu, 05 Mar 2026 23:16:58 -0800
Subject: [PATCH v2 1/4] staging: iio: adt7316: refactor temperature
 calculation logic
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-adt7316-correct-macros-v2-1-3702e3841c42@gmail.com>
References: <20260305-adt7316-correct-macros-v2-0-3702e3841c42@gmail.com>
In-Reply-To: <20260305-adt7316-correct-macros-v2-0-3702e3841c42@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michael Harris <michaelharriscode@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772781459; l=2203;
 i=michaelharriscode@gmail.com; s=20260130; h=from:subject:message-id;
 bh=UFx1zfBhIFtNwm637rBCqONNfHs5cD5op/U4yfb32pE=;
 b=/zE4P8C9urMQSsiLpDt9DJmmjAFyaqo+W+Vzn8yMfxHzEGmo85jyHsgb/4+BEnbXPF+tkIaTF
 VqPy87qIaUdANTJHhrVhhYyn6/kiO7WuhCTThSg5EWEt9cdTvCSoYhE
X-Developer-Key: i=michaelharriscode@gmail.com; a=ed25519;
 pk=td/zQD3XANAhdG3Kf3mSetXiynk1Ql0eM4s0+eks5DU=

Replace the manual sign manipulation with sign_extend32() and change the
affected variable from u16 to s32 to properly handle negative values.

Resolve a logic error where the sign bit was being checked at bit 10
instead of bit 9 for a 10-bit value.

Convert the data variable to be in centidegrees celsius (0.25 C per bit)
so we can use simple division and modulo for sysfs_emit() instead of the
convoluted bit shifting and masking.

Signed-off-by: Michael Harris <michaelharriscode@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 8a9a8262c2bec34f3c3e79d8174f492b9a23fb70..1412808c50c76a68b5771a25c46dd3308c5cbcdb 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -155,9 +155,12 @@
  * ADT7316 value masks
  */
 #define ADT7316_VALUE_MASK		0xfff
-#define ADT7316_T_VALUE_SIGN		0x400
 #define ADT7316_T_VALUE_FLOAT_OFFSET	2
-#define ADT7316_T_VALUE_FLOAT_MASK	0x2
+
+/*
+ * ADT7316 hardware constants
+ */
+#define ADT7316_TEMP_CENTIDEG_PER_BIT	25
 
 /*
  * Chip ID
@@ -1090,9 +1093,8 @@ static IIO_DEVICE_ATTR(DAC_internal_Vref, 0644,
 static ssize_t adt7316_show_ad(struct adt7316_chip_info *chip,
 			       int channel, char *buf)
 {
-	u16 data;
+	s32 data;
 	u8 msb, lsb;
-	char sign = ' ';
 	int ret;
 
 	if ((chip->config2 & ADT7316_AD_SINGLE_CH_MODE) &&
@@ -1151,15 +1153,13 @@ static ssize_t adt7316_show_ad(struct adt7316_chip_info *chip,
 		break;
 	}
 
-	if (data & ADT7316_T_VALUE_SIGN) {
-		/* convert supplement to positive value */
-		data = (ADT7316_T_VALUE_SIGN << 1) - data;
-		sign = '-';
-	}
+	data = sign_extend32(data, 9);
+	data *= ADT7316_TEMP_CENTIDEG_PER_BIT;
 
-	return sysfs_emit(buf, "%c%d.%.2d\n", sign,
-		(data >> ADT7316_T_VALUE_FLOAT_OFFSET),
-		(data & ADT7316_T_VALUE_FLOAT_MASK) * 25);
+	return sysfs_emit(buf, "%s%d.%02u\n",
+			  (data < 0 ? "-" : ""),
+			  abs(data / 100),
+			  abs(data % 100));
 }
 
 static ssize_t adt7316_show_VDD(struct device *dev,

-- 
2.53.0

