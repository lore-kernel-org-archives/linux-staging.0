Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564AA347532
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 23:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580363; cv=none; b=Fru2QWmd6Ln6FYMX6W2D8WfAXy1MWsrC4g2xn/5Bbe0CZolJb2TyzwtgJIkA5bG2z2pTJIz5uXbh/9AsVCECgloE2vvK3XQRT5sfwX1L+uOGCmzA366BYPCcXDKZqLSQQ/dbL5yQ6UXJvKFo1v5kD/cNsNw235bPYfZN/7QRA2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580363; c=relaxed/simple;
	bh=CMbTXXHmeZIBffm5ithIzujhIUER4PeHVeuPkMo+WLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCMdZBfzAsdZBhrXdApEwYR0VxqT0wsSCYQk3Cy1Mf8RmIBAt5JkFbF4IdqjA60NdrgkPzYBlbJ2K5zvsrUWTpzeqH81rN6f9+QdjpmG/od6+OcbpuwmJd1CAHlubs+et4tyL49lwScZ3QpVuw0we3QIQBSX1iQwPkloVEM0pOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8uHIKTG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8uHIKTG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48372efa020so54757075e9.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 15:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580358; x=1773185158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr0JagJVxfAuMRUkqo+r5ILWFBJrm67ZsEShfqkvTiY=;
        b=V8uHIKTGGvLzsQCKRUSSxLRv9SU9+RBdklE3C3HnJQjFbTJIXb4xeZQiuD6R7Hg+7t
         s7QK0RwafmP4v1HPOmFu9k2PPplNfWgvuSl16g81Rv8cca5pPzKE50qLgSGlbsjMz+dD
         BOPc5LDQkgUSFBgaaSIiepQn66Dsx89GCcdtR4cBof93XK2eyvcFprFfQBtMogrzzFw3
         8G133M2N9Uw7MTcuDI5SMa1c/R3H2sNXk6sLN/q5x7XHS9wP0U0lvCDdu4S9ZOsDKuCq
         s+nq7wLhk7vuhf/5m0fG7aObKCqBFs5/3szQ+7xIExQwihN38zJplo4UUB5aw9BBlwif
         FdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580358; x=1773185158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kr0JagJVxfAuMRUkqo+r5ILWFBJrm67ZsEShfqkvTiY=;
        b=T8EWXfE/j8AiMwiCMk6oO9W90yZ7GiAN2zxV43LMcTvA5tx0L9m3W10/FjjQQf1FpU
         TdYT6RIwLsyAIPAeXl7q1+kVO8vfvOW1c8vEPTVDg0QG8dbhpmYZx37MLz1jcwuaJ2WJ
         bEdx+IV/4jjp4hyIC6Tw3Myx18g1dm0bROCObA6nguNDSK12GPGvxiwtZTstkYwublj6
         fOf9ISdvDdWw7UzK/8dkT7tR/IAL0y+qdYx/2YKLiVluqt97cjigYRrMSqM7jQFa9Nhb
         9Q+IoD00AiLp3Kw5lFhzk2jW6O7JfLU6dAlaomg8fUAt6K/gMS/uqfSlT7PiJIQjcEs6
         CBJg==
X-Forwarded-Encrypted: i=1; AJvYcCUaKj7zgR9DWNC5tzJnFZpy3El66c3+hSBlj8kS8yiZRhgPA9VtORto13YfJgDrAwOLM8p7temhWqX6to6p@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9ybhk/tsFxlxCTbbtJgq8R8kb6ojotjYOFDycoW+qqGmrHLj5
	pqaSHj6vxYoHG+h7GEvTSI5yj67gjRzVVD9GmRw452iOyPwbAkuupNN9z0ujs4kebzw=
X-Gm-Gg: ATEYQzzIdGJZ7YYaWCd9hQdd630teTjveChOBQ+B6TFefG+fAk2BaqC4TRE/YP+eUpe
	Rd6pyd5wiWLIUHPFkdH1gv4/pK31Lx80OkRn0DHiWAdorHfG/BpclFyLq1XokDVKyVYNuieb0Jn
	Hf7p2+awRvcx0yRZvkOfzInHm0sM7r961JwHA5a0lzT07jgSI90+Fe9NDvNKHnWv61ab0LEcTuW
	BQFa+aZFHcvI4QHuH/xX5MOK0fkl1tqH/zkjNSubwnjlHqtztkQXV8F0v7rUpCATZga/btyOr0q
	QZ4sfPUbMGeTKC25oyWViCtDFkBnw6w67VXE9FABcGjUqbKJR4VDoR9Hw1HouoKwfqSNHaCEfKz
	Gu7Tbr9yz1AoC5ObZfITOchHd0EPcYDFAdvuVFItWb4e0gOPyy+ZlZXrvprAyhwEQ5swNJiOgzv
	SMcN9e1bCbziuUxvVs4DYS3B3l4hl3Rm4gPI5gM72Q+rQZoay2TGfD3Uysg0hH
