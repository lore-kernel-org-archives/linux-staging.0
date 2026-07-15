Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345491624D5
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119826; cv=none; b=JAQF9113Copx7FNbKEq0jnbK7/3rB8ZwJKs2fWh3uFq9fHv/jCPPcpNDa0zWbJW6cQV6Eq7t+57YAe22CZ1xk9YL6ZM8VIopzkjWekxJx2K+9ujTr3kXncQzNQe+RGImKnWNtk82ACN9lMqQgcqBI7bbCn8R23+iRpIri2RWeB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119826; c=relaxed/simple;
	bh=0ieRpVGnJH1hbut5BOon2lxp6nUsK/7oDWxKiwPwvzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOrsKcBDNa6S4T8VZ7w4LW7eyy89xIS7RECiuSVyMSGwaaAjE6M2syf/csS8cXYHOxOsGPl2VcCoxIZ/aLJYRF4u6SDsdAovfwP0yPbKnSzUsS0J4Uh0Yeun7ftu2QelCKUNj2+9RCbgXaW9CaHDBCDeWYi2PLSSmn5UvQrJ7H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdoFSrFY; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdoFSrFY"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b00d083818so560431e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119823; x=1784724623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYkSuTtvbkyclIwWlOakYM6IekniQ0aLPxxWi4mmUSY=;
        b=AdoFSrFYK/OwS/CIdxoxjtpo+edATyjBjrQWI9d5emdChfj4G80uDJmbzdwq+g2DyG
         nk8cHsIM9xj4hONjvtE1GLA0+viCkEJQ+U5YdFB0A2BHflIk9zYxt9RSfZ3EZzteMCHV
         NZXpbPqRoyC1fxTaPmiQQryBH3tpMuCH2TEpZ9GsaM5t3AvAyHZnJX2S/kZA+wKN2TW6
         K63la/h/NOPvueLhdGdWgDZzD94Gpk+yd8tQeEQhNvZ3RfxVOMputdFOG4Ed3+YhfKZm
         xGHGZLfrDB86FhTTMrVW81QTGvGRi7oaS9AwWk/SsGKOoak4YNAeir4UAo8nFBLEz6YS
         j3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119823; x=1784724623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYkSuTtvbkyclIwWlOakYM6IekniQ0aLPxxWi4mmUSY=;
        b=scGaugvZJuJKmGhELu7M/zjI0tt3g4GNpBvF8KcY+6/dQxsJkSYmhQCBwlSU5xWKFN
         70zW58SoTPFNw0wEmuh23++iTytHfsPFq1f7qAhvDLMrf3u1ZQxg3vMkEZeuP4CCw/nA
         V1mSMw6Q1uMa1d0eUTa1GMTa4YIgJNF4nui+p2hErjLCaKcc9iZ3rr2jd4NDGtGqHzAe
         W8y9d7I1ojB+n1Z1TqjxyStI01bZJ0W7iQuPbP3345TG3vJVkJ9PrZL5cSerAJqD1+q3
         YUwNOa9GfB7vfdN0gRg/B4LTT/A/N5p3EkvV70on77D0lEWpaaEoFoFrJIu0GCRFyRzn
         hyiQ==
X-Gm-Message-State: AOJu0Yyyote0bNsti6lv5r1JU0MmeykJQsCVhIQpiLZeA7kS/Bd6YwtA
	/QsuRSzxxQ+TadFj854ScFptsj5fyvbaFwU4jKzxTrtJfq825uIBie2w
X-Gm-Gg: AfdE7ckBrtFixBSA79GTlKeHfu6hWUF01DYMn34Ecq1v8uyT6d0CD7pJEQ9laD3qQtR
	0uHpJUDFjBftutnsy25XIz+xWqJu2ArgM5zqB58mVP3RNPvlRhr8HSHFjXmB9pB8IhIvFFcfLGj
	hrV2mAPvlG5qYG1oKSgsSDScaWtCFLYiYYVV55zABRTKAyO6vq3k+rQG79O1lzMldIK16eRzNbN
	0oYaroOt2T5jFnS4czkCvL78Zb9HtDBbjUKT33C0k72lpBV9GGCJki1BlGYYzHeCnmbQS7ClB26
	boQRrntga9KfNZj7VaL7Nd3dBUHXfjT5ZVcfQ1cOijcCTfIwo53Idy8Re1fkn8NqhaGypMlm2rI
	uE1mjpddTR/lm/zatX1UAMRj+enfTpp7pR2yz4BseMm/qTukHHj1vad54HgpzZEWg8crdWWEYcq
	QG9kC0fE3K0ySbizNzTplShy4EvhY3jomheqiJG+2v2YsXlhHM2vNoFV36fc3ZSOVlgbkPlEbup
	N0Ith2J0vEN0w==
X-Received: by 2002:a05:6512:1324:b0:5b0:149a:9870 with SMTP id 2adb3069b0e04-5b02ba1e7b5mr3519941e87.18.1784119822958;
        Wed, 15 Jul 2026 05:50:22 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:22 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 10/61] staging: rtl8723bs: remove unused tdls_hdl function
Date: Wed, 15 Jul 2026 19:47:38 +0700
Message-ID: <20260715124829.90290-11-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function tdls_hdl() always returns H2C_REJECTED and is not
actively used. Replace its handler reference with NULL and remove
the dead code and its declaration.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 5 +----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 9f1efbd25..d2c6d48a8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -150,7 +150,7 @@ static struct cmd_hdl wlancmds[] = {
 	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl) /*59*/
 
 	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param), NULL) /*60*/
-	GEN_MLME_EXT_HANDLER(sizeof(struct TDLSoption_param), tdls_hdl) /*61*/
+	GEN_MLME_EXT_HANDLER(sizeof(struct TDLSoption_param), NULL) /*61*/
 	GEN_MLME_EXT_HANDLER(0, chk_bmc_sleepq_hdl) /*62*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct RunInThread_param), run_in_thread_hdl) /*63*/
 };
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index aca6111ff..7f101adcc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5799,10 +5799,7 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 /*  TDLS_P_BASE_CH	: periodically go back to base channel */
 /*  TDLS_RS_RCR		: restore RCR */
 /*  TDLS_TEAR_STA	: free tdls sta */
-u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf)
-{
-	return H2C_REJECTED;
-}
+
 
 u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index a0124eee5..09f4d66cc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -646,7 +646,6 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf);
 u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf);
-u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf);
 
 
-- 
2.55.0

