Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4613F33D6CA
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 23:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580358; cv=none; b=i7bR1YX5O8oUF0bfPUXKIqjJbiFGG5ntl/PB9XkadPAHw0i6i1wAAVV0kPcmonr91Y07/tSjeRfuBFbl69m+N++VNEENcAh3llMoBTmKxgw39H4hrDXZwpwszH2DP1iKWXY/xPeMorg0X5yL4MaPIH4yQWJfZYcRI4l02TtCHf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580358; c=relaxed/simple;
	bh=juTqYkup/by3DgOkN6qLT4McKLHDc5uf8jqpeji0c8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvtGQMbW1B8RgeFtKqsXCjFoNiQRpa3kx2hGI9E09h/OHd+k26tbNevQNXP6+R1PZlQOLd7kVIKaY96JtXhlo09blG84rXFBg4HyO3DffYa+tiE8btVGRancuaTvA7gbdv5WzYGWTOQjhloyugPOGRY54Uq+r+QTvkDALrFkfU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbmQL7nh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbmQL7nh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806bf39419so52772925e9.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 15:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580355; x=1773185155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0VDTq5+YnLJ0nZqtFumq/na1fPGtAhpN+2pmOfdQ2I=;
        b=gbmQL7nhx8Y7UiqKB1k1/H1gyagf9L/8NlnwzzFwmFPrCn4AOBvtA6XnFL3KSruwZS
         /uWpUEEMFecRNL7nNy+75TPbUAurokHAs3OeYAQ/h1qEjpuZEGqajhzCG+olU+81BlFk
         rjVOBT8LGPU0KNzXyb5u6h0VTAXxaXx8S/2yhp0yuMlUCINAeRBrfzLVkn6fxsd9nf+6
         RlVRz7ouJYImVUUOrDV+0baHdSgTEepH/8pBKjEbtwPddwbKUZZOqSBFoWtYM27J/r3c
         KsxuSX/lmRfaucGCijWIwsTjzEpNFCEOHWcdvgdegLuNBnnoG3CClMq9T2Mwe6CkQbNh
         9hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580355; x=1773185155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0VDTq5+YnLJ0nZqtFumq/na1fPGtAhpN+2pmOfdQ2I=;
        b=nqBbyf/VOKpvBuU+dIZm70BRsZsEtjTjiKz6Bqv/TKMzw3A4oX7LbjZUzJy9JLbDfi
         h7HdD1yXneJHp2395nD8jBkTgeBSW9JzQaK2pKW/5HbvBGa5nzRiT4fnalZ0Sc8eBgW+
         VHQoLnOt4oYk8BfszVNXlrPLK+rtqY7Pg0q55HLfEgU1mW8Q/MzM0X9ImA7iDr6vJv68
         NzGX5iXdSkTp9NPxSwfpBRMTxrQPqMbqfL/GXN4vk5SNgDAGMIhg1tNNkxTFJJr9RM1z
         t75n8HyXVzivN8C+hpZdBemTWcMhWZB6gG8bq8FxchxsErwBViM3BfrnDF3w5XFWTs0L
         sRZg==
X-Forwarded-Encrypted: i=1; AJvYcCVW09bq/cr6jSJXLJZaapKi4vOPUXRzVAfUFg5n26XxZYmhadlsZw/9+cL4dXYOGnVGw3AvuAphLyCoPSmm@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk4v7tVSsIiC037+c+yQyDbikNoii2aKwKuQaFV+okHyMcuQ4+
	YNov4oqW9oXwnG8jul/OaliRqaWDreJe2Z7iBU9lQt1Ezpvx0N3E0ywF
X-Gm-Gg: ATEYQzynQ+0bQ/pBVwLaVYSaVP/aUkVQl+jD8X1+U+UPhMvA2dokmvG2/oxR9of7DSe
	8YcRZSZSGUHQ61vCZkfECFmn1wwPeD4Z0JjjreccfzhitfMQ55IG448wgvtaCk/Y8GnoU88MVJB
	ZosVswStAWrKk6RrzpZmIJ3DxMjbC4568roWCQMby60LsVOM3xNOn0104MWiAtEsYMiHtMGlreD
	aVZqx52WnvrRkf1vOQgnhOAVXAIuuHo6pX+euQMeATkoFddMImTN8iLfSUefC3Rh9vGd/yB44nw
	yZa1T63cXo9XsnA8RB7kqclBHZ8eqGysm9CdsJ1htBg3QtGao/6Cc+vrQVJdzal9pJQZEwnSPUo
	Z66r5HVSlBqPjqWwmV6jMll1WIPZx4Qr/MD1gCFA8TtaQy+YwHihiy6PF/jFcozbiQyByVwTKf7
	75RY+aBhlkiftwyKUx2LGUfA986wK68vRs2Syu+uoHZ8+qJFC60g==
X-Received: by 2002:a05:600c:3542:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-485198ee3admr278035e9.14.1772580354568;
        Tue, 03 Mar 2026 15:25:54 -0800 (PST)
Received: from arch ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335648esm68036615e9.5.2026.03.03.15.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:25:54 -0800 (PST)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH 2/8] staging: sm750fb: remove unused CSC register definitions
Date: Wed,  4 Mar 2026 00:24:23 +0100
Message-ID: <20260303232434.1850583-2-gawindlin@gmail.com>
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

The Color Space Conversion (CSC) register macros defined in ddk750_reg.h
are not referenced anywhere in the driver. Remove them to reduce dead
code as noted in the TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/sm750fb/ddk750_reg.h | 79 ----------------------------
 1 file changed, 79 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index 59ecbc0d48f7..13b04870ad9b 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -1126,85 +1126,6 @@
 /* Panel Palette register starts at 0x080C00 ~ 0x080FFC */
 #define CRT_PALETTE_RAM                               0x080C00
 
