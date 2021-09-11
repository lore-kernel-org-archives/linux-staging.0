Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577013FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 14:16:09 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP3na-0006bt-Bg; Sat, 11 Sep 2021 16:16:06 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/12] staging: r8188eu: remove unused enum and array
Date: Sat, 11 Sep 2021 16:15:18 +0200
Message-Id: <20210911141521.24901-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210911141521.24901-1-martin@kaiser.cx>
References: <20210911141521.24901-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PS_BBRegBackup in struct pwrctrl_priv is not used. Remove this component
and the related enum _PS_BBRegBackup_.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 97102c1ec553..bb0c9866fd61 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -53,14 +53,6 @@ enum rt_rf_power_state {
 	rf_max
 };
 
-enum _PS_BBRegBackup_ {
-	PSBBREG_RF0 = 0,
-	PSBBREG_RF1,
-	PSBBREG_RF2,
-	PSBBREG_AFE0,
-	PSBBREG_TOTALCNT
-};
-
 enum { /*  for ips_mode */
 	IPS_NONE = 0,
 	IPS_NORMAL,
@@ -126,7 +118,6 @@ struct pwrctrl_priv {
 	u8		bHWPwrPindetect;
 	u8		bkeepfwalive;
 	u8		brfoffbyhw;
-	unsigned long PS_BBRegBackup[PSBBREG_TOTALCNT];
 };
 
 #define rtw_get_ips_mode_req(pwrctrlpriv) \
-- 
2.20.1

