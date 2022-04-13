Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55752F3C
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 20:07:53 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nejHK-0005wN-Jr; Wed, 13 Apr 2022 22:07:50 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: merge _mgt_dispatcher into mgt_dispatcher
Date: Wed, 13 Apr 2022 22:07:40 +0200
Message-Id: <20220413200742.276806-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220413200742.276806-1-martin@kaiser.cx>
References: <20220413200742.276806-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All that the _mgt_dispatcher function does is to call a function from
a function pointer. It's not worth having a separate function for this.

Merge _mgt_dispatcher into mgt_dispatcher.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 22 ++++++++-------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 66dd06371991..ba071de4c05c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -390,19 +390,6 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	}
 }
 
-static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, struct recv_frame *precv_frame)
-{
-	u8 *pframe = precv_frame->rx_data;
-
-	if (ptable->func) {
-	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
-			return;
-		ptable->func(padapter, precv_frame);
-	}
-}
-
 void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	int index;
@@ -442,7 +429,14 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 		else
 			ptable->func = &OnAuthClient;
 	}
-	_mgt_dispatcher(padapter, ptable, precv_frame);
+
+	if (ptable->func) {
+	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
+		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
+		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
+			return;
+		ptable->func(padapter, precv_frame);
+	}
 }
 
 static u32 p2p_listen_state_process(struct adapter *padapter, unsigned char *da)
-- 
2.30.2

