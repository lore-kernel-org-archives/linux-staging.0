Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3933D81
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 18:15:31 +0000 (UTC)
Received: from ipservice-092-217-092-093.092.217.pools.vodafone-ip.de ([92.217.92.93] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nO1bM-0001Cd-Ac; Sat, 26 Feb 2022 19:15:28 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 6/7] staging: r8188eu: get_rx_status is not used
Date: Sat, 26 Feb 2022 19:14:56 +0100
Message-Id: <20220226181457.1138035-7-martin@kaiser.cx>
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

Remove the unused function get_rx_status.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_recv.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 25afcbe862e6..d2c1efbe62f0 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -281,11 +281,6 @@ static inline u8 *get_rxmem(struct recv_frame *precvframe)
 	return precvframe->rx_head;
 }
 
-static inline u8 *get_rx_status(struct recv_frame *precvframe)
-{
-	return get_rxmem(precvframe);
-}
-
 static inline u8 *recvframe_pull(struct recv_frame *precvframe, int sz)
 {
 	/*  rx_data += sz; move rx_data sz bytes  hereafter */
-- 
2.30.2

