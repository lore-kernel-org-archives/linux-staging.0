Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A9B747F
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 19:23:40 +0000 (UTC)
Received: from dslb-178-004-202-208.178.004.pools.vodafone-ip.de ([178.4.202.208] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pPTZ0-0002XK-Vz; Tue, 07 Feb 2023 20:23:35 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/7] staging: r8188eu: xmit_buf's ff_hwaddr is not used
Date: Tue,  7 Feb 2023 20:23:16 +0100
Message-Id: <20230207192319.294203-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230207192319.294203-1-martin@kaiser.cx>
References: <20230207192319.294203-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ff_hwaddr in struct xmit_buf is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_xmit.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 0c999ae6a1f1..9a001fbf45a0 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -193,7 +193,6 @@ struct xmit_buf {
 	u32 alloc_sz;
 	u32  len;
 	struct submit_ctx *sctx;
-	u32	ff_hwaddr;
 	struct urb *pxmit_urb;
 	int last[8];
 };
-- 
2.30.2

