Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A245347534
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580358; cv=none; b=IgBen+D/8fu2nPlo8mZeHd9DkNX8ThyyokACmHGGAQ6eM4uEg7QLUGXq5QzLQI9WiN6kqba9d4IFivDW6uHYMClrXKL/gUQ4p54H1rPzXmPlozd0yFKoWeJ0sXTwatTI8995t02cELrP8ZJbjxuM2Yit8ODMCjEkLjkEdQCk7x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580358; c=relaxed/simple;
	bh=DZL51npHETrQOaLm+gXQSMAWjDCRqz6RGYaVU3tGRew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hz2GBZKOk2YpCuGmC+RtskeKTULh+Y0Bt7b80NKbAiubdIHBH3FF37kEDotZefl+zUGwAU+ou+l1yZ84o9Gv4XfZ4jwLAkxfHQ2pv2XM/Pll5MBgVpBAablnEJQ8FmGIemj6WEbPAlJnszKUQfm6IuqfwAD0Rcv9CxGh77amj+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3PRyQGe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3PRyQGe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so38204225e9.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 15:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580356; x=1773185156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q62znnvOqEzZPobsTXXdYeKA44XpPeuRQCLKUu1n+U0=;
        b=g3PRyQGed/kjNOIymAjZXsDx8I5QWTihKLSqeJjrNGW9O3oPBhPb3nX0hfXv2Qfqe3
         TEj6SRP+inDu1dZTdTsEwVe2Fk2YCuX1J53OEOHh/2vEG3p3ed6PlukwfKCRVyPCqc+k
         sxf0OfiTl4w7YLqz2MEXTBLn0YsZ/VxJ9v2EvaNXNsNF6tciL9Tw4Hna7srGy5U7lePT
         yB+Wp2K+W/4lOjYlE286scHCcCrzO8+m5BDlizianN3jJ57tBoqgJnTXc0/n1BzQ+gw4
         cPjYx6XYp776Ar2zOfXMcNKGfvywIiHrQ6cykynPOj0wluy235+sGpUnW5ZX3s1UqWWS
         5tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580356; x=1773185156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q62znnvOqEzZPobsTXXdYeKA44XpPeuRQCLKUu1n+U0=;
        b=fIRsK05Sr5YsCJUWMObxLiozNj/xTvEpopsgiPmGkUpTy1NSi6NY/f3lqZ9YveZwTz
         uLQIybywtg5KN5GyhwL30R/IlH8rRs9afC0bbrYJFU+SaszSsq70qiGk2PTOS4o8pL71
         okJjifAWhXciNOSjFpcyLBYHytrJ/LAyxYG+T+LKd8Uc2P/uQz9EbWKhsLLjmvv3SwqG
         AD6jfBMvKG1JRQxKh1v+/YbpZAbxIXTTkkV150e9ToJkbzEwVHJi07Kd5hF/3214yLpf
         t6ujm38XwqgJ0G+ZeXJJD/z1xZxT/PenCBMe0vZubJeQRB6hXEbV3xoEmdCp5ZT6VxFq
         adWA==
X-Forwarded-Encrypted: i=1; AJvYcCWJFoUsopUkXQKBvUUGzWCKUL1TTTKJyx0AtXL+77JbJ4TU7yjVQHsS44vwAwpPetVoCUw1vszr/LZQSVF7@lists.linux.dev
X-Gm-Message-State: AOJu0YzDhnQG4IQIMVDywdTXuApbd6MLxsd/8ESZVJnp9tpgUb9SX3Kr
	lrwCgWHzJ6/yy//x50P+/0ctqArGGrJna0AEltjnLJfpbj1R26z1wFv8
