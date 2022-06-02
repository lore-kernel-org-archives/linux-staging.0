Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC973D7A
	for <linux-staging@lists.linux.dev>; Thu,  2 Jun 2022 19:48:23 +0000 (UTC)
Received: from ipservice-092-217-081-045.092.217.pools.vodafone-ip.de ([92.217.81.45] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nwqnr-000400-Aw; Thu, 02 Jun 2022 21:48:19 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/3] staging: r8188eu: fix the declaration of process_pwrbit_data
Date: Thu,  2 Jun 2022 21:48:07 +0200
Message-Id: <20220602194807.281115-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602194807.281115-1-martin@kaiser.cx>
References: <20220602194807.281115-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the declaration of process_pwrbit_data. Make the function static and
remove its prototype.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index df518439aea2..fe3d597fea69 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -452,8 +452,7 @@ static int recv_decache(struct recv_frame *precv_frame, u8 bretry, struct stainf
 	return _SUCCESS;
 }
 
-void process_pwrbit_data(struct adapter *padapter, struct recv_frame *precv_frame);
-void process_pwrbit_data(struct adapter *padapter, struct recv_frame *precv_frame)
+static void process_pwrbit_data(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	unsigned char pwrbit;
 	u8 *ptr = precv_frame->rx_data;
-- 
2.30.2

