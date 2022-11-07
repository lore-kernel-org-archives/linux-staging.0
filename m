Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC7122AC
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 20:28:42 +0000 (UTC)
Received: from ipservice-092-217-067-198.092.217.pools.vodafone-ip.de ([92.217.67.198] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1os8jW-0004bP-PW; Mon, 07 Nov 2022 21:28:38 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 1/3] staging: r8188eu: use a qos_hdr in validate_recv_data_frame
Date: Mon,  7 Nov 2022 21:28:22 +0100
Message-Id: <20221107202824.61431-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107202824.61431-1-martin@kaiser.cx>
References: <20221107202824.61431-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a struct ieee80211_qos_hdr in the validate_recv_data_frame
function. Use this struct to replace some numeric offsets and make the
code easier to understand.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
Changes in v2
- fixed hdrlen calculation

 drivers/staging/r8188eu/core/rtw_recv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index cb0f35d7ab98..5b0a66aebff1 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1032,7 +1032,6 @@ static int validate_recv_data_frame(struct adapter *adapter,
 				    struct recv_frame *precv_frame)
 {
 	struct sta_info *psta = NULL;
-	u8 *ptr = precv_frame->rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
 	struct rx_pkt_attrib	*pattrib = &precv_frame->attrib;
 	struct security_priv	*psecuritypriv = &adapter->securitypriv;
@@ -1071,10 +1070,12 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	pattrib->ack_policy = 0;
 	/* parsing QC field */
 	if (pattrib->qos) {
+		struct ieee80211_qos_hdr *qos_hdr = (struct ieee80211_qos_hdr *)hdr;
+
 		pattrib->priority = ieee80211_get_tid(hdr);
-		pattrib->ack_policy = GetAckpolicy((ptr + 24));
-		pattrib->amsdu = GetAMsdu((ptr + 24));
-		pattrib->hdrlen = 26;
+		pattrib->ack_policy = GetAckpolicy(&qos_hdr->qos_ctrl);
+		pattrib->amsdu = GetAMsdu(&qos_hdr->qos_ctrl);
+		pattrib->hdrlen = sizeof(*qos_hdr);
 
 		if (pattrib->priority != 0 && pattrib->priority != 3)
 			adapter->recvpriv.bIsAnyNonBEPkts = true;
-- 
2.30.2

