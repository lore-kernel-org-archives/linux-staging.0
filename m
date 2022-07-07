Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB028F2
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 19:49:31 +0000 (UTC)
Received: from dslb-188-097-214-244.188.097.pools.vodafone-ip.de ([188.97.214.244] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1o9XV3-0008AP-Ke; Thu, 07 Jul 2022 21:49:21 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/2] staging: r8188eu: remove sta2sta_data_frame prototype
Date: Thu,  7 Jul 2022 21:49:13 +0200
Message-Id: <20220707194914.63794-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220707194914.63794-1-martin@kaiser.cx>
References: <20220707194914.63794-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the prototype for sta2sta_data_frame. Make the function static, it
is used only inside rtw_recv.c.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 32cd452d1f3d..6a2a1b1664ac 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -556,13 +556,8 @@ static void count_rx_stats(struct adapter *padapter, struct recv_frame *prframe,
 	}
 }
 
-int sta2sta_data_frame(
-	struct adapter *adapter,
-	struct recv_frame *precv_frame,
-	struct sta_info **psta
-);
-
-int sta2sta_data_frame(struct adapter *adapter, struct recv_frame *precv_frame, struct sta_info **psta)
+static int sta2sta_data_frame(struct adapter *adapter,
+			      struct recv_frame *precv_frame, struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->rx_data;
 	int ret = _SUCCESS;
-- 
2.30.2

