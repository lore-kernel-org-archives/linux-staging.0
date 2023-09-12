Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A37CA95A
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 19:28:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3175e1bb38cso972301f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 12:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546935; x=1695151735; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9QOFf4TBJHbEExXLmv/GmW03P0dycuuh5jJHz9YFN0=;
        b=Zya1fjunZuhAW6UuoB6YbLNoYide8/cdSBp16A1D6EYeyKl10129gxmT3vRlKB1bOx
         xswEPM2tbq6kc9CuT63U0TVPPAjKYETFweA/hhS4Rd1fJanCx9SY3F5pmTrrKmYibYZC
         DXoP4IIjlqUHuVcExX4//RQ3za9WuMf25aNWC2+xLTcw0edJDYtB6HrsOQ00SfRISj92
         0/uYM8eppwmnes22TRNy0iEbpSc98gZ9Bt4erfzKA9X9Ev5JYqqD5eJPkwC5FoloF5PF
         Ilm1r3F9+obcmHqP/auKMDy1vEUG1OBqt26OQ64xK7MZ7UQALBSVV5QL+xjCfZpll2Hc
         g9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546935; x=1695151735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9QOFf4TBJHbEExXLmv/GmW03P0dycuuh5jJHz9YFN0=;
        b=hhWMnGl1YG6NvfkKM9k3+CGbsUgG+QzpLMy0fO0/nLNvV4gKTZ9UQVzEdrEkEjnyB0
         YCX3PridCUPVVumDTs3pDcscUFYxcYzpE5cUkGzPnTuAC4eGcYJyHhG8ngYkFW0Cc5i2
         Q72CsAZ+Iau2hPp5OG1Uk5lObisi2+20E1WN1GYrcjLignE7ZOD565356oj1b1B7wDgs
         yHp1vuaHN1BSDJK8rO0xMsvTKgDUWbJ+Ii9z9IQznlgWvG7Hcj9Pziq5DbZrex3RMUbq
         bowxgzHkvf0rbe7M2hcBfg78cKYdf1Tt2mFe43LyhjwVSFYFpR1lY2ydZK/0kM0HpBOC
         ithQ==
X-Gm-Message-State: AOJu0YyfvPOB6lnX0t1Fz6onL+y13qkEN8qQ2Zp8Uyzbrkn3kP7qaxLM
	SIUpTu4JNdyvMrTxgr4cQA8=
X-Google-Smtp-Source: AGHT+IEWSM+SW8BpvQulP8HrwUyJjbRtAlSQeT8oECnzVT6aSE1Tt/ISTlh/Mhnt2k+SMZUB6+HQww==
X-Received: by 2002:a5d:5651:0:b0:31a:e21f:37ef with SMTP id j17-20020a5d5651000000b0031ae21f37efmr392517wrw.3.1694546934906;
        Tue, 12 Sep 2023 12:28:54 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id q15-20020adfcd8f000000b0031753073abcsm13509097wrj.36.2023.09.12.12.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:28:54 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:28:53 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] staging: rtl8192e: Remove rtllib_get_payload()
Message-ID: <3ef288fb819f50da3eb9291522067babaa57f532.1694546301.git.philipp.g.hortmann@gmail.com>
References: <cover.1694546300.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694546300.git.philipp.g.hortmann@gmail.com>

rtllib_process_action() is only called in one place with management
frames. Frame is passed over to rtllib_get_payload() which passes it to
rtllib_get_hdrlen(). In rtllib_get_hdrlen() all management frames
return with hdrlen = RTLLIB_3ADDR_LEN. Therefore the switch in
rtllib_get_payload() is useless and dead code. The condition act == NULL
cannot occur and can also be removed. Then rtllib_hdr_2addr is not used
anymore and can be removed as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Unchanged
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
2.42.0

