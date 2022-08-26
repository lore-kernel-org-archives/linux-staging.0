Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4AF1FB2
	for <linux-staging@lists.linux.dev>; Fri, 26 Aug 2022 02:07:37 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 23CA51E80D96;
	Fri, 26 Aug 2022 09:58:30 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybcgZmHEZ7m6; Fri, 26 Aug 2022 09:58:27 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: yuzhe@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id DB4401E80D90;
	Fri, 26 Aug 2022 09:58:26 +0800 (CST)
From: Yu Zhe <yuzhe@nfschina.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	paskripkin@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liqiong@nfschina.com,
	Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] staging: r8188eu: use time_after_eq(a,b) to replace "a>=b"
Date: Fri, 26 Aug 2022 10:01:51 +0800
Message-Id: <20220826020151.10138-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

time_after_eq() deals with timer wrapping correctly.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 10550bd2c16d..870d81735b8d 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -89,7 +89,7 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 	struct wifidirect_info	*pwdinfo = &adapter->wdinfo;
 	bool ret = false;
 
-	if (adapter->pwrctrlpriv.ips_deny_time >= jiffies)
+	if (time_after_eq(adapter->pwrctrlpriv.ips_deny_time, jiffies))
 		goto exit;
 
 	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE | WIFI_SITE_MONITOR) ||
-- 
2.11.0

