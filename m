Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED98B3D091D
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173154; cv=none; b=d4ff5I2wRCssotkSZtMa6TQQ8/eU/7Ry78ub8Zmu5EanaD2NMepE4sVdfPxggcZcxxh7NXguP17nHWu6p9PfghdzRL5q7/VGgsvAaEtHcAgdDguQoe9eRzxuSfLnkJUQNa6lcF2G3CWsAnRZZ44mYMW6EVJxHhwjjPeRS3VWrb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173154; c=relaxed/simple;
	bh=guApLfrSRuNxR3Y8l2tK1to2nzdDTARtdhHWSQ+XOAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o/GGSVSX1vxJ2jg9hDcqzK2uPsrUHv7btGiXPyJ7MEBr9Y2o8u29pKNRgO1tHGqahOMFlPMNZgfapRnCjnLrv4POD76rA2Zh/LLarC896qL/bDwW1tt+GHnVFFeTlq2dd4p2jRK5PrsYrpk8V8mXUKxBPu8jvMZ4CrQj6ZBG5mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLm/UwUg; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLm/UwUg"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82976220e97so3660338b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173151; x=1773777951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=VLm/UwUgg7X1zfPFBF1WbWtbe8jePF+ZmtmWe9zIEQNrC3MdUndJOUApRunXr6d6FF
         jbzG4qKBlWRzGkasAxgOg7FNElsO7T97X13/pQvlT7KbPHwzQCAhW5zhIOzpHXAFlc+P
         FeZwqzb06RlxwAuwCQs8acvr/aJBPYFEIPtAPl4GHxxBvaNPfffQHkrFvBZJzoR4mgqP
         e3hFlPNX8iEAfJkNOTX6lO0zIHJOtCl7RfMPx3GyRiUXSEaeiYdv++fRzQgnaxswO8AN
         s6ew5JYJd+x7bi38sgY4OjqG4rZysZBreMREAVtvDBGAGEvKR0uC1Qd/DWvZZcYQQal1
         hgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173151; x=1773777951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=pmL1FIrqvXgarEF6C80XIDulCZEUMwbrMPGehQ2yAg1Z7GuTp+S7ShdjBDXF8dPAxS
         ZzvD1mKzOdiskSGwmtiIoxjfBpVhOpGtQNldYmYJWnhbW/3JyvYmg1dRQbzioZbU4Dua
         q7lodxI+wqLxwY9sYPUdN4FNHpNwgppAUFp7QnIvNgKwKgVGdlGBtYt01jDf9Lv1HLOE
         3ffTw8Jx7S5yJE7OgXcDhIU2vciLgtUp9grxd401m4XD/iG9IamfK0BO0ZTqqlBaWah1
         y1YXfb2uLL+fJsorPqIhZz+SAhvJpV20bZQIKcGtRZC0d/IISkvXS0hPTyBz8MsRwCmK
         lTAg==
X-Forwarded-Encrypted: i=1; AJvYcCU32HGBONcyNRTxoPByGCX1LWyCQCfv7fJQuKXw/gHGpl8MfEg7mWITCpikwhswdXiPq+aRsyqm4+SBmSXe@lists.linux.dev
X-Gm-Message-State: AOJu0YykmVhYRHBXPoRXlT1w/Dkj06aVZCFefC9fMzCtQXl76FU+FVGN
	EOzTPqt+xfN0//3Hy33Q/B3ciXPf3XD6ClpMQK1N5lDZBxmf/2tlkpMw
X-Gm-Gg: ATEYQzzkq6qu3YwO7iYORDCjEDf8jthcLhbtnlKGeJAXO1fP68Uhl8WdFfC0lF8gKHp
	PuTdqsB3Iy1xsrliFM+T7wRq7Oxe0+LT4i7qUmkhRHaqG8H/m1hJkY3mLdHcupDk02RKaCfAaQR
	qhwy8ncjU0o0LrQsJqti6aq/XYePnOyr1mGevR3XFmlAJJg/tAQBkhCxYamczKt00LpS+fBLTB8
	7RcNDqoD4mhZm1bXuyUZEKGmSafEnPtqJcvYQlrlnSwBfZkcBt7beJkuorrqEFNLJ8ouNOkSHwB
	FbHy0MnT0LvSyViKsBcLANWghfla3WM6qdRjEJX9obJMUG8Mesc+aKX76k3uf7LjYYuENE/t+As
	thmgGSVuzpEifSN9n3RFibdb+zLGuey1E/3Rx/t64rEyYfp9H5P2BOIB7k5DIdrl5T7dFBWz6lL
	VuS54KXa2MEZkqXGHKG2f30/HkF9kpsLTIlgfy2q0CeLbBkFbc5yNrU/xfCGc=
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr156570b3a.9.1773173151308;
        Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:50 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:08 +0530
Message-Id: <20260310200513.2162018-3-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/iio/common/ssp_sensors/ssp_spi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/common/ssp_sensors/ssp_spi.c b/drivers/iio/common/ssp_sensors/ssp_spi.c
index 6c81c0385fb5..e76ef39c6b7c 100644
--- a/drivers/iio/common/ssp_sensors/ssp_spi.c
+++ b/drivers/iio/common/ssp_sensors/ssp_spi.c
@@ -331,7 +331,6 @@ static int ssp_parse_dataframe(struct ssp_data *data, char *dataframe, int len)
 /* threaded irq */
 int ssp_irq_msg(struct ssp_data *data)
 {
-	char *buffer;
 	u8 msg_type;
 	int ret;
 	u16 length, msg_options;
@@ -375,7 +374,7 @@ int ssp_irq_msg(struct ssp_data *data)
 			 * but the slave should not send such ones - it is to
 			 * check but let's handle this
 			 */
-			buffer = kmalloc(length, GFP_KERNEL | GFP_DMA);
+			char *buffer __free(kfree) = kmalloc(length, GFP_KERNEL | GFP_DMA);
 			if (!buffer) {
 				ret = -ENOMEM;
 				goto _unlock;
@@ -386,8 +385,6 @@ int ssp_irq_msg(struct ssp_data *data)
 			if (ret >= 0)
 				ret = -EPROTO;
 
-			kfree(buffer);
-
 			dev_err(SSP_DEV, "No match error %x\n",
 				msg_options);
 
@@ -420,20 +417,18 @@ int ssp_irq_msg(struct ssp_data *data)
 		mutex_unlock(&data->pending_lock);
 		break;
 	case SSP_HUB2AP_WRITE:
-		buffer = kzalloc(length, GFP_KERNEL | GFP_DMA);
+		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
 		if (!buffer)
 			return -ENOMEM;
 
 		ret = spi_read(data->spi, buffer, length);
 		if (ret < 0) {
 			dev_err(SSP_DEV, "spi read fail\n");
-			kfree(buffer);
 			break;
 		}
 
 		ret = ssp_parse_dataframe(data, buffer, length);
 
-		kfree(buffer);
 		break;
 
 	default:
-- 
2.34.1

