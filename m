Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ADD1FDC
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:55:05 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V6-0008D7-Na; Sun, 03 Apr 2022 18:54:52 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/11] staging: r8188eu: ra and ta do not depend on to_ds, from_ds
Date: Sun,  3 Apr 2022 18:54:35 +0200
Message-Id: <20220403165438.357728-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403165438.357728-1-martin@kaiser.cx>
References: <20220403165438.357728-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "DS bit usage" table in include/linux/ieee80211.h shows that
ra is always addr1 and ta is always addr2.

We can set pattrib->ra and pattrib->ta regardless of the to_ds and
from_ds bits.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 0098f3de31d7..75c0e0b17185 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -962,19 +962,15 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	if (ieee80211_has_a4(hdr->frame_control))
 		return _FAIL;
 
-	if (ieee80211_has_fromds(hdr->frame_control)) {
-		memcpy(pattrib->ra, pda, ETH_ALEN);
-		memcpy(pattrib->ta, pbssid, ETH_ALEN);
+	memcpy(pattrib->ra, hdr->addr1, ETH_ALEN);
+	memcpy(pattrib->ta, hdr->addr2, ETH_ALEN);
+
+	if (ieee80211_has_fromds(hdr->frame_control))
 		ret = ap2sta_data_frame(adapter, precv_frame, &psta);
-	} else if (ieee80211_has_tods(hdr->frame_control)) {
-		memcpy(pattrib->ra, pbssid, ETH_ALEN);
-		memcpy(pattrib->ta, psa, ETH_ALEN);
+	else if (ieee80211_has_tods(hdr->frame_control))
 		ret = sta2ap_data_frame(adapter, precv_frame, &psta);
-	} else {
-		memcpy(pattrib->ra, pda, ETH_ALEN);
-		memcpy(pattrib->ta, psa, ETH_ALEN);
+	else
 		ret = sta2sta_data_frame(adapter, precv_frame, &psta);
-	}
 
 	if (ret == _FAIL || ret == RTW_RX_HANDLED)
 		return ret;
-- 
2.30.2

