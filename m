Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782805;
	b=syuJQKJqI1hCvJfnS/8N2Fdo6ugQGKzTG3ju66AgSRYLBQocN8BhuOpyLbvW8RlLHhfO
	 hEF3fXvxzFXv/uXhrkic3hXp73PYXVTB5Dy52lsGByCGgL6tqds6OLbOLX/dzRD4u40DD
	 UIbFQYFOXH6ZlBOObh8zbHPd6wHMHdw1q7oofcXjIrG3jjBEOmAgvkzGyL6E9Y7yrOYFk
	 a6sMcKi2NB2zTM/OSJrpLkfiAfyR3Pb8WVa0iHQCAMZ5BpUUugp5IAccArd5b03BWbKQc
	 vgaoUcU111Yk9iLtNMNdXYFOUb84+Ja9PSX21iXKgKmANI39pZ/dx5JPI3KG0LDqY9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kZPMEzPJEBmK9RydLOqHgkqh2L3rwP0H3qPdw9k3biE=;
	b=dyDRu5Pke/vs/5u2GzmYGK7WK9vWmGDlv33FA9HqQCLdLMbUU1IuI2pfb00GKvicvBrJ
	 IAIvUjvVOQk4HWX1i3SBTDvyseyCQkQ3douy4wJz1gMtLk/d8Im1F3ygXa7epRzVgKY4z
	 yJR//kQ3Pnqey7H1RyE2RnhfxP2qRPGF56+DT31bJsh42T5zGC0oji5aiSgC3v7GZ9T0V
	 nGBn1Yo0x5ljdl3RHpzAeOewmNs+bDWFGM5BUomvZ/W/KTPU0Z39YZIFzbrCMv78RgYdQ
	 Cabe1cGHidP7beyi3CcYHAJGWMCUivD+T6PqhszeKKePOYcyQKIkJDqi35Trya9BWdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTEB0S36;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5C606A31C
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 12:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTEB0S36
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso3246458b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 04:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782804; x=1796387604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZPMEzPJEBmK9RydLOqHgkqh2L3rwP0H3qPdw9k3biE=;
        b=TTEB0S36ZiApCAtUmmS9PCYCEwSX/YBqZx+NwnbFNIr9sMcU/v4uTXpbS0Xe5hfPev
         fgk+vx3uLbZMZJWwox6ybYEMatcBwIm55cPJa/HAvrRb4Vle6Mf8LwxDgBVFVE01WPlL
         7VPFL6bknlv2XOrxbtV1LYPxhEHJv39pYVTd3upt5A3LR2EEQ5RNkcKEa8eykiQBTc7Q
         duQspUq5eyw0y/PycD7lVqVrLnwSIhAnzwnCh1LQ2x5OA2QPLERizStKiqC8wsJvEU3c
         H6LmifvPSLWrVqYaltyUFl4XgSGViDEfX4HK75q1JlEqyKZepqLIsswTDpzPYxAwREc9
         NiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782804; x=1796387604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZPMEzPJEBmK9RydLOqHgkqh2L3rwP0H3qPdw9k3biE=;
        b=s0BzlIt699rC+1yYCT3b5aGjmt8ePTxXuHjH289sjsX4E76OPl3zwEQuaizFeyF26f
         wBczViKXyLlx/3a9VDNPQelc3nxNtLZjVU+YG5meHA5FU0YnmOJQWLbtexhE05T12wkY
         gRK3krX81edk0uvcDdEDYF1lcImvKsP7XHYy/7QObQLN6fYc5Iod5vJXYC7BMUiAvNNs
         mcrWOSOUDfdhaRdKcfgnD3LkxbUZwUt1s3ZecP6bJnBtwyS7fNZTyANxihjJliXvyGQb
         OpncSwOk18rK1hwFX5wHscC20/nRe6pBl53uCyosR1Jf1BTKfgdqOIo74RDqEP4ve9f0
         lMCQ==
X-Forwarded-Encrypted: i=1; AL+hErGfwDyHwokT8sK9JJBOTseaedhmwFk5hK8RXAXcFryFAQDnEAVNpktvIHtrTx68L45DDzIbRt3kFX0rLSg9@lists.linux.dev
X-Gm-Message-State: APuU4Z/yeqVCIPnAGHuefxRrIH45dcMQYnsnIWEvgJbcUh98fMI/DW9y
	2i9CeJ/6WzJ3OwVkCvfigcm+KSdxR+39nYZ9H/6+bfES0JvK+6gfQBCk
