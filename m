Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2385D70
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:45 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p8-20020a7bcc880000b02901dbb595a9f1so520083wma.2
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bgKRjBPM8AFL+ak+0aT9uZMXv7Z59szsWp5P9GybssM=;
        b=oLFksRJfvCphjvG9FVIVr30QoP27GRWPSNihX+Jn2K6qoaY9d706OtSksRz6e0zTXD
         Hc6aCeai61SPAetyj5QYi/CLftu1AU568J614iTrf++J/BktRgppRPxWrwOzhl3ukffP
         flgst2+YnybrN7h1ROBUTFKqXUTc0pLwtg7XDLhgRtObIFlO4HT+P/ybW7mmqa4qF01p
         VMMiwppSXj0sbzVfTXOSDGNiSSceSiAU8GsY4WQkmOyKSE3eWvjFkL0IupZQwMj+8MoS
         2pFj0fx6Sg8qzTup3CkyeYfGkOKzs4cU52gziVPHgeswtvubmawAOmrOnmKeWF0dIkri
         gxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bgKRjBPM8AFL+ak+0aT9uZMXv7Z59szsWp5P9GybssM=;
        b=dCs9H6wCqg7xj0luVemfSm6hDQnJFvsTDkQM2mUW9i+92nnxW+39HS8nrXHiLjm3Ub
         XL3LZNfol/7sE3pnoGn0lbf4kfbScFOMRxuBlrrt/YwT1ZqlgoSW6VQPigrFL2A20Gq/
         IlXXnwmrJTobnYgYbHV8xrqR0YORRcM2DCD6xn65mDcUKUmoGWNi7HwXXSv0Gbudlrrw
         vDtTZPSCkgA4lvJYScIv/eh5RuVO/7kffrzHxzJX7KECHhUq7BB203j0er4mG02vwq4B
         xXenR8cyd0XmlbD2CEXZ91aZ7K1ZtSttd56j5PQUORXJUcDp+0h33gPtPczjaw/XDVS4
         nXYQ==
X-Gm-Message-State: AOAM531nOdhaZQ2VOY+NgcPV3Pd6jF1E9NmyG9ZNvn4eWg3aRHr5sjrK
	tM6XGgn6/ZrI5p/vOU2GzHfdjOc4VL1ZNw==
X-Google-Smtp-Source: ABdhPJw791kXxYFuNxxUFMUO/WBvnRvlgF79IQkxNZjoPKkbzRqWfUIaLSWmcOzrVgWFwYLcA1eB8g==
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr15712468wmg.44.1624099663808;
        Sat, 19 Jun 2021 03:47:43 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id l39sm6937459wms.6.2021.06.19.03.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/18] staging: rtl8723bs: remove register initializations tied to 802.11ac standard
Date: Sat, 19 Jun 2021 12:47:18 +0200
Message-Id: <66706b5cb6474c4482c3342c4383fe62eba54967.1624099126.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove register initializations tied to 802.11ac standard which
is not supported by the device.

It's a dangerous operation, relying only on comments, but tested
on a Lenovo Ideapad MIIX 300-10IBY tablet seems to work.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 059d3050acc6..3a03dfb8d275 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1718,24 +1718,12 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	rtw_write8(Adapter, 0x4c7, rtw_read8(Adapter, 0x4c7)|BIT(7)); /* enable single pkt ampdu */
-	rtw_write8(Adapter, REG_RX_PKT_LIMIT_8723B, 0x18);		/* for VHT packet length 11K */
 	rtw_write8(Adapter, REG_MAX_AGGR_NUM_8723B, 0x1F);
 	rtw_write8(Adapter, REG_PIFS_8723B, 0x00);
 	rtw_write8(Adapter, REG_FWHW_TXQ_CTRL_8723B, rtw_read8(Adapter, REG_FWHW_TXQ_CTRL)&(~BIT(7)));
 	if (pHalData->AMPDUBurstMode)
 		rtw_write8(Adapter, REG_AMPDU_BURST_MODE_8723B,  0x5F);
 	rtw_write8(Adapter, REG_AMPDU_MAX_TIME_8723B, 0x70);
-
-	/*  ARFB table 9 for 11ac 5G 2SS */
-	rtw_write32(Adapter, REG_ARFR0_8723B, 0x00000010);
-	if (IS_NORMAL_CHIP(pHalData->VersionID))
-		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0xfffff000);
-	else
-		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0x3e0ff000);
-
-	/*  ARFB table 10 for 11ac 5G 1SS */
-	rtw_write32(Adapter, REG_ARFR1_8723B, 0x00000010);
-	rtw_write32(Adapter, REG_ARFR1_8723B+4, 0x003ff000);
 }
 
 static void ResumeTxBeacon(struct adapter *padapter)
-- 
2.20.1

