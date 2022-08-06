Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAA67C
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:55:59 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPtq-0004Tu-QA; Sat, 06 Aug 2022 21:55:54 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/13] staging: r8188eu: remove OutEpNumber
Date: Sat,  6 Aug 2022 21:55:33 +0200
Message-Id: <20220806195540.777390-7-martin@kaiser.cx>
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

Remove the OutEpNumber component of struct hal_data_8188e.
RtNumOutPipes in struct dvobj_priv stores the same info.

Update the only place where OutEpNumber is read.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 7 ++-----
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 1 -
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 603108a5d794..664028c14141 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -110,17 +110,14 @@ int rtl8188eu_interface_configure(struct adapter *adapt)
 	switch (pdvobjpriv->RtNumOutPipes) {
 	case 3:
 		haldata->OutEpQueueSel = TX_SELE_HQ | TX_SELE_LQ | TX_SELE_NQ;
-		haldata->OutEpNumber = 3;
 		three_out_pipe(adapt, wifi_cfg);
 		break;
 	case 2:
 		haldata->OutEpQueueSel = TX_SELE_HQ | TX_SELE_NQ;
-		haldata->OutEpNumber = 2;
 		two_out_pipe(adapt, wifi_cfg);
 		break;
 	case 1:
 		haldata->OutEpQueueSel = TX_SELE_HQ;
-		haldata->OutEpNumber = 1;
 		one_out_pipe(adapt);
 		break;
 	default:
@@ -358,9 +355,9 @@ static void _InitNormalChipThreeOutEpPriority(struct adapter *Adapter)
 
 static void _InitQueuePriority(struct adapter *Adapter)
 {
-	struct hal_data_8188e *haldata = &Adapter->haldata;
+	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(Adapter);
 
-	switch (haldata->OutEpNumber) {
+	switch (pdvobjpriv->RtNumOutPipes) {
 	case 1:
 		_InitNormalChipOneOutEpPriority(Adapter);
 		break;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index fdc187f4deaa..ff0a4ce19dde 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -150,7 +150,6 @@ struct hal_data_8188e {
 	u8	TRxAntDivType;
 
 	u8	OutEpQueueSel;
-	u8	OutEpNumber;
 
 	struct P2P_PS_Offload_t	p2p_ps_offload;
 
-- 
2.30.2

