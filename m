Received: from mail.meizu.com (edge01.meizu.com [14.29.68.187])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AF87C
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 11:06:21 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 29 Mar
 2022 19:06:13 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 29 Mar
 2022 19:06:12 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter
	<phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Haowen Bai <baihaowen@meizu.com>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: r8188eu: Directly return _SUCCESS instead of using local ret variable
Date: Tue, 29 Mar 2022 19:06:06 +0800
Message-ID: <1648551967-23627-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <d293aee5-6065-9d87-0906-438542a8be84@meizu.com>
References: <d293aee5-6065-9d87-0906-438542a8be84@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

As init_mlme_ext_priv function always returns SUCCESS , We can change
return type from int to void.

fixes coccinelle warning:
./drivers/staging/r8188eu/core/rtw_mlme_ext.c:357:5-8: Unneeded variable: "res".
 Return "_SUCCESS" on line 380

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 5 +----
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c      | 8 +-------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 10d5f12..ff48293 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -352,9 +352,8 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	return chanset_size;
 }
 
-int	init_mlme_ext_priv(struct adapter *padapter)
+void init_mlme_ext_priv(struct adapter *padapter)
 {
-	int	res = _SUCCESS;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -376,8 +375,6 @@ int	init_mlme_ext_priv(struct adapter *padapter)
 	pmlmeext->mlmeext_init = true;
 
 	pmlmeext->active_keep_alive_check = true;
-
-	return res;
 }
 
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 0c555ea..827ac6c 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -419,7 +419,7 @@ struct mlme_ext_priv {
 	u8 active_keep_alive_check;
 };
 
-int init_mlme_ext_priv(struct adapter *adapter);
+void init_mlme_ext_priv(struct adapter *adapter);
 int init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv (struct mlme_ext_priv *pmlmeext);
 extern void init_mlme_ext_timer(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 550721e..ca1c4df 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -490,10 +490,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	init_wifidirect_info(padapter, P2P_ROLE_DISABLE);
 	reset_global_wifidirect_info(padapter);
 
-	if (init_mlme_ext_priv(padapter) == _FAIL) {
-		dev_err(dvobj_to_dev(padapter->dvobj), "init_mlme_ext_priv failed\n");
-		goto free_mlme_priv;
-	}
+	init_mlme_ext_priv(padapter);
 
 	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL) {
 		dev_err(dvobj_to_dev(padapter->dvobj), "_rtw_init_xmit_priv failed\n");
@@ -534,9 +531,6 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 free_mlme_ext:
 	free_mlme_ext_priv(&padapter->mlmeextpriv);
 
-free_mlme_priv:
-	rtw_free_mlme_priv(&padapter->mlmepriv);
-
 free_evt_priv:
 	rtw_free_evt_priv(&padapter->evtpriv);
 
-- 
2.7.4

