Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9D01B4223
	for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771745230; cv=none; b=LEUlhJX6KupA9UzS6YcgC0rEoTlOBztODT8Qfq559U4OS6B0fTsybKL9ZmuETUz8zOEeSttmO8syttXw9rwDcmfr69mTtaWQeT5FXDBcxTyYBQWjaM07H6UTWLpzTiswB/oXDSOrJH6/Spw7KNxHrgBwfSIxxJ3R8PQ+kUapRMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771745230; c=relaxed/simple;
	bh=RM+L5yF//fEHaiwweMuaZLU773hi0GitczABJVd1S4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bRbnK1KaY1HXHMsftIvCuhF07IKARIbPIotLrmvaiYA/W3R2tvWRaVvXLtgVq5fXfFkmyOSVaL1BuIEXJImBBWoK0u9SL0Ec5iYc3wOW2OAyMdse5dnZDf/wVBVzOaG67+JPnB8LzdiUj4mHnhT4us5PB56oApwOevuLQ5wBbIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oD+T6YDx; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oD+T6YDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pY
	M2Uwg7yhzl5I+iNy1TEwWgvJncg45hVau/5FY+7A8=; b=oD+T6YDxaZIwqobiFx
	s5GpJFpajwEOpC/sdOfR2tnxZanyBSNEOIkT7PHm5MOLTFXOefLtcOwzk4hu802W
	gNeuY9QYUqoz2QxmZFELeM5/j8QFlPjbvCSohH4epomBzlmLtZkGBbuo/44xglfJ
	1ZbIc11MpfbCNZRqV0mwTcfpk=
Received: from ubuntu24.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC3CJmvr5ppRC7vMA--.24557S2;
	Sun, 22 Feb 2026 15:26:40 +0800 (CST)
From: Yan Pan <maxwell2119@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yan Pan <maxwell2119@163.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Date: Sun, 22 Feb 2026 15:26:32 +0800
Message-ID: <20260222072632.2931217-1-maxwell2119@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3CJmvr5ppRC7vMA--.24557S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AryDWrykAw17Kw1rAF18Krg_yoWxXw1fpF
	4rX343C3y8Zr4I9r4DKF4j9w4Sq3W0gFyqyFZ3Kw1rCF13Ar1jgF18tF40vrn8tFWkAanx
	Was8W34Duw4jyrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRl1vcUUUUU=
X-CM-SenderInfo: 5pd04v1oosiiqz6rljoofrz/xtbC+RAZfWmar7DBvQAA3d

Remove unnecessary parentheses around variables and struct members
in rtw_sta_mgt.c to comply with the Linux kernel coding style.
This issue was reported by checkpatch.pl.

