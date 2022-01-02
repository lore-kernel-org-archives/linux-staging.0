Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5382CA1
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:12:01 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id l4so19997999wmq.3
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EUDmwLB5yfmQWSSlq3AiM8nBbJjWg7Qwk3bKLu8jt3k=;
        b=Esxg6cQdaodcxTky+8Nh9rJjStVomTlq9ZvvbyQzEoKlYGot0j40UehhHkVOYopffJ
         cUKtZh9TAf4OfecffriQOLc5PksEU11oUBT1/MMAvfDEgmPmmGIw7ATuFV9gze5t1QS4
         N69lpf8H6+RieapuKogeZ29cMsk56jTPWO6b/nIqCzNq3gMBs6K2GxNvXVvNtL8OXUpU
         oluL2FQm5FKIAN8V/Ke7/8jK3IukFF1Nwj2FjHuwRTS2tV6tPJWva+0hIjGWDa7YZ2hr
         rUr2+QSgfp2NoWDF5IyDSUOtD5APCVHRkjyj6H3Vw63IolNcuxa5hb6dAmadNm3prbFn
         eLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EUDmwLB5yfmQWSSlq3AiM8nBbJjWg7Qwk3bKLu8jt3k=;
        b=n8oDoqTvtWVRzIzJSrrZ8kc8dGDlOgR1uCCXP0BK2smeQ6MqVwFJ2tt4jCR+X/q6KL
         T9nViZ6Lcb4QWu/vtdhBPgHt9135SyubZbI4Q/pJOp3MsKbmNnurBnTKzqmGEoEXBYCL
         ncbO9YMW81wnq4LBBQYXL6MstLvou8vm04gHZG0pj4e5UazEF56lwsXNROS8o6pp2bHd
         Ci6B6XevXQK0bVub4zdYhQZaYQ0lytARAYg7jTFM6wqLqqH8gezvFuryuNg+ushc9Dh3
         4KvvwZJ8nbO6ErWW/gYfDFGaZDcnX91ulR7AuTv7uthT5IhezHuJ20dBcXkd35c3A5qG
         8H/g==
X-Gm-Message-State: AOAM532kqSC7MLbTnhn2EdY9jNwiNDPBdQPJP9yr4iyUQ7WeoD+dgGYQ
	0yhcMB3F6f/nYJ5liIEbxjY=
X-Google-Smtp-Source: ABdhPJy5JSVb+QPzwJ3GproL+IzsO2wngO2+0p6goHTf6j9NRgimdF9shxEZ53eZWCoq9J/LD0UNAg==
X-Received: by 2002:a05:600c:4f13:: with SMTP id l19mr35936082wmq.152.1641129119455;
        Sun, 02 Jan 2022 05:11:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:11:59 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/11] staging: r8188eu: enum hw90_block is not used
Date: Sun,  2 Jan 2022 14:11:38 +0100
Message-Id: <20220102131141.12310-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220102131141.12310-1-straube.linux@gmail.com>
References: <20220102131141.12310-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enumeration hw90_block is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index addc6a5354a6..fe6111fe278e 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -17,14 +17,6 @@
 
 /*------------------------------Define structure----------------------------*/
 
-enum hw90_block {
-	HW90_BLOCK_MAC = 0,
-	HW90_BLOCK_PHY0 = 1,
-	HW90_BLOCK_PHY1 = 2,
-	HW90_BLOCK_RF = 3,
-	HW90_BLOCK_MAXIMUM = 4, /*  Never use this */
-};
-
 enum rf_radio_path {
 	RF_PATH_A = 0,			/* Radio Path A */
 	RF_PATH_B = 1,			/* Radio Path B */
-- 
2.34.1

