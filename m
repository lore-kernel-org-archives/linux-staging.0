Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0003748C
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:20:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401314e7838so9061635e9.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283625; x=1694888425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jSwFvBNQ2AMCc4pS5SxTSy3TPsMqYhfRv4nOtRztjH4=;
        b=Jtx+7Dx2zv3uP3ltLUtvL9ieFfa2k+ds89D+VAMfAo0RFB9s5x9frMWGwQHJYKC/Kv
         EmhiMYxpR8uTpBTRpA/FWQ7Njcx2IVP6yhgFVGAzKDs2T8S05D3//ny0jY1QvLUkQ1FL
         060Q+vRdAvpgZnPqCxaPe5mO79hSSsIYVgoaxVw6OVucISC+lcXnev+XeiwUJ+HS8/Z9
         YQ2kZP3knrXiHvuvrzX3oSUfAo6xwWWIUZey9pMqh5EcpPKcHixMdYZY16jmV3hjVFGS
         lB7GQFZFxvIuaCSg6PwW/zyUsrLz0KRuBvFrzbG2A9ALnHhAEh73eqCwR4WaQ/sqlGEn
         09LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283625; x=1694888425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSwFvBNQ2AMCc4pS5SxTSy3TPsMqYhfRv4nOtRztjH4=;
        b=Qe81hqvRKCmyMTlN/X2LMuUcKr42LuuP4eRd2UBN3+BsM15yRQEqFIXA9yWLT0kpD8
         0owUy12gDj+1Rahy56wgowEvnzj0kaC4RRF6SekhRlbFeKH7ZHb+Oasele4yn/BuN6E1
         Sn+Xfgb7DutFeaPSEjx5WX68908p0nBC1tBFVKGIo1dfcdA5++i1JhVDosVvXlxzKe+s
         bkojmjDE/cV0tGfQ0fTaxZMnDtfbADzk+AOiO4m1FGLVkUZiJTUSm2O/ZN6HkqvH9iNE
         Kzb3FdOTHTlX0cemtVWdjHKBuVuEtIps51z3/hvxuFSC6X9X36QGzZuakwNSCVVVCLnw
         Eg9g==
X-Gm-Message-State: AOJu0YxIQ/qylBl4yXk5cvsveWeFA/k+cmY1d4Y3/zeuU8/03rEvVQYn
	QhqqErjZaDB9cgVoC85DnWfxiDXTpcpCdw==
X-Google-Smtp-Source: AGHT+IGYzLWM2bWX2MqgLDzD2AesQMqSmGp4wAHxG4NYNRnSG7mwZwWtOjrIvDOjnkEpxeFYr1ZZ5A==
X-Received: by 2002:a05:600c:3ba6:b0:3ff:8617:672b with SMTP id n38-20020a05600c3ba600b003ff8617672bmr4974721wms.2.1694283625280;
        Sat, 09 Sep 2023 11:20:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b00403038d7652sm2192312wmq.39.2023.09.09.11.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:20:25 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:20:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] staging: rtl8192e: Remove rtllib_get_payload()
Message-ID: <cea7bba329e0dabdbf3d020abafd7e7c122587da.1694282907.git.philipp.g.hortmann@gmail.com>
References: <cover.1694282907.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694282907.git.philipp.g.hortmann@gmail.com>

rtllib_process_action() is only called in one place with management
frames. Frame is passed over to rtllib_get_payload() which passes it to
rtllib_get_hdrlen(). In rtllib_get_hdrlen() all management frames
return with hdrlen = RTLLIB_3ADDR_LEN. Therefore the switch in
rtllib_get_payload() is useless and dead code. The condition act == NULL
cannot occur and can also be removed. Then rtllib_hdr_2addr is not used
anymore and can be removed as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         | 23 -----------------------
 drivers/staging/rtl8192e/rtllib_softmac.c |  9 +--------
 2 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7dfb93f0590c..565a6e41b982 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -692,14 +692,6 @@ struct rtllib_hdr_1addr {
 	u8 payload[];
 } __packed;
 
-struct rtllib_hdr_2addr {
-	__le16 frame_ctl;
-	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 addr2[ETH_ALEN];
-	u8 payload[];
-} __packed;
-
 struct rtllib_hdr_3addr {
 	__le16 frame_ctl;
 	__le16 duration_id;
@@ -1781,21 +1773,6 @@ static inline int rtllib_get_hdrlen(u16 fc)
 	return hdrlen;
 }
 
-static inline u8 *rtllib_get_payload(struct rtllib_hdr *hdr)
-{
-	switch (rtllib_get_hdrlen(le16_to_cpu(hdr->frame_ctl))) {
-	case RTLLIB_1ADDR_LEN:
-		return ((struct rtllib_hdr_1addr *)hdr)->payload;
-	case RTLLIB_2ADDR_LEN:
-		return ((struct rtllib_hdr_2addr *)hdr)->payload;
-	case RTLLIB_3ADDR_LEN:
-		return ((struct rtllib_hdr_3addr *)hdr)->payload;
-	case RTLLIB_4ADDR_LEN:
-		return ((struct rtllib_hdr_4addr *)hdr)->payload;
-	}
-	return NULL;
-}
-
 static inline int rtllib_is_ofdm_rate(u8 rate)
 {
 	switch (rate & ~RTLLIB_BASIC_RATE_MASK) {
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 5de57331c1cf..904be0ef867f 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1921,16 +1921,9 @@ EXPORT_SYMBOL(rtllib_ps_tx_ack);
 static void rtllib_process_action(struct rtllib_device *ieee,
 				  struct sk_buff *skb)
 {
-	struct rtllib_hdr_3addr *header = (struct rtllib_hdr_3addr *)skb->data;
-	u8 *act = rtllib_get_payload((struct rtllib_hdr *)header);
+	u8 *act = skb->data + RTLLIB_3ADDR_LEN;
 	u8 category = 0;
 
-	if (act == NULL) {
-		netdev_warn(ieee->dev,
-			    "Error getting payload of action frame\n");
-		return;
-	}
-
 	category = *act;
 	act++;
 	switch (category) {
-- 
2.41.0

