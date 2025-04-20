Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5819F436;
	Sun, 20 Apr 2025 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171251; cv=none; b=ds1zj2OMU1X0S8SaMegL+AGXKPh6P+LubLOxMs5+1xg6JBRDfyzjcGLtYQUmzD7ou/hRoeCEO1PS6MOF+txETX82SsVu95rUY7xw+EPXk0rH/YsyJg0M6tlhiagZELM0bdsJNRcyXpWJyoPAc76ma051mgi90hautgc9T1bAc8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171251; c=relaxed/simple;
	bh=G7cQA1vbU7ME82rND+ta8qnI8kBAvliO793si5bKvhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWEnJPkSTNdbtrapT70fukiGBTxQ2/a/SwS2DUFtwYm2zbPsWSRBkyphHYksAcudtLZ0RSnVHgYLn7kew9p81nRTu5eWoYqHkf9p2rLTE9ACI9/I8PL+AzozL0rdXkIfhEc9MBfQGSi+C5TwOSHmuYzt15mPlQJ182vXF+hEWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egDxTMGx; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egDxTMGx"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so24299736d6.2;
        Sun, 20 Apr 2025 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745171248; x=1745776048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwMHB2nUwzNcRVsw3OgexWqiEt8JRdlA5caQ8STPGxo=;
        b=egDxTMGx6YNUx0uQGErErbzorHsSoXB2K5YADFiQKNlf0kCqoFn08OcCTRZhHZ9ovE
         sTTf+tXLf7in6kySs9u9/g8HB9zv+tDlzU51AmSp1wwr4fBRdN0eHQy3UutkANlUdwdz
         wBzZpC4GGzrtoJdVdce7KjUBexJOTrT7ZWy5MuGOXnS4w0FT1Sr6alohdyNxT+OycVg+
         4AKBNvCAOd61EjdoJG30IS0c3dwabj7RSeJnLO7l09kSxEC1Vdr6XEB8smb2SFBJakt8
         6g9fsk/g05e8YKK/kuE1GSk1cPISy+piQYOBAjWQGlntzA28EMZ84Yf5RUrWmbAMHRIu
         5b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745171248; x=1745776048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwMHB2nUwzNcRVsw3OgexWqiEt8JRdlA5caQ8STPGxo=;
        b=Kpz5pAKM+Zt7o2tqOzP9ZIGumseprJ0PtUWJ2SHTs+S98qE2Oj1I8I9XeMCwFosSYp
         ZTr/H+kSbwYNrGzL2Mnc8IRe8dw+h0rKopTws/6RRWnCf6SvJRxSSnlu2u8SU+X6SK8m
         o0u3Z7gVTge9BWUg+AFVy1ae9amzRhiJKPPCaV62bHuqimi1UN+Ni35d8SlshRZJoq8L
         z8Py5CUCgrIvQmCqiASzrvidyV1EdM9OCU9AHweZRlX90rJ2v7Gv/25FTDUzEkXeebPH
         B8g9n0/T2DsByCRO5t91+xC4iKXGaqXLrEom8aGDmLDCfpchDfRvSkgO67bkIy36j72C
         R6lw==
X-Forwarded-Encrypted: i=1; AJvYcCW2KUCA6cwwDPVuabcS98uVGsy9JmnNqinM7pgIhJULaTyoSBHUQ4bztTHf8KvUUlJ9okGm32n7Mp/5KfE0XVSEMEW4bg==@lists.linux.dev, AJvYcCXzC2gxWB/WkeWu1xzv39/1WH3LlUAhFxzxhlKiSLPRS7e/vxN5nkwJoQrPrzf1ktWUWImwFwX+Pl66nvHu+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWJM0oIZZQk7+dHFQkaMzbXdXNUePvajZPq4azgkL6kCWvYhhC
	jbQtOU2eSVUskzQujAdnh6/QTsZ2TuyoagBvoDNfw0Ae09QJ+ZEE
X-Gm-Gg: ASbGncvHPwyGgVU07T330Eq1PjzoVIXOltPWKjGQrUbYOkXORVfIMat0/28N0Kb93ue
	Xm6WU7tmcp3MdSIHLR+0Xfq75nth+dXcl8/ucITYCGVmO25Ax+hMbYGkQs6fAz05Lpow3/dE1gq
	iaYhSgngQnzChjXSIhvigRfNGHrQWqlEMGdRiSvnV/MIdnVlU/94pfAZjHYJGNRAnC+G+5bq3Eh
	TLDC6K/wwi6K17F6ADRKKcHKF6tJeqyxW3GlUkTPfrxfqgu27YnlDr0JFaDm2u/zVIlW3ToufBd
	2yq1ASUc14HFaOFMtEc+sw+CcL24yzqGi8YN02ZEhI8YBXCadjPD3A4=
X-Google-Smtp-Source: AGHT+IG0psL0GsQcZjIWDxL3CpYMMouucx4/293lu1Def4c/30lkEViKoNJRISzRxA+fpp0gxTi8KA==
X-Received: by 2002:a05:6214:1c49:b0:6e8:f568:22e8 with SMTP id 6a1803df08f44-6f2c4556801mr156707866d6.15.1745171248371;
        Sun, 20 Apr 2025 10:47:28 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd3e4sm34110156d6.85.2025.04.20.10.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:47:28 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] iio: frequency: Use SLEEP bit instead of RESET to disable output
Date: Sun, 20 Apr 2025 13:47:23 -0400
Message-ID: <20250420174725.887242-2-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420174725.887242-1-gshahrouzi@gmail.com>
References: <20250420174725.887242-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the AD9832 datasheet (Table 10, D12 description), setting
the RESET bit forces the phase accumulator to zero, which corresponds to
a full-scale DC output, rather than disabling the output signal.

The correct way to disable the output and enter a low-power state is to
set the AD9832_SLEEP bit (Table 10, D13 description), which powers down
the internal DAC current sources and disables internal clocks.

Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index db42810c7664b..0872ff4ec4896 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -232,7 +232,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
 					AD9832_CLR);
 		else
-			st->ctrl_src |= AD9832_RESET;
+			st->ctrl_src |= AD9832_SLEEP;
 
 		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
 					st->ctrl_src);
-- 
2.43.0

