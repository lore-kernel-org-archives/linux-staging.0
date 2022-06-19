Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B007B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 19:42:52 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id b10so1074218plg.4
        for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lnwBlfKsLcAz6io0BTwqY0usDb2Nda3s24yxh9Wy1vs=;
        b=Ig0kvXXHf61H2AJL6sWPLdtzgUeN7hX9Y81ip+5VYrCz0eaZTiSv/KQiwbV+lTOaTf
         pf9thO2GRs7hjeNMdlebIwegofPk/9fVnsFtClaISQ/jULIcj6dzydGvLGEOAgz6vlOZ
         hLqJ28hWh6wcYgz7gFEr2We/DAPjqbg7NpS/iof7iqohExxFad6WmDOkUdGXQX0B5jDR
         zdXHl1hkMmkY0qW7t9VDQ+WcE+vCL9t8A6RGbSNeEy6MiSc1HkF2OGlF5uh5VjkWt88a
         erjeeABx4srqKpuH3ya+IMRo2vhpxC1X6OEIAlC3wTsJ9EOTYxWZQ2Vd2gNzR826Ow3X
         i+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lnwBlfKsLcAz6io0BTwqY0usDb2Nda3s24yxh9Wy1vs=;
        b=6vLTR8VInDwex/Ta5BSCUedremrkW4hEhEqWdKS7hX2OdLyWoD9o5xk2fULnhMXoly
         wr5mqm2AFlDbpSb6O5tPRCU06sR8asBqNvcSUSVuTxZ/F827hM+py/nBaqzdnx23TVpk
         PIKKmPhYlSB3Q7dEXE/zu1KKZByHKttIGhbxoJ16OrSrDpaNGyHYW8YE5DhISK/nveP7
         kIpOkpKByMzKX8y0idE/fwozwLGBU013OlwuHngRj6yYFqvhW8OAkW5exSJ0ZuxohSVL
         vgi5/izLUGNYj4JYAGRkvxiKpdqwp7zGH4WmLVbPfszVk3koGhK5PVc5TPqUZl7Iu468
         fqIw==
X-Gm-Message-State: AJIora8m9E/mvh8+y9D2kOXANZ4QlmQA1/5VefkcVIXMwIgYQfin3UQY
	THvCg9pXuonG3qdPOqllS2Q=
X-Google-Smtp-Source: AGRyM1u/kMveQHb5unIS+o39fAdYB7p0WXj1hjykHwdfWYZ4Ca4PRIB2OBzQVBJGkmh3oOnPiQeM9A==
X-Received: by 2002:a17:90a:4209:b0:1df:b907:ed3d with SMTP id o9-20020a17090a420900b001dfb907ed3dmr23188142pjg.40.1655667772515;
        Sun, 19 Jun 2022 12:42:52 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902650800b00167942e0ee9sm7150970plk.61.2022.06.19.12.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:42:52 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v2 1/5] Staging: r8188eu: core: rtw_xmit: Fixed some whitespace coding style issues
Date: Sun, 19 Jun 2022 12:42:27 -0700
Message-Id: <841716cec5032ad706fbee8677e1b67aec8ad736.1655666628.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655666628.git.marcus.yu.56@gmail.com>
References: <cover.1655666628.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed superfluous blank lines and added blank lines after variable
declarations as per checkpath.pl

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 3d8e9dea7651..1aa284453ab2 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -16,16 +16,13 @@ static u8 RFC1042_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0x00 };
 
 static void _init_txservq(struct tx_servq *ptxservq)
 {
-
 	INIT_LIST_HEAD(&ptxservq->tx_pending);
 	rtw_init_queue(&ptxservq->sta_pending);
 	ptxservq->qcnt = 0;
-
 }
 
 void	_rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv)
 {
-
 	memset((unsigned char *)psta_xmitpriv, 0, sizeof(struct sta_xmit_priv));
 	spin_lock_init(&psta_xmitpriv->lock);
 	_init_txservq(&psta_xmitpriv->be_q);
@@ -34,7 +31,6 @@ void	_rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv)
 	_init_txservq(&psta_xmitpriv->vo_q);
 	INIT_LIST_HEAD(&psta_xmitpriv->legacy_dz);
 	INIT_LIST_HEAD(&psta_xmitpriv->apsd);
-
 }
 
 s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
@@ -300,6 +296,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 			/* check HT op mode */
 			if (pattrib->ht_en) {
 				u8 htopmode = pmlmeinfo->HT_protection;
+
 				if ((pmlmeext->cur_bwmode && (htopmode == 2 || htopmode == 3)) ||
 				    (!pmlmeext->cur_bwmode && htopmode == 3)) {
 					pattrib->vcs_mode = RTS_CTS;
@@ -450,6 +447,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		/*  The following is for DHCP and ARP packet, we use cck1M to tx these packets and let LPS awake some time */
 		/*  to prevent DHCP protocol fail */
 		u8 tmp[24];
+
 		_rtw_pktfile_read(&pktfile, &tmp[0], 24);
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
@@ -1069,7 +1067,6 @@ void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len)
 		}
 		break;
 	}
-
 }
 
 void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe, int sz)
@@ -1316,7 +1313,6 @@ void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pfram
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 	}
 	spin_unlock_bh(&pframequeue->lock);
-
 }
 
 s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
@@ -1515,7 +1511,6 @@ void rtw_init_hwxmits(struct hw_xmit *phwxmit, int entry)
 
 	for (i = 0; i < entry; i++, phwxmit++)
 		phwxmit->accnt = 0;
-
 }
 
 static int rtw_br_client_tx(struct adapter *padapter, struct sk_buff **pskb)
-- 
2.36.1

