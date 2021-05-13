Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E324F2FB7
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 09:42:11 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fgmph46RPzlc2V;
	Thu, 13 May 2021 17:39:56 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 17:41:59 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabio Aiuto
	<fabioaiuto83@gmail.com>, Hans de Goede <hdegoede@redhat.com>, linux-staging
	<linux-staging@lists.linux.dev>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/2] staging: rtl8723bs: core: remove three unused local variables
Date: Thu, 13 May 2021 17:40:06 +0800
Message-ID: <20210513094007.6435-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210513094007.6435-1-thunder.leizhen@huawei.com>
References: <20210513094007.6435-1-thunder.leizhen@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected

Commit 968b15adb0ea ("staging: rtl8723bs: remove all DBG_871X logs")
removed all of the DBG_871X logs, so no one uses local variable 'reassoc',
'reason_code' and 'psta' anymore.

Fixes: 968b15adb0ea ("staging: rtl8723bs: remove all DBG_871X logs")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 31 +++----------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9031cf7657ae91c..acf5578863e17d7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1021,7 +1021,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
-	unsigned char 	reassoc, *p, *pos, *wpa_ie;
+	unsigned char *p, *pos, *wpa_ie;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int		i, ie_len, wpa_ie_len, left;
 	unsigned char 	supportRate[16];
@@ -1041,14 +1041,10 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _FAIL;
 
 	frame_type = GetFrameSubType(pframe);
-	if (frame_type == WIFI_ASSOCREQ) {
-		reassoc = 0;
+	if (frame_type == WIFI_ASSOCREQ)
 		ie_offset = _ASOCREQ_IE_OFFSET_;
-	} else { /*  WIFI_REASSOCREQ */
-		reassoc = 1;
+	else	/*  WIFI_REASSOCREQ */
 		ie_offset = _REASOCREQ_IE_OFFSET_;
-	}
-
 
 	if (pkt_len < sizeof(struct ieee80211_hdr_3addr) + ie_offset)
 		return _FAIL;
@@ -1726,7 +1722,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char 	*frame_body;
 	unsigned char 	category, action;
-	unsigned short	tid, status, reason_code = 0;
+	unsigned short	tid, status;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -1795,9 +1791,6 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 					~BIT((frame_body[3] >> 4) & 0xf);
 				psta->htpriv.candidate_tid_bitmap &=
 					~BIT((frame_body[3] >> 4) & 0xf);
-
-				/* reason_code = frame_body[4] | (frame_body[5] << 8); */
-				reason_code = get_unaligned_le16(&frame_body[4]);
 			} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
 				tid = (frame_body[3] >> 4) & 0x0F;
 
@@ -5127,22 +5120,8 @@ void _linked_info_dump(struct adapter *padapter)
 
 		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
 			rtw_hal_get_def_var(padapter, HAL_DEF_UNDERCORATEDSMOOTHEDPWDB, &UndecoratedSmoothedPWDB);
-		} else if ((pmlmeinfo->state&0x03) == _HW_STATE_AP_) {
-			struct list_head	*phead, *plist;
-
-			struct sta_info *psta = NULL;
-			struct sta_priv *pstapriv = &padapter->stapriv;
-
-			spin_lock_bh(&pstapriv->asoc_list_lock);
-			phead = &pstapriv->asoc_list;
-			plist = get_next(phead);
-			while (phead != plist) {
-				psta = container_of(plist, struct sta_info, asoc_list);
-				plist = get_next(plist);
-			}
-			spin_unlock_bh(&pstapriv->asoc_list_lock);
-
 		}
+
 		for (i = 0; i < NUM_STA; i++) {
 			if (pdvobj->macid[i]) {
 				if (i != 1) /* skip bc/mc sta */
-- 
2.26.0.106.g9fadedd


