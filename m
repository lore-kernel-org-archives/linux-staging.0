Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEA17C
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:56:04 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPtu-0004Tu-Vs; Sat, 06 Aug 2022 21:55:59 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/13] staging: r8188eu: remove _InitNormalChipOneOutEpPriority
Date: Sat,  6 Aug 2022 21:55:38 +0200
Message-Id: <20220806195540.777390-12-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220806195540.777390-1-martin@kaiser.cx>
References: <20220806195540.777390-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When _InitNormalChipOneOutEpPriority is called, pdvobjpriv->RtNumOutPipes
and haldata->OutEpQueueSel have already been initialized.

_InitNormalChipOneOutEpPriority is called only if
pdvobjpriv->RtNumOutPipes == 1. In this case, haldata->OutEpQueueSel is
always TX_SELE_HQ.

We can then simplify _InitNormalChipOneOutEpPriority to a single
_InitNormalChipRegPriority call, i.e. we can remove
_InitNormalChipOneOutEpPriority and call _InitNormalChipRegPriority
directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 25 ++---------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index f3314bed9285..a89db93840f3 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -225,28 +225,6 @@ static void _InitNormalChipRegPriority(struct adapter *Adapter, u16 beQ,
 	rtw_write16(Adapter, REG_TRXDMA_CTRL, value16);
 }
 
-static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
-{
-	struct hal_data_8188e *haldata = &Adapter->haldata;
-
-	u16 value = 0;
-	switch (haldata->OutEpQueueSel) {
-	case TX_SELE_HQ:
-		value = QUEUE_HIGH;
-		break;
-	case TX_SELE_LQ:
-		value = QUEUE_LOW;
-		break;
-	case TX_SELE_NQ:
-		value = QUEUE_NORMAL;
-		break;
-	default:
-		break;
-	}
-	_InitNormalChipRegPriority(Adapter, value, value, value, value,
-				   value, value);
-}
-
 static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
@@ -319,7 +297,8 @@ static void _InitQueuePriority(struct adapter *Adapter)
 
 	switch (pdvobjpriv->RtNumOutPipes) {
 	case 1:
-		_InitNormalChipOneOutEpPriority(Adapter);
+		_InitNormalChipRegPriority(Adapter, QUEUE_HIGH, QUEUE_HIGH, QUEUE_HIGH,
+					   QUEUE_HIGH, QUEUE_HIGH, QUEUE_HIGH);
 		break;
 	case 2:
 		_InitNormalChipTwoOutEpPriority(Adapter);
-- 
2.30.2

