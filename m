Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3D07B
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648740376;
	bh=6eNe0sCBAfB/Hcfduogy8j4fDGvYRi7JohyzMwaNYwc=;
	h=From:To:Cc:Subject:Date;
	b=JpISyFgjkY9ekyIBwFZaBXUpOFirDzI4eVKaJCW/DH/WxyAp30n4IO/frFXP1OOEr
	 gBB/Fl0sEuO6Q6HMdX8DOqF5rM8l8dqXV1vROqlRmaOBIadzzNwNG7kdTEzJrpYvLW
	 WMtGxPoo8KLDB1+H7MPw58hU4oxbZTyj5Uw7K2qE=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
	id 68DB8661; Thu, 31 Mar 2022 23:26:13 +0800
X-QQ-mid: xmsmtpt1648740373thyjaxjd9
Message-ID: <tencent_0AE833E7E70272D4518084C72B05FE17810A@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujP6ZwiqCqDasFNtR0GvcsI1nrPkLX6b36tQRgx8JFpF1v/39Xwb
	 7ccgrWcehKuTzSdNQS1f+Ep9OA+uXl4mucqtc4KNvoXuDsyWOjOkUtI9kZuItMmnooQxztrX09QR
	 hRh5GiNB32NIPIxvrmfNnoniks96XobZvyRQBeusGZotVrmLkPoHmrx24mI9Bmt/ahtdAOtWQcYu
	 834w8xHvRJR/cIklTr81l77/iK9HnOw4zm6KCEOlKNzSpy6b65KgPu83v2BRnP/22qC9CJ9+axJP
	 BOyxGFtQw6oBPyAwvcytfYB+NEhyELB6hhiuoyn2FV+4y9o0N000/641C+tvBdNvZje7vf3O0EP0
	 hR/PwyGIyV6Dl4deklwQfNF4oFvxTN0VPMQlWbMrDfcPAatl5mZwTJguA5QngCHRIE8+V1wHxvCf
	 3pAEQYTVX64NGZbP6w5CbGKw/alDJhcwJSBwHeEAro3GWn6l26wEV1H79EI+Bo52lG47huxxyLoN
	 jn1T5TnRoG5ubdZ1bSM2qbWXCsVAclYMzP2pr1Us5P8k16DcjIGT+y7QNUpjgMX7I2dG63kpuOmg
	 b2gQkQI1f25G2NA8BKnJHj98hxibd9bdrxVY+PdO7El+EX/DUdiRCAQVedP8A+AVa1HuVeP7/Zs+
	 hpWLYPQ7Y4eNx240jmfJYvwHw3CUwIbKhQEUWmfB+Tx0JRtTyictzJMDVumTNhOir4MGL3yzW+aQ
	 l+t6mDL6nnJbIq8zJr4nZbHHh7zyL75rIkxvJp5eISWaOOj1LhwgFkLqAfrHlWrDnO2qbeKkNMOh
	 Av3w9THovGFV3GqcQW98NECy4Co1ylnSs8NQRdJ7lqlhNiDn9aocOzyS6YT0dRXH98Wzrlq0eM2s
	 Tz/j/lpgT986M/0D8uiKGO+rFqVws5qZaTu3OHhutgnyYVMAzqpkvYVRdOS4icKjkq6kCyUEk6dt
	 jIa749J9twl1+pFoT8Ag==
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] staging: rtl8723bs: fix potential memory leak in _rtw_init_xmit_priv()
Date: Thu, 31 Mar 2022 23:26:04 +0800
X-OQ-MSGID: <20220331152604.8729-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In _rtw_init_xmit_priv(), there are several error paths for allocation
failures without releasing the resources.
To properly release them, several error handling paths are added.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 50 +++++++++++++++++------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 528f920..b288b04 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -112,7 +112,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->pallocated_xmitbuf) {
 		res = _FAIL;
-		goto exit;
+		goto free_frame_buf;
 	}
 
 	pxmitpriv->pxmitbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmitbuf), 4);
@@ -132,7 +132,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			msleep(10);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
-				goto exit;
+				goto free_xmitbuf;
 		}
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
@@ -162,7 +162,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	if (!pxmitpriv->xframe_ext_alloc_addr) {
 		pxmitpriv->xframe_ext = NULL;
 		res = _FAIL;
-		goto exit;
+		goto free_xmitbuf;
 	}
 	pxmitpriv->xframe_ext = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->xframe_ext_alloc_addr), 4);
 	pxframe = (struct xmit_frame *)pxmitpriv->xframe_ext;
@@ -195,7 +195,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->pallocated_xmit_extbuf) {
 		res = _FAIL;
-		goto exit;
+		goto free_xframe_ext;
 	}
 
 	pxmitpriv->pxmit_extbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmit_extbuf), 4);
@@ -210,10 +210,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
-		if (res == _FAIL) {
-			res = _FAIL;
-			goto exit;
-		}
+		if (res == _FAIL)
+			goto free_xmit_extbuf;
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMIT_EXTBUF_SZ;
@@ -240,10 +238,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->buf_tag = XMITBUF_CMD;
 
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
-			if (res == _FAIL) {
-				res = _FAIL;
-				goto exit;
-			}
+			if (res == _FAIL)
+				goto free_cmd_xmitbuf;
 
 			pxmitbuf->phead = pxmitbuf->pbuf;
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
@@ -255,7 +251,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	res = rtw_alloc_hwxmits(padapter);
 	if (res == _FAIL)
-		goto exit;
+		goto free_cmd_xmitbuf;
 	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 
 	for (i = 0; i < 4; i++)
@@ -267,6 +263,34 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	rtw_hal_init_xmit_priv(padapter);
 
+	return res;
+
+free_cmd_xmitbuf:
+	while (i-- > 0) {
+		pxmitbuf = &pxmitpriv->pcmd_xmitbuf[i];
+		if (pxmitbuf)
+			rtw_os_xmit_resource_free(padapter, pxmitbuf, MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ, true);
+	}
+	i = NR_XMIT_EXTBUFF;
+free_xmit_extbuf:
+	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
+	while (i-- > 0) {
+		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		pxmitbuf++;
+	}
+	vfree(pxmitpriv->pallocated_xmit_extbuf);
+free_xframe_ext:
+	vfree(pxmitpriv->xframe_ext_alloc_addr);
+	i = NR_XMITBUFF;
+free_xmitbuf:
+	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
+	while (i-- > 0) {
+		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		pxmitbuf++;
+	}
+	vfree(pxmitpriv->pallocated_xmitbuf);
+free_frame_buf:
+	vfree(pxmitpriv->pallocated_frame_buf);
 exit:
 	return res;
 }
-- 
