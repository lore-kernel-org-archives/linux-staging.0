Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488A133D4FB
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781816189; cv=none; b=NXBsesM/KZcObpn3Ea+FwsaHRaPgnq0YuIHAqvK+ZUJ625jdkMYRA10Rtu3ca7A9KrqhWAe9+9q3zIQhkPPTXV3Ce4kz2SDnJiWD49pic6gJGoUxbYvR63lwiquVLsrRWU8cXkurLSRC6YHkmDGvDv9WIlHiI5KkRCFVMV4sI9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781816189; c=relaxed/simple;
	bh=FUnx5YPu+vuPuuoEA0qDckO0CfoQvJkO8/KWURA8wRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvJGYbFUY1WoyGflOEZLAs09mtAob3r/mEEPp1gXCbRNsP2K7N98ku4KQoDUnR9FPQ9gp1HumZB/tYnCZ8BG1DaRsAjpaj1DPYYCQLvPX9a9fqOPPwM34enj5Z7A6tuyqeHGrOW7aTziFUNhxQMPMG5OEXTU4w1IJxciq7WVuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvP+J75r; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvP+J75r"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-460662fcb4eso1049811f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781816187; x=1782420987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltzQxPp5mbAlLPFlwRLIVENxcwXmcohF8LYeSzi4dQ4=;
        b=lvP+J75r76MExxl1QdWEhq+e2xlTg0rTPobfwJPA3AnCbXlu1j9Bhm+/uUu1nF+u+g
         wUKbAz6I14pIxqeHqEZhezIzzDSdklz+NReXJQBxqbxYeQqf3yvPYuDcAMRSOL1QzhIh
         qxuIt1GRReDgUGJFxHZMACUDkdV02/87jLW0NN4BxpHk06RpQ7hBkhrxhb1P8MkcJcrw
         GUFxMSSY02v42gooAqqcoEmXzTnZeQ/M+qbK7aBOGClZ0jEFncWkW6n2041LN15/Utbw
         Bukck5ZhHhjGXEfobS0eFslQNaN2pu2Oyz9yhkT1y3ipenI9HWOlOByA2/56TEC/g18p
         r/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781816187; x=1782420987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ltzQxPp5mbAlLPFlwRLIVENxcwXmcohF8LYeSzi4dQ4=;
        b=AeXPhJrgfZifTgifMV1Sl9N71YPUcnhsofF2bJd8vPQ2A9NP8eORfg5U3Jpnxq78Mb
         8NU2/m0nWX4WTIf5OcHih68DMJNGk8FDbOi4DCGQU2nrtfAmnEQBQ26bwxQm/GtQ+H7Z
         R4Ja1VDbNMDHAqs2j5DqgY2FXjp3iV78QIXY3hTunCkWdo4XShwQgmoHLCUpv+hVJ+HQ
         OKIRW2LgXU6Zwb2HRaD0KRz8bCHa4/5fguXh9Bfw2+9I/8eCJaV/o52BbAUt+L3x/ikl
         zdsOXzEorw/w35pyQD1E8Np5CG/NH3TjX20HYG3KtKGa9hVacwIhWmxfQ8Mm9m3nlCm6
         TYXw==
X-Gm-Message-State: AOJu0YwDj2A887LcOI02YfJoj7NkKc8ksNAulzWyRRv2DryEqrU8DYVg
	RXoThF/ltYAD0IvvG2j29Lwr+VCQ4wotCTfE1VhU9DXbelfdXyS9gm/xkF5lxsMH
X-Gm-Gg: AfdE7cnTDMiA6Pb51W9QavaRHNOwn3LVUOs1/f7Oirm2fghbXdrhbeLQtz7VEJbHNcC
	1WAjSFNBpQSisHfl6V4q8kHjyMwCZS2gBxxK7ac094T6xFb0N3tB+9ZTm3RwUwIKHdlreTTAb2n
	p6Vc/BD3h5m0d0d7YeRljEz4DsGWYZuBS+yWoLK5jY5KPDdgcx9FOWE5aER41sgBTvEHeWkpa8M
	X08d9jCdQaVlJinHplYWOZ25x6eKU4ne+0huRWULafqHAQm+arGa0pu9UgoICGHyd1gGDwldwsu
	3byHHK0poEcxaNUzkEyroIZqIVLOr6i8OQBjKTwLHhKvIb26DB9WrBBqQzI1Rdurz2J1cl11fC5
	tIl54/u244+3C+3tiUEnGd7KRIDbbw9CGYs+PiMquASp/vt5d5UDkXUZxTDS5USSSRRTI/wzm8M
	7wWei8ZYrB00lXkkiuSP2YverOqHSkK6IccIT6j9r2300LSWCvq1ohH+doW/de2l7APA==
X-Received: by 2002:a05:6000:4685:b0:45e:f381:cd7f with SMTP id ffacd0b85a97d-465071f9a53mr1128337f8f.5.1781816186523;
        Thu, 18 Jun 2026 13:56:26 -0700 (PDT)
Received: from fedora ([196.112.75.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc42a3asm1674015f8f.31.2026.06.18.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:56:26 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove unused RF_PATH_MAX_90_8812 define
Date: Thu, 18 Jun 2026 21:56:03 +0100
Message-ID: <20260618205603.452858-3-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618205603.452858-1-inasj268@gmail.com>
References: <20260618205603.452858-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RF_PATH_MAX_90_8812 which is a leftover from RTL8812
chip support and is not referenced anywhere in this driver.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_phy.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index 3d71a4f41592..a4d15879f01d 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -39,7 +39,6 @@ enum rf_path {
 #define	TX_4S			3
 
 #define	RF_PATH_MAX_92C_88E		2
-#define	RF_PATH_MAX_90_8812		4	/* Max RF number 90 support */
 
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
-- 
2.54.0

