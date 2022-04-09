Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BEA31
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 16:32:27 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndE0e-0006Rg-QC; Sat, 09 Apr 2022 18:32:24 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/10] staging: r8188eu: improve timeout handling in iol_execute
Date: Sat,  9 Apr 2022 18:32:10 +0200
Message-Id: <20220409163212.241122-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409163212.241122-1-martin@kaiser.cx>
References: <20220409163212.241122-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the standard kernel functions to define and check the timeout in
iol_execute.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 609138887b25..efdadfb61905 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -33,17 +33,16 @@ static s32 iol_execute(struct adapter *padapter, u8 control)
 {
 	s32 status = _FAIL;
 	u8 reg_0x88 = 0;
-	u32 start = 0, passing_time = 0;
+	unsigned long timeout;
 
 	control = control & 0x0f;
 	reg_0x88 = rtw_read8(padapter, REG_HMEBOX_E0);
 	rtw_write8(padapter, REG_HMEBOX_E0,  reg_0x88 | control);
 
-	start = jiffies;
+	timeout = jiffies + msecs_to_jiffies(1000);
 	while ((reg_0x88 = rtw_read8(padapter, REG_HMEBOX_E0)) & control &&
-	       (passing_time = rtw_get_passing_time_ms(start)) < 1000) {
+		time_before(jiffies, timeout))
 		;
-	}
 
 	reg_0x88 = rtw_read8(padapter, REG_HMEBOX_E0);
 	status = (reg_0x88 & control) ? _FAIL : _SUCCESS;
-- 
2.30.2