Signed-off-by: Yan Pan <maxwell2119@163.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 34 ++++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index bdd4b6d8fd2e..9d222ae87d79 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -79,7 +79,7 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 	for (i = 0; i < NUM_STA; i++) {
 		_rtw_init_stainfo(psta);
 
-		INIT_LIST_HEAD(&(pstapriv->sta_hash[i]));
+		INIT_LIST_HEAD(&pstapriv->sta_hash[i]);
 
 		list_add_tail(&psta->list, get_list_head(&pstapriv->free_sta_queue));
 
@@ -149,7 +149,7 @@ u32 _rtw_free_sta_priv(struct	sta_priv *pstapriv)
 		/*delete all reordering_ctrl_timer		*/
 		spin_lock_bh(&pstapriv->sta_hash_lock);
 		for (index = 0; index < NUM_STA; index++) {
-			phead = &(pstapriv->sta_hash[index]);
+			phead = &pstapriv->sta_hash[index];
 			list_for_each(plist, phead) {
 				int i;
 
@@ -186,15 +186,15 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 	pfree_sta_queue = &pstapriv->free_sta_queue;
 
 	/* spin_lock_bh(&(pfree_sta_queue->lock)); */
-	spin_lock_bh(&(pstapriv->sta_hash_lock));
+	spin_lock_bh(&pstapriv->sta_hash_lock);
 	if (list_empty(&pfree_sta_queue->queue)) {
 		/* spin_unlock_bh(&(pfree_sta_queue->lock)); */
-		spin_unlock_bh(&(pstapriv->sta_hash_lock));
+		spin_unlock_bh(&pstapriv->sta_hash_lock);
 		return NULL;
 	}
 	psta = container_of(get_next(&pfree_sta_queue->queue), struct sta_info, list);
 
-	list_del_init(&(psta->list));
+	list_del_init(&psta->list);
 
 	/* spin_unlock_bh(&(pfree_sta_queue->lock)); */
 
@@ -207,11 +207,11 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 	index = wifi_mac_hash(hwaddr);
 
 	if (index >= NUM_STA) {
-		spin_unlock_bh(&(pstapriv->sta_hash_lock));
+		spin_unlock_bh(&pstapriv->sta_hash_lock);
 		psta = NULL;
 		goto exit;
 	}
-	phash_list = &(pstapriv->sta_hash[index]);
+	phash_list = &pstapriv->sta_hash[index];
 
 	/* spin_lock_bh(&(pstapriv->sta_hash_lock)); */
 
@@ -258,7 +258,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 	/* init for the sequence number of received management frame */
 	psta->RxMgmtFrameSeqNum = 0xffff;
-	spin_unlock_bh(&(pstapriv->sta_hash_lock));
+	spin_unlock_bh(&pstapriv->sta_hash_lock);
 	/* alloc mac id for non-bc/mc station, */
 	rtw_alloc_macid(pstapriv->padapter, psta);
 
@@ -300,7 +300,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	/* vo */
 	/* spin_lock_bh(&(pxmitpriv->vo_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->vo_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->vo_q.tx_pending));
+	list_del_init(&pstaxmitpriv->vo_q.tx_pending);
 	phwxmit = pxmitpriv->hwxmits;
 	phwxmit->accnt -= pstaxmitpriv->vo_q.qcnt;
 	pstaxmitpriv->vo_q.qcnt = 0;
@@ -309,7 +309,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	/* vi */
 	/* spin_lock_bh(&(pxmitpriv->vi_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->vi_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->vi_q.tx_pending));
+	list_del_init(&pstaxmitpriv->vi_q.tx_pending);
 	phwxmit = pxmitpriv->hwxmits + 1;
 	phwxmit->accnt -= pstaxmitpriv->vi_q.qcnt;
 	pstaxmitpriv->vi_q.qcnt = 0;
@@ -318,7 +318,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	/* be */
 	/* spin_lock_bh(&(pxmitpriv->be_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->be_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->be_q.tx_pending));
+	list_del_init(&pstaxmitpriv->be_q.tx_pending);
 	phwxmit = pxmitpriv->hwxmits + 2;
 	phwxmit->accnt -= pstaxmitpriv->be_q.qcnt;
 	pstaxmitpriv->be_q.qcnt = 0;
@@ -327,7 +327,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	/* bk */
 	/* spin_lock_bh(&(pxmitpriv->bk_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->bk_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->bk_q.tx_pending));
+	list_del_init(&pstaxmitpriv->bk_q.tx_pending);
 	phwxmit = pxmitpriv->hwxmits + 3;
 	phwxmit->accnt -= pstaxmitpriv->bk_q.qcnt;
 	pstaxmitpriv->bk_q.qcnt = 0;
@@ -369,7 +369,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 
 			plist = get_next(plist);
 
-			list_del_init(&(prframe->u.hdr.list));
+			list_del_init(&prframe->u.hdr.list);
 
 			rtw_free_recvframe(prframe, pfree_recv_queue);
 		}
@@ -435,7 +435,7 @@ void rtw_free_all_stainfo(struct adapter *padapter)
 	spin_lock_bh(&pstapriv->sta_hash_lock);
 
 	for (index = 0; index < NUM_STA; index++) {
-		phead = &(pstapriv->sta_hash[index]);
+		phead = &pstapriv->sta_hash[index];
 		list_for_each_safe(plist, tmp, phead) {
 			psta = list_entry(plist, struct sta_info, hash_list);
 
@@ -473,7 +473,7 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 
 	spin_lock_bh(&pstapriv->sta_hash_lock);
 
-	phead = &(pstapriv->sta_hash[index]);
+	phead = &pstapriv->sta_hash[index];
 	list_for_each(plist, phead) {
 		psta = list_entry(plist, struct sta_info, hash_list);
 
@@ -525,7 +525,7 @@ u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr)
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
 	struct __queue	*pacl_node_q = &pacl_list->acl_node_q;
 
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 	phead = get_list_head(pacl_node_q);
 	list_for_each(plist, phead) {
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
@@ -536,7 +536,7 @@ u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr)
 				break;
 			}
 	}
-	spin_unlock_bh(&(pacl_node_q->lock));
+	spin_unlock_bh(&pacl_node_q->lock);
 
 	if (pacl_list->mode == 1) /* accept unless in deny list */
 		res = !match;
-- 
2.43.0

