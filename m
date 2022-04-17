Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1952A62B
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:22:41 +0000 (UTC)
Received: from dslb-188-096-140-061.188.096.pools.vodafone-ip.de ([188.96.140.61] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ng236-0002FP-1U; Sun, 17 Apr 2022 12:22:32 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/6] staging: r8188eu: replace the GetFrameSubType call
Date: Sun, 17 Apr 2022 12:22:17 +0200
Message-Id: <20220417102221.466524-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220417102221.466524-1-martin@kaiser.cx>
References: <20220417102221.466524-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver's local GetFrameSubType macro returns both frame type and
subtype.

Use the ieee80211 framework to extract the two fields. This shows more
clearly that both type and subtype are read.

Convert everything to host endianness before we use bit operations.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 3afd06120cb1..be1afabe77d1 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -395,7 +395,6 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 	int index;
 	struct mlme_handler *ptable;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	u8 *pframe = precv_frame->rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, hdr->addr2);
 
@@ -409,8 +408,8 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 
 	ptable = mlme_sta_tbl;
 
-	index = GetFrameSubType(pframe) >> 4;
-
+	index = (le16_to_cpu(hdr->frame_control) &
+		 (IEEE80211_FCTL_STYPE | IEEE80211_FCTL_FTYPE)) >> 4;
 	if (index > 13)
 		return;
 	ptable += index;
-- 
2.30.2

