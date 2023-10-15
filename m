Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2C185E;
	Sun, 15 Oct 2023 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etv3qrYW"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59b5484fbe6so44375477b3.1;
        Sun, 15 Oct 2023 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697368627; x=1697973427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DO6KnUO6Wq3OltHCFgApO607UOe9P9M+L1ytJhSq08E=;
        b=Etv3qrYWd6ufU3yMLFZPiPDOCy7BTqwa8EmHsjd6rLfSdGNXJizXdsUXYUBJ2rMw/a
         AdfZXRKUecpqdj5TEgN+pwJKAWx6Q6Rmu+Wr3hVQ3AwA13rnWT/T1HBAo5BnO+N6KABn
         UYBVP38HVcXlDR6Swil17JiXVv+mnwJPOoDvIzFe6EAIiqcPc8eV9PglhFEsJ8n7KQ5O
         oqcEKIHRXHwJAyQRy4UOtED6ysx5NDJJho2Eru0Mt6wJ24M85RzARrZVrd45ZwxyccPA
         h6hC/s1KHA7Kljk4fO/3wWPf0xE5w3gUDWy9FWrsFt9J/8NhEbkULJvlfBdJ7EZBkcn2
         FzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697368627; x=1697973427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO6KnUO6Wq3OltHCFgApO607UOe9P9M+L1ytJhSq08E=;
        b=TfUWJod8uHL7ipzmQCgPLbfR04jlca1wZu7Wcc8sbLfNUZqm6gKui4/8iv7fBvXY5c
         OpHXpZx0fu8CMerpN6SYOFyF/iIK1nezwiy/T5yhsnTufqzHXfqtDZk/nqn7YeFUkCWo
         IYaEuUFD0gGcCWyAh9+qX5RkrHB7thXL2ITeyFT7/ip6TkwbBerAP2ubY2dpG5YFjipr
         vF9y+87uWMmJ0vvkNPGPA4yksTGe7yptzbhQgaaHIJDQSyUQ3VJ/67d5aOzmZJCKrHb6
         /tObVyYxzKVeBJwE7GTGj5J3euqxxPuy3t77Z1lhAatxflqAgi5Wjr6EH8/PCvnI73JF
         5idw==
X-Gm-Message-State: AOJu0Yy8Efk6HzoJNys+HEiqYUAqU3UxkEH/N2OIgl6L11AhDX5yJlUa
	kDJfDsWYmps8w1Ek43VToe0=
X-Google-Smtp-Source: AGHT+IH0B8YHosoBm8Xz2MXZnwtWpdPuBdtqddsjOIrdfiC6lM/3CG/dVtxA3ypzEL4bqYeunPnytg==
X-Received: by 2002:a05:690c:ec5:b0:5a7:f002:4fe4 with SMTP id cs5-20020a05690c0ec500b005a7f0024fe4mr16228024ywb.23.1697368627653;
        Sun, 15 Oct 2023 04:17:07 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id i132-20020a81548a000000b005a7d9fca87dsm1294142ywb.107.2023.10.15.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:17:06 -0700 (PDT)
Date: Sun, 15 Oct 2023 12:17:00 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: rtl8192u: Align descendant arguments
Message-ID: <0d2b5585a914d50305d0d2bade3f8d615615f26b.1697367161.git.gilbertadikankwu@gmail.com>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/rtl8192u/r8190_rtl8256.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8190_rtl8256.c b/drivers/staging/rtl8192u/r8190_rtl8256.c
index 54747fda552f..a81e88894e01 100644
--- a/drivers/staging/rtl8192u/r8190_rtl8256.c
+++ b/drivers/staging/rtl8192u/r8190_rtl8256.c
@@ -46,17 +46,17 @@ void phy_set_rf8256_bandwidth(struct net_device *dev, enum ht_channel_width Band
 				    priv->card_8192_version == VERSION_819XU_B) {
 					/* 8256 D-cut, E-cut, xiong: consider it later! */
 					rtl8192_phy_SetRFReg(dev,
-						(enum rf90_radio_path_e)eRFPath,
-						0x0b, bMask12Bits, 0x100); /* phy para:1ba */
+							     (enum rf90_radio_path_e)eRFPath,
+							     0x0b, bMask12Bits, 0x100); /* phy para:1ba */
 					rtl8192_phy_SetRFReg(dev,
-						(enum rf90_radio_path_e)eRFPath,
-						0x2c, bMask12Bits, 0x3d7);
+							     (enum rf90_radio_path_e)eRFPath,
+							     0x2c, bMask12Bits, 0x3d7);
 					rtl8192_phy_SetRFReg(dev,
-						(enum rf90_radio_path_e)eRFPath,
-						0x0e, bMask12Bits, 0x021);
+							     (enum rf90_radio_path_e)eRFPath,
+							     0x0e, bMask12Bits, 0x021);
 					rtl8192_phy_SetRFReg(dev,
-						(enum rf90_radio_path_e)eRFPath,
-						0x14, bMask12Bits, 0x5ab);
+							     (enum rf90_radio_path_e)eRFPath,
+							     0x14, bMask12Bits, 0x5ab);
 				} else {
 					RT_TRACE(COMP_ERR, "%s(): unknown hardware version\n", __func__);
 					}
-- 
2.34.1

