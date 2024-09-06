Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4AF1CFEB7
	for <linux-staging@lists.linux.dev>; Fri,  6 Sep 2024 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725631904; cv=none; b=V8usLyliemCbsJupYqRHE7WUYFPjXZPlR/38OEknSoTSXOlpMRp62VNir2OjJQgtC0RYMpOpQNMBSIkcKRxjhLouEn9sDBfCo3hygdo7GaUu8Sxk1YJ3pNnSDhHK2T76je12UxLa/HK3OwHGV5LbcA5Vf3fGm/tQESMm3InnFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725631904; c=relaxed/simple;
	bh=n8WQglKXOWQ5TRI+1rAwPrg2+szf7yQwZbqLLzSWIo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YN6fiZOEHjlzV7+Ho2EmUIIg0E4jOdv5SBDGJ6c5w80vxadk/0f/aNA3NnGMOqbDT5S/WbsXJUk411cxENxOXRy6QgDNkKwEIMV1Vt+09PbutSL9B8KN2Xc3oli53o31JxWIPnpyvdS+Fmd28QPdZGVS9ucC4XU9S8cwwKpjtSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjH8BzO9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjH8BzO9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2055a524017so1959875ad.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Sep 2024 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725631902; x=1726236702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5vSWCkgvvHrA0ZM+4e5EthGrwYNA4O6y9CajVrLEgU=;
        b=kjH8BzO9sADMH73hJVIQIu9BVhbOXtYlMi8cisJvYcZBXTZUxmcx4vf8dANGMGuMt3
         ND8ing2PvRdHFgfn+z/8ql8zGFuXj8F9WjJmj9/SgYW6oG85QAvUCklFvZCTAp19k4n5
         uxzNyoKqSPy49VpKfEmt2t7VO2jl+JOnAYg4FHTbGGY5LKoAlfqkm+vSHjYq6NXnktf4
         2/WepGzqMcqqzsHIUM2/DBVc4mOrIraPGwK4DOt+CnSPlGGsPBPYr4P3YB7hh8UaJMLW
         s1h2qiib0TxxsJICYrPGEj1sFGh+BeRyRRoNhhaj+mPLAkJi/Gj5tnAAzLosKfmyIF+E
         wEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631902; x=1726236702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5vSWCkgvvHrA0ZM+4e5EthGrwYNA4O6y9CajVrLEgU=;
        b=S8PW+DEW54R8NU0nRANy1KYEWwM9bDNgFwoAm6EUOzqKz2pr5d6/aUyrn912bnZ7Hd
         etNDD0o7oLeuzypHRJwImRiVP3rs+3yhofXIJ77Faf0hsknKTfNXEkbUu4nF2PbWIR01
         NGDahrLdrvaqvBh5DNlB0zZ8HG62XbbAVIFGOyewweB5+Ebd/YlSr0ljS2N05EdD8aIJ
         l833hbMmJklkjVRTg1xSYB4F1uuwm6jYgZ08ET/LkWT31yMGPXxSGTymR9WmrRhpkBZT
         vbfc6uSxcd98kl53CoKNkMyrAfOf7sQejRzB4iMkEUEiLu+B6qlOd0SEIbUQrTlGZklv
         i3LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu1gG9Ozc/+VeOA+1EcJDDOTsEBV8TuPs7P/M5t6hBvplmjZbvhRytRfYbWzGXOeWKC9y0otO8+xWTyVgN@lists.linux.dev
X-Gm-Message-State: AOJu0YzlFzrYWLUCr92zXI0pcdKLx6UtDnE6pjwzSHCgMbzALoUrip4g
	idgrfcuvL7ho5bMoXkfGSlKF47SIOoOXgux/tteFnj9afJPbSkXD
X-Google-Smtp-Source: AGHT+IGnttK575gxEnOIsRfoaeIrU1TuS3xGG5WzKJfzYm0vLyg1t0QUlE6wi7rzXqhJhSNjp3BRmw==
X-Received: by 2002:a17:902:e5c6:b0:206:b8b7:883 with SMTP id d9443c01a7336-206f04b2ef9mr15362495ad.1.1725631901741;
        Fri, 06 Sep 2024 07:11:41 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea351basm43481015ad.129.2024.09.06.07.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:11:41 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: include: Fix spelling mistake in rtw_mlme.h
Date: Fri,  6 Sep 2024 19:56:34 +0545
Message-Id: <20240906141134.10118-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index e103c4a15d1a..e665479babc2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -131,7 +131,7 @@ struct mlme_priv {
 	u8 roam_rssi_diff_th; /* rssi difference threshold for active scan candidate selection */
 	u32 roam_scan_int_ms; /* scan interval for active roam */
 	u32 roam_scanr_exp_ms; /* scan result expire time in ms  for roam */
-	u8 roam_tgt_addr[ETH_ALEN]; /* request to roam to speicific target without other consideration */
+	u8 roam_tgt_addr[ETH_ALEN]; /* request to roam to specific target without other consideration */
 
 	u8 *nic_hdl;
 
-- 
2.34.1

