Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5ED3537C2
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 23:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580362; cv=none; b=FTP+wDa8HATisvp3dyLMdrIGR/siAV3gdZT83dUOne/pMBS4cUG9unLP0Kwr5k/yOg6Na2p0XGgyMzy0eBBQNHMS3TZjeQZEdeUQVuchJgFyfLofjLDpBDXDkDKGt6PSctNwiAODbrLA5cwXlDFL2P71ftVBpoYy6MvhfRtxU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580362; c=relaxed/simple;
	bh=A3+faAY7AXDtRwO5G5QmTMd3uq7BnRwjdVOM4uNiuhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILyxNnqC26Mz5yhJct+g7kmiRHWTqqEGvXycoYwp5+VBj8iKyx1HLL5vloipf44w0cP9YRc31mxu7+efV3zO313gkd2taKT5xgSIjd6pT9aeZ+j8w+M4HEan/TpPzVD9f1irJgDMMgYr7U8Vp+00vIe2eV27GO+vyW6OP/XSRmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0r3uB42; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0r3uB42"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4807068eacbso51624585e9.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 15:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580360; x=1773185160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAdMTVC0yzAIQdHQtiqVKDmjjcmet5Re2izhdAxquos=;
        b=i0r3uB42zehiX3y+atNEapXL6K7t9maBsEqVV6Td91GGAB3Bzp2e5gED8h8ySB6Fvs
         tLpLjg9gRn6kDB/TTokpe+W8GKgnyJFet2ZN9u0y20kCHhasL3nrQFoIup6JqZVo1gsP
         jVF5b+/okQnWZ9bFU2yFbRqaaaxlpfHoh14HsgclSpMy93CvaJwvAs/+M1jo60hHTcpb
         v6ilT8E/xBqehLv2ZdgJFSKPQXRGArfO8DS31CHNjid77JveEWuEr/cc1awJQw5B0hlH
         sCJ94DJLn4WRs26w93ulTG0JpTiHsecBUacC7UYcKIA6am3SM+9ELFYnIdj38GDd+q1l
         oLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580360; x=1773185160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SAdMTVC0yzAIQdHQtiqVKDmjjcmet5Re2izhdAxquos=;
        b=QacFgwNO7BrcNTfWo/j66nK/hrej5WxJSJXEyHlfZA1ZMDEhftpVbDM6domXbIqIGt
         5DcM1R2NrC4x/NE5jbH7I21vTXK0n2mFnFggyg6sFWTqpqYqYAe5hXCooCj6VPlKWMcW
         M8FD4IKu8RKupMTs5iIshjPyfl1r+xH9tC9FeVZm33OaoPHzWSxTT+SzWNN8Lk5K7+pp
         V5Q0qpWMI2p3/IFfVJyw1Nto/+4o7cetKqeEwaUyaCFMv4y1JpZjJzodv2sT4yOdO0YS
         TLXiVIp95RWoX3ygwuwDwIH9ATjk0yzK8HM4eEMPkMBz5HlQew/v6FYTAtGVk3fKzGrl
         jxGA==
X-Forwarded-Encrypted: i=1; AJvYcCUIBkhpsf8bDsKhHtfbW8azzEez0rKtYhM47CJ6ajP5JMXadCYMuemzrH5tjgwMXybSjQp8Bpz3xVtdeqSH@lists.linux.dev
X-Gm-Message-State: AOJu0YzifoqU0Z1ML39fuvruEjh4vWc5IYGQ9KsOG477exOYwLVIgK7r
	kFikhEeIkrKjvQFOJ7d/8RIlpoZrReB2mCb4TyTNreYX+zy+7lOGHH8IqwRA/AWNYUQ=
X-Gm-Gg: ATEYQzxDGa18vNEtLNvhx5eqxGtH240A4+siHnsTDUzJbis+mrqgP7TrVhm3zLFFUg8
	r6EJ5F3fG99jF5/SkCKjTJyp/nnZaYyPsypM1lvKL5DuMpsTstHnXjIxwJpYNIPnU2sGxE+tjLT
	diCNgCZXCxlEPCElXGlJWgBChrY92lDw/NR/dzo8+t1rjkPZuIjtR9rVh/CrAwq1zvvBX99JZS/
	BKon+SyxlpjNIEDiegr39D4JkEvygKzV9y8eyZHKsdXl9MYtwT3uPW8lIPEFjhmsT5L0vE2OmLP
	dteX0G+xcSiFEzmzdXaSetkR0py/ywKgBHO+nKCK0IzH7tLKhCKtGhw0X3uCdoTFKw6gQB60ZtD
	Slb8dEe5k1QGeEUbya9RUQnY1JVhhlUOXMwtR/zn3OIGmELx1kKqPV4dLaK8aDaieNMc0mXrC1z
	cwPuB+ukaFCqT9dbwEXNqMJo4ewGZo6EjyFIrsMCxhVJgkh/UFttRVb00Iad3V
