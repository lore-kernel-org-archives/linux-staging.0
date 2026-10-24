Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792865376;
	b=sRHv+WpFz4Fzce8GuodebO543CIJbLk9zXCVIWYKJeb2eCVcbEJeDqUIdERbYSnmo7Fm
	 gPA8zC5fuvACIiKZT06fO6H59svaYO56ce2q4AfXDRRg9ojhC9ADRkGBYrua7wfQgn7Bc
	 X//jf2Yfiw6M1yb+wapaNGtW/WXP2sSjHo3RaWF55jzKMdkkADjx6GkRQi5UkIg4W/CZa
	 hlptjB6iSAGej3KHxMr7qA6p0LgYzk0JPM/eSXZDJcd+IqE3R4uV2sj/Cs0hV8IcMRkfL
	 bilqwocl7lDULix8GC3DSMSweeXOV6C0NSTGLJxYbsyN81ZA/Bgv9shRgo9qy6rcjsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1do5SZCsNsXFNjC3kteHvHno5OZSZlN4oGD9w4JlcOk=;
	b=TQVgogbZMd2yi3ccJDsOIlH7F3jrjXzK+B5TYf9esXMwIfTXV0L5K7AqMMAEqqT5l61j
	 HHZ8G6Fzyp8b0KvFgcNMPm4L+vnwOpFQK4UZpzqKu5J21oxTFqVeqfecx+J658pDL/Sua
	 eonFDaqgl3GQnY9JYAkuQUB6s6L5xPHLI2YcIEKPPoqipKak162ciUCESsOjiUJ/cGrZC
	 HCgNhP9dlgSAGhgGEqBg1oglOkw4Fyzl6ZcNGhUHsqvwNFiUmdNZMlMxZZuZlf61fgCvc
	 tOd5q3UnceYQDaYw7atxtVIRr+DDtcw6HjyJJdEKpj5mT7WFk+BWT37YGsxu4uVI1Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dUYR30XF;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D1606A31D
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 18:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dUYR30XF
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so2999193eec.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 11:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792865375; x=1793470175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1do5SZCsNsXFNjC3kteHvHno5OZSZlN4oGD9w4JlcOk=;
        b=dUYR30XFlNpiwZKNC7ZSLxXHmnlsQkNoAPQaKbCblsicPYfNekHR2qaY1fo36EIzOi
         1uERQkGAc2bNSe1nkHa7Bm9+zS3X6+Qgg7XyNdLT2gOSXQXAl15jek786VbMkVn5eKyy
         BELZSfDd3Yr0v0Lzsma24tL+y/K5aDfWN0P6k8zGP2enjFT+Ww2wGR4QygPhk7wciViP
         hNuB3bgKE/FyIrjQRcwHNpy+NEKX5pPL5y8qULf34//iyCGyNrz8n6R/huu1+PJj/63r
         GEHcNlq25SdDbBZ4e3E/DXXtCTKWIve+KpaYwaf53C/EuSHBEAZdfrAzW/qu9MNqUNXb
         D0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792865375; x=1793470175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1do5SZCsNsXFNjC3kteHvHno5OZSZlN4oGD9w4JlcOk=;
        b=LV8O5H3ZhYaBNmNmrF6TG+x86vO3EbthDTkk0XwDaui2GFXU5+r2NCO/TCaTs4eYC0
         tg3dNhtyEhdVVvWmHi4W2bDpjb0rbeP05RGd7A0Q5FGaUrS0EVi49P9JJLTLm5d7AYYJ
         nqV2fMZU6Se6iJv4cuQsgXn3HwXhZRP/8cdK3/ehRI/Tl3RMJWkz957Ix0MPH37IejkF
         rhRwOtF5p9mHrvY5viuBGaaUuZ2NsHnBpUpVnry8pcrJURarM+syV9J3fgGr2glOjt1r
         BbZ0J52dkzYL6x0RvIMvVicQ8vsOHNukCd/QTPxzrSBXTspTy5J3LIAqxsO7dN6IyTk7
         Hyyg==
X-Forwarded-Encrypted: i=1; AKwUvBzhpHAl3zqhpiVWPKnG9nykamJzvU+9JE8L5dIajWAmdtVNQX8Sc1g+jWPpQWWR8r2j/s30328GwCW5YHeJ@lists.linux.dev
X-Gm-Message-State: AFq9FYJHpO2CQFNhuUhdfigkumSJVko8ZzUz3pVZNYmtwClktn5U2tPK
	l8XFLdoIpdrG4KoODOZczPTzztffVxgndBChUxHt64xfPF0VBK81Ztmo
X-Gm-Gg: AYBFou0UOsmRkzyw8UuADgSD6xddfkQbRx/gGGOjsFc4YZKb3aFUXT+uL7bb14GbjS/
	RK0O+EkABKb6cv+iCi1hVUwEbZAeP41HbriBPSgtUP/JruOdIELTwIIXWf3kfDM/wDClnUL4fCk
	86zP9NFENzoDptxyVK3OaVltdAefrxIx1puO8QBMi8ceNkX1t+sOG0YvpBiyhPPiTbPXtlnHDy9
	+JEq7lai32rnYcmag4zN72md+Xq2LKL+axQqQHP7PJis5nnX6s/a39PRXeRoUU/YrzUXnq9DAao
	twgci47oFaF1JFvZFNkAXcrYHHWD94n4yA0g6VLSukrZ7t703zthd+rZXsAxNFsdqZZKTXpxm9i
	juIDSpEpQaq/AYR/XBo0nkw9cBy/r0faarSLk/b1QkCKGnYmBeMf2gDqVOgvMLGc6nCysxBgz53
	uRTJKFxdjyWdfpwj0E1cVP6MJMfZh0b9ZiEpvoA7MJPPhUjdr11iWEr5Yq/2ABUh69Df/wCzl3V
	HEv9nFbFUpREHecewTBUsW0xGJ288yKbYs71frGUsw0wR10Hc+9JI5FWPDB/+/iCfjZ3G2BtK8=
X-Received: by 2002:a05:693c:62d2:b0:360:8a6e:640f with SMTP id 5a478bee46e88-369e8625854mr3682464eec.39.1792865375371;
        Sat, 24 Oct 2026 11:09:35 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec865esm8020891eec.26.2026.10.24.11.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:09:35 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] staging: fbtft: Fix line length warning
Date: Sat, 24 Oct 2026 23:38:03 +0530
Message-ID: <20261024180803.108872-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Split the line in fbtft_init_dbg macro to keep it within the limit of 100
columns and address the check-patch warning.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index c7afb0fd3943..fd7f8fc2afba 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -424,7 +424,8 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define fbtft_init_dbg(dev, format, arg...)                  \
 do {                                                         \
 	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
+	    (((struct fbtft_platform_data *)(dev)->platform_data)-> \
+	    display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
 		dev_info(dev, format, ##arg);                \
 } while (0)
 
-- 
2.56.0

