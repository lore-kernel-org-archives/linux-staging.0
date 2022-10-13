Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FAA7B
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 00:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F43BC433C1;
	Thu, 13 Oct 2022 00:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620673;
	bh=AkOcEHZmdaA81I6y7tbCcNTRyBxYzqfv88yAdxAyoJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DAr3VYvGjBMaX22yCd33+AtBDz83bx0oUvSUCr3d+KtLCutXN3pZmP7GS57ICHrZv
	 MScDaDgpodUCQeLOHJ9oRpkBjG8B3As783OyQwH1yaupzxGgKHxLLgVVypLfdP1iuZ
	 6VHXiABhd8uwZ6OGmsgSgKnARO5pfaBi9Q/3Aneb2UFY1l+f63IIWxc6A0wdF4DnNg
	 2eLaRMPMs8jGfVozznEP1uK5SRAXtN7YkVc5qkNQaoO8bJIWTyHMeYuREK9Da6l0VF
	 iNxIRJpx4dvhijUeARU1S/9WRKEPi8csicRdODEBIhCZ7Y+e785BWemWGKYOp1IZey
	 5NjANaddG0avg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xiaoke Wang <xkernel.wang@foxmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	kushalkothari285@gmail.com,
	namcaov@gmail.com,
	remckee0@gmail.com,
	saurav.girepunje@gmail.com,
	eng.alaamohamedsoliman.am@gmail.com,
	jagathjog1996@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 25/33] staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
Date: Wed, 12 Oct 2022 20:23:24 -0400
Message-Id: <20221013002334.1894749-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013002334.1894749-1-sashal@kernel.org>
References: <20221013002334.1894749-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

[ Upstream commit 708056fba733a73d926772ea4ce9a42d240345da ]

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
Link: https://lore.kernel.org/r/tencent_2B7931B79BA38E22205C5A09EFDF11E48805@qq.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 2abe205e3453..cee05385f872 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -165,8 +165,6 @@ No irqsave is necessary.
 
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
-	int res = 0;
-
 	init_completion(&pcmdpriv->cmd_queue_comp);
 	init_completion(&pcmdpriv->terminate_cmdthread_comp);
 
@@ -178,18 +176,16 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 
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
@@ -199,8 +195,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 	pcmdpriv->rsp_cnt = 0;
 
 	mutex_init(&pcmdpriv->sctx_mutex);
-exit:
-	return res;
+
+	return 0;
 }
 
 static void c2h_wk_callback(_workitem * work);
-- 
2.35.1

