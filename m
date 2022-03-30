Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA17C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648640173;
	bh=8fJrMhzqjAXlwfUDxJahr95XCF0ybbs2a5Ofgeo9KHM=;
	h=From:To:Cc:Subject:Date;
	b=Kusvf+7+tvzEVvQFzmlmvlSTvjSdYPZ2WSNrpHdJfdEd4m17QkSWW6SCy8j3NhjiZ
	 a+AP51PPXtG662wmrkAbF06YVqI/iUgSYbch77mFnb1W5uMUxAzRgH9sN3NU3NSyuT
	 oqLdSehnBYVM0k/Tju/KuMVmY3KaOOld6DnXyXEs=
Received: from localhost.localdomain ([43.227.138.48])
	by newxmesmtplogicsvrszc9.qq.com (NewEsmtp) with SMTP
	id 8288103E; Wed, 30 Mar 2022 19:32:40 +0800
X-QQ-mid: xmsmtpt1648639960tfxmvk268
Message-ID: <tencent_FF6828BEC24B9560FE5D405E998D73633809@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvTbni/KihziXVzkQT7chenEEvQ0U9T8LGHF9mKokFevWkRDB7mgP
	 phdQziLrbDwEstkLvoJuVEs2Jv7hbp3/79y4EHQfbs2EC3CQFpgAnGDFRqKn+iN6MQNWO1jjVdZO
	 yMgEcHGyFOw+0it2PdatDnbOUjSEGSUTIYI49FIPPmSCtEFnzTthzt3ijvYozzLru9sUU8nuQXL9
	 YD4o0DXTCRk2xkbCltn0DKdZ7f2HrJEPcK4l2Sk5/jzNkxxLo2Gbf2oSowAg1lXVsOfSWh/Ne1RL
	 bANkOOUa05NVcVUJCAJEGOqsU/HhM6qM48VsDV5r4MeIOsd2cmjxRtZUmkNlftM9thFd+D9jl+Qb
	 eOw/hVvnRwio0w3wY9MUO2DXLD6HPeSvs28KUvNILoYjz4pYddmCmI4Q4mPHwTjWGnpJ/862qG2M
	 mKYGeFp392TmaC0e8UI+ixI6r0TgLHnaz/Yn2pR2x6wHqkltwt7SifGhbV++9ZHEJ07Fwo5z2S15
	 XRyzk6vvkUR0z+2ujLkf0q7xG//jfflU2MlDqI863PPwwPYFEPdiD/JPaWiNMVyrXhJSTkGoe9V7
	 k2uyNuuKaXdeINzwxrX7j0wSkb5R4Yeny+mcbZZKk6cv7IkQUTg0Wkvm154Lx2TGXopbkRgh9uZA
	 vZhSOPgxgXem5QPTJM+kmjlvkGsKaWMtGJNn6DjlKECS2iP6VETvPrhBQL33N+yhiJI3Bnlc30dA
	 pU40rd3qLVm53AczA1iHHmW2XsdiH30DuHOxU/OLq/iZbmPoAQokGblkgtge0LLir1hY+b/IACoq
	 gZIlItK5HWRssW96A7i2lLbHXmvKGgpr6ljMMpmN8ZmCMDzgwfHjj5zk+NflId54Prb4XnM/+FdF
	 MgXfAskR+5sAPqT04wHwbSZhDMy8nSDfgxi3zveJql4TIcEGtQfzGiEgtz3XFCZPEeHaqgZg0n3Q
	 sOy+eaFqptN9x9K6/0clsyDI9z2pkdvl3hdXAVvUwbxtOh8if3/g==
From: xkernel.wang@foxmail.com
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] staging: r8188eu: fix a potential memory leak in _rtw_init_cmd_priv()
Date: Wed, 30 Mar 2022 19:32:21 +0800
X-OQ-MSGID: <20220330113221.5520-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In _rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated
in failure, `pcmdpriv->cmd_allocated_buf` is not properly released.
This patch is to free it.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 56910c3..e76015e 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -42,6 +42,8 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);
 
 	if (!pcmdpriv->rsp_allocated_buf) {
+		kfree(pcmdpriv->cmd_allocated_buf);
+		pcmdpriv->cmd_allocated_buf = NULL;
 		res = _FAIL;
 		goto exit;
 	}
-- 
