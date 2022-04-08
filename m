Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0A2368
	for <linux-staging@lists.linux.dev>; Fri,  8 Apr 2022 01:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1649381852;
	bh=AGpgReuc8vUqZuul0VY4Gnt/NTcYGzZUFJEPxGHjf6g=;
	h=From:To:Cc:Subject:Date;
	b=Wx3ainhsRe1F0qit34WgopLVnqyGVS7lv0i5yhPdlPQfrMi+VoS1f2TtbcAuK8zwW
	 JWxPADLGfJcVkItK5yjosu0paer8Z63r6GCcdQFRagQLUnJG2MvtqU0Q+uYNBe+GoC
	 aILLzxcjG2rpO6QQtloGjdy+6Qw3Tb0RG9/SsS+o=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrszc8.qq.com (NewEsmtp) with SMTP
	id 959184B6; Fri, 08 Apr 2022 09:37:25 +0800
X-QQ-mid: xmsmtpt1649381845t2pbyfq9s
Message-ID: <tencent_06FCFF1B2086CCD7B9C51C7C1490E1D64A08@qq.com>
X-QQ-XMAILINFO: MYvQTNt/YNi0Ht22sifMJZkDJEOTdZIkWvUEKnmsmcd2NKjpw0fqa/FI4yhq4H
	 V72SOGMMMrh5aPyK7YASGZPHMyBBuqUxxsV/xgReH+dnfG08tsolvXutT+2ADisXvwfCdCpSOHeu
	 RBBKl3ABpVkugU8s6MTYd5VQ2wnFOSNDKsJK/t6eE9A6rSOabWGtuoo4rg7xfPsmBgoDmOnjEDZw
	 LASiW6pLiHvvAJHdSvaal4rtrQJCuReqDYzwupgfOUESHf6eKVUv+DaRqJiWybYjKgi1ou2j9TKA
	 9ImC56nnCmWvyRrAGw/ZL2mna5S0g83HVcHMMRawCQuSVuA8ge0jarzybp87deJxxBg3jeqnDLfy
	 F8oePinmw1/vDf3Ok3P1H6JhWKlR0b6Gk46BBlGHHpEd3iOhI+2k715BGf2bltQhGgSg4yI3Sn2S
	 ziCeikjyOmpFmCZfgU8sO3JQzpBRDXvkv6icVwOvZTurpFsbhF18XkCGtbaB6lOAltxUoAcKxrrY
	 mG+z1BMZ/yOWUubYtGr8yMJTNloTB6NMrpZCAm9bYABeqaHelWoBoRhzalVhH06G+/CLQd5QYfPq
	 IfHucj2T6gFTRdHbnofK4E2XLFBuVH8fyjrkJiTUMbX0pTgXTm9sgTuhaKyeq9d7vWkhqaDRkcUe
	 2x3bwrcoVdn9JTQvf2hCTuiulN0UJuKLv99AGEqXYL4RJcxyvNuXM57yCh2wxg9DEbKvFrPt/9yC
	 fCy38Unt12qt5k0qAjmgWf6mGo3aynMaAwXxuaZ1+NVIcshVN6r2AtlqnJp2ZpKx+3TRc6wKdVdE
	 nJYXV0wHBLA9GhwXKwAas3WxRwdfBBvnJWHwqAZuMUMKj75HSD03j+Yje/9+EYEtHxAAf3r1NvMO
	 jKDoMXT2JIL4pqmoqFB0jXbFALo2XZ4sX0IYHloYUxssBZOWITAfpwAVq40VBGN+Q2H0k6vW2p
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org,
	paskripkin@gmail.com
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v3 1/2] staging: r8188eu: fix potential memory leak in _rtw_init_xmit_priv()
Date: Fri,  8 Apr 2022 09:37:10 +0800
X-OQ-MSGID: <20220408013710.15055-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In _rtw_init_xmit_priv(), there are several error paths for allocation
failures just jump to the `exit` section. However, there is no action
will be performed, so the allocated resources are not properly released,
which leads to various memory leaks.

To properly release them, this patch unifies the error handling code and
several error handling paths are added.
According to the allocation sequence, if the validation fails, it will
jump to its corresponding error tag to release the resources.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the description and adjust the sequence of patches.
v2->v3 None to this patch, but some to another pathch in this series.
 drivers/staging/r8188eu/core/rtw_xmit.c | 32 ++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index aede8ef..865b2fc 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -112,7 +112,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->pallocated_xmitbuf) {
 		res = _FAIL;
-		goto exit;
+		goto free_frame_buf;
 	}
 
 	pxmitpriv->pxmitbuf = (u8 *)N_BYTE_ALIGMENT((size_t)(pxmitpriv->pallocated_xmitbuf), 4);
@@ -134,7 +134,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			msleep(10);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
 			if (res == _FAIL)
-				goto exit;
+				goto free_xmitbuf;
 		}
 
 		pxmitbuf->flags = XMIT_VO_QUEUE;
@@ -152,7 +152,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->pallocated_xmit_extbuf) {
 		res = _FAIL;
-		goto exit;
+		goto free_xmitbuf;
 	}
 
 	pxmitpriv->pxmit_extbuf = (u8 *)N_BYTE_ALIGMENT((size_t)(pxmitpriv->pallocated_xmit_extbuf), 4);
@@ -167,10 +167,8 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->ext_tag = true;
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, max_xmit_extbuf_size + XMITBUF_ALIGN_SZ);
-		if (res == _FAIL) {
-			res = _FAIL;
-			goto exit;
-		}
+		if (res == _FAIL)
+			goto free_xmit_extbuf;
 
 		list_add_tail(&pxmitbuf->list, &pxmitpriv->free_xmit_extbuf_queue.queue);
 		pxmitbuf++;
@@ -200,8 +198,26 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	rtl8188eu_init_xmit_priv(padapter);
 
-exit:
+	return _SUCCESS;
 
+free_xmit_extbuf:
+	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
+	while (i-- > 0) {
+		rtw_os_xmit_resource_free(padapter, pxmitbuf, (max_xmit_extbuf_size + XMITBUF_ALIGN_SZ));
+		pxmitbuf++;
+	}
+	vfree(pxmitpriv->pallocated_xmit_extbuf);
+	i = NR_XMITBUFF;
+free_xmitbuf:
+	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
+	while (i-- > 0) {
+		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
+		pxmitbuf++;
+	}
+	vfree(pxmitpriv->pallocated_xmitbuf);
+free_frame_buf:
+	vfree(pxmitpriv->pallocated_frame_buf);
+exit:
 	return res;
 }
 
-- 
