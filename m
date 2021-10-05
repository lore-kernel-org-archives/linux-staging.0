Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890AB2C81
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 20:25:30 +0000 (UTC)
Received: from ipservice-092-217-085-112.092.217.pools.vodafone-ip.de ([92.217.85.112] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mXqjt-000847-Sh; Tue, 05 Oct 2021 22:08:37 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/9] staging: r8188eu: remove an obsolete comment
Date: Tue,  5 Oct 2021 22:08:13 +0200
Message-Id: <20211005200821.19783-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function that this comment describes is not present in the
r8188eu driver. The comment can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 83813388de24..ab7b80144403 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -624,21 +624,6 @@ static void _InitAntenna_Selection(struct adapter *Adapter)
 	DBG_88E("%s,Cur_ant:(%x)%s\n", __func__, haldata->CurAntenna, (haldata->CurAntenna == Antenna_A) ? "Antenna_A" : "Antenna_B");
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	HwSuspendModeEnable92Cu()
- *
- * Overview:	HW suspend mode switch.
- *
- * Input:		NONE
- *
- * Output:	NONE
- *
- * Return:	NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	08/23/2010	MHC		HW suspend mode switch test..
- *---------------------------------------------------------------------------*/
 enum rt_rf_power_state RfOnOffDetect(struct adapter *adapt)
 {
 	u8 val8;
-- 
2.20.1

