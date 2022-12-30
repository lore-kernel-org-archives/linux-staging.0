Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238092F5F
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:13 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJme-0004rR-DF; Fri, 30 Dec 2022 19:07:08 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/20] staging: r8188eu: cmd_seq is write-only
Date: Fri, 30 Dec 2022 19:06:29 +0100
Message-Id: <20221230180646.91008-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230180646.91008-1-martin@kaiser.cx>
References: <20221230180646.91008-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmd_seq component of struct cmd_priv is set and incremented but never
read. It can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 4 ----
 drivers/staging/r8188eu/include/rtw_cmd.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 19b2f73d481d..eb79435da355 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -65,8 +65,6 @@ int rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 
 	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
 
-	pcmdpriv->cmd_seq = 1;
-
 	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ,
 					      GFP_KERNEL);
 
@@ -233,8 +231,6 @@ int rtw_cmd_thread(void *context)
 				ret = cmd_hdl(pcmd->padapter, pcmdbuf);
 				pcmd->res = ret;
 			}
-
-			pcmdpriv->cmd_seq++;
 		} else {
 			pcmd->res = H2C_PARAMETERS_ERROR;
 		}
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index c330a4435b31..9df7d4bf441d 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -32,7 +32,6 @@ struct cmd_priv {
 	struct completion start_cmd_thread;
 	struct completion stop_cmd_thread;
 	struct __queue cmd_queue;
-	u8	cmd_seq;
 	u8	*cmd_buf;	/* shall be non-paged, and 4 bytes aligned */
 	u8	*cmd_allocated_buf;
 	u8	*rsp_buf;	/* shall be non-paged, and 4 bytes aligned */
-- 
2.30.2