X-Received: by 2002:a05:600c:6389:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-4851989f63amr407045e9.30.1772580358488;
        Tue, 03 Mar 2026 15:25:58 -0800 (PST)
Received: from arch ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335648esm68036615e9.5.2026.03.03.15.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:25:58 -0800 (PST)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH 5/8] staging: sm750fb: remove unused memory arbitration register definitions
Date: Wed,  4 Mar 2026 00:24:26 +0100
Message-ID: <20260303232434.1850583-5-gawindlin@gmail.com>
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

The LOCALMEM_ARBITRATION and PCIMEM_ARBITRATION register macros defined
in ddk750_reg.h are not referenced anywhere in the driver. Remove them
to reduce dead code as noted in the TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/sm750fb/ddk750_reg.h | 132 ---------------------------
 1 file changed, 132 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index 24e826c31721..dd1d67fb9856 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -77,138 +77,6 @@
 
 #define GPIO_MUX                                      0x000008
 
-#define LOCALMEM_ARBITRATION                          0x00000C
-#define LOCALMEM_ARBITRATION_ROTATE                   BIT(28)
-#define LOCALMEM_ARBITRATION_VGA_MASK                 (0x7 << 24)
-#define LOCALMEM_ARBITRATION_VGA_OFF                  (0x0 << 24)
-#define LOCALMEM_ARBITRATION_VGA_PRIORITY_1           (0x1 << 24)
-#define LOCALMEM_ARBITRATION_VGA_PRIORITY_2           (0x2 << 24)
-#define LOCALMEM_ARBITRATION_VGA_PRIORITY_3           (0x3 << 24)
-#define LOCALMEM_ARBITRATION_VGA_PRIORITY_4           (0x4 << 24)
-#define LOCALMEM_ARBITRATION_VGA_PRIORITY_5           (0x5 << 24)
-#define LOCALMEM_ARBITRATION_VGA_PRIORITY_6           (0x6 << 24)
-#define LOCALMEM_ARBITRATION_VGA_PRIORITY_7           (0x7 << 24)
-#define LOCALMEM_ARBITRATION_DMA_MASK                 (0x7 << 20)
-#define LOCALMEM_ARBITRATION_DMA_OFF                  (0x0 << 20)
-#define LOCALMEM_ARBITRATION_DMA_PRIORITY_1           (0x1 << 20)
-#define LOCALMEM_ARBITRATION_DMA_PRIORITY_2           (0x2 << 20)
-#define LOCALMEM_ARBITRATION_DMA_PRIORITY_3           (0x3 << 20)
-#define LOCALMEM_ARBITRATION_DMA_PRIORITY_4           (0x4 << 20)
-#define LOCALMEM_ARBITRATION_DMA_PRIORITY_5           (0x5 << 20)
-#define LOCALMEM_ARBITRATION_DMA_PRIORITY_6           (0x6 << 20)
-#define LOCALMEM_ARBITRATION_DMA_PRIORITY_7           (0x7 << 20)
-#define LOCALMEM_ARBITRATION_ZVPORT1_MASK             (0x7 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT1_OFF              (0x0 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT1_PRIORITY_1       (0x1 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT1_PRIORITY_2       (0x2 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT1_PRIORITY_3       (0x3 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT1_PRIORITY_4       (0x4 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT1_PRIORITY_5       (0x5 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT1_PRIORITY_6       (0x6 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT1_PRIORITY_7       (0x7 << 16)
-#define LOCALMEM_ARBITRATION_ZVPORT0_MASK             (0x7 << 12)
-#define LOCALMEM_ARBITRATION_ZVPORT0_OFF              (0x0 << 12)
-#define LOCALMEM_ARBITRATION_ZVPORT0_PRIORITY_1       (0x1 << 12)
-#define LOCALMEM_ARBITRATION_ZVPORT0_PRIORITY_2       (0x2 << 12)
-#define LOCALMEM_ARBITRATION_ZVPORT0_PRIORITY_3       (0x3 << 12)
-#define LOCALMEM_ARBITRATION_ZVPORT0_PRIORITY_4       (0x4 << 12)
-#define LOCALMEM_ARBITRATION_ZVPORT0_PRIORITY_5       (0x5 << 12)
-#define LOCALMEM_ARBITRATION_ZVPORT0_PRIORITY_6       (0x6 << 12)
-#define LOCALMEM_ARBITRATION_ZVPORT0_PRIORITY_7       (0x7 << 12)
-#define LOCALMEM_ARBITRATION_VIDEO_MASK               (0x7 << 8)
-#define LOCALMEM_ARBITRATION_VIDEO_OFF                (0x0 << 8)
-#define LOCALMEM_ARBITRATION_VIDEO_PRIORITY_1         (0x1 << 8)
-#define LOCALMEM_ARBITRATION_VIDEO_PRIORITY_2         (0x2 << 8)
-#define LOCALMEM_ARBITRATION_VIDEO_PRIORITY_3         (0x3 << 8)
-#define LOCALMEM_ARBITRATION_VIDEO_PRIORITY_4         (0x4 << 8)
-#define LOCALMEM_ARBITRATION_VIDEO_PRIORITY_5         (0x5 << 8)
-#define LOCALMEM_ARBITRATION_VIDEO_PRIORITY_6         (0x6 << 8)
-#define LOCALMEM_ARBITRATION_VIDEO_PRIORITY_7         (0x7 << 8)
-#define LOCALMEM_ARBITRATION_PANEL_MASK               (0x7 << 4)
-#define LOCALMEM_ARBITRATION_PANEL_OFF                (0x0 << 4)
-#define LOCALMEM_ARBITRATION_PANEL_PRIORITY_1         (0x1 << 4)
-#define LOCALMEM_ARBITRATION_PANEL_PRIORITY_2         (0x2 << 4)
-#define LOCALMEM_ARBITRATION_PANEL_PRIORITY_3         (0x3 << 4)
-#define LOCALMEM_ARBITRATION_PANEL_PRIORITY_4         (0x4 << 4)
-#define LOCALMEM_ARBITRATION_PANEL_PRIORITY_5         (0x5 << 4)
-#define LOCALMEM_ARBITRATION_PANEL_PRIORITY_6         (0x6 << 4)
-#define LOCALMEM_ARBITRATION_PANEL_PRIORITY_7         (0x7 << 4)
-#define LOCALMEM_ARBITRATION_CRT_MASK                 0x7
-#define LOCALMEM_ARBITRATION_CRT_OFF                  0x0
-#define LOCALMEM_ARBITRATION_CRT_PRIORITY_1           0x1
-#define LOCALMEM_ARBITRATION_CRT_PRIORITY_2           0x2
-#define LOCALMEM_ARBITRATION_CRT_PRIORITY_3           0x3
-#define LOCALMEM_ARBITRATION_CRT_PRIORITY_4           0x4
-#define LOCALMEM_ARBITRATION_CRT_PRIORITY_5           0x5
-#define LOCALMEM_ARBITRATION_CRT_PRIORITY_6           0x6
-#define LOCALMEM_ARBITRATION_CRT_PRIORITY_7           0x7
-
-#define PCIMEM_ARBITRATION                            0x000010
-#define PCIMEM_ARBITRATION_ROTATE                     BIT(28)
-#define PCIMEM_ARBITRATION_VGA_MASK                   (0x7 << 24)
-#define PCIMEM_ARBITRATION_VGA_OFF                    (0x0 << 24)
-#define PCIMEM_ARBITRATION_VGA_PRIORITY_1             (0x1 << 24)
-#define PCIMEM_ARBITRATION_VGA_PRIORITY_2             (0x2 << 24)
-#define PCIMEM_ARBITRATION_VGA_PRIORITY_3             (0x3 << 24)
-#define PCIMEM_ARBITRATION_VGA_PRIORITY_4             (0x4 << 24)
-#define PCIMEM_ARBITRATION_VGA_PRIORITY_5             (0x5 << 24)
-#define PCIMEM_ARBITRATION_VGA_PRIORITY_6             (0x6 << 24)
-#define PCIMEM_ARBITRATION_VGA_PRIORITY_7             (0x7 << 24)
-#define PCIMEM_ARBITRATION_DMA_MASK                   (0x7 << 20)
-#define PCIMEM_ARBITRATION_DMA_OFF                    (0x0 << 20)
-#define PCIMEM_ARBITRATION_DMA_PRIORITY_1             (0x1 << 20)
-#define PCIMEM_ARBITRATION_DMA_PRIORITY_2             (0x2 << 20)
-#define PCIMEM_ARBITRATION_DMA_PRIORITY_3             (0x3 << 20)
-#define PCIMEM_ARBITRATION_DMA_PRIORITY_4             (0x4 << 20)
-#define PCIMEM_ARBITRATION_DMA_PRIORITY_5             (0x5 << 20)
-#define PCIMEM_ARBITRATION_DMA_PRIORITY_6             (0x6 << 20)
-#define PCIMEM_ARBITRATION_DMA_PRIORITY_7             (0x7 << 20)
-#define PCIMEM_ARBITRATION_ZVPORT1_MASK               (0x7 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT1_OFF                (0x0 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT1_PRIORITY_1         (0x1 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT1_PRIORITY_2         (0x2 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT1_PRIORITY_3         (0x3 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT1_PRIORITY_4         (0x4 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT1_PRIORITY_5         (0x5 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT1_PRIORITY_6         (0x6 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT1_PRIORITY_7         (0x7 << 16)
-#define PCIMEM_ARBITRATION_ZVPORT0_MASK               (0x7 << 12)
-#define PCIMEM_ARBITRATION_ZVPORT0_OFF                (0x0 << 12)
-#define PCIMEM_ARBITRATION_ZVPORT0_PRIORITY_1         (0x1 << 12)
-#define PCIMEM_ARBITRATION_ZVPORT0_PRIORITY_2         (0x2 << 12)
-#define PCIMEM_ARBITRATION_ZVPORT0_PRIORITY_3         (0x3 << 12)
-#define PCIMEM_ARBITRATION_ZVPORT0_PRIORITY_4         (0x4 << 12)
-#define PCIMEM_ARBITRATION_ZVPORT0_PRIORITY_5         (0x5 << 12)
-#define PCIMEM_ARBITRATION_ZVPORT0_PRIORITY_6         (0x6 << 12)
-#define PCIMEM_ARBITRATION_ZVPORT0_PRIORITY_7         (0x7 << 12)
-#define PCIMEM_ARBITRATION_VIDEO_MASK                 (0x7 << 8)
-#define PCIMEM_ARBITRATION_VIDEO_OFF                  (0x0 << 8)
-#define PCIMEM_ARBITRATION_VIDEO_PRIORITY_1           (0x1 << 8)
-#define PCIMEM_ARBITRATION_VIDEO_PRIORITY_2           (0x2 << 8)
-#define PCIMEM_ARBITRATION_VIDEO_PRIORITY_3           (0x3 << 8)
-#define PCIMEM_ARBITRATION_VIDEO_PRIORITY_4           (0x4 << 8)
-#define PCIMEM_ARBITRATION_VIDEO_PRIORITY_5           (0x5 << 8)
-#define PCIMEM_ARBITRATION_VIDEO_PRIORITY_6           (0x6 << 8)
-#define PCIMEM_ARBITRATION_VIDEO_PRIORITY_7           (0x7 << 8)
-#define PCIMEM_ARBITRATION_PANEL_MASK                 (0x7 << 4)
-#define PCIMEM_ARBITRATION_PANEL_OFF                  (0x0 << 4)
-#define PCIMEM_ARBITRATION_PANEL_PRIORITY_1           (0x1 << 4)
-#define PCIMEM_ARBITRATION_PANEL_PRIORITY_2           (0x2 << 4)
-#define PCIMEM_ARBITRATION_PANEL_PRIORITY_3           (0x3 << 4)
-#define PCIMEM_ARBITRATION_PANEL_PRIORITY_4           (0x4 << 4)
-#define PCIMEM_ARBITRATION_PANEL_PRIORITY_5           (0x5 << 4)
-#define PCIMEM_ARBITRATION_PANEL_PRIORITY_6           (0x6 << 4)
-#define PCIMEM_ARBITRATION_PANEL_PRIORITY_7           (0x7 << 4)
-#define PCIMEM_ARBITRATION_CRT_MASK                   0x7
-#define PCIMEM_ARBITRATION_CRT_OFF                    0x0
-#define PCIMEM_ARBITRATION_CRT_PRIORITY_1             0x1
-#define PCIMEM_ARBITRATION_CRT_PRIORITY_2             0x2
-#define PCIMEM_ARBITRATION_CRT_PRIORITY_3             0x3
-#define PCIMEM_ARBITRATION_CRT_PRIORITY_4             0x4
-#define PCIMEM_ARBITRATION_CRT_PRIORITY_5             0x5
-#define PCIMEM_ARBITRATION_CRT_PRIORITY_6             0x6
-#define PCIMEM_ARBITRATION_CRT_PRIORITY_7             0x7
-
 #define RAW_INT                                       0x000020
 #define RAW_INT_ZVPORT1_VSYNC                         BIT(4)
 #define RAW_INT_ZVPORT0_VSYNC                         BIT(3)
-- 
2.53.0

