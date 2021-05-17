Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B42FB9
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 20:20:33 +0000 (UTC)
Received: from dslb-084-059-234-229.084.059.pools.vodafone-ip.de ([84.59.234.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lijiz-0001o4-UY; Mon, 17 May 2021 22:20:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 4/6] staging: rtl8188eu: use safe iterator in rtw_acl_remove_sta
Date: Mon, 17 May 2021 22:18:24 +0200
Message-Id: <20210517201826.25150-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517201826.25150-1-martin@kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210517201826.25150-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use list_for_each_entry_safe, we may delete list items while iterating
over the list.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - use list_for_each_entry_safe

 drivers/staging/rtl8188eu/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index 6d7c96f1aa42..d297d5301153 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -1068,8 +1068,8 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 
 int rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 {
-	struct list_head *plist, *phead;
-	struct rtw_wlan_acl_node *paclnode;
+	struct list_head *phead;
+	struct rtw_wlan_acl_node *paclnode, *temp;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
 	struct __queue *pacl_node_q = &pacl_list->acl_node_q;
@@ -1079,9 +1079,7 @@ int rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	spin_lock_bh(&pacl_node_q->lock);
 
 	phead = get_list_head(pacl_node_q);
-	list_for_each(plist, phead) {
-		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
-
+	list_for_each_entry_safe(paclnode, temp, phead, list) {
 		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
 			if (paclnode->valid) {
 				paclnode->valid = false;
-- 
2.20.1

