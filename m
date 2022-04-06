Received: from out203-205-251-53.mail.qq.com (out203-205-251-53.mail.qq.com [203.205.251.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF817CA
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 03:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1649216860;
	bh=yj7NcvlYRMNO/RGY/g86/vf9wHVq0xTD1ZKTfb+GBg0=;
	h=From:To:Cc:Subject:Date;
	b=pnHlRDoqhKR7mdEscOLMNnNyoVTi2T6uaK2hhP6kNApYYPpLVwEup33gCQCqnTKS7
	 WrI2KP888qRvdqffpdMgUWxIQKzfwhmYsGphFnUkW8rZyKsUFTf3gVJCzucODAPl0m
	 KeDQvloChNUyP8ladIY7Aa8pKHk46PkzX1splruc=
Received: from localhost.localdomain ([43.227.136.188])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id BE4B001F; Wed, 06 Apr 2022 11:47:36 +0800
X-QQ-mid: xmsmtpt1649216856to394z7sf
Message-ID: <tencent_1D37399629C2C28395F0FE4940BA98DB7209@qq.com>
X-QQ-XMAILINFO: OG3fjXpkFjhKdEI16ZoyY6ObZyAeXL6lYK8xtwi92ADw9HAkE5w2kNRxBWsU2z
	 idAgETmYMXqf98nbbuLGXUqrVP+f7jXh7eQg0o22D9TvAWYOc+Nc+GsB5QcY1KaW5DrlqOJSUw9/
	 KnX5buemHIrL1fkyGnTISzVi/+XBFjeupMUjMN+LB599uA7hlA7mcg5u9/5Gq4PMdpqf4xCiPmyJ
	 i6RghOyLaVgihmIC7hv/eMwxOW3NcSXKnaKU3yC2KNoa0yeKIxqNvnDziHJm5DorUq2g3iGLLezq
	 7ed2RfDVjKE4EtN4F33BTVNAZI1yv3SEwG7fCu4KMaaQe8L3TrJUP6uOTn2slCSph73BKGLwFZch
	 RGsCz6tGG2hYZNaRSd+hfqsffrMZJHRsFCkhXi9VZpuFufVNuZtAZuQwyIzlORK0qYRzTKtKu+/y
	 hVFDI/L8VXuHPpPFo2TnFwdfmasOPadApJNxqCh5EDAFEVbpR83Byj6vmJDPSlclQsitysJ0QJbn
	 wH6fABG2q9YSEV3d43D6VQt2mxNJOZbTqJabMAN5j/pPIHiKCRQs/racrsFVxGNhQ8X4WAvEPaot
	 IrZ1DwDusqcFS99sExQvqeCVXjEt7d73Dua/UTSROD9jNVjneEn6iH/C7ncl71vUyWMSsFLRELbO
	 CiwA27M1Omm3atch3EbzZfGJ1SJIwioqD1d5oa0Al+8F14yAB5IAXiCdDmN0s9wPU4nXIiMSeyte
	 x0KKx7h93FU89Gkwkv2WHmNEfkC2kPcWRbu86Ta9UXJUHBq+fqFiUSWdUjp0mF6/71Z3SEsyBLpB
	 HYi18FF/UW1KZS0yxLFji7L2lcoUcg9/ap28Ly2NswbHS6H1xHh6+cm6+8dy9xEWKEc4/ualMk8y
	 9ub+lO8kyWHWZNZw8c0VSv0tuJRrboM2qxSGrgyCV/Tqv6Rpcpo+PByoPJ9g4sB3NPykNLcy3M
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v4] staging: r8188eu: fix a potential memory leak in _rtw_init_cmd_priv()
Date: Wed,  6 Apr 2022 11:47:22 +0800
X-OQ-MSGID: <20220406034722.12617-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In _rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated  
in failure, then `pcmdpriv->cmd_allocated_buf` will not be properly 
released. Besides, considering there are only two error paths and the 
first one can directly return, we do not need to implicitly jump to the 
`exit` tag to execute the error handling code.

So this patch added `kfree(pcmdpriv->cmd_allocated_buf);` on the error 
path to release the resource and simplified the return logic of 
_rtw_init_cmd_priv().

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2: simplify the function.
v2->v3: rebase and recover some whitespace cleanups.
v3->v4: update the description.
 drivers/staging/r8188eu/core/rtw_cmd.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 4eeb961..f6653d6 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -18,8 +18,6 @@ No irqsave is necessary.
 
 static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
-	int res = _SUCCESS;
-
 	init_completion(&pcmdpriv->enqueue_cmd);
 	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
 	init_completion(&pcmdpriv->start_cmd_thread);
@@ -34,27 +32,24 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ,
 					      GFP_KERNEL);
 
-	if (!pcmdpriv->cmd_allocated_buf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!pcmdpriv->cmd_allocated_buf)
+		return _FAIL;
 
 	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((size_t)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));
 
 	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);
 
 	if (!pcmdpriv->rsp_allocated_buf) {
-		res = _FAIL;
-		goto exit;
+		kfree(pcmdpriv->cmd_allocated_buf);
+		return _FAIL;
 	}
 
 	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((size_t)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_done_cnt = 0;
 	pcmdpriv->rsp_cnt = 0;
-exit:
 
-	return res;
+	return _SUCCESS;
 }
 
 static void c2h_wk_callback(struct work_struct *work);
-- 
