Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6411FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:55:05 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V1-0008D7-1c; Sun, 03 Apr 2022 18:54:47 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/11] staging: r8188eu: use ieee80211 helper for source address
Date: Sun,  3 Apr 2022 18:54:28 +0200
Message-Id: <20220403165438.357728-2-martin@kaiser.cx>
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

Use the ieee80211_get_SA helper to get a pointer to the source
address of the incoming data frame.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 9f0bb29c9c56..597c6291f098 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -940,13 +940,14 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	u8 *psa, *pda, *pbssid;
 	struct sta_info *psta = NULL;
 	u8 *ptr = precv_frame->rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
 	struct rx_pkt_attrib	*pattrib = &precv_frame->attrib;
 	struct security_priv	*psecuritypriv = &adapter->securitypriv;
 	int ret = _SUCCESS;
 
 	bretry = GetRetry(ptr);
 	pda = get_da(ptr);
-	psa = get_sa(ptr);
+	psa = ieee80211_get_SA(hdr);
 	pbssid = get_hdr_bssid(ptr);
 
 	if (!pbssid) {
-- 
2.30.2

