Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3055733C3
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 15:40:26 +0000 (UTC)
Received: from dslb-178-004-201-227.178.004.pools.vodafone-ip.de ([178.4.201.227] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oFdiP-0004Qh-FU; Sun, 24 Jul 2022 17:40:21 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/5] staging: r8188eu: read aid from struct ieee80211_mgmt
Date: Sun, 24 Jul 2022 17:39:16 +0200
Message-Id: <20220724153917.138848-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724153917.138848-1-martin@kaiser.cx>
References: <20220724153917.138848-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read the aid of the association response message from struct
ieee80211_mgmt instead of parsing the message ourselves.

Remove the cast to int, aid is a u16.
Keep the 0x3fff mask that is currently applied to the aid.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 1a68b131f983..25e47efa5b9c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1301,8 +1301,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, struct recv_frame *precv_frame
 	/* set slot time */
 	pmlmeinfo->slotTime = (pmlmeinfo->capability & BIT(10)) ? 9 : 20;
 
-	/* AID */
-	pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4)) & 0x3fff);
+	pmlmeinfo->aid = le16_to_cpu(mgmt->u.assoc_resp.aid) & 0x3fff;
 	res = pmlmeinfo->aid;
 
 	/* following are moved to join event callback function */
-- 
2.30.2