X-Gm-Gg: AZFdTZfiEI1SSak3sXdpFFflUnL/Dk47OK78teLvvEjnHnsLw4G6FeVFrnt+nF7Qk8d
	ar+MF6BidFsurY2Dj7PXHfFDG2m1zHXef1wbyTK6inPLEKRVSQgFmuqWKyQRWQDTDw+lCn1s1nk
	FhgT73JbA6zVnY1Q/pgBJ/nyXIH9SJ8ceUcb6NUEy9KTMji5Ai2H7x/8Vw0CepaQQrlkn/O93Mj
	bTF5FbrpOJoyGUVE+jwZOYmwQDiFkCA/trQnRaSqc3taDOF8sbKu4JL03pRyXvNKA52Mclnbuj0
	oHYQX1ib1pPac0P6oLO3e1vfEmmFEFgNhmxp2Fhx5oE13UrtEeegAm8sprDYMEEjKSCyKjWrWrU
	4evOvuX79ASXZntCoVRAOG841/tSnBsYAhXyPho1bIkFdryV0OJznCSOqGaqtdtSThz9lOFt3xO
	m0EkTGzm9ZZxwE0zgXH/Dm84KHL8VwfYOThbZKSfFG6fEhRbs5J5hzcduDIvTsS34YYAeJVXwO+
	WSquioMm6Ly0azzrzIzE2DMDS172BGPs6ks6kmBA3Io1nZKPwKcCZmDt6G/3Thcx3/KimBnAUXR
	k/sxBqzRQfQnx0qg0JpdLwQ8GuxC1C8Yz1dbkg+02R7txfDg9/6ld782kbGoDv18GfrQVLs=
X-Received: by 2002:a05:6a00:2d06:b0:886:cae0:fb64 with SMTP id d2e1a72fcca58-8c87c85fbbfmr22361125b3a.31.1795782803987;
        Fri, 27 Nov 2026 04:33:23 -0800 (PST)
Received: from localhost ([2401:4900:1c2a:12da:3176:e694:92eb:c932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12568899b3a.2.2026.11.27.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:33:23 -0800 (PST)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH 1/4] staging: iio: impedance-analyzer: ad5933: fix swapped real and imag data
Date: Fri, 27 Nov 2026 18:03:00 +0530
Message-ID: <20261127123303.144052-2-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127123303.144052-1-punnaysharma805@gmail.com>
References: <20261127123303.144052-1-punnaysharma805@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With only in_voltage_real enabled, every buffer sample is the imag
value. With only in_voltage_imag enabled, every sample is the real
value. Nothing reports an error.

ad5933_work() picks the register to read with
test_bit(1, indio_dev->active_scan_mask). But real is scan index 0 and
imag is scan index 1. With only real enabled, bit 1 is clear, so the
driver reads AD5933_REG_IMAG_DATA (0x96). With only imag enabled, bit 1
is set, so it reads AD5933_REG_REAL_DATA (0x94). With both enabled, the
read starts at 0x94 and covers both registers, so that case works.

The driver tested bit 0 until the bitmap conversion in the commit
below changed it to bit 1.

Test bit 0 instead.

Fixes: 32b5eecab0f2 ("staging:iio: Switch the channel masks to bitmaps so as to allow for more channels.")
Cc: stable@vger.kernel.org
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---

Notes:
    Tested in a virtme-ng VM with i2c-stub. I have no AD5933 hardware, so
    there is no real sweep and no real ADC data here. The stub holds 0x1234
    in REAL_DATA and 0x5678 in IMAG_DATA.
    
    Before: with only real enabled, the sample is 0x5678. With only imag
    enabled, it is 0x1234.
    
    After: only real gives 0x1234, and only imag gives 0x5678. Both enabled
    gives 0x1234 0x5678, before and after.

 drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 51d73c5ab9a1..bd85cb37ca4b 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -624,7 +624,7 @@ static void ad5933_work(struct work_struct *work)
 		int scan_count = bitmap_weight(indio_dev->active_scan_mask,
 					       iio_get_masklength(indio_dev));
 		ret = ad5933_i2c_read(st->client,
-				      test_bit(1, indio_dev->active_scan_mask) ?
+				      test_bit(0, indio_dev->active_scan_mask) ?
 				      AD5933_REG_REAL_DATA : AD5933_REG_IMAG_DATA,
 				      scan_count * 2, (u8 *)buf);
 		if (ret)
-- 
2.56.0

