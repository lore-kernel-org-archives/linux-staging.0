Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36023FC4
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:04:37 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso14523412wmc.5
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eF8hUMXIhBsRJkAF7DIG+jKUHZ6c4iXSE2pyRmvKCds=;
        b=Sno+t9x0km+5GnMk09xljLYqotrtbyi02yPWrwYJW1ACMP+OFOhgASWYBYccSnua4M
         TtDE/c7i4AoSqeA9sbBpfdgfc81j9jFVOpouJW20AJVVFKrf3T2WKwWIcczyzptuZCJg
         SuXQh/7BMsBs/RYuQyBMRA1lM3hEyuUP91dvXF4yE86nEHoWy7N9U2MlNOljXPPQSpUP
         3JaHTozt/NTHckjsZhbL9zSpondsxCb6NAardONi1eTcFQ6SJ8vQdlA+sLigIGoH/pcr
         9I5Pvq7s8viAtEf/P9Aaybyln8CFmrWwNbefrdKQ+LOVimLYTx56HF3uyFsxJCt9KPb6
         0w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eF8hUMXIhBsRJkAF7DIG+jKUHZ6c4iXSE2pyRmvKCds=;
        b=bO+/UyaXcAvpKTaslC9S/vnLmQa7Zb5nuJI63809pTe4Yjigbw2p5cJzxh8+cMKZw/
         zUnHGm18SMdt4o0PpXGm2XR/A4RS1zGg8lDPQ8rh1cf2ETJnMRa/ny8hGdKfxpa6luG8
         sW1Hs4YBBnMbYDU6soUk9A9xIeovMaBQf/B2TWWmlDbBJG98FHAT6GOLDQbJLfIxRspP
         Jxma9BKunSG29JuA2sse/VhWDxN5N6adQM7ejXxrLrCRoXss6/OYH1OumZiXbpnpiNJU
         j1rgTrEQheviYYjoMH8q0ez4oyfHMYwa6FrNKyTqK8p6dZVRRzA98W2hwPcSxdGZ6vQN
         4Dyw==
X-Gm-Message-State: AOAM531pFCmAMuu3d5Pu03tMKsEsrDpVEcAhfQGKS/uzbnkEfAJjEojw
	+tHIo7Sfv+6sCea0nocX4Ao=
X-Google-Smtp-Source: ABdhPJzZu6RhmkMtvK8wKDGNtB2P3mLZr0p4K4TFyCE4fx+Vb4EXBT85lbQ3+smslifs/SjFwMbWbw==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr21514057wmj.44.1630325076435;
        Mon, 30 Aug 2021 05:04:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f18sm13184195wmc.6.2021.08.30.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:04:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/8] staging: r8188eu: use ETH_ALEN
Date: Mon, 30 Aug 2021 14:04:15 +0200
Message-Id: <20210830120420.5287-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830120420.5287-1-straube.linux@gmail.com>
References: <20210830120420.5287-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ETH_ALEN instead of hard-coding the value for the mac_addr buffer
in struct eeprom_priv.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_eeprom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index fb591a764dac..d0c812cf5cc2 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -99,7 +99,7 @@ struct eeprom_priv {
 	u8		bautoload_fail_flag;
 	u8		bloadfile_fail_flag;
 	u8		bloadmac_fail_flag;
-	u8		mac_addr[6] __aligned(2); /* PermanentAddress */
+	u8		mac_addr[ETH_ALEN] __aligned(2); /* PermanentAddress */
 	u16		channel_plan;
 	u8		EepromOrEfuse;
 	u8		efuse_eeprom_data[HWSET_MAX_SIZE_512] __aligned(4);
-- 
2.33.0

