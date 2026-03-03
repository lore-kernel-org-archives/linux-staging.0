Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BF3537CF
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 23:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580364; cv=none; b=VrOaLPIVjpPfHmXYTLzpBwg+zU7eeTCMhFnKZn8HD/wE5F6Ab5jnThVwLEYl3IkghWvXGWcZAPY1xRSg4x946XaMasC0cmY5ZZ952qKt17lLxTaNIg3e+GA/3Clpfl/CzuB7c4P+2+gtw/x0uvKrkVZApkKUFJuwkjdHZ/VkmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580364; c=relaxed/simple;
	bh=c3ERkWhD9cbQaTRuGWOS7lOZK1bMgNpj7WxTjZQhGG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJSJ6ScIwD0on+/3VbXA1JqfE6+1qqxgLYYaJyQULxcNnFmsD1JYYY3/o0K/tkGN6MdaNkigZqg3gOTE/4wcYEKOBL3zliU2FuV5mih9+wTM49AJo3/UXufOOy/pHwReAs6TyepbTcV1G1PSO5yOhMy+E2Twq7VMpz0zgnh3aNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVFsUjCC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVFsUjCC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-437711e9195so4848606f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 15:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580361; x=1773185161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwxRWLyaa3AgnUQSozmfRcF7xtoXF7t1KAuB4nhzAW8=;
        b=SVFsUjCC6vUU357Axm/lU4+JYcuZcv1n6tAADiPLoGFbVGrOZrYPKN42rwwUGbhcNx
         qkyPt39Oyeq8/V9tijOTB+S7dI7kCZb50VE6KJUJpJw3Andj/D9915grbt7S9nKy16Jc
         7DhMmKD/G7Gv4yGUOtyBQlJUhy650EaeBxy8CGzTFhzPmA/3WrF1lq/iQz6klHWXR1iG
         PCbJ+2BpiKeXBHlfECQcc74UKSiSllEGVGb661BSkL3z/CMLTht+JoKOFgD/YcTYIlFS
         am1WpLZ7fL6G4LZHsLOJpjvjPAXNXbsvKQeho+2icsGf/2eyPUVqrnFz7ictQndIicFa
         zY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580361; x=1773185161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwxRWLyaa3AgnUQSozmfRcF7xtoXF7t1KAuB4nhzAW8=;
        b=J8KS5ZmFwar9mIgR/BSykwJaWXINkFrjjwdqVhBb75Ko0ZBWgBF8xkVqAa/t13P/oU
         EPL3eX0zioar1EPUa9YxLWliSBM5eZUp04IIhFR2OfwQyGw6ylh6syMwTo2ZYfrlhgq8
         IDLj5onTK9QK3zHsGfPxrvG65YEAJfKf7c6RWnRRIaeXJIjZoejVUFu79sZWh+zPDYTC
         Rznpq5W4j50NV4Ej02E6Hn32k29px2IW0R8xw9hoTueY+MougCi71Bo5u7tlyAsZTBF6
         VFKtjJIj743TEnmD+vcsPGMPazGsgJESx8MlMTEjme8si3+EGnmA3KVIP2hGUociUv/0
         MPaw==
X-Forwarded-Encrypted: i=1; AJvYcCWOrmA2T+Ar4ggtguSRQWifS/NhHdjVlyjio/fG1yg55UoTyrYeJ3/YkJx+XQCfDqoPWs2JV3n5HE7fYNfR@lists.linux.dev
X-Gm-Message-State: AOJu0YzBxBNhUPsHGTBx6w7cJDipDaO6pHI6uugOPo+zpokLFn2iZHaU
	H0XhMB9xNlTKWB+Sr1l6Z2Mug9Vd5YnvCRXg3mJL1pyxB2cKtWYc4nvR
X-Gm-Gg: ATEYQzyZ66TptEl/qPzhkaU6pJBG+djBV0U6WQOUaP5A4gA5c1Q+MU5gTix+Ts3Md25
	ZmgQ6CINesEIusEhC35YSPvo+IdwN4z3lfQclSSZjldINkuYK0CM+K1sFEBGEmt8hvBroDC1cGq
	DKaS7hp0kfMK2fHdIzfXbPy8zOTquOjatgtwoj8tRWEqzzVBNtOclY5T9fv1Kdtq/H1UYqt3gRm
	ycx6b4odvUUfmqMCWR/blFyutL6Oz2a7JlaCLNiDbAJ8XUCjPVEvFSYW1Z+T98a4DrAJ6CJGcnD
	7KMwo94uSKFGWU/vhQMwlUWM6SWYEZ0yPdm/JUGsqyvfY7HrsN8o151v09i9+YJSzyCfkQUjJcT
	D7aYnkURDuqTzQpCMPGv6aVIKVK6FWQWbePfFLeWnqiS/YNbTXvxFNLkPulF0Ext2StMFPCYhXP
	OeAXS+5HWR/ttjuE3UoaqyTSrKbvIAzKuHpQ/mJdNrDlK/dNF6lg==
X-Received: by 2002:a05:600c:6992:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-4851984fd72mr688695e9.10.1772580360518;
        Tue, 03 Mar 2026 15:26:00 -0800 (PST)
