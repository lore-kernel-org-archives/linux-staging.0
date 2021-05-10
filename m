Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096870
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 08:49:17 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FdvmX4V8szkYF3;
	Mon, 10 May 2021 16:46:36 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 16:49:08 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging
	<linux-staging@lists.linux.dev>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] staging: rtl8723bs: Delete two redundant condition branches
Date: Mon, 10 May 2021 16:49:01 +0800
Message-ID: <20210510084901.3421-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected

The statement of the "if (check_fwstate(pmlmepriv, WIFI_AP_STATE))" branch
is the same as the "else" branch. Delete it to simplify code.

No functional change.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 160f624612c778c..8bb9355d072b68d 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1192,8 +1192,6 @@ int rtw_suspend_common(struct adapter *padapter)
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
 		rtw_suspend_normal(padapter);
-	else if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
-		rtw_suspend_normal(padapter);
 	else
 		rtw_suspend_normal(padapter);
 
@@ -1275,8 +1273,6 @@ int rtw_resume_common(struct adapter *padapter)
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		rtw_resume_process_normal(padapter);
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
-		rtw_resume_process_normal(padapter);
 	} else {
 		rtw_resume_process_normal(padapter);
 	}
-- 
2.26.0.106.g9fadedd


