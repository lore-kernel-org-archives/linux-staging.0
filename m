Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B0670
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD6F361055;
	Fri, 30 Jul 2021 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637083;
	bh=mtioYFrd9yg/XGTrS9az4Z0+xpCf2JX0rx0lkAOfVII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iVm6vUfLyXWBSCKlZjOA2I8kOZioM2pIklWY3GsmD10jTFbFi85ZLdgq7hhyq1Ivr
	 iSCpgbURDnTvdkIOKMO08930p1XDRgEcnls2O7AOxakw4TNs4oBydKZ0j2PRX+2gqe
	 Gsaxbzh0rN0OgApyZ6fHTZQO6CBFIg329eM089Bg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 08/12] staging: r8188eu: remove rtw_buf_free() function
Date: Fri, 30 Jul 2021 11:24:13 +0200
Message-Id: <20210730092417.1014392-8-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3843; h=from:subject; bh=mtioYFrd9yg/XGTrS9az4Z0+xpCf2JX0rx0lkAOfVII=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx38Lmw0vi/F5ztjysTbMjtm7vFj2Ork1+aQUDt/w2zb 5lnZHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCR5/4MC3q9Gq6WvYtPyN1rmxfDeV S99oAJC1CUNyz09ffdva/XeQk/MFihutNMaTMA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

It is just a wrapper around kfree(), so just replace all calls with
kfree() instead.  The pointer is also set to NULL and the length set to
0 to emulate the original logic, just to be "safe" as I do not have a
device to test with, but odds are that can be removed later on.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/core/rtw_mlme.c         |  8 ++++++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c     | 11 ++++++++---
 drivers/staging/r8188eu/include/osdep_service.h |  1 -
 drivers/staging/r8188eu/os_dep/osdep_service.c  |  7 -------
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 887e3a89bd27..8266e9a88e01 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -102,8 +102,12 @@ static void rtw_free_mlme_ie_data(u8 **ppie, u32 *plen)
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 {
-	rtw_buf_free(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len);
-	rtw_buf_free(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len);
+	kfree(&pmlmepriv->assoc_req);
+	pmlmepriv->assoc_req = NULL;
+	pmlmepriv->assoc_req_len = 0;
+	kfree(&pmlmepriv->assoc_rsp);
+	pmlmepriv->assoc_rsp = NULL;
+	pmlmepriv->assoc_rsp_len = 0;
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_beacon_ie, &pmlmepriv->wps_beacon_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_probe_req_ie, &pmlmepriv->wps_probe_req_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_probe_resp_ie, &pmlmepriv->wps_probe_resp_ie_len);
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 488a18133e59..36b4e073d24c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1522,7 +1522,9 @@ unsigned int OnAssocRsp(struct adapter *padapter, struct recv_frame *precv_frame
 	if (res > 0) {
 		rtw_buf_update(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len, pframe, pkt_len);
 	} else {
-		rtw_buf_free(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len);
+		kfree(&pmlmepriv->assoc_rsp);
+		pmlmepriv->assoc_rsp = NULL;
+		pmlmepriv->assoc_rsp_len = 0;
 	}
 
 	report_join_res(padapter, res);
@@ -5549,8 +5551,11 @@ void issue_assocreq(struct adapter *padapter)
 exit:
 	if (ret == _SUCCESS)
 		rtw_buf_update(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len, (u8 *)pwlanhdr, pattrib->pktlen);
-	else
-		rtw_buf_free(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len);
+	else {
+		kfree(&pmlmepriv->assoc_req);
+		pmlmepriv->assoc_req = NULL;
+		pmlmepriv->assoc_req_len = 0;
+	}
 
 	return;
 }
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index ac45eec75153..df59fa325e6e 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -440,7 +440,6 @@ u64 rtw_division64(u64 x, u64 y);
 			 (((u64) (a)[3]) << 24) | (((u64) (a)[2]) << 16) | \
 			 (((u64) (a)[1]) << 8) | ((u64) (a)[0]))
 
-void rtw_buf_free(u8 **buf, u32 *buf_len);
 void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len);
 
 struct rtw_cbuf {
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index d11718013cf9..182f8e9cd199 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -388,13 +388,6 @@ u64 rtw_division64(u64 x, u64 y)
 	return x;
 }
 
-void rtw_buf_free(u8 **buf, u32 *buf_len)
-{
-	*buf_len = 0;
-	kfree(*buf);
-	*buf = NULL;
-}
-
 void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 {
 	u32 ori_len = 0, dup_len = 0;
-- 
2.32.0

