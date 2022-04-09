Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCA1A34
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 16:32:27 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndE0d-0006Rg-SG; Sat, 09 Apr 2022 18:32:23 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/10] staging: r8188eu: improve timeout handling in LPS_RF_ON_check
Date: Sat,  9 Apr 2022 18:32:09 +0200
Message-Id: <20220409163212.241122-8-martin@kaiser.cx>
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
LPS_RF_ON_check.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index ffafeb7f9c47..1aebf9400f12 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -239,10 +239,9 @@ static bool lps_rf_on(struct adapter *adapter)
  */
 static s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 {
-	u32 start_time;
+	unsigned long timeout = jiffies + msecs_to_jiffies(delay_ms);
 	s32 err = 0;
 
-	start_time = jiffies;
 	while (1) {
 		if (lps_rf_on(padapter))
 			break;
@@ -252,7 +251,7 @@ static s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			break;
 		}
 
-		if (rtw_get_passing_time_ms(start_time) > delay_ms) {
+		if (time_after(jiffies, timeout)) {
 			err = -1;
 			break;
 		}
-- 
2.30.2

