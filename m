Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD291387
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 07:49:11 +0000 (UTC)
Received: from dslb-178-004-173-157.178.004.pools.vodafone-ip.de ([178.4.173.157] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWvjw-0003JV-9m; Wed, 23 Mar 2022 08:49:08 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/7] staging: r8188eu: use ieee80211 define for version check
Date: Wed, 23 Mar 2022 08:48:53 +0100
Message-Id: <20220323074859.177425-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323074859.177425-1-martin@kaiser.cx>
References: <20220323074859.177425-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the IEEE80211_FCTL_VERS define to check the version number
of a received frame.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 8800ea4825ff..524a00345501 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1063,7 +1063,6 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
 	u8 *ptr = precv_frame->rx_data;
 	__le16 fc = *(__le16 *)ptr;
-	u8  ver = (unsigned char)(*ptr) & 0x3;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
 	if (pmlmeext->sitesurvey_res.state == SCAN_PROCESS) {
@@ -1072,8 +1071,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 			pmlmeext->channel_set[ch_set_idx].rx_count++;
 	}
 
-	/* add version chk */
-	if (ver != 0)
+	if ((fc & IEEE80211_FCTL_VERS) != 0)
 		return _FAIL;
 
 	pattrib->to_fr_ds = get_tofr_ds(ptr);
-- 
2.30.2

