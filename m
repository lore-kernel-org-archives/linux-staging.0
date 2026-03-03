Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297CD350D46
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580364; cv=none; b=Zx+oaIwKPqn66N85q/B/VkAGOs4u5Ztqg17ABZRD/JZxHwvJXIo3A4F0QBrcwrougKG2fyxbbWe1HNvocjoaudYMfvpAy8ZjodSzIPxYCoP8b2cTRhX0B4OcyJE00iyK99MG/zHA8Cn7VNzauLJ1MMrnR0YK/qcWg7a7XZYu/Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580364; c=relaxed/simple;
	bh=qV/0UT47G1yQzfkFgXEY+RNjtPkyqT1MQNXqMOS8wTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAt7hfGqhmrA6/aMzoycCWAYhHSebeAh2cgI0FQRhsu9lTS+RhU0PWmZf3ArjteWAFtq1ISbQtJ2lHjhoviXWQmXYdaxosghHdNxXfGWQU68OZfdIAnuIRKnRqhVtI2JMaiemkVZAcnY9uyw2gMBF3XT4N6RVza9A5s/+EV3+xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si7Jlrje; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si7Jlrje"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4377174e1ebso4627200f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 15:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580362; x=1773185162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZM92izGRmi9MJGoaWiyABzFcYIy1pivLl2UdegXzXw=;
        b=Si7JlrjecWYHF71uKtmlLjoCDJZH1x7BX2VtYdGVaEYe8H6Ba/S731vE3KsA51hG/6
         l+qwAv/8ew9+w4zksieb3UHem9lB6jEz0Jp8Lv/2lw9QV1wy+lEyflg0OXTCp7/pO1tA
         GdazEWWtYFeLt5x3xjwiS7ypmtMKpGwrOhe0A/v390XxBx3ZEpnvFfU1kMt6H6ib2p/G
         dIRGWeRyYG27cSFs3uMe+Nm8xxdV5BkVYetUj9WlAsHWe/hRiML5yG4Kk7g//pQORf89
         wzjv2o2sYs8F26HgFplBVFcQJT4af6tnqCudV0FissO+tLlEHSrcPQ07sWoIhkocQ+cE
         5UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580362; x=1773185162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZM92izGRmi9MJGoaWiyABzFcYIy1pivLl2UdegXzXw=;
        b=as1vYQvLKX2ZTYJhoBcP9JJW7C5kFXmWuUP/qYvAyZqWF5242m0OhaZNlERXoCYjSj
         hDrbMMzktcZJ5d/3pv6IJqzVQ7HM0TYLEqPiSWI5MifJe/P21krK9L5ZhadhtA1H6/qL
         /4RWgBYyqR8VHCbABznlpvutRH7ehvaAmD4UzPaTRq0UHtxViTfe7S7GnMaVIHF/24CX
         o7B4TEZQ3yy4Dh4F7mtUM5OOs3sqcQ2sLiRYo5Hytq/lx3Il3va6p4AfXHoCtEGXHOsj
         Lv8HPiI6s7Qq/qDyOqCt1NtNzNaOpgxGUyZ7X9Y8MKqYwUY/6pZZnFSF65f4Y5nScctV
         UbvA==
X-Forwarded-Encrypted: i=1; AJvYcCXbO86oSZrVaA0j84arMQpZd3bNi1UFaleEKK3BPTXUqbxWjwmpfg1TliqYstjTxI0XnJvK44OQG+nIxTd8@lists.linux.dev
X-Gm-Message-State: AOJu0YzRaHdoPoUBQ/p8pbZqiRThHnBRdIkGe8RK7jR8QuDaMr1ch9JO
	xaegxMKl+bdZzGawMoAwRTKSQbL+cQQ7BiAlPqNKiq3+/MR9DDSwHxrh
X-Gm-Gg: ATEYQzy7WBwr0sPY0h5Zbbs4PttiULYQmxZLZ7Y/gIMAThbm3sKIqZ5zKFrFUhjwVPc
	vCIXhFltU5VLhFYsmDqThJFDzYhfOnTr4s4zKDSTbeZj1RsHI0NPWTZ8nlLIX+5u+Jf3iyq3k7A
	NU+5xlPjEL6RyWwdf5HZfhbMCQYMThTt0+9gGu34RNh1/4fn3ER0gdYStk1msRx5CoPfxr7aKvs
	ma0hg7MjOPSkVscnovgWzVhNCrNQi+qFULNFt2o1gpVB0CkycSI+7sts+jIxOZ4Oa7lWVcA7/QH
	WDO1zdKXEfWnvK+rP9jjQfwpdowB2RxXl6AmWAaUK6e/aE4c6xtA8RY5KrDrxvGy3/jfXY0JEOa
	rltlY8b65czqd8R4B1CsnyHhUtBCx/Tq+NpXWebYnUFN+k+6T8sdJEvXR16oaE/VMeOI4InYHqx
	tFVNvPhDPVq9e5tYrkoW0HcgkZ3dQpqkq8G8LVWz0NsSrzfX0nrw==
