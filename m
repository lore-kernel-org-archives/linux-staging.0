Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A513502AA
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325293; cv=none; b=LJWj079LKJVSDMaEHlaceoiMwoRFi4r8hmKxNv2nci1YaInpUK0gtN+oMNQpkRzmep2kH2FLv29DwTJmVJyy8J2HSC2jHr9udtz0d05eycXgqAfMRa/R9ZKNgmgKUX3s6M/SuJEFRQVVWEElmb5FFaztSFZ9vXAtgWMJ6h80kgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325293; c=relaxed/simple;
	bh=A+qpwwqEuPU9LQ7T9Nr8Dk71iIlwHSWsYGXp/8jp8Ko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M4Zi95NiGH4nINs32HZHwaS6QtcmzkbLlSNuIak75nIQiMgT9EWgAnCMGjObcB0F7/VEKxqNmQWIPnj5Rs+csuzhuJWqmBAFg52qPBAPq6S45rHiEupISkQmzIkNc4t3T1fFVnTDCgHeoRgUYKDJ4EdxBUyntJjMfUAPiF4nrn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLqpDJQK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLqpDJQK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43246af170aso31984f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 09:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768325290; x=1768930090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEEjpAa0hiVuWSNQpUBIYifaKxqsQfJ6JiXcZAA+XqM=;
        b=jLqpDJQK8u+RkxYs8iixaE+fnVRHmW0PheRRqEXObLJSKvG1pNz0Ah9VhNTKlba60C
         vKrQgHYXnOReOCmsgHGfNPaXgY2hq7TAwtmZtqkNYY0UrhS0O0xSzrDRIK5jDmtNzMhk
         +KntVkhKKBFBhGvNrc3H3+Te6ZmX6oAtCGxTDojFC+eCl12YAMajVTuaqNsPERj+spEa
         +a/lS7f6Ihc0hM521/6qQcrLAtv59h8CZg61WTc7UAhIi5ylqKJhY6g2Pe+RV4HcMDyP
         Id5Q+wOy7WCC74SaOH+Dc1rrWfO4dSFmn2zBbslDGOS7J8AY2gBvdSx6nsA912S0oX17
         chHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325290; x=1768930090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEEjpAa0hiVuWSNQpUBIYifaKxqsQfJ6JiXcZAA+XqM=;
        b=ElwU79VwU9KOjqFsEnTqrFpwyHTMj3hD5i4YP/veTnDiDxq3tTj+IXcVmXjhDe16uL
         dfzL99l3ziGXjAvWb+4rFaCQDa+iqSIXRb96ebleIKdx12ESrcTHc7wZGalRbnScIbRF
         lrw7xwvpbgkmG8/D3mlPF4TOrClleXVf2Up+FNZ5ZxLOoc/DPD3onyFhOMwG2WfRqk8/
         SUwBAH9Dp/iEQfgttTJ/12VpW7qwlR6PefibHGwwRW2EdUNlEPAiwK6VEP0YzVEnnVWN
         YwTM50guOFfJ9ciFwwXHcU5wM2BXt0rH3rnA78PY/3wZecFBoXu0IuIGcbZysQL2IbRG
         WKHw==
X-Forwarded-Encrypted: i=1; AJvYcCXC6tqVUHubg89XL4RbTOAuaLAzU39MePFdcPb4wJnkJ8Lk+6l3mcevDIbzaVQqw+MD4zFmyzX8Sfs53yzn@lists.linux.dev
X-Gm-Message-State: AOJu0YzafDIitkJeMaa7D0/lf71R91d729Vo0lwdih4c9CAy/QDv5Xzg
	wBaG61QxZAAT2i392RDrxNEZlqJxHL+YTc0XfzuDv6WGMc0bQGHoJAFg
X-Gm-Gg: AY/fxX54pIm61Bd5OqpFBHn999YebxYNayIay3MUppXlbjU47way+UbLTXnibB+FJ0i
	vwDXECHJ858+YnJOLug14Ng1ejXUvgOfqBTqUrezJjFe3cCwXBXpkPe6tli1GwVGdMU8VWowiHv
	rUNIVmcVM7wPU2Bmyr2g+oDwnEeQk7bPVJ8bPI0/EjqmRLqo8bLh3Mus8QXLCE5urgL3dtvWpFB
	wBqeIdBBtFrF4dePwS4enrsEkSSWCxXid4UubFXRs8roR5gNhobIHy8qEdChKMuJfX/cWp76/7h
	HqZJTCJqxpMd1OowEOmeWBJD4RXGIzNgU1VpsjoEAUktaGj1kbsuKU/KelxcnvwTDxJCK8Cn35g
	CZnOJCLDUPQB4zwseGykRrH5XA0Kyo+9bISI3ttiOiRhM+Z77kpjnyP2EsXzqjHGNDmdJhcyZjn
	sMMUNhoNDwfX5+FGRpQOGvD6qCqM6W4QGu6QGP7MgLAybN
X-Google-Smtp-Source: AGHT+IHH51cskQ/rWPUY+DHYeuVH4jyvuoMluFfD7D37fHpkEs8+rYtzPOXZVsHRQyZzJD5N1Wq29w==
X-Received: by 2002:a05:6000:230c:b0:42f:f627:3a88 with SMTP id ffacd0b85a97d-43423e77f7bmr4931500f8f.4.1768325290175;
        Tue, 13 Jan 2026 09:28:10 -0800 (PST)
Received: from ubuntu.localdomain ([154.161.61.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacdcsm44792388f8f.1.2026.01.13.09.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:28:09 -0800 (PST)
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jianglei Nie <niejianglei2021@163.com>,
	Matthew Wilcox <willy@infradead.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gideon Adjei <gideonadjei.dev@gmail.com>
Subject: [PATCH] staging: fbtft: Change udelay() to usleep_range()
Date: Tue, 13 Jan 2026 09:27:56 -0800
Message-Id: <20260113172756.14744-1-gideonadjei.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace udelay() calls >= 100us with usleep_range() to avoid busy-waiting.
This allows the scheduler to run other tasks while waiting.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
 drivers/staging/fbtft/fb_upd161704.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..ee8d6b10374a 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	usleep_range(250, 400);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..aed5cc7cabde 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,7 +32,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100, 200);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200, 400);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.34.1

