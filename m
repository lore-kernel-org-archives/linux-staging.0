Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030A28E1
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 15:26:11 +0000 (UTC)
Received: from ipservice-092-217-092-093.092.217.pools.vodafone-ip.de ([92.217.92.93] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nNyNW-0007Wh-Ei; Sat, 26 Feb 2022 15:48:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/6] staging: r8188eu: recvframe_push is not used
Date: Sat, 26 Feb 2022 15:48:41 +0100
Message-Id: <20220226144843.1118951-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226144843.1118951-1-martin@kaiser.cx>
References: <20220226144843.1118951-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recvframe_push function is not used. It can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_recv.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index a417a70835e7..25afcbe862e6 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -286,26 +286,6 @@ static inline u8 *get_rx_status(struct recv_frame *precvframe)
 	return get_rxmem(precvframe);
 }
 
-static inline u8 *recvframe_push(struct recv_frame *precvframe, int sz)
-{
-	/*  append data before rx_data */
-
-	/* add data to the start of recv_frame
- *
- *      This function extends the used data area of the recv_frame at the buffer
- *      start. rx_data must be still larger than rx_head, after pushing.
- */
-	if (precvframe == NULL)
-		return NULL;
-	precvframe->rx_data -= sz ;
-	if (precvframe->rx_data < precvframe->rx_head) {
-		precvframe->rx_data += sz;
-		return NULL;
-	}
-	precvframe->len += sz;
-	return precvframe->rx_data;
-}
-
 static inline u8 *recvframe_pull(struct recv_frame *precvframe, int sz)
 {
 	/*  rx_data += sz; move rx_data sz bytes  hereafter */
-- 
2.30.2

