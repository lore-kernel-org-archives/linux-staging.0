Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3933C7
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 17:22:39 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id x20so3443471edi.12
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pdJD0sEz6JwadVVPr09JFw5k3V85Yh/6gSBnE158MpY=;
        b=fvdNsxkRy3WWly5FIzP7B0aqEiXB88vpmchkCe+qdiFRcqBjIEW7bEwTJhNBIi+Udp
         x6v2sIHGISgtnSFjsWnbTCI/qq/UIk4LTD4K0Lxoxld2aj5nN09atQQ0TLZlATTXu/l6
         LudZ1GbQSbyyx9VAqVs6gMYlkR+Cr3OnV3/z2OXPlAJ4NYzOqYEQ2cPOGCU+BnEuoSuk
         UuxN/gyz/Atf3qYAos0j9x1Q/LXk1PWrDlPC3FRExAJQE8gj4b+Q3KzejN2C9V4hAA5B
         kq4DwToVP6IJEGVtUFxuz1VbflO0U7At7hll8YHGunlmFrx6kUwg56+8acN0yc3ubqun
         eQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pdJD0sEz6JwadVVPr09JFw5k3V85Yh/6gSBnE158MpY=;
        b=7HdzphdeN0N3YoBfYFTUAigvJe+S053BltEUWlApOI/yPWW9szDjy6XxB1BnxxxXGK
         dElgM2dJPRDG6e1/inyee2MlnMYjkeIj6zXgxWUADVhfVOCq003JaliQ71ESLvFhhc2R
         noqr/JrQ83vztg5ZQDs9Wr9xRCQlB+0dy0FMwEzuDqdNNowxZW1LZUrdi7dR9vd/HPre
         d0I1kxVB81RczykCeR2SqgpCkudEL+lcZaIUnRDj8oLprdI3eyz4c2VwY4Io2/0ye+2c
         VcX8rAKqZ8whldZphQH0+0q+SwbFEniZKLnAylXb7myhK3UpLvicW4vgPJIc7zejOp8O
         u20w==
X-Gm-Message-State: AOAM531WobChveHdglfwa4X15PagDcMjuUM08+9KXkGcQswDRQ8QT+Vf
	D3RbY02RdjXiaWxgfiBojzRKp/6L53A=
X-Google-Smtp-Source: ABdhPJyyp3Tik/xLKv/T9iImv2aa39sxGQbc2ut7VH4ZAYYM1I3/7Ab7q13INWl44i3OuioMWgWEow==
X-Received: by 2002:a50:9d0f:0:b0:416:95a3:1611 with SMTP id v15-20020a509d0f000000b0041695a31611mr9953294ede.77.1649265757668;
        Wed, 06 Apr 2022 10:22:37 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id da19-20020a056402177300b00413583e0996sm7912730edb.14.2022.04.06.10.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 10:22:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/5] staging: r8188eu: use round_up() instead of _RND8()
Date: Wed,  6 Apr 2022 19:22:17 +0200
Message-Id: <20220406172219.15565-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406172219.15565-1-straube.linux@gmail.com>
References: <20220406172219.15565-1-straube.linux@gmail.com>
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
v2: no changes

 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c    | 6 +++---
 drivers/staging/r8188eu/include/osdep_service.h | 8 --------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 9bd2428514de..2feae03a271b 100644
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

