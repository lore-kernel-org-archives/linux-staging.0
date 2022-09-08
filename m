Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158A47C
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1662622393;
	bh=28ZeIHtLy4fSUpsw0G6PvyUZcFFeSa2cafIP6grxt64=;
	h=From:To:Cc:Subject:Date;
	b=wVRVJ1WR1IJ6uJsBx4tUIMiKs+aOMMW02uJAlKJO772z9EpESblKcR9nxBb+7tsDM
	 4tjczren8v7AjCI1dDeUByW2KS8QhGSLZ0z2V6CHysP0g1DLclK4T3QRXexEqyFT+n
	 8aDbDZd+g+vGdet2wFuWpObI+2qzzrCK3izwwf/0=
Received: from localhost.localdomain ([59.172.176.188])
	by newxmesmtplogicsvrszc14.qq.com (NewEsmtp) with SMTP
	id 84B0E241; Thu, 08 Sep 2022 15:33:11 +0800
X-QQ-mid: xmsmtpt1662622391tawvm0z0s
Message-ID: <tencent_3FB11458E1274AF3FF69207CCC10B92F1C08@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoAeIKrPV78jd1oTZa0S2N6aaxEvyM9cATQrj5Nfw2PZCm/2tmwa
	 ETX/rIhhYYyN2WjF6VWVtAEFQH0+geX2zJnidAQyk0FndTuJZMM0JupL+ukHfK5fG2jiTJiY/Lr/
	 /wonX2VXy+MLqAjObqRVbrJYJ1rkQT5zs1vWWXzB0zbYKdnPbpIgA91Ij2gzAJSoldSBsB4msXf/
	 AOAtKDa7Bu1q4fSzWmuhgB3aNsgqu7e+irKPkggYPaX0rjVbdqokrMDoRRmF5QUqtjsO2Cck610/
	 rYz3xyvUkdC/hiJbCL7B/ZJFXUn9wGz4vYNMgVpNKKJMVaLXgZgdyLK3irb3G1/crAuSwtC5PsDf
	 DrqdLtI+oAyLN9yp1whjWAqVk1lxaPOQlbMaACvn57g11f+1Zpi62oVncckDzHa3eJJ7p/FljKGD
	 hSj278K9+w5UJTau97U/pmUExUNvaJ2QibQQE7ijxyPiYGeI+NpwMjY9CP8HJz2EFLlJinW4Z238
	 w60WUkStgPwcxVYxYplEDEYNdOVsxJmQTpUdrsbg7/hLJyQh6Zf06hhwHN/HEgi/EqQmPDcEJ63Y
	 wXjwHSXm4L5b2om4P+TxCoYQz/aX4dmYMWtKhvNWwpk5yjs7TJZKLz0kfGA17gtfi7/pht6LNQ3g
	 +XFLU+N8BIMVNR2tkuYnCHE1jpmLdb03lnbIkH2FGorciez6gh1oyNxlp7Eu1YqDDZ1m/LfhkNKG
	 Bw0/jkbrQqBJP/kqqU8Oca8a8KOKCgudYDKfzKeQZGTiMAwCLqsByY2tgVNrAl+Voro4zRN4qppN
	 esnlZ+NznuzJnrPoac7WQ2sydIYnYiRzA6cf6uEdV2tR6noZdNAKgdeH5La4GOAH+HarFQAde1LL
	 9arQ+kK+rU7GOwIaFVOvWIOOMPw0BwjpDUwhDC+D+rBa9fQhmXk/tYMA2pu4/LXfwD6Utsg/u/xa
	 XLb7eqCeecueeR69Nqu8tew4BORL7zqrtx6Fjt3JuJRh3kImE16+0bLH5uQHzRXphqI9WiQFg=
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
Date: Thu,  8 Sep 2022 15:33:00 +0800
X-OQ-MSGID: <20220908073300.2253-1-xkernel.wang@foxmail.com>
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
rtw_init_cmd_priv(). As there is no FooBar device to test with, no runtime
testing was performed.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the description.
v2->v3 update the description.
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
