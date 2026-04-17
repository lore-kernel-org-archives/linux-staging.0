Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11A93B5825
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421013; cv=none; b=HC+VcHvE7MbDl9aRrIIEk0cn7cWHC8ldzZmsFMIFwduE3RbhOClkP4mAqhIhxUIYWTW3NLlDQdmZiJaJkOiVrV969yYkX8xpRsCh0vpNy/lV8nmiam5W4YPSH839prRDNCVwAU8Of443kVpNxF/UIudYzwihgvxZbjvgjjKXhzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421013; c=relaxed/simple;
	bh=Vw7D17ioAHMpV0rVIr2m8wJ9QnCWiT84kXKCxVydXYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bc9xgya65XVYpuPjwkYgqmrLa4abxpCD68yK/DN3kELeZhQ5OG1vnXhwoTl01jjS8L5FUl9+F1YNdKG8a+2jW/m3Mh9fIB3jQLoGXw8oSeF1hEPDdVa/KIAZ/dsymheBV/lqHI71tAfhOYMvmpDRAuGMTSOBXt7UITV1i8kUKT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ2LaTT0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ2LaTT0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so69572266b.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776421010; x=1777025810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ptfzQti2l8j30duqTHZefI9tN8DiTkDmOYqUjk7fx4=;
        b=TJ2LaTT0v+SwvSky2u518SdtagUybB4OdfcEfJkwQrdeUCJs4cnsr+LSIxbxOeuvJy
         38sNG0RzOd+IHjpiXVnKYhfYZ92E8hXXmqB97/M9DkiGFQ8imSrGDhZ/FQjq+JmLaKWD
         xE9y6WdLesSaT1md3mj1MqW5Olmk11UEHjU/anOwQMA2WIjMGWdeOspFTjLSpiqfSIr7
         HfEpeafxCy8tLYjTXkGkfreh9PuIZNbak00C/CMsnsu69cO93II5JhaN61HUv/WBIKs+
         jL62Jd3fIUcgdbVSkV/Eskjvh9qzTgsawPNfC5QtmjC/2XVXY+H0w/D8vqWSJb9AqcgS
         K0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776421010; x=1777025810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ptfzQti2l8j30duqTHZefI9tN8DiTkDmOYqUjk7fx4=;
        b=oHceNg4Uvyzf4mxvqH9ZIFdXO5SzgqpWo9Vp0Y32z20r/9ESB7cIW12Dybr6lE5Wpy
         HdNnwGaM2Y4U2RyWdm7P8gq268391Jp+33eUJ3CONBKvZd3PAN6fATqWt25JmAUI1zKr
         6LvcwGuvywJE5Mlmw1eSHOa8zPXiCg2oSaqHIxoEzU5YdkHVbTmo+5QJ1U4BBv1c1Vpq
         /uwyzaVnx043wBaDmG1OvN2qk2wnpmOl1Yd7xir2XCUXYs8rKeNLewazmw8p/zJPQ2h6
         GinPV1fMM6h9oRI6GmeN3TFGOfW9zTGGMuve3aZ+uY76ihRyc7cHrXhu/Rr3JPdIBcb8
         TvMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+++TTnzWhs+nZhe/UQACXw2lfbnFARTuMSWjHaqUl+5Fld0P5uJNwqKzjO1jWBDafXsV1Gb/ljTXtAQ6jL@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8VYKmiFnMRM7aP1UCeR13LKJl7J8loo3WoEKXRotgMzWd2WxR
	FzPaLr74BYBxLYL4CMtF6GX0SmcsQ5pU/meSHc85w5Fjk+2rqQ79fURO
X-Gm-Gg: AeBDieuEjNGzpX08KHBdqZts3tTfkuizsJgUvy8BK1LQ0SJ2mh9STezBWs5aHDDwZ8n
	Lqi5rwGrpgRP5sgewQaGLDLo+oskJi5z95fi53v68W0NmKenLP433wWVP19bfxzJ2VA5M2Q0vot
	1fxgLpXuR5XoZiYk6JNyRrXXyIggJeN9+zv/vHTL6l3y6YA4DPNaZ8RjxF14GIxLHNs1/zHHs2u
	An/CBgG9Bh3SItGMl/KQDIPYXoda8sdLaV4lp9434fDbr0NvpjvPXd4hxGSS+ul2hL5ueIie2NG
	e10az6FAfF3EnoLdH9q9uQnw1ZCu2nr9GE9zY4qJ1RDmIhgpFqDRfKr6X6s8Te3qCaEyM3b7m9X
	RJ/TRMMRtOontC3YY2wHpvPV5M4L0NB//9EGmHN4qPNovwacVyXNDRHy6wLrBMK3lSaPqvxXT8m
	vcgDWR9XX1Gp7FkaWevPPgMA/Ind58OUEBhZL9nI0kYpRV5Pnf5ZukxpzUMwpJy6nUtIqt0jIxk
	E4+Skc4jfW1fYPdozywbnXEpCnvECxFIbiviAxXvMfmeOKoXiIxqWITvYEYbnDSAGagA0QE/4Xq
	E4UxV4broT7tLvQHHGk0PlFrhZ8cHj7TwnpiDHwcn211m9lJHkNxxPt/4ua9Nmr47H8U2pd+Agb
	S/ms03ScVHwYFylaOj2JWiS7A1m4xdh/6i8pXgwK5OxXyQZI9re3YCeVg2qooXQbhkyqrKIL3KC
	ny/43pxeIH9p0+k5hHGQ==
X-Received: by 2002:a17:907:94d1:b0:b97:cf49:efb8 with SMTP id a640c23a62f3a-ba41f0bc286mr108172166b.49.1776421009732;
        Fri, 17 Apr 2026 03:16:49 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (125.133.90.34.bc.googleusercontent.com. [34.90.133.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm38937066b.63.2026.04.17.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:16:49 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v6 2/2] iio: frequency: ad9832: simplify bitwise math
Date: Fri, 17 Apr 2026 10:16:23 +0000
Message-ID: <20260417101623.1281-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417101623.1281-1-joshua.crofts1@gmail.com>
References: <20260417101623.1281-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactor the ad9832_calc_freqreg by adding a BIT_ULL() macro instead of
manual bit shifting for better readability.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/iio/frequency/ad9832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index c0b7852f1c..6ce9651542 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -117,8 +117,8 @@ struct ad9832_state {
 
 static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
-	unsigned long long freqreg = (u64)fout *
-				     (u64)((u64)1L << AD9832_FREQ_BITS);
+	u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS);
+
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.47.3

