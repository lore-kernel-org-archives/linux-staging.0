Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF77B
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 00:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D2BC433D6;
	Thu, 13 Oct 2022 00:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620278;
	bh=TZI+pygGR9VgAS6VCGq1EY8I+61HOj+ZEUc/tgiwZGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AodJ2zsZglDVLcKgEqPAolzGbVAchOKYYRQOnI+CBOi9kWm6bRWGjPd9YThurRAfo
	 KLE7N3AJzmrDiSC6Mf96y5gbeykP/e4zbTlElLsbyDpPyGPvvZaFLbDBjG/2BNbu1O
	 FdCwaXpO+iRtBYFCpr6X5uoFDs2kAa/DwgDegYZPu8xbmx5On6oeKXbnaAhwzS1DLQ
	 ODTNNhxw8PeeNgA63mZcqn2rVvDrQChfDvkHH2JmVQ+T3xciDzhqxdPmt7r0lK6Klj
	 DJSo0v/3A3quevdBKzaoS9qLMJegWCxxTl0uD5SgODTWEuKAdFfA3aplfVnlIJvr9V
	 3cAtZtGNVEo+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xiaoke Wang <xkernel.wang@foxmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	remckee0@gmail.com,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	makvihas@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 49/67] staging: r8188eu: fix a potential memory leak in rtw_init_cmd_priv()
Date: Wed, 12 Oct 2022 20:15:30 -0400
Message-Id: <20221013001554.1892206-49-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001554.1892206-1-sashal@kernel.org>
References: <20221013001554.1892206-1-sashal@kernel.org>
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

[ Upstream commit 06bfdb6d889f57fe9ce7bd139ce278b68f3a59de ]

In rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated
in failure, then `pcmdpriv->cmd_allocated_buf` will not be properly
released. Besides, considering there are only two error paths and the
first one can directly return, we do not need to implicitly jump to the
`exit` tag to execute the error handling code.

So this patch added `kfree(pcmdpriv->cmd_allocated_buf);` on the error
path to release the resource and simplified the return logic of
rtw_init_cmd_priv(). As there is no proper device to test with, no
runtime testing was performed.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
Link: https://lore.kernel.org/r/tencent_1B6AAE10471D4556788892F8FF3E4812F306@qq.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 5b6a891b5d67..5eb1751a43ac 100644
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
@@ -74,27 +72,24 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
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
 
 u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
-- 
2.35.1

