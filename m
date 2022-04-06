Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD517E8
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 06:19:15 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x20so1323937edi.12
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 23:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DNgNlT+7YKaOvPCk/gmrkhMCJ6Py+Nbw2htQid6V97Q=;
        b=QI2Gdu2tXG9iYVqWPzCMp1nFFt1kzrAaSBQuv9xvmpATMAJLTsBrtdPzpcaZRi4sDy
         FhMfnNLYuW5IkKSx51AChbtQAalwUhqgSnwgVlISmyHu6faduh16hRIU7A0UJ0tbHsro
         0vIp7nwQp4HVtcLgtPN5gDxvzMPekkyJ2Y1kDGnZx5G3p95WOh3eY30TB5rsDmF8LwlF
         H4ygxdCVvNu5YGRqEhr32PAqOQifrlmH1QRXuTdLrVSgrAqbkPHBttVAR0m8ACd4xisg
         +SEYm9pP0u3EB6gmePfm2+dk1ibjoSjvfKte05UBXrMx3yh8mt9P2KudKpsMuCjxIv3p
         T+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DNgNlT+7YKaOvPCk/gmrkhMCJ6Py+Nbw2htQid6V97Q=;
        b=6GfRJKeghki3xnxD3/LPWTKfKt1lRJYURktV6ZPG72K311UTGAnMawo9lzypZ+xhmU
         h6iUGOl/jGtqOMwqvvJ+OW4nqOIixrqgoNho99oH5ETRy6hvlcht4f+nExQNsCCjKapP
         Moy5ZSZawwwqYngGYYAjU5NxVP/QMYir9YAlNTwCnFedCKjtAmXFmrH9RoVtulZVlC9o
         BuE+ddIEYnx5NhAm226TQmYCHA1vFIqQ9q2HNXM/HF2LfcGOgcl+4nbiKevyrWlm3f1E
         POSd1TZOvXNxgPOni7WDWjJ7hL8WkCQFwvwaZoONklRB6t9SWCCAIrYCKs2BCBlYRzKD
         sEsA==
X-Gm-Message-State: AOAM533Z2PP4Zif8bwEiDHgZ+gr1/d7DR+f7m2eKMEiq+Z8gABV941p+
	675561p3SWPHsRS/YqWEgD4=
X-Google-Smtp-Source: ABdhPJyuoF4rDcD4UnydR4O5S6Id89eWt1TrCaA9wMFZX4ynMeTR8soUNMakwXSKjQS4TU2NrkiFHA==
X-Received: by 2002:a05:6402:d0e:b0:418:f011:275e with SMTP id eb14-20020a0564020d0e00b00418f011275emr7045959edb.323.1649225954273;
        Tue, 05 Apr 2022 23:19:14 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id q3-20020a50da83000000b0041cdd6e92b1sm2475251edj.27.2022.04.05.23.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 23:19:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: use round_up() instead of _RND8()
Date: Wed,  6 Apr 2022 08:18:57 +0200
Message-Id: <20220406061859.9011-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406061859.9011-1-straube.linux@gmail.com>
References: <20220406061859.9011-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use in-kernel round_up() instead of custom _RND8().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c    | 6 +++---
 drivers/staging/r8188eu/include/osdep_service.h | 8 --------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 87095eff107b..e00791efccc8 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -437,7 +437,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmit
 	pfirstframe = pxmitframe;
 	len = xmitframe_need_length(pfirstframe) + TXDESC_SIZE + (pfirstframe->pkt_offset * PACKET_OFFSET_SZ);
 	pbuf_tail = len;
-	pbuf = _RND8(pbuf_tail);
+	pbuf = round_up(pbuf_tail, 8);
 
 	/*  check pkt amount in one bulk */
 	desc_cnt = 0;
@@ -488,7 +488,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmit
 
 		len = xmitframe_need_length(pxmitframe) + TXDESC_SIZE + (pxmitframe->pkt_offset * PACKET_OFFSET_SZ);
 
-		if (_RND8(pbuf + len) > MAX_XMITBUF_SZ) {
+		if (round_up(pbuf + len, 8) > MAX_XMITBUF_SZ) {
 			pxmitframe->agg_num = 1;
 			pxmitframe->pkt_offset = 1;
 			break;
@@ -511,7 +511,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmit
 
 		/*  handle pointer and stop condition */
 		pbuf_tail = pbuf + len;
-		pbuf = _RND8(pbuf_tail);
+		pbuf = round_up(pbuf_tail, 8);
 
 		pfirstframe->agg_num++;
 		if (MAX_TX_AGG_PACKET_NUMBER == pfirstframe->agg_num)
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 388c22751d09..ff44c4a37b9d 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -96,14 +96,6 @@ static inline void flush_signals_thread(void)
 
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
-static inline u32 _RND8(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 3) + ((sz & 7) ? 1: 0)) << 3;
-	return val;
-}
-
 static inline u32 _RND128(u32 sz)
 {
 	u32	val;
-- 
2.35.1

