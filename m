Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AEF511
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335165; cv=none; b=QjHVGn0Agl6kOWe5vIGzAH+KVlWw/C92KDD1XkZ4Q6hyt5X+/pSlHB8ErpdpoqsjzEMiJSge6L7Bcbr5OKIhg8ZhzGmKoD8bR7fqoZwVRWtgLstuKAnpDKDrxF+PJFpXS8UrZg6KzAOLXcXeZD2qpeqmReIT/yShfpX8Sb3av6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335165; c=relaxed/simple;
	bh=2gHlRRfe5N0hzfS0ebrcez3lGn41AB8pRSZzX3LKbLg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZPaFQhE0SGLYIn6y64eiovRMaGH6oiSCa99Rwt0wqM3svGGgZyyqKQ4icPrvcbFqUP+MO5U/AAOY/6ZvR6GNFvrMyWIVULwHl3Y+eVFRsIJMasrnivTVTZIjCnUa3vTbtosQlet4GnMD0lTee7fs/4bfa8bwIa1zICZF9GhMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8eoRFZV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8eoRFZV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4264c77037cso2955455e9.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335160; x=1720939960; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4nTXTdn8BfpeIUTQTFy+0PL+rg8osqbE7sRCEcbh36A=;
        b=E8eoRFZVWH8Ta2G7BUjyPl3la55ASv2ixek+a6dZ6K+B9sisRZ0MTa3uZShBg5G8wL
         Ne4UofskP+om5V7sYZ3w1bLgD2gPWZYD2pNt6tzYdvtITIXNmi+i4HfuMusNcOnLurAC
         sCJuAKS5Tf95Gx6ZOUrHJOaQddx3reC7hPgYWtFi8tTz7pOSbZ0ZyB50+LPsy81xeM1J
         yqvOKqgCjrlSttKFaxPy5ZILH36KputwBmfG6gAfTmYO4u4XgKQ877/wKNR8Rf764+8U
         cDa7jjJFcIhOQzVCcmJVvdYmLOlFMQYwdPaolbi29w6cjjx7lYNhq+WP0oM3g5nxs8es
         e3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335160; x=1720939960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nTXTdn8BfpeIUTQTFy+0PL+rg8osqbE7sRCEcbh36A=;
        b=pirCXpi8AnkVOcTALPQ5amvgH+HnxpvBkEdeavQR1M3qKfRHjpmPwNWpiUjVrYuvoZ
         VTWAbROy84wPErqsPDLQaYCeyqjoz3HCOeQwq4bbBoOzb1t3g+alr4brpfpv2lPa8R0R
         cl/ij5bmFNg7a49IqMhbp3ItRbyt5+lKP483EaEDwwLFEcS6yfgKRoQjpO+4copojSVD
         s7PwQj5OOLJnI+8dGjKxlxF8ZhAor3gPq1kDEPi654/MVLeUmiSjrBgq0gJS0DxFWnsh
         6RT8UYC8oUisTVfXDu8dTPAXuRL0xuCItk30WjDuS/xwhe0n3gUbhyyzwaIoYO2XBnTT
         3Nsw==
X-Forwarded-Encrypted: i=1; AJvYcCWddv17YB71K7GycD8Dg9nHTaGmJ/Ow7B46GNnkKcI3GmIV7ZM8s0RLD/6/7y0fU6cXzYaN6Tseb8JTTLDUbM0PR6bD+4Q9JKBf3zrn7Q==
X-Gm-Message-State: AOJu0Ywhe1De8TXjGi7/nTQmdw1mU9Atb0fgTXj2G85sAmM34zofhdzA
	qmVvm9iDlYhcOvvVVVhH8sQnl6a9u8CsgxTgepi5gKkKT1gwiM+a
X-Google-Smtp-Source: AGHT+IEkAV8bNmuZkYXMin26Xc6b6o7XjXvQBr+yzOkeoBzNz/3QpTUWJQLG0wyYeJeR+246lvNNQQ==
X-Received: by 2002:a05:600c:35d4:b0:426:4920:2846 with SMTP id 5b1f17b1804b1-4264a46b0bbmr59448925e9.3.1720335160526;
        Sat, 06 Jul 2024 23:52:40 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36792881856sm10726712f8f.6.2024.07.06.23.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:52:39 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:52:38 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] staging: rtl8723bs: Remove unused macros in
 hal_phy_reg_8723b.h
Message-ID: <a478e607d4fcf22f547594c4a569c27da4fb2645.1720245061.git.philipp.g.hortmann@gmail.com>
References: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720245061.git.philipp.g.hortmann@gmail.com>

Remove unused and double defined macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../rtl8723bs/include/hal_phy_reg_8723b.h     | 51 -------------------
 1 file changed, 51 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h b/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h
index b0b1ac1090fc..0791b85b7c57 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h
@@ -14,56 +14,5 @@
 /*  4. Page9(0x900) */
 /*  */
 #define rDPDT_control				0x92c
-#define rfe_ctrl_anta_src				0x930
-#define rS0S1_PathSwitch			0x948
-#define AGC_table_select				0xb2c
-
-/*  */
-/*  PageB(0xB00) */
-/*  */
-#define rPdp_AntA						0xb00
-#define rPdp_AntA_4						0xb04
-#define rPdp_AntA_8						0xb08
-#define rPdp_AntA_C						0xb0c
-#define rPdp_AntA_10					0xb10
-#define rPdp_AntA_14					0xb14
-#define rPdp_AntA_18					0xb18
-#define rPdp_AntA_1C					0xb1c
-#define rPdp_AntA_20					0xb20
-#define rPdp_AntA_24					0xb24
-
-#define rConfig_Pmpd_AntA				0xb28
-#define rConfig_ram64x16				0xb2c
-
-#define rBndA							0xb30
-#define rHssiPar						0xb34
-
-#define rConfig_AntA					0xb68
-#define rConfig_AntB					0xb6c
-
-#define rPdp_AntB						0xb70
-#define rPdp_AntB_4						0xb74
-#define rPdp_AntB_8						0xb78
-#define rPdp_AntB_C						0xb7c
-#define rPdp_AntB_10					0xb80
-#define rPdp_AntB_14					0xb84
-#define rPdp_AntB_18					0xb88
-#define rPdp_AntB_1C					0xb8c
-#define rPdp_AntB_20					0xb90
-#define rPdp_AntB_24					0xb94
-
-#define rConfig_Pmpd_AntB				0xb98
-
-#define rBndB							0xba0
-
-#define rAPK							0xbd8
-#define rPm_Rx0_AntA					0xbdc
-#define rPm_Rx1_AntA					0xbe0
-#define rPm_Rx2_AntA					0xbe4
-#define rPm_Rx3_AntA					0xbe8
-#define rPm_Rx0_AntB					0xbec
-#define rPm_Rx1_AntB					0xbf0
-#define rPm_Rx2_AntB					0xbf4
-#define rPm_Rx3_AntB					0xbf8
 
 #endif
-- 
2.45.2

