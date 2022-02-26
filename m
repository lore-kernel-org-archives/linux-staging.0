Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513413B5C
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 15:26:24 +0000 (UTC)
Received: from ipservice-092-217-092-093.092.217.pools.vodafone-ip.de ([92.217.92.93] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nNyNU-0007Wh-QQ; Sat, 26 Feb 2022 15:48:56 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/6] staging: r8188eu: irq_prepare_beacon_tasklet is unused
Date: Sat, 26 Feb 2022 15:48:39 +0100
Message-Id: <20220226144843.1118951-3-martin@kaiser.cx>
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

irq_prepare_beacon_tasklet in struct recv_priv is not used for r8188eu.
Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_recv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 13df95781747..a417a70835e7 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -170,7 +170,6 @@ struct recv_priv {
 	struct semaphore allrxreturnevt;
 	u8	rx_pending_cnt;
 
-	struct tasklet_struct irq_prepare_beacon_tasklet;
 	struct tasklet_struct recv_tasklet;
 	struct sk_buff_head free_recv_skb_queue;
 	struct sk_buff_head rx_skb_queue;
-- 
2.30.2

