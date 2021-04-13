Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004F70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:05:23 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id w3so26511706ejc.4
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xoku/gJZVifospo6o1WZ6Sg1aj10S84grdNkCx2C9U=;
        b=OqO69w81Xg78+Yg0PKNTUy5lhRRTv55K3xIP+2wpLNf6aoNyj65s9aDl+EfNz5FAZj
         lokQ+1koIWlndO5ZgnqKwEuO0sPxthTNiMd0tDwsrRcY29v8PpL59hn9iwqkCYW4eRp4
         GMwpTNqls1vwDO3tjCQ3C25pZQ7lPrwiM+cLl1Y91YX/qLN2sT4HXjzV+WnroSNDHaS/
         FymL1SocfkRLXCWHe7hctEoy890ucotx/E2pan7eEMplNJr+DJL30cVAROuWfTJZqLNg
         a2XwW4eUNcz/F120dcCdkqiBDhHktew8M7ilJyH7W2Nr5pj7hAv/2DMDfkFtnBEswujV
         k8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xoku/gJZVifospo6o1WZ6Sg1aj10S84grdNkCx2C9U=;
        b=O+1FLffz5pWpIvRXeSZ5qxTSaKcXjAWZdAGrpW4czgw7UTG907DOw5rxkP3o0+grBK
         C94Hb7srPVykUvtQQNUDbLhroZz1Le9VImsuhjn/C/iYsbmxwZb0cwf7lhFUiTADW/ja
         Na236TwC6h47zG2+wmBMDAo5FVsfi9ZlOTc61/CdPNXWKRqq4wMQ4TLmbXaa5ryGxCwE
         /CFxvTjnBuyimpwJBRrZl8ACCy70IuxCEZmc9jmswuwSi8iG5t+7WZ8awD3oP4yw6xNI
         2Rt/L0Ml9hbhrq5niCEIew6zvM9SG8UaOp42f/sSvNetEQpSv1iH1m1efciqolnTXUhI
         xo6Q==
X-Gm-Message-State: AOAM531iX8mUU9dcsoPl3TT0Zcx62MPpyO7emHWbTkQBUMQT2hDLLRKZ
	9z/duEAyvTUH7HADnsJQMqU=
X-Google-Smtp-Source: ABdhPJyr1MXST1Y1PDIDxsCuqGEiSF5meOf84ayVkS4Gc4mwVsAkK+Kd5EnSQNKM4K6VjofV4VN/zw==
X-Received: by 2002:a17:907:33cb:: with SMTP id zk11mr16188048ejb.231.1618326322074;
        Tue, 13 Apr 2021 08:05:22 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id t1sm9681085edy.6.2021.04.13.08.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:05:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8723bs: core: Remove unused but set variable
Date: Tue, 13 Apr 2021 17:05:17 +0200
Message-Id: <20210413150517.12533-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed "ledBlink_param" because it was set to the value of "pbuf" but was
never reused. This set was made by direct assignment (no helper had been
called), therefore it had no side effect to the location pointed by "pbuf".

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f19a15a3924b..440e22922106 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -6191,12 +6191,10 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	struct LedBlink_param *ledBlink_param;
 
 	if (!pbuf)
 		return H2C_PARAMETERS_ERROR;
 
-	ledBlink_param = (struct LedBlink_param *)pbuf;
 	return	H2C_SUCCESS;
 }
 
-- 
2.31.1

