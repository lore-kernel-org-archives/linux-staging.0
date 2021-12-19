Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7BF2CAA
	for <linux-staging@lists.linux.dev>; Sun, 19 Dec 2021 18:39:54 +0000 (UTC)
Received: from dslb-188-097-041-189.188.097.pools.vodafone-ip.de ([188.97.41.189] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mz167-0000Iw-DL; Sun, 19 Dec 2021 19:39:51 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 8/9] staging: r8188: reformat the power transition steps
Date: Sun, 19 Dec 2021 19:39:25 +0100
Message-Id: <20211219183926.4746-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211219183926.4746-1-martin@kaiser.cx>
References: <20211219183926.4746-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the definitions of the power transition steps and address some
checkpatch warnings.

Reduce the line lengths where possible. Add spaces between elements.
Rewrite comments that are in contradiction with the definition they
describe.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 .../staging/r8188eu/include/Hal8188EPwrSeq.h  | 84 +++++++++----------
 1 file changed, 38 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188EPwrSeq.h b/drivers/staging/r8188eu/include/Hal8188EPwrSeq.h
index dc5cfc701aad..19cc5d627893 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPwrSeq.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPwrSeq.h
@@ -6,54 +6,46 @@
 
 #include "HalPwrSeqCmd.h"
 
-#define RTL8188E_TRANS_CARDEMU_TO_ACT														\
-	/* format */																\
-	/* { offset, cmd, msk, value }, comments here*/								\
-	{0x0006, PWR_CMD_POLLING, BIT(1), BIT(1)},/* wait till 0x04[17] = 1    power ready*/	\
-	{0x0002, PWR_CMD_WRITE, BIT(0)|BIT(1), 0}, /* 0x02[1:0] = 0	reset BB*/			\
-	{0x0026, PWR_CMD_WRITE, BIT(7), BIT(7)}, /*0x24[23] = 2b'01 schmit trigger */	\
-	{0x0005, PWR_CMD_WRITE, BIT(7), 0}, /* 0x04[15] = 0 disable HWPDN (control by DRV)*/\
-	{0x0005, PWR_CMD_WRITE, BIT(4)|BIT(3), 0}, /*0x04[12:11] = 2b'00 disable WL suspend*/	\
-	{0x0005, PWR_CMD_WRITE, BIT(0), BIT(0)}, /*0x04[8] = 1 polling until return 0*/	\
-	{0x0005, PWR_CMD_POLLING, BIT(0), 0}, /*wait till 0x04[8] = 0*/	\
-	{0x0023, PWR_CMD_WRITE, BIT(4), 0}, /*LDO normal mode*/	\
-
-#define RTL8188E_TRANS_ACT_TO_CARDEMU													\
-	/* format */																\
-	/* { offset, cmd, msk, value }, comments here*/								\
-	{0x001F, PWR_CMD_WRITE, 0xFF, 0},/*0x1F[7:0] = 0 turn off RF*/	\
-	{0x0023, PWR_CMD_WRITE, BIT(4), BIT(4)}, /*LDO Sleep mode*/	\
-	{0x0005, PWR_CMD_WRITE, BIT(1), BIT(1)}, /*0x04[9] = 1 turn off MAC by HW state machine*/	\
-	{0x0005, PWR_CMD_POLLING, BIT(1), 0}, /*wait till 0x04[9] = 0 polling until return 0 to disable*/	\
-
-#define RTL8188E_TRANS_CARDEMU_TO_CARDDIS													\
-	/* format */																\
-	/* { offset, cmd, msk, value },  comments here*/							\
-	{0x0026, PWR_CMD_WRITE, BIT(7), BIT(7)}, /*0x24[23] = 2b'01 schmit trigger */	\
-	{0x0005, PWR_CMD_WRITE, BIT(3)|BIT(4), BIT(3)}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
-	{0x0007, PWR_CMD_WRITE, 0xFF, 0}, /*  0x04[31:30] = 2b'10 enable enable bandgap mbias in suspend */	\
-	{0x0041, PWR_CMD_WRITE, BIT(4), 0}, /*Clear SIC_EN register 0x40[12] = 1'b0 */	\
-	{0xfe10, PWR_CMD_WRITE, BIT(4), BIT(4)}, /*Set USB suspend enable local register  0xfe10[4]=1 */	\
+/* The format of all power transition steps is: { offset, cmd, msk, value } */
+
+#define RTL8188E_TRANS_CARDEMU_TO_ACT	\
+	{ 0x0006, PWR_CMD_POLLING, BIT(1), BIT(1) },	\
+	{ 0x0002, PWR_CMD_WRITE, BIT(0) | BIT(1), 0 }, /* reset BB */	\
+	{ 0x0026, PWR_CMD_WRITE, BIT(7), BIT(7) }, /* schmitt trigger */	\
+	{ 0x0005, PWR_CMD_WRITE, BIT(7), 0 }, /* disable HWPDN (control by DRV)*/	\
+	{ 0x0005, PWR_CMD_WRITE, BIT(4) | BIT(3), 0 }, /* disable WL suspend*/	\
+	{ 0x0005, PWR_CMD_WRITE, BIT(0), BIT(0) },	\
+	{ 0x0005, PWR_CMD_POLLING, BIT(0), 0 },	\
+	{ 0x0023, PWR_CMD_WRITE, BIT(4), 0 }, /* LDO normal mode */
+
+#define RTL8188E_TRANS_ACT_TO_CARDEMU	\
+	{ 0x001F, PWR_CMD_WRITE, 0xFF, 0 },/* turn off RF */	\
+	{ 0x0023, PWR_CMD_WRITE, BIT(4), BIT(4) }, /* LDO Sleep mode */	\
+	{ 0x0005, PWR_CMD_WRITE, BIT(1), BIT(1) }, /* turn off MAC by HW state machine */	\
+	{ 0x0005, PWR_CMD_POLLING, BIT(1), 0 },
+
+#define RTL8188E_TRANS_CARDEMU_TO_CARDDIS	\
+	{ 0x0026, PWR_CMD_WRITE, BIT(7), BIT(7) }, /* schmitt trigger */	\
+	{ 0x0005, PWR_CMD_WRITE, BIT(3) | BIT(4), BIT(3) }, /* enable WL suspend */	\
+	{ 0x0007, PWR_CMD_WRITE, 0xFF, 0 }, /* enable bandgap mbias in suspend */	\
+	{ 0x0041, PWR_CMD_WRITE, BIT(4), 0 }, /* Clear SIC_EN register */	\
+	{ 0xfe10, PWR_CMD_WRITE, BIT(4), BIT(4) }, /* Set USB suspend enable local register */
 
 /* This is used by driver for LPSRadioOff Procedure, not for FW LPS Step */
