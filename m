Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969817CA
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 03:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1649217082;
	bh=zJFkZzqZthfWKrX/zbSrPfFnqxzqHvVv4Csfy9NuN4g=;
	h=From:To:Cc:Subject:Date;
	b=s5xSy1EHmuX3LsvO+Nx7FaydXFQceHBv4DcV5TLTVEylib6GVDlqaM1kAsP/QGURI
	 9lBiL/bANjvnM6B2al9/3Svi2SvMOSg+HrCgtGbzaS5QK00chkqWbx8M0alj2heibI
	 bTm7rdlNm5YM3FFyPEbUlfWgBPjP+qEoSgQui/74=
Received: from localhost.localdomain ([43.227.136.188])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id C8B2E245; Wed, 06 Apr 2022 11:50:11 +0800
X-QQ-mid: xmsmtpt1649217011tba63epip
Message-ID: <tencent_0D2E31C704054CF88F12F6FF114803B34106@qq.com>
X-QQ-XMAILINFO: OJV4F5WcWfWafbtek9ZeR1+BxzU4H4LqqfBQzbRUrASnC0l5H8Io4igjpzafji
	 84wV1JwjWN33McDWy4ILmtIDT7dxOaLGjPvX+RoCby4d8cn2z/pYiNqI7DjmGymK1jcYWaAZboQ5
	 /dyK+9lPw4jCzShkVve2Vsod9vZix5+6Bnlh92E3RjvbxY8Khk5E4TXGi4vJZFmvHSidkd/ILWsx
	 wNVS6aUeAhOIemejsFmfXhNyZvlp6RuOBUQ1Rj6zKFPhyK3cbkAD9lmUDktVNEZzTF+N7FgG8l56
	 t+9zCgtX2/suAxCnUeOCOI7UcdT12xOh+yxC4r2oITifegyQtsAt/lTrNxmhgyXksMEgrm1agzh+
	 DT5gZ/16jHv3pcqoGj6+L/40TnhcnwPBnimrkS4VNTWeAZ0e33gqhnh/WMlKazLjOtkssErNX07j
	 gDJBXb1YGJes9QoJO+rg26kxVQ0gZKF7379kwCz69kyoTKSWTSUL/Lg6XizVbJkcgR4h7EfgoTEc
	 cZgNTeoQBNNdWZHBEu28luuG1hHNR+JgQOcqXqsEbjhPnOFebspihnx4tOiTFLPzs6PbDoakzP+a
	 Fk8EQApApQGdChzDUm5TJeOxda7t6GJld4tKBfc2ypVKrdbVM4q2/OujrpEOuiMnSHoZumi6DswX
	 vTgig5tcSWGt7ivxGPUP2fq2JJAZL+4Cb1QPb9FZFghiZqgU3ERI623fiVoVRJ95pVi6KxQVXuuO
	 AxXUSCnmz8cNXuLMNkSSQPpt8Vu6sd8sOVmwNrL8Z654ABwDKYibmaFOlke4FykjntZRbMVcy0l0
	 P180k+m3bDhrb3TghdZNsesvMCnOdSL7Z9iL+c17vP49oNZFvkhD1WBAS9IdsUMYGfjuvUZVNcDV
	 G2DYJD3hoKyEMVHO3BhHBIWrzAJj4z/l9CzMr3vpF58WSUEFs15CBiOY8Vh6DEIWkktlU+PEGEXm
	 lBK45r5jujTh9KqkhUNlif8nUFLQ/j
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix potential memory leak in _rtw_init_xmit_priv()
Date: Wed,  6 Apr 2022 11:50:01 +0800
X-OQ-MSGID: <20220406035001.12744-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In _rtw_init_xmit_priv(), there are seven error paths for allocation  
failures without releasing the resources but directly goto `exit`, while   
the exit section only executes `return res;`, which leads to various 
memory leaks.

To properly release them, this patch unifies the error handlers of 
_rtw_init_xmit_priv() and several error handling paths are added.
According to the allocation sequence, each error will jump to its 
corresponding error handling tag.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the description.
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
