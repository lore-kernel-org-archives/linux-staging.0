Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D542F83
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 20:12:07 +0000 (UTC)
Received: from dslb-188-097-210-083.188.097.pools.vodafone-ip.de ([188.97.210.83] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lYaFS-0006ik-AY; Mon, 19 Apr 2021 22:11:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 1/4] staging: rtl8188eu: change bLeisurePs' type to bool
Date: Mon, 19 Apr 2021 22:11:23 +0200
Message-Id: <20210419201126.25633-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417180037.17806-1-martin@kaiser.cx>
References: <20210417180037.17806-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bLeisurePs is used as a boolean variable. Change its type from
u8 to bool.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - no change, re-sending the entire series

 drivers/staging/rtl8188eu/include/rtw_pwrctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h b/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h
index 06062643c868..4345dc0c7cf9 100644
--- a/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h
@@ -171,7 +171,7 @@ struct pwrctrl_priv {
 	unsigned long ips_deny_time; /* will deny IPS when system time less than this */
 	u8 ps_processing; /* temp used to mark whether in rtw_ps_processor */
 
-	u8	bLeisurePs;
+	bool	bLeisurePs;
 	u8	LpsIdleCount;
 	u8	power_mgnt;
 	u8	bFwCurrentInPSMode;
-- 
2.20.1