-#define RTL8188E_TRANS_ACT_TO_LPS														\
-	/* format */																\
-	/* { offset, cmd, msk, value }, comments here				*/   \
-	{0x0522, PWR_CMD_WRITE, 0xFF, 0x7F},/*Tx Pause*/	\
-	{0x05F8, PWR_CMD_POLLING, 0xFF, 0},/*Should be zero if no packet is transmitting*/	\
-	{0x05F9, PWR_CMD_POLLING, 0xFF, 0},/*Should be zero if no packet is transmitting*/	\
-	{0x05FA, PWR_CMD_POLLING, 0xFF, 0},/*Should be zero if no packet is transmitting*/	\
-	{0x05FB, PWR_CMD_POLLING, 0xFF, 0},/*Should be zero if no packet is transmitting*/	\
-	{0x0002, PWR_CMD_WRITE, BIT(0), 0},/*CCK and OFDM are disabled,and clock are gated*/	\
-	{0x0002, PWR_CMD_DELAY, 0, PWRSEQ_DELAY_US},/*Delay 1us*/	\
-	{0x0100, PWR_CMD_WRITE, 0xFF, 0x3F},/*Reset MAC TRX*/	\
-	{0x0101, PWR_CMD_WRITE, BIT(1), 0},/*check if removed later*/	\
-	{0x0553, PWR_CMD_WRITE, BIT(5), BIT(5)},/*Respond TxOK to scheduler*/	\
-
-#define RTL8188E_TRANS_END															\
-	/* format */																\
-	/* { offset, cmd, msk, value },  comments here*/					\
-	{0xFFFF, PWR_CMD_END, 0, 0}, /*  */
+#define RTL8188E_TRANS_ACT_TO_LPS	\
+	{ 0x0522, PWR_CMD_WRITE, 0xFF, 0x7F },/* Tx Pause */	\
+	{ 0x05F8, PWR_CMD_POLLING, 0xFF, 0 }, /* Should be zero if no packet is transmitted */	\
+	{ 0x05F9, PWR_CMD_POLLING, 0xFF, 0 }, /* Should be zero if no packet is transmitted */	\
+	{ 0x05FA, PWR_CMD_POLLING, 0xFF, 0 }, /* Should be zero if no packet is transmitted */	\
+	{ 0x05FB, PWR_CMD_POLLING, 0xFF, 0 }, /* Should be zero if no packet is transmitted */	\
+	{ 0x0002, PWR_CMD_WRITE, BIT(0), 0 }, /* CCK and OFDM are disabled, clocks are gated */	\
+	{ 0x0002, PWR_CMD_DELAY, 0, PWRSEQ_DELAY_US },	\
+	{ 0x0100, PWR_CMD_WRITE, 0xFF, 0x3F }, /* Reset MAC TRX */	\
+	{ 0x0101, PWR_CMD_WRITE, BIT(1), 0 }, /* check if removed later */	\
+	{ 0x0553, PWR_CMD_WRITE, BIT(5), BIT(5) }, /* Respond TxOK to scheduler */
+
+#define RTL8188E_TRANS_END	\
+	{ 0xFFFF, PWR_CMD_END, 0, 0 },
 
 extern struct wl_pwr_cfg rtl8188E_power_on_flow[];
 extern struct wl_pwr_cfg rtl8188E_card_disable_flow[];
-- 
2.20.1

