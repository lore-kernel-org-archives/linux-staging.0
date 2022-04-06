Received: from out203-205-251-80.mail.qq.com (out203-205-251-80.mail.qq.com [203.205.251.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6925317CA
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 03:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1649217045;
	bh=5jdw8RKiZGnQQuDSxJ+xf7FKkPdpchd+2LUxqYBwJ+k=;
	h=From:To:Cc:Subject:Date;
	b=Wyvr0KKfy8EsnDijAEggEal9rbIVxqxnjaqLf516Qd6cUnCMbMrSBXy8rvj1zkyVT
	 SYQx/mCVQVTF9j8NFopgYXenXB97Zc/tpwguLvJq8qP8nKjPy8LjNQd5cvJX8IPEXr
	 W3t8uoqwZiuCOAhA8jYix8W12vMjpAHRtfvrSkYY=
Received: from localhost.localdomain ([43.227.138.48])
	by newxmesmtplogicsvrszc11.qq.com (NewEsmtp) with SMTP
	id C62BE879; Wed, 06 Apr 2022 11:49:34 +0800
X-QQ-mid: xmsmtpt1649216974td65ko7ki
Message-ID: <tencent_5A192E178D4393A235FC57A9E9BF12E49305@qq.com>
X-QQ-XMAILINFO: NKv2G1wnhDBnIOY+fAUH+8MAtlSqWU1AoaNZRDnEzg80bxBn+3QSlas6n6CKH5
	 qAnzYE5xPX2rLbKpqSJ40XXPOlZ+gXyt5VQI6oUHRvXNJYqdaB10l+X6/4TjqwUuC/lyPIlYRJN7
	 vNdTDMqADsJ8gOW3A/7o9YhwtUZp7ihijiTdVpjskx6uzrSv0EThPzkp9TCTKp9rdRVLmXuNUejt
	 Gtlteq8Vry+U82ENL/RnlXZ0Pp1aLsEID05achHNIJ6Bc1VWiha3/fx1E2jt8Iu2mOswLX10bWpd
	 PGDyzGMEjsLEGx69LX0MdVKIvIOAiqhUV7gS6WSDk4L5gOtxSjndd49wxOmadDflzwdA0yEgeBfs
	 wIpeuxHIFRrVBWXvu7WiFW4Azbq8GQ9RDLs3iKSAnj5mdeUvPW/QZXBW+2vuhWlreEr0Y3WVIZjJ
	 I9biaTU9DODO4V2VQ3CPN79Wa2ksQYJy1AOyuGth7tDFxqz3wG/xmz5oZpElzBQlHWvFPzc5g5Z+
	 DX9ArgfAyaU8ZYoLp5OKbXlPg8/TlbWrrQcymLF0VHw5VewUiKOjYAtkWaN6tAZrO3Z2ND/eXAs3
	 v1PtLMKI14pkEnbzI3fmXQFr8lKgaSwVN5EimFY21zNCRx+Bp74aUnIYko3gzz+51iGErJFa/1W9
	 8xWxph+QKJS3fd9r6UV8J54o10XXxCfSs11JyRCV0ix7QYoclQGmHyqFgp5LiPqd9MfnDON/kD/r
	 fEcTHTmDCupZia/UrWM2sagCsWaw3eYVgiwheU1zdvkO2J8905lzV3UM4W+3qPte1bsE0ZfTIOXs
	 Eohwf3BUOIOp0/z6AssL6ww+dTF4zBY/xQtr1Mm2DXUsfFISQo39WJUHyi2UiMuePLYKnFw2Obz0
	 TIwwSNq0p4gE7nB6x6PcmbcUyfb9ae8jNgxkkkwSQsQJo7Qbc3OiE/sV6wch6bjyGecgq5rdyhdg
	 FHyvjygMkNooW9/EKlaSXy5DTkPmHHsHh6P0VyfHxAm1vg2QWuzg==
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
Date: Wed,  6 Apr 2022 11:49:23 +0800
X-OQ-MSGID: <20220406034923.12717-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated  
in failure, then `pcmdpriv->cmd_allocated_buf` will be not properly 
released. Besides, considering there are only two error paths and the 
first one can directly return, so we do not need implicitly jump to the 
`exit` tag to execute the error handler.

So this patch added `kfree(pcmdpriv->cmd_allocated_buf);` on the error 
path to release the resource and simplified the return logic of 
rtw_init_cmd_priv().

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the description.
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index e574893..9126ea9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -161,8 +161,6 @@ static struct cmd_hdl wlancmds[] = {
 
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
-	int res = 0;
-
 	init_completion(&pcmdpriv->cmd_queue_comp);
 	init_completion(&pcmdpriv->terminate_cmdthread_comp);
 
@@ -175,18 +173,17 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 
 	pcmdpriv->cmd_allocated_buf = rtw_zmalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ);
 
-	if (!pcmdpriv->cmd_allocated_buf) {
-		res = -ENOMEM;
-		goto exit;
-	}
+	if (!pcmdpriv->cmd_allocated_buf)
+		return -ENOMEM;
 
 	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
 
 	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
 
 	if (!pcmdpriv->rsp_allocated_buf) {
-		res = -ENOMEM;
-		goto exit;
+		kfree(pcmdpriv->cmd_allocated_buf);
+		pcmdpriv->cmd_allocated_buf = NULL;
+		return -ENOMEM;
 	}
 
 	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
@@ -196,8 +193,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 	pcmdpriv->rsp_cnt = 0;
 
 	mutex_init(&pcmdpriv->sctx_mutex);
-exit:
-	return res;
+
+	return 0;
 }
 
 static void c2h_wk_callback(struct work_struct *work);
-- 
