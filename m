Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA894A18
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 20:17:13 +0000 (UTC)
Received: from dslb-178-004-207-027.178.004.pools.vodafone-ip.de ([178.4.207.27] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1o8SVJ-00007Y-W7; Mon, 04 Jul 2022 22:17:10 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/6] staging: r8188eu: use ieee80211 helper to check for nullfunc frame
Date: Mon,  4 Jul 2022 22:16:54 +0200
Message-Id: <20220704201654.195574-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704201654.195574-1-martin@kaiser.cx>
References: <20220704201654.195574-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the ieee80211_is_nullfunc function from ieee80211.h to check for a
nullfunc frame. This is a data frame whose subtype has bit6 set.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 8b21ec8f111f..32cd452d1f3d 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -649,6 +649,7 @@ static int ap2sta_data_frame(
 	struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
 	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
 	int ret = _SUCCESS;
 	struct	sta_priv *pstapriv = &adapter->stapriv;
@@ -693,8 +694,8 @@ static int ap2sta_data_frame(
 			goto exit;
 		}
 
-		if (GetFrameSubType(ptr) & BIT(6)) {
-			/* No data, will not indicate to upper layer, temporily count it here */
+		if (ieee80211_is_nullfunc(hdr->frame_control)) {
+			/* We count the nullfunc frame, but we'll not pass it on to higher layers. */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
 			goto exit;
-- 
2.30.2

