Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8C70
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 16:59:26 +0000 (UTC)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lpZdt-0002hw-4Q; Sat, 05 Jun 2021 18:59:25 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/9] staging: rtl8188eu: simplify rtw_get_wireless_stats
Date: Sat,  5 Jun 2021 18:58:54 +0200
Message-Id: <20210605165858.3175-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210605165858.3175-1-martin@kaiser.cx>
References: <20210605165858.3175-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary temporary variables.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index ebd61ba93ef0..70c028e06aee 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -2920,25 +2920,18 @@ static struct iw_statistics *rtw_get_wireless_stats(struct net_device *dev)
 {
 	struct adapter *padapter = netdev_priv(dev);
 	struct iw_statistics *piwstats = &padapter->iwstats;
-	int tmp_level = 0;
-	int tmp_qual = 0;
-	int tmp_noise = 0;
 
 	if (!check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
 		piwstats->qual.qual = 0;
 		piwstats->qual.level = 0;
 		piwstats->qual.noise = 0;
 	} else {
-		tmp_level = padapter->recvpriv.signal_strength;
-		tmp_qual = padapter->recvpriv.signal_qual;
-		tmp_noise = padapter->recvpriv.noise;
-
-		piwstats->qual.level = tmp_level;
-		piwstats->qual.qual = tmp_qual;
-		piwstats->qual.noise = tmp_noise;
+		piwstats->qual.level = padapter->recvpriv.signal_strength;
+		piwstats->qual.qual = padapter->recvpriv.signal_qual;
+		piwstats->qual.noise = padapter->recvpriv.noise;
 	}
 	piwstats->qual.updated = IW_QUAL_ALL_UPDATED;/* IW_QUAL_DBM; */
-	return &padapter->iwstats;
+	return piwstats;
 }
 
 struct iw_handler_def rtw_handlers_def = {
-- 
2.20.1

