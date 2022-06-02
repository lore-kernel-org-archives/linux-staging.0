Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B63D65
	for <linux-staging@lists.linux.dev>; Thu,  2 Jun 2022 19:37:54 +0000 (UTC)
Received: from ipservice-092-217-081-045.092.217.pools.vodafone-ip.de ([92.217.81.45] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nwqdh-0003py-QK; Thu, 02 Jun 2022 21:37:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/11] staging: r8188eu: remove the pframe variable
Date: Thu,  2 Jun 2022 21:37:25 +0200
Message-Id: <20220602193726.280922-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602193726.280922-1-martin@kaiser.cx>
References: <20220602193726.280922-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the pframe variable, it is no longer used for populating fields of
the outgoing frame.

pmgntframe->buf_addr is already a u8 *, we can drop the (u8 *) cast.

Increment the u8 *pmgntframe->buf_addr by TXDESC_OFFSET before we cast
it to struct ieee80211_mgmt *.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 565e447bb75e..c025f95defab 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5369,7 +5369,6 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	u16 BA_starting_seqctrl = 0;
 	struct xmit_frame *pmgntframe;
 	struct pkt_attrib *pattrib;
-	u8 *pframe;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -5389,8 +5388,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 
 	memset(pmgntframe->buf_addr, 0, WLANHDR_OFFSET + TXDESC_OFFSET);
 
-	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
-	mgmt = (struct ieee80211_mgmt *)pframe;
+	mgmt = (struct ieee80211_mgmt *)(pmgntframe->buf_addr + TXDESC_OFFSET);
 
 	mgmt->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION | IEEE80211_FTYPE_MGMT);
 
-- 
2.30.2

