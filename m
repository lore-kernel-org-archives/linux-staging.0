Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07033C98B9
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884550; cv=none; b=gXI66OaxnWZWkVJpe8lmyQXAKahvYAWi2/Oq3W9KKaegPrNvvqX/C+XQM3To4GnHjgNKzhgqW8i41S5jtNHOKdfLDXsYd6Kop8cHEd91Lh4guxaok1OQrEBqT1mL2rBIYEgzVlt9kpsMm/h5f1jwt76jgQHpdXZ8Pj+C30JXUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884550; c=relaxed/simple;
	bh=wPM5GGcsQFVTIBDPZ70NRcd8C2Qs0IrujwLvCiOl59g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8ifQmHJRDrH8vFfEEc9vyrr9LcsCprEsCSx+38nwPlVpxBIwz6HK7r722lzXm2awAS3Sjs0A+QeEqLjWY+dm0tfC9pIh/DnEV7Ovjw4rD71po87WyBtLVM/6i6hT33KBhvX27zPdnwqAb5ZaN/4wrqHs70t6d5EbOMBVhBcsqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OzYSFzKX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OzYSFzKX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-462cdb88d01so1569887f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781884538; x=1782489338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bffnwId5AI6KcDIEhgyLtJOygYgr4I3ga9axIgTnSVc=;
        b=OzYSFzKXOipCBd3jDvwZjsSdD3cXU51kg9MgAfWOGPewjJDbKTyBY5MAPWEJwZWWwd
         QByNU5XoJdHwOy9InN5jZaUzn1Lfx5Hb1b6YyLQ3nUTUxUPGmGm8He7PwVZbP8lYkhBE
         w4T39S6xtXGuJ3KwRxYpYbvehKHZhESGSs0tMTcLUKJqdYCQanIMNKAvvnWJX9NZ3x09
         +WDVxe1Ut5P5whLg4u3/p2XrrjrKAjEckF8bwv1QS2GD314dCcj/zLNorF1HtJvr3REv
         B3FQxd9jMcyzx62JJJ2yY4KY10RAM6nAL+T9Y5bEdPRSlnbv9mvNdyII32ewLGNb9p9r
         6c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781884538; x=1782489338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bffnwId5AI6KcDIEhgyLtJOygYgr4I3ga9axIgTnSVc=;
        b=AP9b96z0b3Sab8iR/EeX1X+6fc7RvbKV/Wo/Exh579AQ6/WkxxjxkFPcQ/AnM2/sgA
         ICWWAHeD1YcDxELguue+dRXjFzPlN+L1DcniQIRMNFuzUetR+LZbAEJ1Bw/JnNW1R8BH
         9IfU3FGsdrXIK3Y2rlWWn9QavhbZQS0+B9VuZXOaIXIEw2OeTL2Vlm4HywAbDsfV5Ulg
         Nsr9e2ZvZH7rSv+mX7p6rEadIj1ALdOLTxepqKNqcavBk+88Y2EL0quZ8ej7e13jjIRu
         lgtnS6Mz+dM23eEFI0eMkV2qzl+MSmqAz+ft87l9AU1YnEEiBbM6kKaIzAMnhr1aJXU+
         QVLw==
X-Forwarded-Encrypted: i=1; AFNElJ9EDwrEYgiAUB9RGcMy1AnZgeS3MRYUqDzTPkzv4CVBu8KVUAhbwnW4c2R8slX1aoqPcQ0XjJYlAo4ID/IJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzYTY4MoEwnMly8Iv9oz+1xdkJwaRDIT7REQYL/or3vVmZhUInT
	32sl9ppfgwczwB1p8J0QXicKm7OnLFD4e1U26KiPbbwCaSa7DmL5e0/BllfqK1WcD9Q=
