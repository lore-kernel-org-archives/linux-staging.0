Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E787185E;
	Sun, 15 Oct 2023 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clRT5awK"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a7cc03dee5so44265237b3.3;
        Sun, 15 Oct 2023 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697369276; x=1697974076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO6KnUO6Wq3OltHCFgApO607UOe9P9M+L1ytJhSq08E=;
        b=clRT5awKYq5KVpUGMH6U+67CotNWEerM/kDPT/2BwRuBxg3dpccWHe84VzsThOcl9J
         Q5pUYrnb1wooLt8robIJdMWWKzdDeA5CWl9jmjDYwTrb5bCVWHactwTnUt7YbVea26Ku
         0aGuE8yGiQOUaZ/kbm3PADBbKLy0JlMuFh2G/AJzjXZL8HDsz1/Vu20IZ8Y6WxLI4I64
         cGZNVszua4k7SdV/j1GeB2Yxqgp84mzeTVRsML0IPA3rk2CnLEcfw0Qtz1FmyJWLui8H
         gFc4xh21dTNwe8ZiyLnHfawi/LhfExroweftZPmFAIhRB6okhTuCa0NuusNzE2Sez8G6
         VyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697369276; x=1697974076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO6KnUO6Wq3OltHCFgApO607UOe9P9M+L1ytJhSq08E=;
        b=CEfflSmbmWixHBclV/0AdcPSWrjFXogm8v/cm9wvvmMp04MWpITYL8iLz71/JS7UQS
         m7Fg1ivWhYIARgjs2K66hgS6JmiLnr93qqpAEjhAhqRQeTpMrGilzyJHFcBYyZJZwsgx
         fiouiXgUd0v6RGgKjyF9Mwy6vmJphrkytce9hWK7zZOJmcEApNO613/M5O19kSJB+8wa
         OtUrbJpV5D1mDwvj0T/uGOXNDcpRCZdzDfKyVybwfFiSEF3I6/c0DlirjjZHAC7Q2Fx9
         lgpOTqbEmNskG8fosItNFVCh2zOmjnuqSrdHcG3JcEHIZ2dbt0zymZ0DjfK6L3zQ6/C7
         WplQ==
X-Gm-Message-State: AOJu0Yx2+WgLQYjnUU08m65pMWSiYv7sRUbRSDFwRg0Aa4cmKZKI3bw3
	WU65zh6+a3zqXeMrX1fGufA=
X-Google-Smtp-Source: AGHT+IEIMdX1ahZf9tXa89MB2N1rmLKvrFYHzhd+Do9bTNptfqAKUMTZd31vaqofKmFdYQcylRFW5Q==
X-Received: by 2002:a81:4326:0:b0:5a7:ab56:e081 with SMTP id q38-20020a814326000000b005a7ab56e081mr17808636ywa.19.1697369276231;
        Sun, 15 Oct 2023 04:27:56 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id w132-20020a0dd48a000000b005928ba6806dsm1318177ywd.97.2023.10.15.04.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:27:55 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 2/6] staging: rtl8192u: Align descendant arguments
Date: Sun, 15 Oct 2023 12:24:48 +0100
Message-ID: <0d2b5585a914d50305d0d2bade3f8d615615f26b.1697367161.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20231015112448.bhe7TZjs_x_SVhsFtJ6qHGwtBIvsCuxTYRIThWRUq_A@z>

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

