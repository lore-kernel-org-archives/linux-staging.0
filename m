Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED6D2F3C
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 19:37:48 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1neio7-0005fr-CM; Wed, 13 Apr 2022 21:37:39 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 4/8] staging: r8188eu: summarize two if statements
Date: Wed, 13 Apr 2022 21:36:50 +0200
Message-Id: <20220413193654.258507-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220413193654.258507-1-martin@kaiser.cx>
References: <20220409151557.207980-1-martin@kaiser.cx>
 <20220413193654.258507-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Summarize two if statements in rtw_pwr_wakeup and place the constants
on the right side of the comparison.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index fd7ea83968ed..ff96e5229b52 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -394,11 +394,10 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 		ret = _SUCCESS;
 		goto exit;
 	}
-	if (rf_off == pwrpriv->rf_pwrstate) {
-		if (_FAIL ==  ips_leave(padapter)) {
-			ret = _FAIL;
-			goto exit;
-		}
+
+	if (pwrpriv->rf_pwrstate == rf_off && ips_leave(padapter) == _FAIL) {
+		ret = _FAIL;
+		goto exit;
 	}
 
 	if (padapter->bDriverStopped || !padapter->bup || !padapter->hw_init_completed) {
-- 
2.30.2

