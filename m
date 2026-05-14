Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232B3C2768
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 06:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738635; cv=none; b=TM6jfl5/vLozwoCV3xHXayMthT4tQy41PN/UzsrjZkcndmlOs0S/UOCAYuOMIO4OTXqEIpUSMnBdP38FNzmjTzE9u3v/CgFOsHd31ZcENnR9YSTRfM9Fyk5wDNRWLHiLortAy94LxZyV78fNFOpcP6cC88aXU8zIks6ERPJknIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738635; c=relaxed/simple;
	bh=nrczOfGVC80s+tKVDd3e9ohV6aT19hUDJHpFQ9xSAjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XkvHTRNMAUkpheeYPoG7wX1CZxvLRWUeXR+JIv8AmseuJ4784fd33gnsT6VfudBl2hmssyhg4HhQB+/SW4avlONqqkobBrX8TVf9BgTWCvDN5yzHckGPjDD75PIVAzm3EolV05QuD/7hSyTDkcFLjJJvDoOkGuAJbUDQJSCEXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2LwuFNr; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2LwuFNr"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso8660913eec.0
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 23:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778738633; x=1779343433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEDmPs3IEzkMNu9wS4D7y4et1HievtNnY5UColUpsPw=;
        b=K2LwuFNrTgnoz77xxF8hqwIe6F/ogqqTjGlzp7XtCE18wslnfnur8GTgWVCJzP7zW/
         Rs51wiAfFSsrOjJHgSeM1hjrXEZVahH4CIt3rH5jIFM4Wz7okyT3BkpRj9hyzoiGkM51
         UG504xitL49n0dcKNoHIDQdusOtV3k4s65CjhNV5Ms9dBTTGRvfw24LkHnP7oq6O2clY
         XbaUG4pihvEqsXrPKp5mnNQekEg05Eb2cYRlKOoldKdbyp6irgbfZkEV8UCJiRgLAZrF
         let69pLqdZemLXyp99zhKovofME+EThbDJmmnPdWqP00B0+24e7OS2KbmMVW5Wpxjn18
         tuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778738633; x=1779343433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEDmPs3IEzkMNu9wS4D7y4et1HievtNnY5UColUpsPw=;
        b=EgXKcKW6BNKj6/u7T52WNb2RyQ07hZ+eZ6W4QdlXgWisZswpG9jySq64hzaaNgoBsk
         W6HCCDLJUBPTb6ZWyvkkD1/QGL84bNq4YoRanAXyJPJ/k2X6x+T+wb/YS5evDtP/zyVD
         84qbm3cucX6UHb03+5JsSfHq0CENWhs8ya0JoL7vA4nEFTgh63svXAz/5f4by9nskKAa
         0/sFuHCVZjSlH350l9Wzd52RP/BghLq5z2jv7BEd79bV4pKOAiKaBIw212cBtst6tUKL
         hTUdFp+Gk+DkszzatK5nLz7fSvd/v3G8GO+sFWJQ5PbGiXkV6WIylBka06YLv2JdeZcK
         GQEw==
X-Forwarded-Encrypted: i=1; AFNElJ961PFEY9dcsDzAzDa16yVALv/kPPqbHge1NwhSwtqtf1/itohfhOg2eBXUUVnHyuEsjAB1MPyfPX24DxHE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/5zrB6c0t5rzyAmbJAFj2LtewGuigS3KhgBfAUiFyysHBKDea
	QGU3gPXfbH7gSJf3NQTNk3A6lRV4FCdGJWpQm68ljABZeOxj0TTWIfB4
