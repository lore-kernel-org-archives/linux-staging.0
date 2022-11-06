Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E57258B
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 12:49:19 +0000 (UTC)
Received: from ipservice-092-217-068-220.092.217.pools.vodafone-ip.de ([92.217.68.220] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1orf5K-0008Dj-HH; Sun, 06 Nov 2022 13:49:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/9] staging: r8188eu: reorder assignments, clarify the header format
Date: Sun,  6 Nov 2022 13:48:55 +0100
Message-Id: <20221106124901.720785-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221106124901.720785-1-martin@kaiser.cx>
References: <20221106124901.720785-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder some of the assignments in update_recvframe_attrib_88e.

This should make it a bit easier to understand the format of the header
that is added by the chip's firmware.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index 9a61eef8550b..d1ac2960f1c4 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -66,28 +66,25 @@ void update_recvframe_attrib_88e(struct recv_frame *precvframe, struct recv_stat
 
 	if (pattrib->pkt_rpt_type == NORMAL_RX) {
 		pattrib->pkt_len = le32_to_cpu(prxstat->rxdw0) & 0x00003fff;
+		pattrib->icv_err = (le32_to_cpu(prxstat->rxdw0) >> 15) & 0x1;
 		pattrib->drvinfo_sz = ((le32_to_cpu(prxstat->rxdw0) >> 16) & 0xf) * 8;
-
+		pattrib->encrypt = (u8)((le32_to_cpu(prxstat->rxdw0) >> 20) & 0x7);
+		pattrib->qos = (le32_to_cpu(prxstat->rxdw0) >> 23) & 0x1;
+		pattrib->shift_sz = (le32_to_cpu(prxstat->rxdw0) >> 24) & 0x3;
 		pattrib->physt = (le32_to_cpu(prxstat->rxdw0) >> 26) & 0x1;
-
 		pattrib->bdecrypted = (le32_to_cpu(prxstat->rxdw0) & BIT(27)) ? 0 : 1;
-		pattrib->encrypt = (le32_to_cpu(prxstat->rxdw0) >> 20) & 0x7;
 
-		pattrib->qos = (le32_to_cpu(prxstat->rxdw0) >> 23) & 0x1;
 		pattrib->priority = (le32_to_cpu(prxstat->rxdw1) >> 8) & 0xf;
-
 		pattrib->amsdu = (le32_to_cpu(prxstat->rxdw1) >> 13) & 0x1;
+		pattrib->mdata = (le32_to_cpu(prxstat->rxdw1) >> 26) & 0x1;
+		pattrib->mfrag = (le32_to_cpu(prxstat->rxdw1) >> 27) & 0x1;
 
 		pattrib->seq_num = le32_to_cpu(prxstat->rxdw2) & 0x00000fff;
 		pattrib->frag_num = (le32_to_cpu(prxstat->rxdw2) >> 12) & 0xf;
-		pattrib->mfrag = (le32_to_cpu(prxstat->rxdw1) >> 27) & 0x1;
-		pattrib->mdata = (le32_to_cpu(prxstat->rxdw1) >> 26) & 0x1;
 
 		pattrib->mcs_rate = le32_to_cpu(prxstat->rxdw3) & 0x3f;
 		pattrib->rxht = (le32_to_cpu(prxstat->rxdw3) >> 6) & 0x1;
 
-		pattrib->icv_err = (le32_to_cpu(prxstat->rxdw0) >> 15) & 0x1;
-		pattrib->shift_sz = (le32_to_cpu(prxstat->rxdw0) >> 24) & 0x3;
 	} else if (pattrib->pkt_rpt_type == TX_REPORT1) { /* CCX */
 		pattrib->pkt_len = TX_RPT1_PKT_LEN;
 	} else if (pattrib->pkt_rpt_type == TX_REPORT2) {
-- 
2.30.2

