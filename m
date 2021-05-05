Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE272
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 20:27:01 +0000 (UTC)
Received: from dslb-188-104-057-152.188.104.pools.vodafone-ip.de ([188.104.57.152] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1leO6m-0003aS-0o; Wed, 05 May 2021 22:27:00 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/6] staging: rtl8188eu: remove padapter from struct mlme_ext_priv
Date: Wed,  5 May 2021 22:26:22 +0200
Message-Id: <20210505202622.11087-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505202622.11087-1-martin@kaiser.cx>
References: <20210505202622.11087-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct mlme_ext_priv is an element of struct adapter. Use container_of
to get a pointer to the enclosing struct.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c    | 4 +---
 drivers/staging/rtl8188eu/include/rtw_mlme_ext.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index 50d3c3631be0..25118ca08562 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -4017,8 +4017,6 @@ int init_mlme_ext_priv(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	pmlmeext->padapter = padapter;
-
 	init_mlme_ext_priv_value(padapter);
 	pmlmeinfo->accept_addba_req = pregistrypriv->accept_addba_req;
 
@@ -4041,7 +4039,7 @@ int init_mlme_ext_priv(struct adapter *padapter)
 
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 {
-	struct adapter *padapter = pmlmeext->padapter;
+	struct adapter *padapter = container_of(pmlmeext, struct adapter, mlmeextpriv);
 
 	if (!padapter)
 		return;
diff --git a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
index 03d55eb7dc16..fcf366f9be90 100644
--- a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
@@ -383,7 +383,6 @@ struct p2p_oper_class_map {
 };
 
 struct mlme_ext_priv {
-	struct adapter	*padapter;
 	u8	mlmeext_init;
 	atomic_t	event_seq;
 	u16	mgnt_seq;
-- 
2.20.1

