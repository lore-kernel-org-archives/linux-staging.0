Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763C8808
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 11:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1662723066;
	bh=2y+E7kwgOLvUCg8rZ1hu5N2W5Q7xogjD9EgNDXRSFgQ=;
	h=From:To:Cc:Subject:Date;
	b=S+Fq4e3HlxxSKWXl8IKhbqK44yIPoTELiDZ7qhhiC+GCN89K6kr8wDPGdgRMPW7Xn
	 +fzmQ6WW43OiP9Wc0rrDAphanhFdylKUp2/8X9Xpev8eYBNuuhxJA7Cj6BJD1xtJ8F
	 zeWhU+3+6o72eTpxjgs0JfvQZCDv/ds4/wzLB3Rw=
Received: from localhost.localdomain ([59.172.176.188])
	by newxmesmtplogicsvrsza31.qq.com (NewEsmtp) with SMTP
	id 6F02267D; Fri, 09 Sep 2022 19:27:48 +0800
X-QQ-mid: xmsmtpt1662722868t7cygl1kz
Message-ID: <tencent_2B7931B79BA38E22205C5A09EFDF11E48805@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjyTeMrtXPTfR8bd40mbNu/dfdSaPxtBQ7PuE3t15CErBk3S5klq
	 WwXGkl6UnqT2pia9oUpAt8Ivo0P64Pdr3YyYkUQH4MZO/VN2XKSStOz6PiChI7eBu1ozqF3oGpw1
	 +y19JPK2s4FPKg67gCwxSTP3LOrjzKXu+k1hdzN7Su7cAxv5NnMkJQaltlFdmeQoV3f9hmFwxApm
	 IOg5b6TRs55JlY/G6fWgtNNPFKol669lSQtSYOP0YrZmePE+JVbuQRV31Sn8W1FwdvzoCw5bzgi/
	 7RhaV2KxyrpROBJwvL+lfxgOXyO/TTt1/pQHd7LXOvuoMAEAHcFISXBKGy13mCgE1hopzQ2WhKav
	 AIZiROfvzGAnn3rqtjR25/7aLc0E4/SZu+shoTllgo4IdIGaizKPwjamSHGK/PeQTlnl0v3GW18x
	 BSpdeTxfmvEmVgPXOoqsBlFivaWeZlL9BHyRDHS8mpYrnaJE+FxUpaQ009j8/HTQNet2u7JUuKdp
	 WkziXmmjGB0QcnSC8rQZAaJpSu6oBzM2HGI+c8xfnvrs3BSvUIP9uskBe0LdAknA8AqxygLGYtAx
	 ad7jns4IddTI16KK0HhpnTFAChaqNdZU86ChJFXGm/9hDSKvrv/UdhklScBGuf3tb75Pi9KWbfEg
	 vImUkFrcUw5g54sKgi3Cq0eYlODgpvj3Guv4RcGl7y+byMqorgosTndsZzV+m5U2AEtWLQ72Iraz
	 0FE2+8CUYOrKhxqG2xi1W5zXfr2WmKAAHUi9KPcJ69q/dgRGBTIPI0gSC5aaPj/fsMyhJBYhjIfM
	 tFgi2vgiGQmlpmJ8pZjDPnrp9w3FNRF0ZVln3KW2yGuqudmvr5v/Zc4MQ/g4IrGSK/FE9Ks70dA5
	 mTnDKROXM6QbZFmxKIpY50iSZFuK2o+3Bz2nTjM9NU2HyWGatW7qJfShi1f66RKSTHEn0XHOrVp+
	 UtO0/aG8QwkqZs15QfwSeb0qiBX4feOFbQx6rTEkMnzROwIIVPxRg6A18dVRfjbsLj7pOqVrtcF9
	 2GV3c0lA==
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v4] staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
Date: Fri,  9 Sep 2022 19:27:21 +0800
X-OQ-MSGID: <20220909112721.3571-1-xkernel.wang@foxmail.com>
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
rtw_init_cmd_priv(). As there is no proper device to test with, no runtime
testing was performed.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the description.
v2->v3 update the description.
v3->v4 remove trailing whitespace and restore unnecessary changes.
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index e909dcc..bd51233 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -161,8 +161,6 @@ static struct cmd_hdl wlancmds[] = {
 
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
-	int res = 0;
-
 	init_completion(&pcmdpriv->cmd_queue_comp);
 	init_completion(&pcmdpriv->terminate_cmdthread_comp);
 
@@ -175,18 +173,16 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 
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
+		return -ENOMEM;
 	}
 
 	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
@@ -196,8 +192,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 	pcmdpriv->rsp_cnt = 0;
 
 	mutex_init(&pcmdpriv->sctx_mutex);
-exit:
-	return res;
+
+	return 0;
 }
 
 static void c2h_wk_callback(struct work_struct *work);
-- 
