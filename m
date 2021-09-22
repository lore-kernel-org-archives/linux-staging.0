Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7AC3FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:38 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d21so10282110wra.12
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VbtaVOH7479Z5itgAUQ6L7Ybt61B93UH6gaHBf7lYQQ=;
        b=dbpz3uLCEeQVS4FFfTIJG6tFo7AAQtfC/es7r9kjYiMRD8n8TaX/NVepyeCq63E8bh
         DBPvs/EKvpH0d4XylH7lByYcwe3nKkhJd7ivVEd+eRr/Zo2ozpkT29aKMnznVYKRr+2J
         EFqEPRSgKLpJxoXZa4QPNmaf1mqNonxExXJQ8ZFVe+tsIgHXGmzcIzzGuB+z7ypmRa+j
         UyE0WoEaqGyFzLx4lh7z+gAcbVNIE5jtlLHHLkC+lPZ97inp73lVfeI9O+UD42Q+EBj/
         bNaCzW69UzJPwobjQQqikaFl4QjOO1BchFqT+OYBr+zl4A2HG0c9p7bvQH7EMjejsgSN
         gJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VbtaVOH7479Z5itgAUQ6L7Ybt61B93UH6gaHBf7lYQQ=;
        b=ATqIFVfgZ0be1U6qFrWO5/JdcwzyJgfKXUFhN8zIMpLEn9AsmW4BY3QNv/NMFCCsEJ
         ZAD3Dv9OFxnGpRx/2Gq/PJLEZ3foUlc+6aWEw5jbrQCkl52lnwkU+7CJnUx2RMl3PX3g
         0BTHvb4hV9sjqruzbBk1MxAvIl4yaoKi6Qp13eMvwfXVFUdeCJTtG+vwfDNWKoUdosC+
         gkER+caXBussxkTYU5zoYVX8Yk4Q/GVnXMH77gy5Q3eXIcp0DrjiS2NR6DUoVxSWcE40
         6cLgZho6YD+NpJNJhhIb9T/2M5vmgjLmsH1BQRCuOxu+B7e7LXIQgNSBFSuFp+nVX1vC
         rxpQ==
X-Gm-Message-State: AOAM531oc6usNmamCpMO0FSGg/d58wyHopqCZcq1Lh+pBiYvSq1VEPgL
	jUr10sfTjhCY+Frqw4ObEP0=
X-Google-Smtp-Source: ABdhPJzgLOglQfrc1f2mJTZ0QMXliBTfbO0ty9x62p7nqPrsXFsTNJrNyHZMqN4RJNobUMxfu80/TQ==
X-Received: by 2002:a5d:5229:: with SMTP id i9mr838055wra.373.1632341136784;
        Wed, 22 Sep 2021 13:05:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/47] staging: r8188eu: remove issue_action_spct_ch_switch()
Date: Wed, 22 Sep 2021 22:03:46 +0200
Message-Id: <20210922200420.9693-14-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function issue_action_spct_ch_switch() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 59 -------------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 -
 2 files changed, 61 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 38ab1ab18872..c35ca002b63f 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5756,65 +5756,6 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 	return ret;
 }
 
-void issue_action_spct_ch_switch(struct adapter *padapter, u8 *ra, u8 new_ch, u8 ch_offset)
-{
-	struct xmit_frame			*pmgntframe;
-	struct pkt_attrib			*pattrib;
-	unsigned char				*pframe;
-	struct rtw_ieee80211_hdr	*pwlanhdr;
-	__le16 *fctrl;
-	struct xmit_priv			*pxmitpriv = &padapter->xmitpriv;
-	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
-
-	DBG_88E(FUNC_NDEV_FMT" ra =%pM, ch:%u, offset:%u\n",
-		FUNC_NDEV_ARG(padapter->pnetdev), ra, new_ch, ch_offset);
-
-	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
-	if (!pmgntframe)
-		return;
-
-	/* update attribute */
-	pattrib = &pmgntframe->attrib;
-	update_mgntframe_attrib(padapter, pattrib);
-
-	memset(pmgntframe->buf_addr, 0, WLANHDR_OFFSET + TXDESC_OFFSET);
-
-	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
-	pwlanhdr = (struct rtw_ieee80211_hdr *)pframe;
-
-	fctrl = &pwlanhdr->frame_ctl;
-	*(fctrl) = 0;
-
-	memcpy(pwlanhdr->addr1, ra, ETH_ALEN); /* RA */
-	memcpy(pwlanhdr->addr2, myid(&padapter->eeprompriv), ETH_ALEN); /* TA */
-	memcpy(pwlanhdr->addr3, ra, ETH_ALEN); /* DA = RA */
-
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
-	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ACTION);
-
-	pframe += sizeof(struct rtw_ieee80211_hdr_3addr);
-	pattrib->pktlen = sizeof(struct rtw_ieee80211_hdr_3addr);
-
-	/* category, action */
-	{
-		u8 category, action;
-		category = RTW_WLAN_CATEGORY_SPECTRUM_MGMT;
-		action = RTW_WLAN_ACTION_SPCT_CHL_SWITCH;
-
-		pframe = rtw_set_fixed_ie(pframe, 1, &category, &pattrib->pktlen);
-		pframe = rtw_set_fixed_ie(pframe, 1, &action, &pattrib->pktlen);
-	}
-
-	pframe = rtw_set_ie_ch_switch(pframe, &pattrib->pktlen, 0, new_ch, 0);
-	pframe = rtw_set_ie_secondary_ch_offset(pframe, &pattrib->pktlen,
-		hal_ch_offset_to_secondary_ch_offset(ch_offset));
-
-	pattrib->last_txcmdsz = pattrib->pktlen;
-
-	dump_mgntframe(padapter, pmgntframe);
-}
-
 void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short status)
 {
 	u8 category = RTW_WLAN_CATEGORY_BACK;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index c00ed9553209..89020f828e08 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -566,8 +566,6 @@ int issue_deauth(struct adapter *padapter, unsigned char *da,
 		 unsigned short reason);
 int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason,
 		    int try_cnt, int wait_ms);
-void issue_action_spct_ch_switch(struct adapter *padapter, u8 *ra, u8 new_ch,
-				 u8 ch_offset);
 void issue_action_BA(struct adapter *padapter, unsigned char *raddr,
 		     unsigned char action, unsigned short status);
 unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr);
-- 
2.33.0

