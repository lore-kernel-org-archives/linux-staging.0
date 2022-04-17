Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10249629
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:22:39 +0000 (UTC)
Received: from dslb-188-096-140-061.188.096.pools.vodafone-ip.de ([188.96.140.61] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ng234-0002FP-VT; Sun, 17 Apr 2022 12:22:31 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/6] staging: r8188eu: check receiver address only once
Date: Sun, 17 Apr 2022 12:22:16 +0200
Message-Id: <20220417102221.466524-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220417102221.466524-1-martin@kaiser.cx>
References: <20220417102221.466524-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check only once in mgt_dispatcher that the receiver address is the local
address or the broadcast address. The second identical check can be
removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b6ee6a24930a..3afd06120cb1 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -431,13 +431,8 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 			ptable->func = &OnAuthClient;
 	}
 
-	if (ptable->func) {
-	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-		if (memcmp(hdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN) &&
-		    !is_broadcast_ether_addr(hdr->addr1))
-			return;
+	if (ptable->func)
 		ptable->func(padapter, precv_frame);
-	}
 }
 
 static u32 p2p_listen_state_process(struct adapter *padapter, unsigned char *da)
-- 
2.30.2

