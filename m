Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F7579D5
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 19:53:32 +0000 (UTC)
Received: from dslb-188-097-040-029.188.097.pools.vodafone-ip.de ([188.97.40.29] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pMaDQ-0007S2-Lc; Mon, 30 Jan 2023 20:53:20 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/9] staging: r8188eu: legacy_dz is initialised but never used
Date: Mon, 30 Jan 2023 20:53:00 +0100
Message-Id: <20230130195303.138941-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230130195303.138941-1-martin@kaiser.cx>
References: <20230130195303.138941-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

legacy_dz in struct sta_xmit_priv is initialised but not used. It can be
removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c    | 1 -
 drivers/staging/r8188eu/include/rtw_xmit.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index c2b1e6f1d358..797e24b852b1 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -29,7 +29,6 @@ void	_rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv)
 	_init_txservq(&psta_xmitpriv->bk_q);
 	_init_txservq(&psta_xmitpriv->vi_q);
 	_init_txservq(&psta_xmitpriv->vo_q);
-	INIT_LIST_HEAD(&psta_xmitpriv->legacy_dz);
 	INIT_LIST_HEAD(&psta_xmitpriv->apsd);
 }
 
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index dfdc1c57d5d4..8566e731514c 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -232,7 +232,6 @@ struct sta_xmit_priv {
 	struct tx_servq	bk_q;			/* priority == 1,2 */
 	struct tx_servq	vi_q;			/* priority == 4,5 */
 	struct tx_servq	vo_q;			/* priority == 6,7 */
-	struct list_head legacy_dz;
 	struct list_head apsd;
 	u16 txseq_tid[16];
 };
-- 
2.30.2

