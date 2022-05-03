Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2243117E9
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1651561361;
	bh=OWbtuVJZ9U3e0kRU290fgZR2YK74JKN66/5fnkRXd4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bxp2ySyKe8TeHcYoW1UpwlLThIkUUA0P7eL/K88InUuJ8jCQvRYiebXeQ1geYxyGO
	 rB+kmoObNQp8295wAqMtEyH24EnDFoTeHEdJX6au3I6p22YyFP6JJisVqWHJmlrqMi
	 LrGSf6z/6CQsMhtRqtePLt01mZvI+R8Tmjz9+sDs=
Received: from localhost.localdomain ([59.172.176.242])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id 5E3F88A; Tue, 03 May 2022 15:01:30 +0800
X-QQ-mid: xmsmtpt1651561290trm599m8a
Message-ID: <tencent_EA8B79235780C38F022D9C4389E75F0B6405@qq.com>
X-QQ-XMAILINFO: M4iqtcQzl/9FsP2jsSxfmBTxVNr75GrLeDtc6JEsSF1TQO8IGkorOBz3GyRok8
	 3AlThxfdybKWWZwIWOBrp4tArX69z4B0vHujyewfAZr/aU/evMUFMu8GqaozxBVgnd1REfN5k3eY
	 Zad0f05O8+5EMBKj6Uy9X+L3sKjIbv+UZOUbgRo+aaVnxYBFnqoneEytpThF+UYGqih9Quk8xDR/
	 RkuZMnfErt35actBwPx+V5651XS7r3IEVabbSHGtdatFB7GNaYNCheoO9lc7YCP5R1ts1CwyVY0A
	 Gb/qydxdFVMb153M7MtFoaR9E9pP81lsaXQoi2We7dkqC13WZyKhbBL80lAKkXnZEutfapVzgfvS
	 q+z24mGjawqjMNrafHMW/Q+ckp05y9H4l3YbILRDCmmOqwp+zn2paEYSA1LVwjyXhvxLYXKxgEzM
	 0G8cFTwtY5VnZRB6/lP8ALLqBR7684vkHIa7RjZMgo32lSGIm6kt02t1I6ghbhC6t4rlTPSonv0k
	 IFahdY9ZYyPDNHPhSmvEihpIqAMXcU1Nwq5qJPKa/5//bCk0oi8iYAYDlbcvzs3sL+qZ7vava70s
	 xA9nSswIf9yLE02i/4xsR+W3PpupbxO3ydKKzBavGoDGhDrfloGWKPFUMAvAd/n/8ES4RwnwBz0b
	 R99qRTtAeLKtfDv8ZTKwYNuJV+i46WoFwr526uD9mu7iT6DDq5uANYsipEREI+ua6jJ3Dv78YYUA
	 +/+bNTlWWYi8ZkIIs8+c2DFMICrcwB0ypas+cyUE97tRosBW6sqFb3IhVNquQC6Y85mUR+yTKnCM
	 ns9DEkhr8jU6cy7s9m48aO++mk++72AesIYsOwbMrHoXcx58shu6eVUbqEZjRYjEA9uBBJiOEVkp
	 Kr7nRCxcdn1sPLjFVKeWTnYYoJi5jnc5WaIawQ4lzNL50Y5+1uRDQrDm5ZLIV8978+YQvx4fSfVZ
	 YCWGV5KycvuK2+bZ8fe+UNabaYp7Osedu27I87k8cDTDZr/rPL3sR9ZHJ+hYLMAkGvTIgFnWs=
From: xkernel.wang@foxmail.com
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH 09/12] staging: r8188eu: fix a potential memory leak in _rtw_init_cmd_priv()
Date: Tue,  3 May 2022 15:01:17 +0800
X-OQ-MSGID: <20220503070117.3346-1-xkernel.wang@foxmail.com>
In-Reply-To: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
References: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
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
 drivers/staging/r8188eu/core/rtw_cmd.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 06523d9..37b68a9 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -58,8 +58,6 @@ static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 
 u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
-	u32 res = _SUCCESS;
-
 	init_completion(&pcmdpriv->enqueue_cmd);
 	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
 	init_completion(&pcmdpriv->start_cmd_thread);
@@ -74,27 +72,25 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
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
+		pcmdpriv->cmd_allocated_buf = NULL;
+		return _FAIL;
 	}
 
 	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((size_t)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_done_cnt = 0;
 	pcmdpriv->rsp_cnt = 0;
-exit:
 
-	return res;
+	return _SUCCESS;
 }
 
 u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
-- 
