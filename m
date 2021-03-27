Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A3470
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z2so8379228wrl.5
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//9hLhfyOWBWZCb8GsLQLBDmUYE2F7RU23TdKixYDIs=;
        b=jcG/0LsekPPFmtrj9C0P4JXamKqEAQTh9UHvBNNmpa50s+Lr/sKvjy4fnVtoA4mWhc
         NIEhOK8l0piQMXiouAG1CYLsN8QD7c5gwZwaZKnu6XvvzXuKsDYoepCQ0G9MBqL7TIpm
         Ki5zKERHB1puRu+exz2ZABNv7HBhIhUxuFFq46j5yfSDHxeTNV7maH9qBKEoNATHzL6C
         +zdhGWe0DbRsRrJoS7K/1TuntL6TEykrSF55Qwa7dRbJYQiqVQ3XVFV8wDyzPxHp4Uq5
         Hufd53bUOANCZZ7gERyWlcPqUxxYz3w2Mf8vaFg49xN/NGnR8TNRgMS6WneUJWMoWd5y
         vEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//9hLhfyOWBWZCb8GsLQLBDmUYE2F7RU23TdKixYDIs=;
        b=lokPSZdZhxJzmrx7aPDVt1NGwD9YdpPYAvLD62oI2fh48a7DmwEjBGSUjJ2cjNlgZ7
         9aiiSON6/QXkzpAtca1niR+bGhr1m66q9w9ITOBALAS9ONhgaS/paHe4131nNNIk8dIz
         Ug3Pty94qr2rlmBxOJJr8ZvDOZ/SokyfNvzU+H7TPUte/N/vG9U61LMGOXIL+AFc5vcr
         p4cuRhkv/RrK+RdSQc5DKwa0lyNNtQr9axCCIr5ePsL5Roo8zhsmOEPF9xahP2oGbAjL
         NvyHzJG6ZFvxysDny7VJlm8Zm04i9Iq6RdpmSpQRHnyy5QYabL2Q8WBcoVcQX2FX9MTD
         mV3g==
X-Gm-Message-State: AOAM533g9DwRF7rljiIDDf1OeNkOOoChpRuiG1ONrlVQDejFy1Ufqahu
	N7/i5yfHuKQ5Jmphqwuk2bTr64a+6fs4yg==
X-Google-Smtp-Source: ABdhPJxcsDBGoQU+53G2YZTvgEVGVGwsKXx30cbMRRbcThogKjNvDm/QGZD06xfJup19xtaNXKgtcQ==
X-Received: by 2002:a05:6000:1149:: with SMTP id d9mr19553487wrx.347.1616855091938;
        Sat, 27 Mar 2021 07:24:51 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id f2sm17541572wmp.20.2021.03.27.07.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 06/20] staging: rtl8723bs: put parentheses on macros with complex values in include/hal_data.h
Date: Sat, 27 Mar 2021 15:24:05 +0100
Message-Id: <22c4bc695d3600fcaec18949c7521fa38aa4f4a0.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros with complex values should be enclosed in parentheses
49: FILE: drivers/staging/rtl8723bs/include/hal_data.h:49:
+#define CHANNEL_MAX_NUMBER
               14+24+21        /*  14 is the max channel number */

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 93ee20e8e860..655528ab8c7c 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -46,7 +46,7 @@ enum rt_ampdu_burst {
 	RT_AMPDU_BURST_8723B	= 7,
 };
 
-#define CHANNEL_MAX_NUMBER		14+24+21	/*  14 is the max channel number */
+#define CHANNEL_MAX_NUMBER		(14+24+21)	/*  14 is the max channel number */
 #define CHANNEL_MAX_NUMBER_2G		14
 #define CHANNEL_MAX_NUMBER_5G		54			/*  Please refer to "phy_GetChnlGroup8812A" and "Hal_ReadTxPowerInfo8812A" */
 #define CHANNEL_MAX_NUMBER_5G_80M	7
-- 
2.20.1

