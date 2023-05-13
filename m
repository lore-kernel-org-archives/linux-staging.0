Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093236FA3
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:08:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50d897af77bso2055174a12.1
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001326; x=1686593326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhqmfTNs3O4aemS47cLwnp5JHS1eigTcrbPVaEBITLY=;
        b=ssrGWKWHZqt4kX9TGCoHYjCmXiv+JT50D42PU4JEFfcPO6OJ0xaI7vMIBhxZ9aa1HM
         PBePBa8L8W3u3xZNfzPL4B9d3s524aWJ27R9UHRlxGAgqFHGXbBiYho/YEW5uy4exhPe
         cw/+O6jgjp+hTfjSUSeNzatRSF5yDv7PP+hhBNTHKxCHlJqWs3qOpWCHMmNFQzjH5jXM
         feP8pUQ5GzaqDYJcrURDjT+CIfHwD9EaQ4FQjCM0ysry2fgikuAjR+KW5FgVI4TonX0f
         ktFE1ILID6m9co9vfx+P5NlmL96TAR+qlTn8jbixMeHz23HpISi451Q2IHp/nI/fPtr1
         b/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001326; x=1686593326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhqmfTNs3O4aemS47cLwnp5JHS1eigTcrbPVaEBITLY=;
        b=am7i7pyrlUJs+gJPWseePzHlvuL6EactIFKnH4GLC+Qd+2Nt+ZxNP9V7vxPmGnBiH9
         Ud420I4pLlu80GAFBwx/pZ6iTb++Tne2ABaQpz3RdXAFFxJoecV7ZCqxdWgaL4kuKUQe
         QayeJGLMJ25FNHce2L+dgqlU6YDi8CGr1Rgg3Zg3ceId3FmufMOAT4So6yoP8lvGRAuQ
         NyRtfRU2AIvQA0f8OmxPBPtOfhMNLq4u8/w52zMpo0eSHIWcTXhyed3xvx2vuod7a3rV
         lY88lwaNOssaHQUtybcokWT0RrN06bKo057oi5yQ6o53uFIjP4uqP4jJSeitnWPu0hGB
         T0/w==
X-Gm-Message-State: AC+VfDx3kL0ZyZ+svDGzj5pislURQklkBfzjZLb1J5xBxDEn1DV8hAcI
	H1prn8yA9Tfif084X2SSYiU=
X-Google-Smtp-Source: ACHHUZ6fPHC+SO/3fr62xNUQkvSYxn6BfeekkuRqg+xGpyP/T8HtkimK2xcAGkKrY6iQQxKeLGKwKg==
X-Received: by 2002:a17:906:217:b0:94f:66af:b1f7 with SMTP id 23-20020a170906021700b0094f66afb1f7mr22945364ejd.1.1684001326063;
        Sat, 13 May 2023 11:08:46 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id mm10-20020a170906cc4a00b00960005e09a3sm7096686ejb.61.2023.05.13.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:08:45 -0700 (PDT)
Date: Sat, 13 May 2023 20:08:43 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] staging: rtl8192e: Remove undefined function
 data_hard_stop
Message-ID: <4cc180b9538d6c9c32ff0f56646a642fa217a4a4.1683960684.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove function data_hard_stop as it is not defined.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h            | 6 ------
 drivers/staging/rtl8192e/rtllib_softmac.c    | 5 -----
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 3 ---
 3 files changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d5f5ea5615fc..b356cde80f84 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1682,12 +1682,6 @@ struct rtllib_device {
 	void (*softmac_data_hard_start_xmit)(struct sk_buff *skb,
 			       struct net_device *dev, int rate);
 
-	/* stops the HW queue for DATA frames. Useful to avoid
-	 * waste time to TX data frame when we are reassociating
-	 * This function can sleep.
-	 */
-	void (*data_hard_stop)(struct net_device *dev);
-
 	/* OK this is complementing to data_poll_hard_stop */
 	void (*data_hard_resume)(struct net_device *dev);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 1ca77cdbafa3..65eecbc94b93 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1575,9 +1575,6 @@ static void rtllib_associate_procedure_wq(void *data)
 	ieee->rtllib_ips_leave(ieee->dev);
 	mutex_lock(&ieee->wx_mutex);
 
-	if (ieee->data_hard_stop)
-		ieee->data_hard_stop(ieee->dev);
-
 	rtllib_stop_scan(ieee);
 	HTSetConnectBwMode(ieee, HT_CHANNEL_WIDTH_20, HT_EXTCHNL_OFFSET_NO_EXT);
 	if (ieee->rf_power_state == rf_off) {
@@ -2734,8 +2731,6 @@ void rtllib_disassociate(struct rtllib_device *ieee)
 	if (ieee->softmac_features & IEEE_SOFTMAC_TX_QUEUE)
 		rtllib_reset_queue(ieee);
 
-	if (ieee->data_hard_stop)
-		ieee->data_hard_stop(ieee->dev);
 	if (IS_DOT11D_ENABLE(ieee))
 		dot11d_reset(ieee);
 	ieee->state = RTLLIB_NOLINK;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 1f2fa711e60b..d7166d6772df 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -345,9 +345,6 @@ void rtllib_wx_sync_scan_wq(void *data)
 	rtllib_sta_ps_send_null_frame(ieee, 1);
 
 	rtllib_stop_all_queues(ieee);
-
-	if (ieee->data_hard_stop)
-		ieee->data_hard_stop(ieee->dev);
 	rtllib_stop_send_beacons(ieee);
 	ieee->state = RTLLIB_LINKED_SCANNING;
 	ieee->link_change(ieee->dev);
-- 
2.40.1

