Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009912;
	b=AoLR3T16vS8pH2wBF6AzNfmJL0/NCnUWDzuhl7u7JANZghY9LgjFJcMuNjAxHZzaz1x9
	 8jTrRPPwPAKowoQ3uG6Hv4iyCDd7v0OFqndf/5KiDaIf/bNxO5NAPKJQh4Pgxq6DW2w2L
	 gceBM/BxMZnT6wZ3V90TchF0Df2bRG3SY4ObuQ4ogKBqH9bhPCks66DMGHcsSBZ31mXjd
	 fKDFrOjigmJtBv19S4ue7o03Wp6qoxZ52f1yi4sK6SyD3m4h3h0VHijC7L/6Pd1vMvDgQ
	 lrbJWitpdWQ7OzYYco/3abpZdYwczTO02WqP+EUJS4q4uM5DlDU97YsYbdP6oRRVzrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uMe2OrBlQbkfT3wcvRtHcAjQdCdPt+EgXnOa1muqk1Y=;
	b=0gHg1ErHZzeGN7KEVYunikc+iKlbnZQJGsn0QSK6CxIVvkzIOIa3s+UMrNduL7xrQphn
	 m9dVwRW3PIBMup8vYWfAYMWzp8QW55epxuF6S81ZbWrd7b3dQLBglGrlCWzx2bXD6m42O
	 Ql71Tcu6GSHuCk1pidfz/Tq6BHAZuhe+4dmoYfudgRKJ3PuI81scJg8PawOfFtzhiXmjc
	 SY+7QA9SiA2wz4yp5ODHSU1OD/PadPogZn3gl1NZkQD7q3vTmacqnuieIhRneAwT0XUjR
	 hCecT3dhmsf/anzDdZ142MiV7fBwiWs54EYKgqLLj2c5+OjTNMsk1p6FZe/S0DumT+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NIBC4a2t;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCE6606A31B
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 10:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCE6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NIBC4a2t
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4741375eec.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009911; x=1793614711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMe2OrBlQbkfT3wcvRtHcAjQdCdPt+EgXnOa1muqk1Y=;
        b=NIBC4a2tsfnUKqnYNQNMZ/rrZ19Lj8XvMeyCZWl3pEGyicGqQrXzQaYuxateOtk98t
         LFA5pb1WnUBYQvAOtg2zu1pUvwtJXt7ATH70ZUJtbuzP4fvMri/d/lHr2jkhe+6GR45g
         krRqZtX0K5eEA3eQYzF6D6GHg5eQssRODqwAaKnO19Wm9q4sR4ovWvB9EoUFm6qKXfl9
         ElMO8tcknELahBs9kh5UqFVFUar1ZylwzDX4FRPlZhYq+ScmG6kC7MMV5tNXo1iowjPV
         BGJE0znHzcsdA68DVTlgrYNhWKnNDz1vtQdSXPZW5br6TJgVAKpEA+3JuOt9Bc+8ukAV
         FKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009911; x=1793614711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMe2OrBlQbkfT3wcvRtHcAjQdCdPt+EgXnOa1muqk1Y=;
        b=epp00cSpkrK+2WfKQ+Ln6/anPYL/Ro2V7tk8rTWaKka5TkjhVf5Sspvujlboj/fYow
         9XW9/EUseEevStkX4+FVPujliRIN5cKJTPBse6nvCoJ1xoNV7FTaNrb485ss9rAfhz9P
         4KBTGTSq5MgoihyG/vgT9NI1CS0ipel7atwHB5CSw921OfVNVHC4FsqlbqguPY5duhWW
         Bbbb0+2Z1qJcHQQCU6JG05V9zY9xHxPxclosiPobh7HOUtOH2DVqA4QFYu+SzvIJ2asE
         4l4avhOxxi5/3BQzFxFikr+/VzUaUFjroWrcvuedG5yMz9z1Mrevp0NuUFt22LKcLfAS
         Uc0A==
X-Forwarded-Encrypted: i=1; AKwUvBza83nWD/vHo9oqlr+f/9SZRF3DqQwTgI08Gybl9Z4i84RHszHnA1Gk/TKIdoMG4CSNK/431Kb76np+z5mM@lists.linux.dev
X-Gm-Message-State: AFq9FYLSfJrv2ICZ9BdegqCwb2unTjQqchj6ZqX0LbTiRRvP6mmTmJbM
	L7c3jKmfUyoPW9oZcOOzo9lhkvdBWUhZa1manbNWSgz/2571PIQdeJu2
X-Gm-Gg: AYBFou0D/BvmyKXP8eCT5Y6CPRzDu0m1JkiY437PGbx5Xf3Eojy9fNQLzNFQX0KcTMX
	N2sCgTrYhfwqRflvKz0W45MNmMQmk0BwzZRCm0IPsOn9rdhA1ktxSeZ+GmKC7FKaMqUdZ78R/y6
	xiFiMmOkh5mnzqsiTLrY/ILq4qG3fqDCVe/Z3uEsgvJKmJvPkV/ZGZstjk3dxCwpewVHcPPOmgM
	zLtWatExsHf2YksrJ7TR2zXWTYQK1RiyLohBChkvAlDkbE4zZAZ3mXUPz/xbhMtOeNEbYg5fA+K
	J3c0jsrNwN54fcZVKh4d5QJwHM/zdPtRLHCLDC45PvIhoz/PIM/BpOh1lhwdHel5/Z9J5K1Ka80
	i7GoP0opTp2RgO/XVG/pv0gIWKfaBFBV69DyrCMK2uflzvyRN/dhhNSI4zGyZDGz8mmk/V5Vbw2
	bhwPSXhAdOq5tcq2UhdcYujUeVqFXGJb/kUUjv43rV5NgwesCGplYy3ggiW6G9xvNW0cWwpSU2E
	eaukYtFT2TcY54F9gOeg5xwnuXZOlace7681W+W7mXg56BrnDIU1D97T81lO/rCbQGacga4X8c=
X-Received: by 2002:a05:693c:8214:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-369e8613376mr10271627eec.16.1793009910967;
        Mon, 26 Oct 2026 03:18:30 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec865esm22437475eec.26.2026.10.26.03.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:18:30 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH v3] staging: fbtft: remove unused fbtft_init_dbg()
Date: Mon, 26 Oct 2026 15:48:15 +0530
Message-ID: <20261026101815.73722-1-himanshu.bakshi478@gmail.com>
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

The fbtft_init_dbg() macro is not being used, so delete it.

Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
Changes in v3:
- Fix tag formatting as requested by Andy Shevchenko.
- Add revision history and testing details following review feedback.

Testing:
- Built the fbtft driver successfully.
- Verified that fbtft_init_dbg() has no call sites in the kernel
   tree.
---
 drivers/staging/fbtft/fbtft.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..16459e4e0ba0 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
-} while (0)
-
 #define fbtft_par_dbg(level, par, format, arg...)            \
 do {                                                         \
 	if (unlikely((par)->debug & (level)))                    \
-- 
2.56.0

