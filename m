Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50061E5724
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776623816; cv=none; b=aUvzyHIcRDYt2D368tnIo95/DvZIxrgNsgUWD3aqe4IKPbZvrBrscuNyKAsfMF/KsUgSIOMs6KI3I/fCDI9wbTthJydL4EkUuRTcYtWk3nsoUxN78j+MYNkTKdKiDplWXwvBjLzXRjZD/BhrLluV3NfQlS9BljTeEw1z1qdPcKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776623816; c=relaxed/simple;
	bh=Ml7XosIrBBKLKpWQBPoaiYRJ3t1ahlKXAL6Z9dGB3+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fRhWRiiKvTbffCUNQF0dGQ3VHikJVaoQKdp5e2XfR2YMg0x2JxbULJgMejQx34hQ9N+imgOii/Q5qheKCsWNq5VSBWG+Oi/zzDek4pY7QA+SbLVgEU08igAyuHuBmdwisu2neI9D9wKTAr7SF/Zp9oYq3HTKg2NU5Txf83Yh0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwmEFm1I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwmEFm1I"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso22097045e9.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776623812; x=1777228612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QvxSgscLgfqeVV9OXyq74ThO6l4kdBgNKvvMtYF6vPk=;
        b=bwmEFm1IXKLJ91DlT304TPGb3jVcKWepsvrPvoFIOFy7PoBHRGSi/Sgr+IsGzE030T
         sykBPA2mv1fkYXC/biiAGhQgLED8wzEJQ0/2v0TvF8Rr9NJPzHudm4dT4Rsj0NrgqxMf
         Ikj3nQdRqXuBoem5JJ/6CqutYnFdzYgYuphuJJd1oLBdt2Pt3sT9J4bTLDraXz4UYsYf
         cqJODx1Si3a/XVtXyGam8RpxYoJOuXc1exppOHM3nsKmZpx3LzYrvlMNhdGQ7084hr9N
         tJlIrG2mJoSvlK9qX10J5bikQYQ2uExgr6LtH9302JvgxNyrV2b5Sa495pJtaAVg4Zj0
         oYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776623812; x=1777228612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvxSgscLgfqeVV9OXyq74ThO6l4kdBgNKvvMtYF6vPk=;
        b=fX/BCKrQ3GIFwk5E6R+n3wUV/s/pecnk5N/Vno8eUf0cDZFh105M/MHxMGXzKJWu2f
         y6fHMfC1aobl3v6F9zHlDsm2NaqQ4XOQxLq7lMTju/OTHhPnK/qw1Q6aaz2Laf4kMdVb
         eeQgmKNTFxz1Ya0gLbeIpzMjJuPdgZwKxPxtB5vQR3Aw3i/cwoisStAGl8NEq+BRyVcJ
         W3r5K2H0UTowmN4h4TWCDXHhrCD6B9EnHfcTzFosaMoOlZt9l3cIC1cJ/qtvH6PQydos
         znA2xv6ccAIjuScvYisM0mYdbgfXYR3jwvQ492sviDqygRosB1smD+UjnHXjY/6UQJrs
         1ZYg==
X-Forwarded-Encrypted: i=1; AFNElJ+QGFC8S0vr9Dm7AJcwxIWfEly/LY3g47gjJOO9iZtc2r5VUc//Vih+i6GN5By7MEGk+tlpeSuiN9OITrV5@lists.linux.dev
X-Gm-Message-State: AOJu0YyOFUMsOwSnKqrm0hVSGy18JiieENCr4QLNmRI1s5Q7XfTL7S81
	nXHeRM8MqPgujBuRBcxGFCZZS2FJfweyPObSyfF0hkYl2oXI+wRFyFXw
X-Gm-Gg: AeBDieu5WF+hgHnD6hODcP/Ka2HfcDUEBjlKWtd5hp/9S9tamK5iDFQv9p5/kYoVdRH
	9C4IIu5JShc8kw/9duKYnSBuS3cQb+hR5ckr5KdGHaC8wtWc2SHu5C5unEVQI9ypyZ1elBk/svT
	B9OYNj957BVZSCkdkW+5kMRfDN3EDv9Lq5Y2LaVW84Ku6GXsb7+XGhumhWx5b4CE+PGKHdKJnd5
	DY6Po2HvD2ONbDKswk1g3fgg7vkNUUZeNSD5ZS/3pJpiVCoz6PF7VWghHxQmX3EEehmfbilvT/S
	6+d7aVjuihMGddpsmTZwTubzUzDBDCYEkSQEM7EEMzYvvKWbaw8IkeuKfR7gWh7sMEQ9IJcXuCd
	FRaOBQiB9D/Q6AgYvndvw+7iTWJ/5521UiySzNjuH1dlIEiDVa5gOiI1e010+kCN4HgIbqdEJ04
	OA0P+1oWIt8pGmc58UjH6F8ThKDxdE0CryN6JwJWK6NSWqbTC+f9TpwbGh09+t2ZvhgPzYax/bJ
	alN9d7t9LAXEXy0NacQnJHxBnsRQOYF959idnqHyQSr+IkpeZobdoF0oNMc0MalfA37lEtXOQvk
	aY9ddFe10LKRpbP2zZvxIyzKit5KJByw3k8u9+hGVTE9f0obYLAVuYt6Za4R/wwB5haMU0boRik
	oJXYrht+g6g==
X-Received: by 2002:a05:600c:a40a:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-4891ba85dc1mr17847125e9.21.1776623812086;
        Sun, 19 Apr 2026 11:36:52 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-249-181.bb.vodafone.cz. [86.49.249.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bb3d121sm49407265e9.14.2026.04.19.11.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:36:51 -0700 (PDT)
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
Subject: [PATCH v7] iio: frequency: ad9832: simplify bitwise math
Date: Sun, 19 Apr 2026 20:36:23 +0200
Message-Id: <20260419183623.86587-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactor the ad9832_calc_freqreg by removing the redundant u64 casts
and 1L bitwise left shift and replacing the multiplication by a bit
shift, as multiplying integers by a power of two is identical to a
bitwise left shift.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v7:
 - replaced multiplication with bitwise left shift

 drivers/staging/iio/frequency/ad9832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index c0b7852f1c..659821a1e2 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -117,8 +117,8 @@ struct ad9832_state {
 
 static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
-	unsigned long long freqreg = (u64)fout *
-				     (u64)((u64)1L << AD9832_FREQ_BITS);
+	u64 freqreg = (u64)fout << AD9832_FREQ_BITS;
+
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.34.1

