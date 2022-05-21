Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBFA320D
	for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 15:38:40 +0000 (UTC)
Received: from dslb-188-096-138-194.188.096.pools.vodafone-ip.de ([188.96.138.194] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nsRBX-0007XY-5N; Sat, 21 May 2022 17:38:31 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/12] staging: r8188eu: use ieee80211_mgmt in issue_action_BA
Date: Sat, 21 May 2022 17:38:15 +0200
Message-Id: <20220521153824.218196-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220521153824.218196-1-martin@kaiser.cx>
References: <20220521153824.218196-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a struct ieee80211_mgmt variable in issue_action_BA, this will make
it much simpler to populate the fields of the outoing frame.

Use the new mgmt variable to set the type and subtype of the frame.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 0265784368e2..eec716fea41c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5376,13 +5376,13 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	struct pkt_attrib *pattrib;
 	u8 *pframe;
 	struct ieee80211_hdr *pwlanhdr;
-	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_info *psta;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct registry_priv *pregpriv = &padapter->registrypriv;
+	struct ieee80211_mgmt *mgmt;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
@@ -5396,9 +5396,9 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 
 	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
+	mgmt = (struct ieee80211_mgmt *)pframe;
 
-	fctrl = &pwlanhdr->frame_control;
-	*(fctrl) = 0;
+	mgmt->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION | IEEE80211_FTYPE_MGMT);
 
 	/* memcpy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN); */
 	memcpy(pwlanhdr->addr1, raddr, ETH_ALEN);
@@ -5407,7 +5407,6 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ACTION);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
-- 
2.30.2

