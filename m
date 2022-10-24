Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0B7E6
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:14:38 +0000 (UTC)
Received: from ipservice-092-217-079-032.092.217.pools.vodafone-ip.de ([92.217.79.32] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1omsbU-0000nk-2s; Mon, 24 Oct 2022 10:14:36 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/17] staging: r8188eu: make OnAuthClient static
Date: Mon, 24 Oct 2022 10:14:08 +0200
Message-Id: <20221024081417.66441-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221024081417.66441-1-martin@kaiser.cx>
References: <20221024081417.66441-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnAuthClient is used only in rtw_mlme_ext.c. Make this function static.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index dc836e5878d1..7c9ca0c71b65 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -800,7 +800,7 @@ unsigned int OnAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 	return _FAIL;
 }
 
-unsigned int OnAuthClient(struct adapter *padapter, struct recv_frame *precv_frame)
+static unsigned int OnAuthClient(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	unsigned int	seq, len, status, offset;
 	unsigned char	*p;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index c1bc554202a0..866d358f5f10 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -538,8 +538,6 @@ void start_create_ibss(struct adapter *padapter);
 
 unsigned int OnAuth(struct adapter *padapter,
 		    struct recv_frame *precv_frame);
-unsigned int OnAuthClient(struct adapter *padapter,
-			  struct recv_frame *precv_frame);
 unsigned int OnDeAuth(struct adapter *padapter,
 		      struct recv_frame *precv_frame);
 unsigned int OnAction(struct adapter *padapter,
-- 
2.30.2

