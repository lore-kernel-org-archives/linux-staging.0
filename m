Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF06D0F
	for <linux-staging@lists.linux.dev>; Mon,  9 Aug 2021 16:51:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n12so12267637wrr.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Aug 2021 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L+x0I7hPWkCmEDLJ+zw5aCUBeHw5a2dhPwAN7ub/WpE=;
        b=I/365I06/iHbh9jbGRpXK81W24CGy8MX0s5hY3UHkEfpqnY/zaMGY8u7sLh17OEOWs
         ZHRGzx7MdhpsqAzpuKg+W5+ZumNJFHoCjAv0LPijf0U1zLRVElips+Y6kynUxFRrH2KM
         r1GrKXiFGb4Zf9z78UcaHD/xeMLgeqEmQpgYxWRA8K03+/HJ/8a9ti3q1oZ2poi1ojpl
         0zQ4H55DQjyKbw6cB7I0MuVdZa0JTkWaHCWs/8sD49AZxHuu/zLd2LjfRe5VNv8+XRiQ
         R9NvDIin2VbaBLvQAAYND7NyerKyY9ybNYVO/CwAkqYzn3LfERLKtNoptjaY+XwQb92B
         MXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L+x0I7hPWkCmEDLJ+zw5aCUBeHw5a2dhPwAN7ub/WpE=;
        b=r/tmb3fWV5w3NXMfCw7BKWaXXELDNcmFGXJN/X0c4t/QXCGKBokaER+57tn/6dLinQ
         C7UjLz1j2uSPqzIgi8fK5z+GwIEA7IqCyJKqI5+tXOriNHhx59AIGw3D6X8xq6FBjhQt
         IM89i15NenYy30cvc0eNCkssrqcgD0eIWjBhhjpqtSHfo0hWqHzqWKO09A0p7ls3kpcQ
         a5BFrawf048OjB5Luyt9j7EShGKRAJbhRTJZ5pcb1Tiwa63+Mp+Sko0w5NL5rYNlp4ik
         JNm5eYoIHgRSnHFTaVq2lrq1X31WXhBZjxi1yQwp8mpk4Iv+oCtqby2f2RoSXMItR436
         mhTQ==
X-Gm-Message-State: AOAM530W/npyG8D2nRS08e7NwGoEVm4eZbBSR4lfw8EumKs98iN2B0CU
	q2LAbPAP5CfBcMdS/NTSmyo=
X-Google-Smtp-Source: ABdhPJwcwXd+aQv0mObcBHJCbH67ip0hKcrzqR15xaZ9rab1hBpi3YNB2QLhCVt0vS6yaRgN0q/gFw==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr11012532wru.257.1628527859277;
        Mon, 09 Aug 2021 09:50:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::996b])
        by smtp.gmail.com with ESMTPSA id q5sm20484469wrx.33.2021.08.09.09.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 09:50:59 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 17/17] staging: r8188eu: remove remaining unnecessary parentheses in core dir
