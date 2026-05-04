Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44368376BEC
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886475; cv=none; b=pNIAikyYWcaBqbDtitUEXrn7jrV3qFJq9hfTIOXEU/3wy97cE1/4mspaGGLzsngSuuu7XyFxFUvbF0VK99o0cOTPn59Nfo0NpY/Gc+aSTHmEXmF1QtXNNp+5c3xPJ713+1fB5C385rCKwt79Bwn+ndv4D0NVqS6O+qJOzF+4tb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886475; c=relaxed/simple;
	bh=duUPlCxI8wuGm0k2U3KXAy4SPMs3kgHGrFE/FbdciHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZmb5NEXyEob2whgqb9RZvSmvUvjZ/CREiEKMRACaznhDhYDqXZzmnFWRcgU5MFlivMzU0KzobC8q+Zajkq0W9qNGGr7N8ugfGlg9TTWTOM1J0ehVcDjIlHtwLfQHRjzS/7Wuf47MBomUNdSzqdubiW9wXRPU905GKf/RDBa8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbGbj0JF; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbGbj0JF"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8028fa6039so600053a12.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777886474; x=1778491274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFWdw4K1FqjJCcxwSDMp7zY+uVTZLL9z6JMSUECo2AY=;
        b=FbGbj0JF46LTwE8CVdj9FBZXLh54HjFOXNEhCL8CI/QCzT1Xe9IMaOZFZQWfVAZPrb
         4qf7suY52Aukh7bMjl/6u926/rh9U4v+54blLh+gFWj8FdpbRGZhCP4HFaUK0pNCJQ47
         g/XhSQ8CM3dOVe5roaEuSvbla0nyTTADZ3urfuTNbV/l7O764bZVgePLBzYE0QKKtCsx
         1lzDONRcAXtg0tUEQ8sxXwC1ypWWGexCW4VHWwvDw3UUm292Zox4i9x3qcVIbSAVIRel
         eYZpfrra9mpuRtgo++O5mUMaIZgF25c386hOvrwDPh7+D63RBntcPGfUGs4xMNuGUJvI
         nrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886474; x=1778491274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFWdw4K1FqjJCcxwSDMp7zY+uVTZLL9z6JMSUECo2AY=;
        b=T9fUUS+jIHhYhnSUaGNSPqftRe+hZ5PC+vA+Gjjheh1N7KKZklclGxT3S9M+zNcJ9Z
         CL6PCN40MC05T3HQJmzqlVYR8C+lvuuZ/et6HRfGY24Ws78WwPPXVRTnrwO4YsDVP/Ux
         n8U9ArRACJPhlfBU6YrbqH39nghS6n8UOvgeQrr5PRWntXd579gRd094CPxSFz2VwgWC
         LejDo5vFUbzIvq760s5/vXK2Lat83xiblFnoIWqdWbXhgVcf9prDkXQRA446CSv9VqNO
         Gc6kmmjYVBv11DeQidVl8SIQRdsuTfXcbgNjF30DZ/PyIhuQ6Qi/AF6Ooe+cIALzNbt+
         fK7A==
X-Gm-Message-State: AOJu0YwYR7FGMO4ZlMohr2BzlbpfCmE9CMkN9Ul72RRvPHVXPxkntIGK
	9euh8rIA3M0A/GNZSFF8mLWKjCiIo9N1ehR2KxVtPVmXTAXPwTR9mPoD
X-Gm-Gg: AeBDiet5mBlphx4PObY2NH4VEA+WQbLE8i4zzf/tPTNCfOVvWc7DId6S1stFGbLKYBS
	0yHdNTDJqC0I/JJecP1cFtnEY/KS8lQDKkZuFRjTR9MELdr0LPmqfj9BK2PzjPyQrpvagZ9tK01
	0uGoBAFcbaXhjFUZXe9LGbZgByDTIXnECwiEfyyIiVZvhs1rmPOwgSVZVov2kM2JkCuFiyUScOP
	32A+Uipng4d+XdKEyLCArfiW3AS45zmL3U9Ocj8iPuC4FmFOBju88+0cZXweAt0h0JAmHxbhflg
	LtClkWYF/wHT7Hfp23nLNEGYg7oYWzUczf5EeazO9+XA0HEkqgH92D1nTdAAN+3A8f5kzoniHZV
	PqCTzYI6vyfGG+L5a0T9wyyzJn8doIEhKOSi3PkLm2JcoqlVW1IwReCYge1krgAcp2Y3nmcrA59
	zYg1ZyzcvyrHHGsuQbEjF88cylHfAhwQ==
X-Received: by 2002:a05:6a21:3a82:b0:3a2:fbf9:d824 with SMTP id adf61e73a8af0-3a7f1e9a75emr9174677637.54.1777886473478;
        Mon, 04 May 2026 02:21:13 -0700 (PDT)
Received: from scootaloo ([101.179.98.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c802545908esm4163923a12.27.2026.05.04.02.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:21:13 -0700 (PDT)
From: Angus Gardner <angusg778@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Subject: [PATCH 2/3] staging: iio: ad9834: use dev_err_probe() in probe function
Date: Mon,  4 May 2026 19:20:58 +1000
Message-ID: <20260504092059.1536094-3-angusg778@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504092059.1536094-1-angusg778@gmail.com>
References: <20260504092059.1536094-1-angusg778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded dev_err() + return sequences with dev_err_probe(),
which is the preferred pattern for probe error paths as it handles
deferred probing correctly and reduces boilerplate.

Convert all three remaining instances in ad9834_probe():
 - master clock enable failure
 - device init SPI sync failure

The avdd regulator path already used dev_err_probe().

Signed-off-by: Angus Gardner <angusg778@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index f2bf7123ffcf..0e4727fb8cde 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -394,10 +394,9 @@ static int ad9834_probe(struct spi_device *spi)
 	st = iio_priv(indio_dev);
 	mutex_init(&st->lock);
 	st->mclk = devm_clk_get_enabled(&spi->dev, NULL);
-	if (IS_ERR(st->mclk)) {
-		dev_err(&spi->dev, "Failed to enable master clock\n");
-		return PTR_ERR(st->mclk);
-	}
+	if (IS_ERR(st->mclk))
+		return dev_err_probe(&spi->dev, PTR_ERR(st->mclk),
+				     "Failed to enable master clock\n");
 
 	st->spi = spi;
 	st->devid = spi_get_device_id(spi)->driver_data;
@@ -439,10 +438,9 @@ static int ad9834_probe(struct spi_device *spi)
 
 	st->data = cpu_to_be16(AD9834_REG_CMD | st->control);
 	ret = spi_sync(st->spi, &st->msg);
-	if (ret) {
-		dev_err(&spi->dev, "device init failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&spi->dev, ret,
+				     "device init failed\n");
 
 	ret = ad9834_write_frequency(st, AD9834_REG_FREQ0, 1000000);
 	if (ret)
-- 
2.51.0