X-Gm-Gg: ATEYQzxQBdJy//+jg5UM8QLJvbBlsRbrNFW6DU7LonVUxaK9x4DwpTo24CIb+QSQZLD
	HxYOW1uRdKg8D7hUulSgf0FdNR21btSVSEmVaSkn4I10C4Uqba+tzC8l1248YekJQV/NlpFMMUC
	+zFtsZ2WZ9cgFUzQAIvFgojwSXMFTbtfrLpNsPZ9hWmMgUYRxspEFyEAD28VPHR0kvyOxPtLARA
	QTWY4AwLB2SjE9tyjVtHBWGBGY+U79Gp9UYP8FjKlWN+CuKtVfqjPKVhcsKCVqcvGUv7pHLFpa8
	CYQAQIYMtGt4B5MczLpvsuqkWienMxWkNkmgyl7TcXkD6hajHZ4GthUILbWd8ii9LC5UZ7Je0lw
	Hspb7+TTTce4V+wUv+N001amRU1p63ETCSofa0ToD/7oeeQfzvEZRqeKJkmILdU4H/85AM/WkUx
	v1JUmlXSbIaqqlqKpr6T9f04hoSgFkxuUMTWnQCJ70t9f+vel06zWhlmHrGHYE
X-Received: by 2002:a05:600c:1d05:b0:483:badb:618f with SMTP id 5b1f17b1804b1-48519887d35mr606095e9.25.1772580355798;
        Tue, 03 Mar 2026 15:25:55 -0800 (PST)
Received: from arch ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335648esm68036615e9.5.2026.03.03.15.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:25:55 -0800 (PST)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH 3/8] staging: sm750fb: remove unused ZV capture register definitions
Date: Wed,  4 Mar 2026 00:24:24 +0100
Message-ID: <20260303232434.1850583-3-gawindlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303232434.1850583-1-gawindlin@gmail.com>
References: <20260303232434.1850583-1-gawindlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ZV0 and ZV1 video capture port register macros defined in
ddk750_reg.h are not referenced anywhere in the driver. Remove them
to reduce dead code as noted in the TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/sm750fb/ddk750_reg.h | 141 ---------------------------
 1 file changed, 141 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index 13b04870ad9b..efdafa993e86 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -1168,147 +1168,6 @@
 #define I2C_DATA14                                      0x010052
 #define I2C_DATA15                                      0x010053
 