-/* Color Space Conversion registers. */
-
-#define CSC_Y_SOURCE_BASE                               0x1000C8
-#define CSC_Y_SOURCE_BASE_EXT                           BIT(27)
-#define CSC_Y_SOURCE_BASE_CS                            BIT(26)
-#define CSC_Y_SOURCE_BASE_ADDRESS_MASK                  0x3ffffff
-
-#define CSC_CONSTANTS                                   0x1000CC
-#define CSC_CONSTANTS_Y_MASK                            (0xff << 24)
-#define CSC_CONSTANTS_R_MASK                            (0xff << 16)
-#define CSC_CONSTANTS_G_MASK                            (0xff << 8)
-#define CSC_CONSTANTS_B_MASK                            0xff
-
-#define CSC_Y_SOURCE_X                                  0x1000D0
-#define CSC_Y_SOURCE_X_INTEGER_MASK                     (0x7ff << 16)
-#define CSC_Y_SOURCE_X_FRACTION_MASK                    (0x1fff << 3)
-
-#define CSC_Y_SOURCE_Y                                  0x1000D4
-#define CSC_Y_SOURCE_Y_INTEGER_MASK                     (0xfff << 16)
-#define CSC_Y_SOURCE_Y_FRACTION_MASK                    (0x1fff << 3)
-
-#define CSC_U_SOURCE_BASE                               0x1000D8
-#define CSC_U_SOURCE_BASE_EXT                           BIT(27)
-#define CSC_U_SOURCE_BASE_CS                            BIT(26)
-#define CSC_U_SOURCE_BASE_ADDRESS_MASK                  0x3ffffff
-
-#define CSC_V_SOURCE_BASE                               0x1000DC
-#define CSC_V_SOURCE_BASE_EXT                           BIT(27)
-#define CSC_V_SOURCE_BASE_CS                            BIT(26)
-#define CSC_V_SOURCE_BASE_ADDRESS_MASK                  0x3ffffff
-
-#define CSC_SOURCE_DIMENSION                            0x1000E0
-#define CSC_SOURCE_DIMENSION_X_MASK                     (0xffff << 16)
-#define CSC_SOURCE_DIMENSION_Y_MASK                     0xffff
-
-#define CSC_SOURCE_PITCH                                0x1000E4
-#define CSC_SOURCE_PITCH_Y_MASK                         (0xffff << 16)
-#define CSC_SOURCE_PITCH_UV_MASK                        0xffff
-
-#define CSC_DESTINATION                                 0x1000E8
-#define CSC_DESTINATION_WRAP                            BIT(31)
-#define CSC_DESTINATION_X_MASK                          (0xfff << 16)
-#define CSC_DESTINATION_Y_MASK                          0xfff
-
-#define CSC_DESTINATION_DIMENSION                       0x1000EC
-#define CSC_DESTINATION_DIMENSION_X_MASK                (0xffff << 16)
-#define CSC_DESTINATION_DIMENSION_Y_MASK                0xffff
-
-#define CSC_DESTINATION_PITCH                           0x1000F0
-#define CSC_DESTINATION_PITCH_X_MASK                    (0xffff << 16)
-#define CSC_DESTINATION_PITCH_Y_MASK                    0xffff
-
-#define CSC_SCALE_FACTOR                                0x1000F4
-#define CSC_SCALE_FACTOR_HORIZONTAL_MASK                (0xffff << 16)
-#define CSC_SCALE_FACTOR_VERTICAL_MASK                  0xffff
-
-#define CSC_DESTINATION_BASE                            0x1000F8
-#define CSC_DESTINATION_BASE_EXT                        BIT(27)
-#define CSC_DESTINATION_BASE_CS                         BIT(26)
-#define CSC_DESTINATION_BASE_ADDRESS_MASK               0x3ffffff
-
-#define CSC_CONTROL                                     0x1000FC
-#define CSC_CONTROL_STATUS                              BIT(31)
-#define CSC_CONTROL_SOURCE_FORMAT_MASK                  (0x7 << 28)
-#define CSC_CONTROL_SOURCE_FORMAT_YUV422                (0x0 << 28)
-#define CSC_CONTROL_SOURCE_FORMAT_YUV420I               (0x1 << 28)
-#define CSC_CONTROL_SOURCE_FORMAT_YUV420                (0x2 << 28)
-#define CSC_CONTROL_SOURCE_FORMAT_YVU9                  (0x3 << 28)
-#define CSC_CONTROL_SOURCE_FORMAT_IYU1                  (0x4 << 28)
-#define CSC_CONTROL_SOURCE_FORMAT_IYU2                  (0x5 << 28)
-#define CSC_CONTROL_SOURCE_FORMAT_RGB565                (0x6 << 28)
-#define CSC_CONTROL_SOURCE_FORMAT_RGB8888               (0x7 << 28)
-#define CSC_CONTROL_DESTINATION_FORMAT_MASK             (0x3 << 26)
-#define CSC_CONTROL_DESTINATION_FORMAT_RGB565           (0x0 << 26)
-#define CSC_CONTROL_DESTINATION_FORMAT_RGB8888          (0x1 << 26)
-#define CSC_CONTROL_HORIZONTAL_FILTER                   BIT(25)
-#define CSC_CONTROL_VERTICAL_FILTER                     BIT(24)
-#define CSC_CONTROL_BYTE_ORDER                          BIT(23)
-
 #define DE_DATA_PORT                                    0x110000
 
 #define I2C_BYTE_COUNT                                  0x010040
-- 
2.53.0

