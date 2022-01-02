Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F412CA1
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 18:00:21 +0000 (UTC)
Received: from dslb-188-104-058-096.188.104.pools.vodafone-ip.de ([188.104.58.96] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n459W-0005Ye-Gf; Sun, 02 Jan 2022 19:00:18 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/5] staging: r8188eu: cmd_issued_cnt is set but not used
Date: Sun,  2 Jan 2022 18:59:31 +0100
Message-Id: <20220102175932.89127-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220102175932.89127-1-martin@kaiser.cx>
References: <20220102175932.89127-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cmd_issued_cnt in struct cmd_priv is set but not used. It can
be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 3 ---
 drivers/staging/r8188eu/include/rtw_cmd.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 6d503eb7ff26..8bfb01c2ebb5 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -50,7 +50,6 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 
 	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((size_t)(pcmdpriv->rsp_allocated_buf) & 3);
 
-	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
 	pcmdpriv->rsp_cnt = 0;
 exit:
@@ -269,8 +268,6 @@ int rtw_cmd_thread(void *context)
 			goto post_process;
 		}
 
-		pcmdpriv->cmd_issued_cnt++;
-
 		pcmd->cmdsz = _RND4((pcmd->cmdsz));/* _RND4 */
 
 		memcpy(pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 47c3c80cc24a..cf0945ae11c1 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -42,7 +42,6 @@ struct cmd_priv {
 	u8	*cmd_allocated_buf;
 	u8	*rsp_buf;	/* shall be non-paged, and 4 bytes aligned */
 	u8	*rsp_allocated_buf;
-	u32	cmd_issued_cnt;
 	u32	cmd_done_cnt;
 	u32	rsp_cnt;
 	u8 cmdthd_running;
-- 
2.30.2