X-Gm-Gg: AfdE7cmti5uFMUfikb5im3+qVv1x/p59PJ/ChLN0zETBNbqlzssAdElhlfl2bgfRdPF
	3KdZuRJKGsrEUNvBGByPbN3f8fqvMlt2kgHBzYDwZyJXB39944O1RQLKIcdx9gjj15X+V4yxlJr
	8E8Kpu4okkecZqtn6J8y5SZDnvQB651vyzJOHwqcwCHnHzH8pdvfE/Q/yYpzJFPIfCuN4sNsEWk
	k13SjmaxzJG/2Lq20RcGR5fgCx25LEfe7yul40guYYf4aZUEBV7fdBvbl8hO6AjCUnqegToiawK
	YjtXG4tDP2oBnDSz1MYUPwpX2mco9/q2cNKmyIJyTOegsllXRqTkkbGOmd4ny+nuvV3AGLBj9+m
	oHaq2Iyd/nUDHpklhB6UsvyFG3YrDpFgC9uHXPA74K4KDXefnkH0hkVhzoKgm5mTkTVVBJRViYN
	miUqDOI+c6UpSt5S4Q7VvQvJJ1VYBoqfRztPBbEYo7mGSJwKnBbfrz/5rpoBhedargd0kVXDgk7
	Lc=
X-Received: by 2002:a05:6000:1787:b0:460:1c31:7cc8 with SMTP id ffacd0b85a97d-4651df0992fmr6429059f8f.14.1781884538281;
        Fri, 19 Jun 2026 08:55:38 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-466648c698dsm48872f8f.16.2026.06.19.08.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 08:55:37 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/13] staging: iio: Drop unused assignment of spi_device_id driver data
Date: Fri, 19 Jun 2026 17:54:40 +0200
Message-ID:  <0322f4b8c30f04c0e2243f3a9da7382c68e588e5.1781883685.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781883685.git.u.kleine-koenig@baylibre.com>
References: <cover.1781883685.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1957; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=wPM5GGcsQFVTIBDPZ70NRcd8C2Qs0IrujwLvCiOl59g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqNWZT6X9RNULTT8/UvEBxnTQtPbDJuko2y1EkI FjLVjN3GsuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajVmUwAKCRCPgPtYfRL+ Tq46B/93oycLDS4pk5NUVWw0JPXR2r3r/RLX8y3hmgjc6h0ooPOoBd19v7/bQM2pkLspXRH+ZfK FtvJjOu9gXyc8fIXDvR9jeFRGOVuCWCtn11hG1FDMkrvybEULEzglr7qjGNeFbPNWV+qiMJD7Ic qDErge6VUqiX0m2YXHeqqkg1W5TueGzLPYRSBJgGZCbTNCCbJ0/fDZ6WuQGXyvfvQQp3V6nYAx0 hQAuHHzW9O8/ba84UcBHVJ4e4EyPO+tq2LGeLYHTWOjsI4capIZTf45x3mcow0ZCYOlLPI0exyv lcNq+dKKIB4etam/0p6Bq6y0AHI4JiaWdLEHr7ZbCHSSgAaf
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
spi_device_id to zero without relying on that value. Drop these unused
assignments.

While touching these arrays use named initializers for .name.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/staging/iio/addac/adt7316-spi.c | 13 ++++++-------
 drivers/staging/iio/frequency/ad9832.c  |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index 1debcc36c1af..459dd7416b1d 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -126,15 +126,14 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 }
 
 static const struct spi_device_id adt7316_spi_id[] = {
-	{ "adt7316", 0 },
-	{ "adt7317", 0 },
-	{ "adt7318", 0 },
-	{ "adt7516", 0 },
-	{ "adt7517", 0 },
-	{ "adt7519", 0 },
+	{ .name = "adt7316" },
+	{ .name = "adt7317" },
+	{ .name = "adt7318" },
+	{ .name = "adt7516" },
+	{ .name = "adt7517" },
+	{ .name = "adt7519" },
 	{ }
 };
-
 MODULE_DEVICE_TABLE(spi, adt7316_spi_id);
 
 static const struct of_device_id adt7316_of_spi_match[] = {
diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 659821a1e2cb..1a6666c1948e 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -381,8 +381,8 @@ static const struct of_device_id ad9832_of_match[] = {
 MODULE_DEVICE_TABLE(of, ad9832_of_match);
 
 static const struct spi_device_id ad9832_id[] = {
-	{"ad9832", 0},
-	{"ad9835", 0},
+	{ .name = "ad9832" },
+	{ .name = "ad9835" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ad9832_id);
-- 
2.47.3

