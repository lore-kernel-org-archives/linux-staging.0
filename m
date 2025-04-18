Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C223241103;
	Fri, 18 Apr 2025 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009429; cv=none; b=VRkgqNpjwr5qFxV4KEChpV3G0mpIGYk852A+ukbyJpuKxsaGyT+3EWGk6VERPiKGSz4P4caqEHKaAdcRWKqCfQZdCW+Py3sizc2ElXAX72xXeNHG2hb/juVNh3t5IQJR1SFI3uSq6dgTNkkBSP7BPm/+y+GxNV+MsogYqtkkqKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009429; c=relaxed/simple;
	bh=nhjNiEws7JDfpSABnQRCrgaV/jVLhmHTd1ukZHOLh3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouw+PqwIjk7NSCbYIg2eQr3TtlXzH+bWPo1ymNBZ89ei5r/Z1k6EWgWthxnWYAUJSBNOTsljkufM+LlpjdgoBieBa/Qg3AFhdiAhmcJ7/DdE6FRQWRcnpkQatsjkcg3zKSAQUNUMzASQJ3+NREJt/Aj/BxpjB44s0eZ400Y9MrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFwjvr+j; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFwjvr+j"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6eeb7589db4so23675676d6.1;
        Fri, 18 Apr 2025 13:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745009427; x=1745614227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk0TUJMIcvb2/Yt9CvbEI4RZU5fYHN3893YNwk+aijI=;
        b=SFwjvr+jpU/2EbuvG/gYKYaMM2gW1FpziRLb/WXGWcvywIwrXKhA/6vVMog8v37a/z
         JNeFTZgNsg7SuEcU6n7TlpXYbowR3KV32zImN8lgKcT8WnAPbaxt7yAYbaiWTczJF3OM
         Wvb8kuc74qB+KdQYOXOu/svVCNNVaDzP3jERfE69K9fe4BsLbhUU2vdgmsxafnDcTWPO
         IxSMMTGC2qmdTeCiJ9kPuxXxRmqAv0SVsaFxsgpA+wicP6tebPqC5ypwVPBxOHdaEwSJ
         M94824BRpR8iYLqkem2X8yrgCXJgDXAsVeXm03+Z/On06hlv2bNJCP2GGFsQW0pioequ
         We5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745009427; x=1745614227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk0TUJMIcvb2/Yt9CvbEI4RZU5fYHN3893YNwk+aijI=;
        b=HNtQkLA9TYyDCUzhcMpcjQXRoKI5eY+JL59qPDLZ3beZP0db6Roe0HpBFQEqVya0Sd
         kTn2dOEDYHmX2mCqzEqJZnOllL2yAn8UX34ps4r0uEZtaTHms0EWR9/2PaN6lEPAzrLl
         XmE3uUyiH9Jg8peBEe4rk5d1btLwjweQoVkfSZ8Xy7l4y8y6DhOGsiIwLVfGllUYfGt+
         fThYiBX2j6VexJQOVfRY9MdYWiIdXW2KlQBGyEQvtO57XmKopMDNCnBJ20hdlrKdbP7H
         C/9lSOrSGhBVIXjZgPNc7PB35QIuENpZuzaIGNnO/t+0LK/5pAnNDZ0xauwlHn8PCA94
         FOQw==
X-Forwarded-Encrypted: i=1; AJvYcCWr4MLw36ftSv1GuFy0yGoyrt+qz2vY8Ih0RhVx44sJneOXmNjQXKF1PPC1w2qNNYCTxhF5wy2YSLayylesZTpAooIrng==@lists.linux.dev, AJvYcCXjHyPRbE0Wk77PZ9QGpgOhi8ps4kVUfc6PSJp6LEseiME8Q4rk/ApH/GGmXKr96Ic9roQecBNIy7cYsMl8Hg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlOBJBhWg/zeJ1HM7E2HoRk03/GPU7K6iI6A47opKMlHubKsMm
	6+A6N12prJnD/tcOUYLrKMOJdrFiKLZIFrJwDRlu25FUykQTZAomPLxpPnmQ//4=
X-Gm-Gg: ASbGncslbpUNVhmP7b+K7ZEpOqDS4eQF+nlMeIBG1jRS9hDFrayWOnEkUtnYfuas1Nh
	g5bWh2MWPKwAm+3+rM40zKNTkdhMJE8mcwiBNdSa97+TvO7JW4PlPhzgdSuL4Oo/0Qf6zImIA+P
	CCShQFMQSPgg+6sWSiCT+QMVMxjsZBtTxpOzX0k+YsTm8viUIfuUwummMND74bGHf1+9IUnEuOj
	hFr3NFhXZcuqXKqmDIeyhiCruRsAxY0oLucjPUs52Vj6mA72iA/SMZrphe/MbnOwRo3VGJnPfSW
	DMVMNK3ST2rtm00tXpV+2OltG0ergdlGi4MW+v4T7CiKY00iuIR691Z7/HnvEVo3Ti52Q28bJto
	u/Dr5OehkiFB8EyQN6jc=
X-Google-Smtp-Source: AGHT+IG9VgYTosOoLsZ74LQUJV3FY30wheql8pLd081+4mwYIwUcq/Vd77e5NAMewbOoGJBQ0G9b9g==
X-Received: by 2002:a05:6214:2b08:b0:6e6:6a6e:7596 with SMTP id 6a1803df08f44-6f2c466f4d7mr61499376d6.39.1745009426846;
        Fri, 18 Apr 2025 13:50:26 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af11d7sm14355906d6.6.2025.04.18.13.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:50:26 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v3 1/5] staging: iio: adc: ad7816: Allow channel 7 for all devices
Date: Fri, 18 Apr 2025 16:47:35 -0400
Message-ID: <a9ff726ecf80ad7df494e6b0244ada95d6d07a73.1745007964.git.gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745007964.git.gshahrouzi@gmail.com>
References: <cover.1745007964.git.gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the datasheet on page 9 under the channel selection table,
all devices (AD7816/7/8) are able to use the channel marked as 7. This
channel is used for diagnostic purposes by routing the internal 1.23V
bandgap source through the MUX to the input of the ADC.

Modify the channel validation logic to permit channel 7 for all
supported device types.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 6c14d7bcdd675..a44b0c8c82b12 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -190,11 +190,11 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
 			data, indio_dev->name);
 		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1) {
+	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1 && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev,
 			"Invalid channel id %lu for ad7818.\n", data);
 		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0) {
+	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0 && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev,
 			"Invalid channel id %lu for ad7816.\n", data);
 		return -EINVAL;
-- 
2.43.0