X-Received: by 2002:a05:600c:a51:b0:483:a21:774c with SMTP id 5b1f17b1804b1-4851988990bmr608345e9.25.1772580361531;
        Tue, 03 Mar 2026 15:26:01 -0800 (PST)
Received: from arch ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335648esm68036615e9.5.2026.03.03.15.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:26:01 -0800 (PST)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH 8/8] staging: sm750fb: remove unused GPIO bit field and interrupt definitions
Date: Wed,  4 Mar 2026 00:24:29 +0100
Message-ID: <20260303232434.1850583-8-gawindlin@gmail.com>
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

The GPIO_DATA_0..31, GPIO_DATA_DIRECTION_0..31 bit field macros, and
the GPIO_INTERRUPT_SETUP and GPIO_INTERRUPT_STATUS register macros
defined in ddk750_reg.h are not referenced anywhere in the driver. The
register addresses GPIO_DATA and GPIO_DATA_DIRECTION are kept as they
are still in use. Remove the rest to reduce dead code as noted in the
TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/sm750fb/ddk750_reg.h | 96 ----------------------------
 1 file changed, 96 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index 328254d3d7cc..d21e4a5e5ac4 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -215,104 +215,8 @@
 #endif
 
 #define GPIO_DATA                                       0x010000
-#define GPIO_DATA_31                                    BIT(31)
-#define GPIO_DATA_30                                    BIT(30)
-#define GPIO_DATA_29                                    BIT(29)
-#define GPIO_DATA_28                                    BIT(28)
-#define GPIO_DATA_27                                    BIT(27)
-#define GPIO_DATA_26                                    BIT(26)
-#define GPIO_DATA_25                                    BIT(25)
-#define GPIO_DATA_24                                    BIT(24)
-#define GPIO_DATA_23                                    BIT(23)
-#define GPIO_DATA_22                                    BIT(22)
-#define GPIO_DATA_21                                    BIT(21)
-#define GPIO_DATA_20                                    BIT(20)
-#define GPIO_DATA_19                                    BIT(19)
-#define GPIO_DATA_18                                    BIT(18)
-#define GPIO_DATA_17                                    BIT(17)
-#define GPIO_DATA_16                                    BIT(16)
-#define GPIO_DATA_15                                    BIT(15)
-#define GPIO_DATA_14                                    BIT(14)
-#define GPIO_DATA_13                                    BIT(13)
-#define GPIO_DATA_12                                    BIT(12)
-#define GPIO_DATA_11                                    BIT(11)
-#define GPIO_DATA_10                                    BIT(10)
-#define GPIO_DATA_9                                     BIT(9)
-#define GPIO_DATA_8                                     BIT(8)
-#define GPIO_DATA_7                                     BIT(7)
-#define GPIO_DATA_6                                     BIT(6)
-#define GPIO_DATA_5                                     BIT(5)
-#define GPIO_DATA_4                                     BIT(4)
-#define GPIO_DATA_3                                     BIT(3)
-#define GPIO_DATA_2                                     BIT(2)
-#define GPIO_DATA_1                                     BIT(1)
-#define GPIO_DATA_0                                     BIT(0)
 
 #define GPIO_DATA_DIRECTION                             0x010004