-#define ZV0_CAPTURE_CTRL                                0x090000
-#define ZV0_CAPTURE_CTRL_FIELD_INPUT                    BIT(27)
-#define ZV0_CAPTURE_CTRL_SCAN                           BIT(26)
-#define ZV0_CAPTURE_CTRL_CURRENT_BUFFER                 BIT(25)
-#define ZV0_CAPTURE_CTRL_VERTICAL_SYNC                  BIT(24)
-#define ZV0_CAPTURE_CTRL_ADJ                            BIT(19)
-#define ZV0_CAPTURE_CTRL_HA                             BIT(18)
-#define ZV0_CAPTURE_CTRL_VSK                            BIT(17)
-#define ZV0_CAPTURE_CTRL_HSK                            BIT(16)
-#define ZV0_CAPTURE_CTRL_FD                             BIT(15)
-#define ZV0_CAPTURE_CTRL_VP                             BIT(14)
-#define ZV0_CAPTURE_CTRL_HP                             BIT(13)
-#define ZV0_CAPTURE_CTRL_CP                             BIT(12)
-#define ZV0_CAPTURE_CTRL_UVS                            BIT(11)
-#define ZV0_CAPTURE_CTRL_BS                             BIT(10)
-#define ZV0_CAPTURE_CTRL_CS                             BIT(9)
-#define ZV0_CAPTURE_CTRL_CF                             BIT(8)
-#define ZV0_CAPTURE_CTRL_FS                             BIT(7)
-#define ZV0_CAPTURE_CTRL_WEAVE                          BIT(6)
-#define ZV0_CAPTURE_CTRL_BOB                            BIT(5)
-#define ZV0_CAPTURE_CTRL_DB                             BIT(4)
-#define ZV0_CAPTURE_CTRL_CC                             BIT(3)
-#define ZV0_CAPTURE_CTRL_RGB                            BIT(2)
-#define ZV0_CAPTURE_CTRL_656                            BIT(1)
-#define ZV0_CAPTURE_CTRL_CAP                            BIT(0)
-
-#define ZV0_CAPTURE_CLIP                                0x090004
-#define ZV0_CAPTURE_CLIP_EYCLIP_MASK                    (0x3ff << 16)
-#define ZV0_CAPTURE_CLIP_XCLIP_MASK                     0x3ff
-
-#define ZV0_CAPTURE_SIZE                                0x090008
-#define ZV0_CAPTURE_SIZE_HEIGHT_MASK                    (0x7ff << 16)
-#define ZV0_CAPTURE_SIZE_WIDTH_MASK                     0x7ff
-
-#define ZV0_CAPTURE_BUF0_ADDRESS                        0x09000C
-#define ZV0_CAPTURE_BUF0_ADDRESS_STATUS                 BIT(31)
-#define ZV0_CAPTURE_BUF0_ADDRESS_EXT                    BIT(27)
-#define ZV0_CAPTURE_BUF0_ADDRESS_CS                     BIT(26)
-#define ZV0_CAPTURE_BUF0_ADDRESS_ADDRESS_MASK           0x3ffffff
-
-#define ZV0_CAPTURE_BUF1_ADDRESS                        0x090010
-#define ZV0_CAPTURE_BUF1_ADDRESS_STATUS                 BIT(31)
-#define ZV0_CAPTURE_BUF1_ADDRESS_EXT                    BIT(27)
-#define ZV0_CAPTURE_BUF1_ADDRESS_CS                     BIT(26)
-#define ZV0_CAPTURE_BUF1_ADDRESS_ADDRESS_MASK           0x3ffffff
-
-#define ZV0_CAPTURE_BUF_OFFSET                          0x090014
-#ifndef VALIDATION_CHIP
-    #define ZV0_CAPTURE_BUF_OFFSET_YCLIP_ODD_FIELD      (0x3ff << 16)
-#endif
-#define ZV0_CAPTURE_BUF_OFFSET_OFFSET_MASK              0xffff
-
-#define ZV0_CAPTURE_FIFO_CTRL                           0x090018
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_MASK                 0x7
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_0                    0
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_1                    1
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_2                    2
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_3                    3
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_4                    4
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_5                    5
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_6                    6
-#define ZV0_CAPTURE_FIFO_CTRL_FIFO_7                    7
-
-#define ZV0_CAPTURE_YRGB_CONST                          0x09001C
-#define ZV0_CAPTURE_YRGB_CONST_Y_MASK                   (0xff << 24)
-#define ZV0_CAPTURE_YRGB_CONST_R_MASK                   (0xff << 16)
-#define ZV0_CAPTURE_YRGB_CONST_G_MASK                   (0xff << 8)
-#define ZV0_CAPTURE_YRGB_CONST_B_MASK                   0xff
-
-#define ZV0_CAPTURE_LINE_COMP                           0x090020
-#define ZV0_CAPTURE_LINE_COMP_LC_MASK                   0x7ff
-
-/* ZV1 */
-
-#define ZV1_CAPTURE_CTRL                                0x098000
-#define ZV1_CAPTURE_CTRL_FIELD_INPUT                    BIT(27)
-#define ZV1_CAPTURE_CTRL_SCAN                           BIT(26)
-#define ZV1_CAPTURE_CTRL_CURRENT_BUFFER                 BIT(25)
-#define ZV1_CAPTURE_CTRL_VERTICAL_SYNC                  BIT(24)
-#define ZV1_CAPTURE_CTRL_PANEL                          BIT(20)
-#define ZV1_CAPTURE_CTRL_ADJ                            BIT(19)
-#define ZV1_CAPTURE_CTRL_HA                             BIT(18)
-#define ZV1_CAPTURE_CTRL_VSK                            BIT(17)
-#define ZV1_CAPTURE_CTRL_HSK                            BIT(16)
-#define ZV1_CAPTURE_CTRL_FD                             BIT(15)
-#define ZV1_CAPTURE_CTRL_VP                             BIT(14)
-#define ZV1_CAPTURE_CTRL_HP                             BIT(13)
-#define ZV1_CAPTURE_CTRL_CP                             BIT(12)
-#define ZV1_CAPTURE_CTRL_UVS                            BIT(11)
-#define ZV1_CAPTURE_CTRL_BS                             BIT(10)
-#define ZV1_CAPTURE_CTRL_CS                             BIT(9)
-#define ZV1_CAPTURE_CTRL_CF                             BIT(8)
-#define ZV1_CAPTURE_CTRL_FS                             BIT(7)
-#define ZV1_CAPTURE_CTRL_WEAVE                          BIT(6)
-#define ZV1_CAPTURE_CTRL_BOB                            BIT(5)
-#define ZV1_CAPTURE_CTRL_DB                             BIT(4)
-#define ZV1_CAPTURE_CTRL_CC                             BIT(3)
-#define ZV1_CAPTURE_CTRL_RGB                            BIT(2)
-#define ZV1_CAPTURE_CTRL_656                            BIT(1)
-#define ZV1_CAPTURE_CTRL_CAP                            BIT(0)
-
-#define ZV1_CAPTURE_CLIP                                0x098004
-#define ZV1_CAPTURE_CLIP_YCLIP_MASK                     (0x3ff << 16)
-#define ZV1_CAPTURE_CLIP_XCLIP_MASK                     0x3ff
-
-#define ZV1_CAPTURE_SIZE                                0x098008
-#define ZV1_CAPTURE_SIZE_HEIGHT_MASK                    (0x7ff << 16)
-#define ZV1_CAPTURE_SIZE_WIDTH_MASK                     0x7ff
-
-#define ZV1_CAPTURE_BUF0_ADDRESS                        0x09800C
-#define ZV1_CAPTURE_BUF0_ADDRESS_STATUS                 BIT(31)
-#define ZV1_CAPTURE_BUF0_ADDRESS_EXT                    BIT(27)
-#define ZV1_CAPTURE_BUF0_ADDRESS_CS                     BIT(26)
-#define ZV1_CAPTURE_BUF0_ADDRESS_ADDRESS_MASK           0x3ffffff
-
-#define ZV1_CAPTURE_BUF1_ADDRESS                        0x098010
-#define ZV1_CAPTURE_BUF1_ADDRESS_STATUS                 BIT(31)
-#define ZV1_CAPTURE_BUF1_ADDRESS_EXT                    BIT(27)
-#define ZV1_CAPTURE_BUF1_ADDRESS_CS                     BIT(26)
-#define ZV1_CAPTURE_BUF1_ADDRESS_ADDRESS_MASK           0x3ffffff
-
-#define ZV1_CAPTURE_BUF_OFFSET                          0x098014
-#define ZV1_CAPTURE_BUF_OFFSET_OFFSET_MASK              0xffff
-
-#define ZV1_CAPTURE_FIFO_CTRL                           0x098018
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_MASK                 0x7
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_0                    0
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_1                    1
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_2                    2
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_3                    3
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_4                    4
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_5                    5
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_6                    6
-#define ZV1_CAPTURE_FIFO_CTRL_FIFO_7                    7
-
-#define ZV1_CAPTURE_YRGB_CONST                          0x09801C
-#define ZV1_CAPTURE_YRGB_CONST_Y_MASK                   (0xff << 24)
-#define ZV1_CAPTURE_YRGB_CONST_R_MASK                   (0xff << 16)
-#define ZV1_CAPTURE_YRGB_CONST_G_MASK                   (0xff << 8)
-#define ZV1_CAPTURE_YRGB_CONST_B_MASK                   0xff
-
 #define DMA_1_SOURCE                                    0x0D0010
 #define DMA_1_SOURCE_ADDRESS_EXT                        BIT(27)
 #define DMA_1_SOURCE_ADDRESS_CS                         BIT(26)
-- 
2.53.0

