Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DA7E
	for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 09:24:27 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 11 Mar
 2022 17:23:11 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 11 Mar
 2022 17:23:08 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Haowen
 Bai" <baihaowen@meizu.com>
Subject: [PATCH] staging: r8188eu: Directly return 0 instead of using local ret variable
Date: Fri, 11 Mar 2022 17:23:06 +0800
Message-ID: <1646990586-14794-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

fixes coccinelle warning:
drivers/staging/r8188eu/hal/rtl8188eu_xmit.c:152:5-9: Unneeded variable: "pull". Return "0" on line 302

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 293541d..6ab89f8 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -149,7 +149,6 @@ static void fill_txdesc_phy(struct pkt_attrib *pattrib, __le32 *pdw)
 
 static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bagg_pkt)
 {
-	int	pull = 0;
 	uint	qsel;
 	u8 data_rate, pwr_status, offset;
 	struct adapter		*adapt = pxmitframe->padapter;
@@ -299,7 +298,8 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
 	ODM_SetTxAntByTxInfo_88E(&haldata->odmpriv, pmem, pattrib->mac_id);
 
 	rtl8188eu_cal_txdesc_chksum(ptxdesc);
-	return pull;
+
+	return 0;
 }
 
 /* for non-agg data frame or  management frame */
-- 
2.7.4