Received: from arch ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335648esm68036615e9.5.2026.03.03.15.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:26:00 -0800 (PST)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH 7/8] staging: sm750fb: remove unused CURRENT_GATE, CRT_HWC, and DMA register definitions
Date: Wed,  4 Mar 2026 00:24:28 +0100
Message-ID: <20260303232434.1850583-7-gawindlin@gmail.com>
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

The CURRENT_GATE_VGA, CURRENT_GATE_PWM, CURRENT_GATE_SSP, and
CURRENT_GATE_ZVPORT bit field macros, the CRT_HWC hardware cursor
register macros, the DMA_1_SOURCE, DMA_1_DESTINATION, and
DMA_1_SIZE_CONTROL register macros, and the unused
DMA_ABORT_INTERRUPT_ABORT_0, DMA_ABORT_INTERRUPT_INT_1, and
DMA_ABORT_INTERRUPT_INT_0 bit field macros defined in ddk750_reg.h
are not referenced anywhere in the driver. Remove them to reduce dead
code as noted in the TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/sm750fb/ddk750_reg.h | 41 ----------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index 8f227d974613..328254d3d7cc 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -102,12 +102,8 @@
     #define CURRENT_GATE_M2XCLK_DIV_3                 (0x2 << 12)
     #define CURRENT_GATE_M2XCLK_DIV_4                 (0x3 << 12)
 #endif
-#define CURRENT_GATE_VGA                              BIT(10)
-#define CURRENT_GATE_PWM                              BIT(9)
 #define CURRENT_GATE_I2C                              BIT(8)
-#define CURRENT_GATE_SSP                              BIT(7)
 #define CURRENT_GATE_GPIO                             BIT(6)
-#define CURRENT_GATE_ZVPORT                           BIT(5)
 #define CURRENT_GATE_CSC                              BIT(4)
 #define CURRENT_GATE_DE                               BIT(3)
 #define CURRENT_GATE_DISPLAY                          BIT(2)
@@ -602,26 +598,6 @@
 #define CRT_SCALE_HORIZONTAL_MODE                     BIT(15)
 #define CRT_SCALE_HORIZONTAL_SCALE_MASK               0xfff
 
-/* CRT Cursor Control */
-
-#define CRT_HWC_ADDRESS                               0x080230
-#define CRT_HWC_ADDRESS_ENABLE                        BIT(31)
-#define CRT_HWC_ADDRESS_EXT                           BIT(27)
-#define CRT_HWC_ADDRESS_ADDRESS_MASK                  0x3ffffff
-
-#define CRT_HWC_LOCATION                              0x080234
-#define CRT_HWC_LOCATION_TOP                          BIT(27)
-#define CRT_HWC_LOCATION_Y_MASK                       (0x7ff << 16)
-#define CRT_HWC_LOCATION_LEFT                         BIT(11)
-#define CRT_HWC_LOCATION_X_MASK                       0x7ff
-
-#define CRT_HWC_COLOR_12                              0x080238
-#define CRT_HWC_COLOR_12_2_RGB565_MASK                (0xffff << 16)
-#define CRT_HWC_COLOR_12_1_RGB565_MASK                0xffff
-
-#define CRT_HWC_COLOR_3                               0x08023C
-#define CRT_HWC_COLOR_3_RGB565_MASK                   0xffff
-
 /* This vertical expansion below start at 0x080240 ~ 0x080264 */
 #define CRT_VERTICAL_EXPANSION                        0x080240
 #ifndef VALIDATION_CHIP
@@ -703,25 +679,8 @@
 #define I2C_DATA14                                      0x010052
 #define I2C_DATA15                                      0x010053
 
-#define DMA_1_SOURCE                                    0x0D0010
-#define DMA_1_SOURCE_ADDRESS_EXT                        BIT(27)
-#define DMA_1_SOURCE_ADDRESS_CS                         BIT(26)
-#define DMA_1_SOURCE_ADDRESS_MASK                       0x3ffffff
-
-#define DMA_1_DESTINATION                               0x0D0014
-#define DMA_1_DESTINATION_ADDRESS_EXT                   BIT(27)
-#define DMA_1_DESTINATION_ADDRESS_CS                    BIT(26)
-#define DMA_1_DESTINATION_ADDRESS_MASK                  0x3ffffff
-
-#define DMA_1_SIZE_CONTROL                              0x0D0018
-#define DMA_1_SIZE_CONTROL_STATUS                       BIT(31)
-#define DMA_1_SIZE_CONTROL_SIZE_MASK                    0xffffff
-
 #define DMA_ABORT_INTERRUPT                             0x0D0020
 #define DMA_ABORT_INTERRUPT_ABORT_1                     BIT(5)
-#define DMA_ABORT_INTERRUPT_ABORT_0                     BIT(4)
-#define DMA_ABORT_INTERRUPT_INT_1                       BIT(1)
-#define DMA_ABORT_INTERRUPT_INT_0                       BIT(0)
 
 /* Default i2c CLK and Data GPIO. These are the default i2c pins */
 #define DEFAULT_I2C_SCL                     30
-- 
2.53.0