X-Gm-Gg: Acq92OFhPRrrKfs1AyrtrjNeRX40remh4/+BaEnpEEkd3WtK27irXIy1pmlTbEY9qew
	7QBwsmhYtn1ZcGiQ0Jig32fvpkf94RGChzZJiYCIxfFEPXZb9tRymMh7DpMAvTprz8nzO10R+t2
	oPko22clsQDMBo8nEVQ9C2mTOvyyAsjtNHzzyaky5Q9tcpn38gCtGdANhjr3PtNshU/Rw2zRXu8
	Bs4x0LyGWlAIFIlNtLOpgdJ2nPVVi28NuaT16V02uRfG16w6gMjaFU0Hv3IvavB4HVRvAqG74Qw
	KMALF1q3eo1nLcXLTWqxbt4GG44j+uSwysRrGhNCTT/G2D/HaVEAq2LKsAhYaKSyMBy8b84mMZo
	e5yI1v0e556VwgbaXgKqqDka0uwMYTyV30Ye3BkJP+pafMylEPXKpmkXLPdWvE3EKqUSTokXWm4
	EJznbXiXox6S4oQGV2O8IEgqs+AUJYI1ckkT0d8nx1Oi9lczm1V1+BbG8=
X-Received: by 2002:a05:693c:310c:b0:2f0:4268:bc42 with SMTP id 5a478bee46e88-30119f5e862mr3591064eec.25.1778738633533;
        Wed, 13 May 2026 23:03:53 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm2034772eec.15.2026.05.13.23.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:03:53 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: make rtw_xmit_classifier static
Date: Thu, 14 May 2026 06:03:20 +0000
Message-Id: <20260514060323.24895-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514060323.24895-1-dennylin0707@gmail.com>
References: <20260514060323.24895-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_xmit_classifier() function is only used within
rtw_xmit.c. Move it above its caller and make it static to
limit its scope.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 68 ++++++++++----------
 drivers/staging/rtl8723bs/include/rtw_xmit.h |  1 -
 2 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 72e5dddfee5d..b3953bdedb04 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1821,6 +1821,40 @@ void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pfram
 	spin_unlock_bh(&pframequeue->lock);
 }
 
+/*
+ * Will enqueue pxmitframe to the proper queue,
+ * and indicate it to xx_pending list.....
+ */
+static s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
+{
+	u8 ac_index;
+	struct sta_info *psta;
+	struct tx_servq	*ptxservq;
+	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
+	struct hw_xmit	*phwxmits =  padapter->xmitpriv.hwxmits;
+
+	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
+	if (pattrib->psta != psta)
+		return _FAIL;
+
+	if (!psta)
+		return _FAIL;
+
+	if (!(psta->state & _FW_LINKED))
+		return _FAIL;
+
+	ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
+
+	if (list_empty(&ptxservq->tx_pending))
+		list_add_tail(&ptxservq->tx_pending, get_list_head(phwxmits[ac_index].sta_queue));
+
+	list_add_tail(&pxmitframe->list, get_list_head(&ptxservq->sta_pending));
+	ptxservq->qcnt++;
+	phwxmits[ac_index].accnt++;
+
+	return _SUCCESS;
+}
+
 s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	if (rtw_xmit_classifier(padapter, pxmitframe) == _FAIL)
@@ -1863,40 +1897,6 @@ struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *
 	return ptxservq;
 }
 
-/*
- * Will enqueue pxmitframe to the proper queue,
- * and indicate it to xx_pending list.....
- */
-s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
-{
-	u8 ac_index;
-	struct sta_info *psta;
-	struct tx_servq	*ptxservq;
-	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
-	struct hw_xmit	*phwxmits =  padapter->xmitpriv.hwxmits;
-
-	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
-	if (pattrib->psta != psta)
-		return _FAIL;
-
-	if (!psta)
-		return _FAIL;
-
-	if (!(psta->state & _FW_LINKED))
-		return _FAIL;
-
-	ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
-
-	if (list_empty(&ptxservq->tx_pending))
-		list_add_tail(&ptxservq->tx_pending, get_list_head(phwxmits[ac_index].sta_queue));
-
-	list_add_tail(&pxmitframe->list, get_list_head(&ptxservq->sta_pending));
-	ptxservq->qcnt++;
-	phwxmits[ac_index].accnt++;
-
-	return _SUCCESS;
-}
-
 void rtw_free_hwxmits(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index b0189a703d28..a2ff62182b97 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -440,7 +440,6 @@ extern void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac);
 extern s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 
-extern s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe);
 extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
 extern s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
-- 
2.34.1

