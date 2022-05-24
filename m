Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3CA7F9
	for <linux-staging@lists.linux.dev>; Tue, 24 May 2022 09:01:06 +0000 (UTC)
Received: from 162.sub194.ddfr.nl ([83.136.194.162] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ntQPQ-0006Y3-W9; Tue, 24 May 2022 11:00:57 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 05/12] staging: r8188eu: use mgmt to set the sequence number
Date: Tue, 24 May 2022 11:00:22 +0200
Message-Id: <20220524090029.242584-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524090029.242584-1-martin@kaiser.cx>
References: <20220521153824.218196-1-martin@kaiser.cx>
 <20220524090029.242584-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the mgmt structure in issue_action_BA to set the sequence number of
the outgoing frame.

pwlanhdr is now unused, it can be removed.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
- remove pwlanhdr, it's not used any more

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index f08521cb1ff7..e64f2a0ec626 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5375,7 +5375,6 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	struct xmit_frame *pmgntframe;
 	struct pkt_attrib *pattrib;
 	u8 *pframe;
-	struct ieee80211_hdr *pwlanhdr;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -5395,7 +5394,6 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	memset(pmgntframe->buf_addr, 0, WLANHDR_OFFSET + TXDESC_OFFSET);
 
 	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
-	pwlanhdr = (struct ieee80211_hdr *)pframe;
 	mgmt = (struct ieee80211_mgmt *)pframe;
 
 	mgmt->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION | IEEE80211_FTYPE_MGMT);
@@ -5404,7 +5402,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	memcpy(mgmt->sa, myid(&padapter->eeprompriv), ETH_ALEN);
 	memcpy(mgmt->bssid, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	mgmt->seq_ctrl = cpu_to_le16(pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
-- 
2.30.2