-#define GPIO_DATA_DIRECTION_31                          BIT(31)
-#define GPIO_DATA_DIRECTION_30                          BIT(30)
-#define GPIO_DATA_DIRECTION_29                          BIT(29)
-#define GPIO_DATA_DIRECTION_28                          BIT(28)
-#define GPIO_DATA_DIRECTION_27                          BIT(27)
-#define GPIO_DATA_DIRECTION_26                          BIT(26)
-#define GPIO_DATA_DIRECTION_25                          BIT(25)
-#define GPIO_DATA_DIRECTION_24                          BIT(24)
-#define GPIO_DATA_DIRECTION_23                          BIT(23)
-#define GPIO_DATA_DIRECTION_22                          BIT(22)
-#define GPIO_DATA_DIRECTION_21                          BIT(21)
-#define GPIO_DATA_DIRECTION_20                          BIT(20)
-#define GPIO_DATA_DIRECTION_19                          BIT(19)
-#define GPIO_DATA_DIRECTION_18                          BIT(18)
-#define GPIO_DATA_DIRECTION_17                          BIT(17)
-#define GPIO_DATA_DIRECTION_16                          BIT(16)
-#define GPIO_DATA_DIRECTION_15                          BIT(15)
-#define GPIO_DATA_DIRECTION_14                          BIT(14)
-#define GPIO_DATA_DIRECTION_13                          BIT(13)
-#define GPIO_DATA_DIRECTION_12                          BIT(12)
-#define GPIO_DATA_DIRECTION_11                          BIT(11)
-#define GPIO_DATA_DIRECTION_10                          BIT(10)
-#define GPIO_DATA_DIRECTION_9                           BIT(9)
-#define GPIO_DATA_DIRECTION_8                           BIT(8)
-#define GPIO_DATA_DIRECTION_7                           BIT(7)
-#define GPIO_DATA_DIRECTION_6                           BIT(6)
-#define GPIO_DATA_DIRECTION_5                           BIT(5)
-#define GPIO_DATA_DIRECTION_4                           BIT(4)
-#define GPIO_DATA_DIRECTION_3                           BIT(3)
-#define GPIO_DATA_DIRECTION_2                           BIT(2)
-#define GPIO_DATA_DIRECTION_1                           BIT(1)
-#define GPIO_DATA_DIRECTION_0                           BIT(0)
-
-#define GPIO_INTERRUPT_SETUP                            0x010008
-#define GPIO_INTERRUPT_SETUP_TRIGGER_31                 BIT(22)
-#define GPIO_INTERRUPT_SETUP_TRIGGER_30                 BIT(21)
-#define GPIO_INTERRUPT_SETUP_TRIGGER_29                 BIT(20)
-#define GPIO_INTERRUPT_SETUP_TRIGGER_28                 BIT(19)
-#define GPIO_INTERRUPT_SETUP_TRIGGER_27                 BIT(18)
-#define GPIO_INTERRUPT_SETUP_TRIGGER_26                 BIT(17)
-#define GPIO_INTERRUPT_SETUP_TRIGGER_25                 BIT(16)
-#define GPIO_INTERRUPT_SETUP_ACTIVE_31                  BIT(14)
-#define GPIO_INTERRUPT_SETUP_ACTIVE_30                  BIT(13)
-#define GPIO_INTERRUPT_SETUP_ACTIVE_29                  BIT(12)
-#define GPIO_INTERRUPT_SETUP_ACTIVE_28                  BIT(11)
-#define GPIO_INTERRUPT_SETUP_ACTIVE_27                  BIT(10)
-#define GPIO_INTERRUPT_SETUP_ACTIVE_26                  BIT(9)
-#define GPIO_INTERRUPT_SETUP_ACTIVE_25                  BIT(8)
-#define GPIO_INTERRUPT_SETUP_ENABLE_31                  BIT(6)
-#define GPIO_INTERRUPT_SETUP_ENABLE_30                  BIT(5)
-#define GPIO_INTERRUPT_SETUP_ENABLE_29                  BIT(4)
-#define GPIO_INTERRUPT_SETUP_ENABLE_28                  BIT(3)
-#define GPIO_INTERRUPT_SETUP_ENABLE_27                  BIT(2)
-#define GPIO_INTERRUPT_SETUP_ENABLE_26                  BIT(1)
-#define GPIO_INTERRUPT_SETUP_ENABLE_25                  BIT(0)
-
-#define GPIO_INTERRUPT_STATUS                           0x01000C
-#define GPIO_INTERRUPT_STATUS_31                        BIT(22)
-#define GPIO_INTERRUPT_STATUS_30                        BIT(21)
-#define GPIO_INTERRUPT_STATUS_29                        BIT(20)
-#define GPIO_INTERRUPT_STATUS_28                        BIT(19)
-#define GPIO_INTERRUPT_STATUS_27                        BIT(18)
-#define GPIO_INTERRUPT_STATUS_26                        BIT(17)
-#define GPIO_INTERRUPT_STATUS_25                        BIT(16)
 
 #define PANEL_DISPLAY_CTRL                            0x080000
 #define PANEL_DISPLAY_CTRL_RESERVED_MASK              0xc0f08000
-- 
2.53.0