X-Received: by 2002:a05:600c:470d:b0:471:700:f281 with SMTP id 5b1f17b1804b1-485198a767emr458515e9.25.1772580359436;
        Tue, 03 Mar 2026 15:25:59 -0800 (PST)
Received: from arch ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335648esm68036615e9.5.2026.03.03.15.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:25:59 -0800 (PST)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH 6/8] staging: sm750fb: remove unused interrupt register definitions
Date: Wed,  4 Mar 2026 00:24:27 +0100
Message-ID: <20260303232434.1850583-6-gawindlin@gmail.com>
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

The RAW_INT, INT_STATUS, and INT_MASK register macros defined in
ddk750_reg.h are not referenced anywhere in the driver. Remove them
to reduce dead code as noted in the TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/sm750fb/ddk750_reg.h | 51 ----------------------------
 1 file changed, 51 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index dd1d67fb9856..8f227d974613 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -77,57 +77,6 @@
 
 #define GPIO_MUX                                      0x000008
 
-#define RAW_INT                                       0x000020
-#define RAW_INT_ZVPORT1_VSYNC                         BIT(4)
-#define RAW_INT_ZVPORT0_VSYNC                         BIT(3)
-#define RAW_INT_CRT_VSYNC                             BIT(2)
-#define RAW_INT_PANEL_VSYNC                           BIT(1)
-#define RAW_INT_VGA_VSYNC                             BIT(0)
-
-#define INT_STATUS                                    0x000024
-#define INT_STATUS_GPIO31                             BIT(31)
-#define INT_STATUS_GPIO30                             BIT(30)
-#define INT_STATUS_GPIO29                             BIT(29)
-#define INT_STATUS_GPIO28                             BIT(28)
-#define INT_STATUS_GPIO27                             BIT(27)
-#define INT_STATUS_GPIO26                             BIT(26)
-#define INT_STATUS_GPIO25                             BIT(25)
-#define INT_STATUS_I2C                                BIT(12)
-#define INT_STATUS_PWM                                BIT(11)
-#define INT_STATUS_DMA1                               BIT(10)
-#define INT_STATUS_DMA0                               BIT(9)
-#define INT_STATUS_PCI                                BIT(8)
-#define INT_STATUS_SSP1                               BIT(7)
-#define INT_STATUS_SSP0                               BIT(6)
-#define INT_STATUS_DE                                 BIT(5)
-#define INT_STATUS_ZVPORT1_VSYNC                      BIT(4)
-#define INT_STATUS_ZVPORT0_VSYNC                      BIT(3)
-#define INT_STATUS_CRT_VSYNC                          BIT(2)
-#define INT_STATUS_PANEL_VSYNC                        BIT(1)
-#define INT_STATUS_VGA_VSYNC                          BIT(0)
-
-#define INT_MASK                                      0x000028
-#define INT_MASK_GPIO31                               BIT(31)
-#define INT_MASK_GPIO30                               BIT(30)
-#define INT_MASK_GPIO29                               BIT(29)
-#define INT_MASK_GPIO28                               BIT(28)
-#define INT_MASK_GPIO27                               BIT(27)
-#define INT_MASK_GPIO26                               BIT(26)
-#define INT_MASK_GPIO25                               BIT(25)
-#define INT_MASK_I2C                                  BIT(12)
-#define INT_MASK_PWM                                  BIT(11)
-#define INT_MASK_DMA1                                 BIT(10)
-#define INT_MASK_DMA                                  BIT(9)
-#define INT_MASK_PCI                                  BIT(8)
-#define INT_MASK_SSP1                                 BIT(7)
-#define INT_MASK_SSP0                                 BIT(6)
-#define INT_MASK_DE                                   BIT(5)
-#define INT_MASK_ZVPORT1_VSYNC                        BIT(4)
-#define INT_MASK_ZVPORT0_VSYNC                        BIT(3)
-#define INT_MASK_CRT_VSYNC                            BIT(2)
-#define INT_MASK_PANEL_VSYNC                          BIT(1)
-#define INT_MASK_VGA_VSYNC                            BIT(0)
-
 #define CURRENT_GATE                                  0x000040
 #define CURRENT_GATE_MCLK_MASK                        (0x3 << 14)
 #ifdef VALIDATION_CHIP
-- 
2.53.0

