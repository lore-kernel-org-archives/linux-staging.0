Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B173B1B79
	for <linux-staging@lists.linux.dev>; Sat,  5 Mar 2022 14:41:41 +0000 (UTC)
Received: from dslb-084-059-247-134.084.059.pools.vodafone-ip.de ([84.59.247.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nQVbG-0007ms-Fk; Sat, 05 Mar 2022 15:41:38 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/5] staging: r8188eu: don't initialize drvinfo_sz to 0
Date: Sat,  5 Mar 2022 15:41:15 +0100
Message-Id: <20220305144117.1380534-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220305144117.1380534-1-martin@kaiser.cx>
References: <20220305144117.1380534-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In update_recvframe_attrib_88e, there's an initial memset which sets
all of pattrib to 0. There's no need to set pattrib->drvinfo_sz = 0
again later.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index aee6b8c23811..6b83d7e80ad9 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -91,10 +91,8 @@ void update_recvframe_attrib_88e(struct recv_frame *precvframe, struct recv_stat
 		pattrib->shift_sz = (u8)((le32_to_cpu(prxstat->rxdw0) >> 24) & 0x3);
 	} else if (pattrib->pkt_rpt_type == TX_REPORT1) { /* CCX */
 		pattrib->pkt_len = TX_RPT1_PKT_LEN;
-		pattrib->drvinfo_sz = 0;
 	} else if (pattrib->pkt_rpt_type == TX_REPORT2) { /*  TX RPT */
 		pattrib->pkt_len = (u16)(le32_to_cpu(prxstat->rxdw0) & 0x3FF);/* Rx length[9:0] */
-		pattrib->drvinfo_sz = 0;
 
 		/*  */
 		/*  Get TX report MAC ID valid. */
-- 
2.30.2

