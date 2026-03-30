Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F5A3822BC
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894671; cv=none; b=s3F8wWL0w9/7REJA/BFq/Gn+22AoUHYbxbB8L3nHHUpbsva67s5jAucpxth+w7YfE4TZF3CaDXEouCu85tCv1oOd1Yw+f5BM1Z2/Od8Glsz1PUBzOjgLj3s05D2BFob3IT8h6DRKJN3wN9SWJiUaSNJvfxIgzFe8PDzxbU1I8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894671; c=relaxed/simple;
	bh=Mc846RV35bT6iP3fArUd1CRV+Tf3YyEFa0/aDDYCJ1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NLo+lak7O2vgcuaaO2QkPZ7An51H1B3Mamkf/lKqPA3gLZ4C2t62PNZ0zdU2h+H4L1EL5loR8AwdgReGqSzJJu1whf+KpYONqZUAvxCN4WyQBXJTITFmKv9N3YNpVnqW/TVTIRx2UKKc1EkOlrfN5BG2hpBrYUDwlDcDQ2kpHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSZm3quD; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSZm3quD"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82a07738118so2698913b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894669; x=1775499469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpGXMoX9YPHZwP7oVnaLSkpSaXw3E3SWpCp8C56AwzE=;
        b=GSZm3quDnQRN6i1v8hMOvgwaiytrytmNTstLrBJYSqgUnXX2+0H0O6cLjnOHaoOUNR
         eUXjsHsCLAaoo0IUWs7eFv6M+OO02y95ujz/qH6Bg+8jgaHxTgVx3K9xYqqXvqI3o0ce
         2dNcZ4aeK/cvo5X3pIu+nNQxxqQDYJgIwHT5evcaotoECSeCt4mIyt70nsjcFrkyMiCZ
         xcI7NKbNUJIjjaARAi98BqtKc0AiXgSeIi9KEkdwraVlZ9PHlwz0q0WfnMMwYiZJ3lB4
         I1YEfKmce4t3PncYkfeYvITQcfJIFOvPOZUP6Wu+Runi/jqupOMfF9ppDQ9g6UHg02uf
         1NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894669; x=1775499469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpGXMoX9YPHZwP7oVnaLSkpSaXw3E3SWpCp8C56AwzE=;
        b=QsQMEjdY4f8oeo/lXNYm37k3rt1eOOp66eWyNmtUHogRuwzblWBBeMFwlI7Zemaxi/
         0XnIoaEBFtQnH0boGDW2Z3SiNCtVc0iI6WxhMgtPOAhiXMcAoISB6+tJuqaURA10cJyL
         cehABYkXbZrQ2226Y0IE+F8/la9qcg5mF1Y564mnmP/YhEq+4sFn1FaDMHmovZnoDr8x
         qmFuBsQnyoH06P5gydEKl5LQjE2EE7bGKRtLF/IOjLSAEVJcldvtk7tlc6IWtPhDahkn
         oyjz8QBfixQCesbdNW71Len60GmgpweptGSFlUHoxrNLey0rGUZLVA+fW5q8ZJ7xSAXt
         2BGA==
X-Forwarded-Encrypted: i=1; AJvYcCUzQ1a9edt/akJirCOo5TKSvsZTp9wopPbP4hDM7ToUZCfqGSfoyKlf0yhAGvylMBSaLOu7i/l73l8rVW47@lists.linux.dev
X-Gm-Message-State: AOJu0YwtpJGuvKW4yGIGGEtb/MHvyIzct08cmyLltS2SfDOkt+vTDhtd
	b319PaQV33LTN5QcKHEVKvsjF/O2ubfIsSgSXBfydZdt9q8wfO4aAftB
X-Gm-Gg: ATEYQzwpO0A5c42NlhsS52w7HXUKjT+e3oJ8OA31j1WJZc8Z3VcvwzoyJJJRDIIIL3u
	3ossAKx1l7Zr5MSBWImmPjM+3xxkgk29xp9bJCzpXMkDN7ERBqxG2hZ3cWLcKfRo924AEet/jh1
	RtZpitNMKW2KXWSyD8r0U1ODOVXFhnWUhTQ4rAbXHTQ0lBWmjgIM6KnS9xv28Z0MyqQwoU8WIKl
	dMLdMIosLcymYP6weUXmvixQhwl28SwsGfZ1e9yJk0MEtP0HowcQNQUQDnrLUu8yJ5q2ZYGwkTe
	2/Tg4tWUWa42hpyZ5v2cKdlRpSvbnzUZzkYZqyTwYBRtSHzqEV36I3TBfNfq0WIbcVqJh0fWShk
	99zXIM00tZQ+os3+d6slk2kE536gwNPq1lNePhvUd0+gTpmliHzfbeqBfp10Yg6ccvdv9iVRLFo
	2LgxXDY9gLPLAoa44SRABpyHe+TBz81Xm6CNHFO1yKanKtY8SWg3o=
X-Received: by 2002:a05:6a00:94d2:b0:829:7a62:5f with SMTP id d2e1a72fcca58-82c95e5ab81mr12051966b3a.9.1774894669426;
        Mon, 30 Mar 2026 11:17:49 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d4d90sm10099966b3a.36.2026.03.30.11.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:17:49 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v3 2/4] staging: iio: adc: ad7816: use sysfs_match_string() for mode selection
Date: Tue, 31 Mar 2026 00:17:08 +0600
Message-Id: <20260330181710.23258-3-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
References: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual strcmp() logic with sysfs_match_string() to simplify
the mode selection process. This reduces boilerplate code and
leverages standard kernel helper functions for string matching.

Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 5acfceb90..f9a0a5a69 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -58,6 +58,11 @@ enum ad7816_type {
 	ID_AD7818,
 };
 
+static const char * const ad7816_modes[] = {
+	[AD7816_FULL] = "full",
+	[AD7816_PD] = "power-save",
+};
+
 /*
  * ad7816 data access by SPI
  */
@@ -135,14 +140,14 @@ static ssize_t ad7816_store_mode(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	int ret;
 
-	if (strcmp(buf, "full") == 0) {
-		gpiod_set_value(chip->rdwr_pin, 1);
-		chip->mode = AD7816_FULL;
-	} else {
-		gpiod_set_value(chip->rdwr_pin, 0);
-		chip->mode = AD7816_PD;
-	}
+	ret = sysfs_match_string(ad7816_modes, buf);
+	if (ret < 0)
+		return ret;
+
+	chip->mode = ret;
+	gpiod_set_value(chip->rdwr_pin, ret == AD7816_FULL);
 
 	return len;
 }
-- 
2.34.1

