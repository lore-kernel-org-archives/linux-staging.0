Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A5F2FAF
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 11:26:07 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b6so17885344wrh.10
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bk3vHLkpVQKkYaxCanjovyNRt8yU/3sM0JETBfSeoT4=;
        b=GO9FxyDxQ0p03Lqcuw8FgGgRlzSLCx3oklfVe7YJd9hvaCRfOTRYdvF8r2DKEV8U8H
         r7z5t7bbM9Z8Kvm1bGTIbpi4kodX7q2OuS4sBB7KM4JbsIDuDgOx7bbMw0+CfgtpbH3E
         VPP6nArmEzyCgiqP3f3wGdBxw/7dUVMICLrkC4G6NR4Fz+461IpZJen1eEMi+pGUMd7Y
         l3rf4Muk3hUb4xGeY4aa7V5YckXntoBgYF5ZOn+FkK3lc1zqo7R1RJawe/WA3liM/FB3
         ZOpXOnPjAtzv2s3obZ0TeKqEZWHqQIQM0anekJGSp5N4MQP2Owi8Efz7s6NjoiZTtc31
         Akqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bk3vHLkpVQKkYaxCanjovyNRt8yU/3sM0JETBfSeoT4=;
        b=ASmzU2STLVL67FytV67cIxPJLMtFGzFidIv9GK/RS8B+1gVaTd4+HovtVq7lK8vfDK
         Oc6w48lxhjCA9c7u18tp3bsqIP5oW+Lhw1iTPm46+jesnzUYFDpa2uAXeFNPOoVfrFLA
         oBFSwK7JhQwT0r9L3+90WsSW5J7NvcZqzUcaAOmlcPjPDdjmxVZqBBXVG24LJ2ieuLWh
         0TER/+aO7w0zkWNiTgyRaXUZ1tQAv+kvtyoDbyNW03WGzhXqb57kwmrax1HDTsStZUfS
         CcItYyBjlwDnjCgck39lwuWEE74O6nD5zSnib0Mfzal7rBjXbpjYj9mcG8xAv6DJQFBk
         DlbQ==
X-Gm-Message-State: AOAM530MLXJaebCWUVleZaO0Z7lHbPQjqvIKPqLvY9sEt+x8/U7sHT5Z
	SETpOELaGu8j1C1A+8rJS4c=
X-Google-Smtp-Source: ABdhPJy4dmQVJOF6nMxrHRpQ1pYqfweHnHgAUeHUpHYwak2zX0+CSBTJjFcyJQMwRE3gkpKuHB41jw==
X-Received: by 2002:adf:8170:: with SMTP id 103mr20244377wrm.167.1630236366254;
        Sun, 29 Aug 2021 04:26:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id h8sm15826581wmb.35.2021.08.29.04.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 04:26:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: convert type of second parameter of rtw_*_encrypt()
Date: Sun, 29 Aug 2021 13:25:53 +0200
Message-Id: <20210829112555.8726-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210829112555.8726-1-straube.linux@gmail.com>
References: <20210829112555.8726-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the type of the second parameter of the rtw_*_encrypt() functions
to struct xmit_frame.

All callers of the functions cast the type to (u8 *) and in the functions
it is casted back to the original type. Changing the type of the second
parameter to struct xmit_frame avoids these unnecessary casts and improves
readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  2 +-
 drivers/staging/r8188eu/core/rtw_security.c   | 36 +++++++++----------
 drivers/staging/r8188eu/core/rtw_xmit.c       |  6 ++--
 .../staging/r8188eu/include/rtw_security.h    |  6 ++--
 4 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 5a472a4954b0..d78d1b00f66c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5049,7 +5049,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-	rtw_wep_encrypt(padapter, (u8 *)pmgntframe);
+	rtw_wep_encrypt(padapter, pmgntframe);
 	DBG_88E("%s\n", __func__);
 	dump_mgntframe(padapter, pmgntframe);
 }
diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 5aa893ab46e9..5168159d8ae7 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -77,7 +77,7 @@ static void arcfour_encrypt(struct arc4context *parc4ctx, u8 *dest, u8 *src, u32
 /*
 	Need to consider the fragment  situation
 */
-void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
+void rtw_wep_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {	/*  exclude ICV */
 	union {
 		__le32 f0;
@@ -91,17 +91,15 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	u8	*pframe, *payload, *iv;    /* wepkey */
 	u8	wepkey[16];
 	u8   hw_hdr_offset = 0;
-	struct	pkt_attrib	 *pattrib = &((struct xmit_frame *)pxmitframe)->attrib;
+	struct	pkt_attrib	 *pattrib = &pxmitframe->attrib;
 	struct	security_priv	*psecuritypriv = &padapter->securitypriv;
 	struct	xmit_priv		*pxmitpriv = &padapter->xmitpriv;
 
-	if (!((struct xmit_frame *)pxmitframe)->buf_addr)
+	if (!pxmitframe->buf_addr)
 		return;
 
-	hw_hdr_offset = TXDESC_SIZE +
-		 (((struct xmit_frame *)pxmitframe)->pkt_offset * PACKET_OFFSET_SZ);
-
-	pframe = ((struct xmit_frame *)pxmitframe)->buf_addr + hw_hdr_offset;
+	hw_hdr_offset = TXDESC_SIZE + pxmitframe->pkt_offset * PACKET_OFFSET_SZ;
+	pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
 	/* start to encrypt each fragment */
 	if ((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) {
@@ -502,7 +500,7 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 }
 
 /* The hlen isn't include the IV */
-u32	rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
+u32 rtw_tkip_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {																	/*  exclude ICV */
 	u16	pnl;
 	u32	pnh;
@@ -519,17 +517,17 @@ u32	rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	u8	*pframe, *payload, *iv, *prwskey;
 	union pn48 dot11txpn;
 	struct	sta_info		*stainfo;
-	struct	pkt_attrib	 *pattrib = &((struct xmit_frame *)pxmitframe)->attrib;
+	struct	pkt_attrib	 *pattrib = &pxmitframe->attrib;
 	struct	security_priv	*psecuritypriv = &padapter->securitypriv;
 	struct	xmit_priv		*pxmitpriv = &padapter->xmitpriv;
 	u32	res = _SUCCESS;
 
-	if (!((struct xmit_frame *)pxmitframe)->buf_addr)
+	if (!pxmitframe->buf_addr)
 		return _FAIL;
 
-	hw_hdr_offset = TXDESC_SIZE +
-		 (((struct xmit_frame *)pxmitframe)->pkt_offset * PACKET_OFFSET_SZ);
-	pframe = ((struct xmit_frame *)pxmitframe)->buf_addr + hw_hdr_offset;
+	hw_hdr_offset = TXDESC_SIZE + pxmitframe->pkt_offset * PACKET_OFFSET_SZ;
+	pframe = pxmitframe->buf_addr + hw_hdr_offset;
+
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _TKIP_) {
 		if (pattrib->psta)
@@ -1154,7 +1152,7 @@ static int aes_cipher(u8 *key, uint hdrlen, u8 *pframe, uint plen)
 	return _SUCCESS;
 }
 
-u32	rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
+u32 rtw_aes_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {	/*  exclude ICV */
 
 	/*static*/
@@ -1165,20 +1163,18 @@ u32	rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	u8	*pframe, *prwskey;	/*  *payload,*iv */
 	u8   hw_hdr_offset = 0;
 	struct	sta_info		*stainfo;
-	struct	pkt_attrib	 *pattrib = &((struct xmit_frame *)pxmitframe)->attrib;
+	struct	pkt_attrib	 *pattrib = &pxmitframe->attrib;
 	struct	security_priv	*psecuritypriv = &padapter->securitypriv;
 	struct	xmit_priv		*pxmitpriv = &padapter->xmitpriv;
 
 /*	uint	offset = 0; */
 	u32 res = _SUCCESS;
 
-	if (!((struct xmit_frame *)pxmitframe)->buf_addr)
+	if (!pxmitframe->buf_addr)
 		return _FAIL;
 
-	hw_hdr_offset = TXDESC_SIZE +
-		 (((struct xmit_frame *)pxmitframe)->pkt_offset * PACKET_OFFSET_SZ);
-
-	pframe = ((struct xmit_frame *)pxmitframe)->buf_addr + hw_hdr_offset;
+	hw_hdr_offset = TXDESC_SIZE + pxmitframe->pkt_offset * PACKET_OFFSET_SZ;
+	pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _AES_) {
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 46fe62c7c32c..bcc4d65cdcee 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -683,13 +683,13 @@ static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmi
 		switch (pattrib->encrypt) {
 		case _WEP40_:
 		case _WEP104_:
-			rtw_wep_encrypt(padapter, (u8 *)pxmitframe);
+			rtw_wep_encrypt(padapter, pxmitframe);
 			break;
 		case _TKIP_:
-			rtw_tkip_encrypt(padapter, (u8 *)pxmitframe);
+			rtw_tkip_encrypt(padapter, pxmitframe);
 			break;
 		case _AES_:
-			rtw_aes_encrypt(padapter, (u8 *)pxmitframe);
+			rtw_aes_encrypt(padapter, pxmitframe);
 			break;
 		default:
 			break;
diff --git a/drivers/staging/r8188eu/include/rtw_security.h b/drivers/staging/r8188eu/include/rtw_security.h
index ec6ecdb7bc98..4e6d4257b7ba 100644
--- a/drivers/staging/r8188eu/include/rtw_security.h
+++ b/drivers/staging/r8188eu/include/rtw_security.h
@@ -330,9 +330,9 @@ void rtw_secmicappend(struct mic_data *pmicdata, u8 *src, u32 nBytes);
 void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst);
 void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len,
 			u8 *Miccode, u8   priority);
-u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe);
-u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe);
-void rtw_wep_encrypt(struct adapter *padapter, u8  *pxmitframe);
+u32 rtw_aes_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe);
+u32 rtw_tkip_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe);
+void rtw_wep_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe);
 u32 rtw_aes_decrypt(struct adapter *padapter, u8  *precvframe);
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8  *precvframe);
 void rtw_wep_decrypt(struct adapter *padapter, u8  *precvframe);
-- 
2.32.0

