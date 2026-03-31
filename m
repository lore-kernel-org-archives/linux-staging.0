Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA613BF677
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941925; cv=none; b=q9OmhMhUSk5fkSfkBzbQfeuRQTLNKCRhWWrXUM1kb7arvK41S30BDdK+n+9FrGBiA93M1enT/Y6epVCj6W1ZSI6EhrT2EQVDdXVkpxRl0y6W8QAMSMbGnNyrZdauZNmO5M05+w/q6W7t0KeZ3pzwIKKcOTb+2t0Y0TR0UoQNBnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941925; c=relaxed/simple;
	bh=7eZ/V2eaMySxWxCo4cGkZvPIdKQnHRuBxfyly5k7J8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Suo4q1m8iWSmj1w13LgrEHI7JU57x/olgUaZteM5G3aX4HnSUcSTL0Mf1Ok8BsT14qJRXAgmxiyf4lnDzYWDNO0UfeZ5+J2LTwT0F9hCYYzMssPLUr0LL+L57o9rn+NboSfhBW+elZpt4s0sCAm/nJOp4EbsRGOAEW5qExoJCcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+Ne12zZ; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+Ne12zZ"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2b24fdac394so20581215ad.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774941923; x=1775546723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsyQeIKYq/U0F7fCPtRCvH+bKBGjWc1PKEHcjMfaaik=;
        b=D+Ne12zZWvmHnEa04jVpCxpo/4KOKSa8G+J3CeEdumsqeTNX4W4YUfysUiAyypnIb/
         s/uLvsD51GISasRTFYKdb4WmNywXURxgA4VDwRzvQUD9GUu75fIqf2jHvot33CJlaOCW
         xI3vc4d49GK1q1L/ITGkkH8QqcecnJxCgFpoAN6ypHrOqofZVjjXhr6qbFdAUpmuXG/6
         vSVWLlCj0Ju4kndY3QjfSYE8IqwkgKwyf2HNRdahQPNagl/ZFhHj7aYR+VSQm+uXCV3q
         olCE2h9+G3EjIIMRmh2cfCYoe0U7wdAyeaFs8OcKG2U5qOw3ltdsIhQWiFdbhfgJLnzS
         cJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941923; x=1775546723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fsyQeIKYq/U0F7fCPtRCvH+bKBGjWc1PKEHcjMfaaik=;
        b=frQZosSYFRTCJSRTdWmWukyHkxm2v5KzTa7k3eFDDHVRc3cuYgHsjh0xYEcyLDfovH
         qb42FLYephfNGVqxsGleeGuBrHhsXh5jpZ4IOE+ac1A6R41JIaqaEwGU4Y9uN5df9kNo
         mOfQdiBIPmjmjO5lRDRVd96m8kXdF3zPxqaTSkSLYq4WxfDcd25MJ420EL2RxTENWMGp
         4QSRAutZ2s4sxXjOpWE6BtveScoi0XQO5FkSPSPA1ka5/eloEORwHyDURL4oucVCtnG1
         Uvqot2aoGsWRJ4cAVCBOultP/5cjzEVeeQLZfEZYFUCdtYPGyD4cP1YJmwd9pombWU8J
         McCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwDtX3w7II28DqBgPvJqFNhI/9Xhrr94RI+g5etsi0dJWwR+26zHRCG5TiBeWU7vDQbnAbq6bAYQp2pXGC@lists.linux.dev
X-Gm-Message-State: AOJu0YzaiAbdIJJvdhLR35lMv3mibDfNIEXKthayN0m5pL0sgxQs+rMe
	oBryFHIeejbEi//a66cyE2UNvOLl4tW5eyW58qL01wlc9JZAY5bNrdEu
X-Gm-Gg: ATEYQzzv3PRbmYtX4EUx6VNGBg8cjnsaJhLumFpCM4pPB7+bOgaBGGvsYtI8RJ/s5/G
	c6uvec6ll10PS2q9X5a6CqOb0hEbcoVN3YwQkVTe87zwYyXzCb2H3p/diNlwsyjZ1SqG/AkRF7k
	mAqVCVBFCoUD3VHuqmSXzLRK/OPrtRXRpOr9fGEin1sQ6b0B/+Rd+KXA+qgNhLn+cMI2kzIqzcP
	8iDzhltT5XGFS0LwGj/qcJvZfjH38xnkPEtdkEc69GLzlHYtAnAQoPtt85BLapAh/0Kxuaxae+6
	F10vWHBkVPyG2WYll2m2Y93aOWZrMeK/rJ0YhRDRvpFb+DgLKw1QtiOqJ3fcBF+W6elLs2dPe6e
	nv1DpqIPpwJwGmACS6+7zIti/mD9A+vqaLcSb34YAZRpKEP/5y+4mknZ7XZyPbxs8CtUROyFJuV
	j2Q9rCmlRj/QsRWcvWqcs73LqMiPhsqcG0NltkiBU=
X-Received: by 2002:a17:902:ea0f:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2b0cdc1fa6cmr162368355ad.1.1774941923274;
        Tue, 31 Mar 2026 00:25:23 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:5412:6527:d590:8704:ff8:2ffd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642956sm109272495ad.6.2026.03.31.00.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:25:22 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v4 1/4] staging: iio: adc: ad7816: redefine mode constants to start from 0
Date: Tue, 31 Mar 2026 13:24:50 +0600
Message-Id: <20260331072453.6530-2-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
References: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redefine AD7816_FULL and AD7816_PD constants to start from 0 instead
of 1. This change is necessary to use these constants as direct
indices for the mode string array and to align with standard
indexing in modern sysfs helpers.

Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135..9a2f60b97 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -22,8 +22,9 @@
 /*
  * AD7816 config masks
  */
-#define AD7816_FULL			0x1
-#define AD7816_PD			0x2
+#define AD7816_FULL			0
+#define AD7816_PD			1
+
 #define AD7816_CS_MASK			0x7
 #define AD7816_CS_MAX			0x4
 
-- 
2.34.1