Date: Mon,  9 Aug 2021 18:50:07 +0200
Message-Id: <20210809165007.23204-18-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809165007.23204-1-straube.linux@gmail.com>
References: <20210809165007.23204-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove remaining unnecessary parentheses in core dir reported by
checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c    |  6 +++---
 drivers/staging/r8188eu/core/rtw_debug.c     | 14 +++++++-------
 drivers/staging/r8188eu/core/rtw_ieee80211.c |  4 ++--
 drivers/staging/r8188eu/core/rtw_iol.c       |  2 +-
 drivers/staging/r8188eu/core/rtw_mp.c        | 10 +++++-----
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 28f0452d6ccb..e13f134a497b 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -319,7 +319,7 @@ static inline void __network_hash_link(struct adapter *priv,
 static inline void __network_hash_unlink(struct nat25_network_db_entry *ent)
 {
 	/*  Caller must spin_lock already! */
-	*(ent->pprev_hash) = ent->next_hash;
+	*ent->pprev_hash = ent->next_hash;
 	if (ent->next_hash)
 		ent->next_hash->pprev_hash = ent->pprev_hash;
 	ent->next_hash = NULL;
@@ -853,7 +853,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			} else {	/*  session phase */
 				DEBUG_INFO("NAT25: Insert PPPoE, insert session packet to %s\n", skb->dev->name);
 
-				__nat25_generate_pppoe_network_addr(networkAddr, skb->data, &(ph->sid));
+				__nat25_generate_pppoe_network_addr(networkAddr, skb->data, &ph->sid);
 
 				__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
 
@@ -921,7 +921,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			} else {
 				if (ph->sid != 0) {
 					DEBUG_INFO("NAT25: Lookup PPPoE, lookup session packet from %s\n", skb->dev->name);
-					__nat25_generate_pppoe_network_addr(networkAddr, skb->data+ETH_ALEN, &(ph->sid));
+					__nat25_generate_pppoe_network_addr(networkAddr, skb->data+ETH_ALEN, &ph->sid);
 					__nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
 					__nat25_db_print(priv);
 				} else {
diff --git a/drivers/staging/r8188eu/core/rtw_debug.c b/drivers/staging/r8188eu/core/rtw_debug.c
index 30ef77842787..e7b088563738 100644
--- a/drivers/staging/r8188eu/core/rtw_debug.c
+++ b/drivers/staging/r8188eu/core/rtw_debug.c
@@ -133,7 +133,7 @@ int proc_get_fwstate(char *page, char **start,
 {
 	struct net_device *dev = data;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	int len = 0;
 
@@ -168,7 +168,7 @@ int proc_get_mlmext_state(char *page, char **start,
 	struct net_device *dev = data;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info	*pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
 	int len = 0;
 
@@ -184,7 +184,7 @@ int proc_get_qos_option(char *page, char **start,
 {
 	struct net_device *dev = data;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	int len = 0;
 
@@ -200,7 +200,7 @@ int proc_get_ht_option(char *page, char **start,
 {
 	struct net_device *dev = data;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	int len = 0;
 	len += snprintf(page + len, count - len, "ht_option=%d\n", pmlmepriv->htpriv.ht_option);
@@ -230,9 +230,9 @@ int proc_get_ap_info(char *page, char **start,
 	struct sta_info *psta;
 	struct net_device *dev = data;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct wlan_network *cur_network = &(pmlmepriv->cur_network);
+	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	int len = 0;
 
@@ -830,7 +830,7 @@ int proc_get_all_sta_info(char *page, char **start,
 	spin_lock_bh(&pstapriv->sta_hash_lock);
 
 	for (i = 0; i < NUM_STA; i++) {
-		phead = &(pstapriv->sta_hash[i]);
+		phead = &pstapriv->sta_hash[i];
 		plist = phead->next;
 
 		while (phead != plist) {
diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index ff77e686721c..55d2b8f90d91 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -414,11 +414,11 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	}
 
 	/* DS parameter set */
-	ie = rtw_set_ie(ie, _DSSET_IE_, 1, (u8 *)&(pdev_network->Configuration.DSConfig), &sz);
+	ie = rtw_set_ie(ie, _DSSET_IE_, 1, (u8 *)&pdev_network->Configuration.DSConfig, &sz);
 
 	/* IBSS Parameter Set */
 
-	ie = rtw_set_ie(ie, _IBSS_PARA_IE_, 2, (u8 *)&(pdev_network->Configuration.ATIMWindow), &sz);
+	ie = rtw_set_ie(ie, _IBSS_PARA_IE_, 2, (u8 *)&pdev_network->Configuration.ATIMWindow, &sz);
 
 	if (rateLen > 8)
 		ie = rtw_set_ie(ie, _EXT_SUPPORTEDRATES_IE_, (rateLen - 8), (pdev_network->SupportedRates + 8), &sz);
diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 0e5ce12d4b57..927b8c919fa7 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -8,7 +8,7 @@ struct xmit_frame	*rtw_IOL_accquire_xmit_frame(struct adapter  *adapter)
 	struct xmit_frame	*xmit_frame;
 	struct xmit_buf	*xmitbuf;
 	struct pkt_attrib	*pattrib;
-	struct xmit_priv	*pxmitpriv = &(adapter->xmitpriv);
+	struct xmit_priv	*pxmitpriv = &adapter->xmitpriv;
 
 	xmit_frame = rtw_alloc_xmitframe(pxmitpriv);
 	if (!xmit_frame) {
diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index def0c250a4ac..7f7a7eddda4a 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -577,7 +577,7 @@ static int mp_xmit_packet_thread(void *context)
 	pmp_priv = (struct mp_priv *)context;
 	pmptx = &pmp_priv->tx;
 	padapter = pmp_priv->papdater;
-	pxmitpriv = &(padapter->xmitpriv);
+	pxmitpriv = &padapter->xmitpriv;
 
 	thread_enter("RTW_MP_THREAD");
 
@@ -596,7 +596,7 @@ static int mp_xmit_packet_thread(void *context)
 		}
 
 		memcpy((u8 *)(pxmitframe->buf_addr+TXDESC_OFFSET), pmptx->buf, pmptx->write_size);
-		memcpy(&(pxmitframe->attrib), &(pmptx->attrib), sizeof(struct pkt_attrib));
+		memcpy(&pxmitframe->attrib, &pmptx->attrib, sizeof(struct pkt_attrib));
 
 		dump_mpframe(padapter, pxmitframe);
 
@@ -625,7 +625,7 @@ static int mp_xmit_packet_thread(void *context)
 void fill_txdesc_for_mp(struct adapter *padapter, struct tx_desc *ptxdesc)
 {
 	struct mp_priv *pmp_priv = &padapter->mppriv;
-	memcpy(ptxdesc, &(pmp_priv->tx.desc), TXDESC_SIZE);
+	memcpy(ptxdesc, &pmp_priv->tx.desc, TXDESC_SIZE);
 }
 
 void SetPacketTx(struct adapter *padapter)
@@ -676,7 +676,7 @@ void SetPacketTx(struct adapter *padapter)
 	pmp_priv->tx.buf = (u8 *)N_BYTE_ALIGMENT((size_t)(pmp_priv->tx.pallocated_buf), XMITBUF_ALIGN_SZ);
 	ptr = pmp_priv->tx.buf;
 
-	desc = &(pmp_priv->tx.desc);
+	desc = &pmp_priv->tx.desc;
 	memset(desc, 0, TXDESC_SIZE);
 	pkt_start = ptr;
 	pkt_end = pkt_start + pkt_size;
@@ -954,7 +954,7 @@ void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv)
 			goto exit;
 		}
 
-		list_add_tail(&pxmitbuf->list, &(pxmitpriv->free_xmit_extbuf_queue.queue));
+		list_add_tail(&pxmitbuf->list, &pxmitpriv->free_xmit_extbuf_queue.queue);
 		pxmitbuf++;
 	}
 
-- 
2.32.0

