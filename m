Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A607B
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648650885;
	bh=9+iY9B+X+YN1oo9ipnds6d68zDiqia3PAGjqADcjvcM=;
	h=From:To:Cc:Subject:Date;
	b=bSE8zxOPAxQmc4qV/Im6wmMB0TmQkBHjiJc95KoHvkatGpvsqxA1VZoRkGo1NekCC
	 an7HKVmAjYR1YW+311PQl0R0vUg4w/5AqmsDTP8hO0MZxEFvcv+unFkVwPcYF8Nq6W
	 RLY4mO6BCeL9Z+EeEvOei6KYy0xXZH4NqaG04BqA=
Received: from localhost.localdomain ([43.227.138.48])
	by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
	id 7908284A; Wed, 30 Mar 2022 19:30:16 +0800
X-QQ-mid: xmsmtpt1648639816tob60ixc0
Message-ID: <tencent_D95ACC78B93B1CDD14C4E13E4A66FF892008@qq.com>
X-QQ-XMAILINFO: NiAdzfE16ND47ZF6Tl2VR9BjOUK8lcRvYvAREVjoz5arzoXnDmGPiNFew9xdpb
	 zbW/sU2P0JbiGodmPdqoBxOK9HFSeovv2ghnVxUqxhPHSO+CN3Ta3YPlNmKZIh9uM0Nvwvh6q6WH
	 7lQAaHkJXlxRmV+MbUI64mhTuzVt+AkFi8VQT+j8fSQ1Zcgop3OOZUyAlIgcJGmY6uPVjYzTo5iD
	 09E7iPGI9kGQJ6tCh//UKcj1Wi3RKcccy+zjwcvinHTC/5Orjq+m4hVADwb4LzFWcrE7hq7ooKQT
	 7ygPvkkX3eQo537ARZ4cUpakwEzwVvprAAKekTJTm/jWWDSOt6g/ZZZ8D+NjXviMbarZ21Uu1YFZ
	 xZ6EXA+SrWmOtAEiyVyCA396mJYW0y1Xhfg8iQGbVxwsRuwjVsKQ7wwIpytIWfsMZufbdosJtbWo
	 cxnDW7bAPfehAZOarOv4lhO7AwxuSAqG1/1EWkieVplZF4jIKyO/nfpdHZ8/BA+G6LydDsi02eWB
	 TMkkAEKycZIKw1WxF99Y3ImGw20/VWI3HPJNsLAezdT0LMvIOvUOD/yItTY0+qC8gCLGxPPp3Oi3
	 KtPQ380VXATdWYqz8d1D7xijmrLJeJSY+SX82qpTNq1mcq/XN8dsW9rf5oNfZq4GlfVE4EXCoNbh
	 PHsr2LgAiAdr/BNeALEx/WYoqb3fwEaqtaRABsgEIxdvZp9LHTbPIjuR7iNH7hTLJ/TM0Juvmfsf
	 bqzgHiNLQRf5rSONzDkFGRBqJ5RX6ZlAkahyBUeIdrI0d5BjhtvJhGb5ibGPlCoGpA/dPQGVNOoE
	 nGZgr5Szxd7WoBgVgcoFxHeh50b0zoUfPvFa/P1NUa09Tb6RbFd8GzCC2IuG1m0Negh39Zd9ufZZ
	 oAUN5GnQ+T+QrMXqlIhDm6WUB5NgAvUu6EwNsKkVEKj/KG7ggGyjgrWBMvJix04OvJyFoFEfU6dh
	 qkHK0Ih9wTrMdCiR8CTw==
From: xkernel.wang@foxmail.com
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] staging: r8188eu: add a check for rtw_cbuf_alloc()
Date: Wed, 30 Mar 2022 19:30:05 +0800
X-OQ-MSGID: <20220330113005.5465-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kmalloc() is called by rtw_cbuf_alloc() and it returns pointer of
srtuct rtw_cbuf, NULL for allocation failure. So it is better to check
the return value of it.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ce73ac7..56910c3 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -69,6 +69,8 @@ static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
 	pevtpriv->c2h_wk_alive = false;
 	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
+	if (!pevtpriv->c2h_queue)
+		res = _FAIL;
 
 	return res;
 }
-- 

