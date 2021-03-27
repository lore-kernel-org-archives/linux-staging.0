Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FBC70
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j9so6653087wrx.12
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WT7bGwSghAjHu48FM8xKdMZBcfSGTZoPSSqssnK7fBk=;
        b=sXFlBcGZRQxYQA1xjCwLstPexDL8Uajz/3PxyyhoK09RkN2FHKkhqFoQC/5Qq8UGep
         HK6WrUKmD5hehZjwn9DESPP/3Xxl9E3qInOaI4YUnXg3HGPhGvwHT5+4ZSXBXl6fwe74
         khkLfp3G7Px3iGH1xkq1usMnNlp+Xx8769/lXTfasGTEjK+BNnzj4c2LJXH8LgPuf91c
         QCZosmF/vNpwObXNmegGFCnAB0CCDpOwv73My1jsQ5V4UXGl5sHWCQ0ljdR5zqz1CHaL
         dwlWG8xe0ll00h+AWZ9HO/zyGRTgoz9hoZhp7ibbdnbg4lTI7Uiw6VcIN0BkogiAMuox
         h8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WT7bGwSghAjHu48FM8xKdMZBcfSGTZoPSSqssnK7fBk=;
        b=sMqDG90XyNjDQf32QnLz+KVrfe02b4RgjAFMJBAnnNu1CUFulkwAQIAZ6A6+slNMOd
         +L3XyHD8Rt6oPhxZLpxk0ofXoeIwRRZksy6KxiNBuVdxjvfZPduyWN4jUZR4cMDKX4KS
         IecaBUXrxrKB9NoTdxtvgkmWgYAlgpzi5FNTcqfCUXC2g5TnCXLyKT/JvgTXJuowx4DP
         sQ9bqe0iZ6iQK6EUT+VoQ1T1pf2b5NyRL7hHhXksKNYMSNzcSDVps7VMjRTptFa625iG
         DwmsyYTHnd93Lf08S57r0zkRBRJvUecRw2IR19x+Hj0EJ8W4jJ7G0ZH4948mAukwdNdQ
         bJ/w==
X-Gm-Message-State: AOAM53249PBeZT0Yjfqf5HA+lWph7FQlR5Ks40gw5fAyCWansHfVUwSU
	E9P1hKr/Necr4E9+kGT+gfgt9AIPZ0UofQ==
X-Google-Smtp-Source: ABdhPJzvpg4I+QUPi0fZP8l2kAhg+G1eI+xRRf2zOEacl4G9yq7TvXMTWkdcOk2XI9l173JPR8Psrw==
X-Received: by 2002:a5d:6106:: with SMTP id v6mr8209410wrt.268.1616855087878;
        Sat, 27 Mar 2021 07:24:47 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id y8sm16448208wmi.46.2021.03.27.07.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 04/20] staging: rtl8723bs: remove unused macros in include/hal_com_reg.h
Date: Sat, 27 Mar 2021 15:24:03 +0100
Message-Id: <4a5f1016f46ded3fe9b96a85aff3a5a320e29ab9.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove declarations of unused macros in include/hal_com_reg.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com_reg.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index b555826760d0..2cd18eb57244 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -707,14 +707,6 @@ Default: 00b.
 
 
 /*  ALL CCK Rate */
-#define	RATE_ALL_CCK				RATR_1M | RATR_2M | RATR_55M | RATR_11M
-#define	RATE_ALL_OFDM_AG			RATR_6M | RATR_9M | RATR_12M | RATR_18M | RATR_24M |\
-						RATR_36M | RATR_48M | RATR_54M
-#define	RATE_ALL_OFDM_1SS			RATR_MCS0 | RATR_MCS1 | RATR_MCS2 | RATR_MCS3 |\
-						RATR_MCS4 | RATR_MCS5 | RATR_MCS6 | RATR_MCS7
-#define	RATE_ALL_OFDM_2SS			RATR_MCS8 | RATR_MCS9 | RATR_MCS10 | RATR_MCS11 |\
-						RATR_MCS12 | RATR_MCS13 | RATR_MCS14 | RATR_MCS15
-
 #define RATE_BITMAP_ALL			0xFFFFF
 
 /*  Only use CCK 1M rate for ACK */
-- 
2.20.1

