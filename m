Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5246B3D7F
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 18:15:29 +0000 (UTC)
Received: from ipservice-092-217-092-093.092.217.pools.vodafone-ip.de ([92.217.92.93] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nO1bJ-0001Cd-PX; Sat, 26 Feb 2022 19:15:25 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 3/7] staging: r8188eu: fix endless loop in recv_func
Date: Sat, 26 Feb 2022 19:14:53 +0100
Message-Id: <20220226181457.1138035-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226181457.1138035-1-martin@kaiser.cx>
References: <20220226144843.1118951-1-martin@kaiser.cx>
 <20220226181457.1138035-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an endless loop in recv_func. If pending_frame is not NULL, we're
stuck in the while loop forever. We have to call rtw_alloc_recvframe
each time we loop.

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Reported-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 0144c4642911..c9878907de33 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1800,8 +1800,7 @@ static int recv_func(struct adapter *padapter, struct recv_frame *rframe)
 		struct recv_frame *pending_frame;
 		int cnt = 0;
 
-		pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue);
-		while (pending_frame) {
+		while ((pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue))) {
 			cnt++;
 			recv_func_posthandle(padapter, pending_frame);
 		}
-- 
2.30.2

