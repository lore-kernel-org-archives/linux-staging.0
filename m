Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14A21C3A
	for <linux-staging@lists.linux.dev>; Fri,  2 Dec 2022 09:25:40 +0000 (UTC)
Received: from ipservice-092-217-087-074.092.217.pools.vodafone-ip.de ([92.217.87.74] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1p12IU-0001tn-8N; Fri, 02 Dec 2022 10:25:30 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/2] staging: r8188eu: merge two probereq_p2p functions
Date: Fri,  2 Dec 2022 10:25:24 +0100
Message-Id: <20221202092525.403887-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202092525.403887-1-martin@kaiser.cx>
References: <20221202092525.403887-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_issue_probereq_p2p is called only by issue_probereq_p2p. Merge the two
functions and remove the unused return value.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 49e0b50b1243..cf7b39cfb8f4 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3183,9 +3183,8 @@ void issue_probersp_p2p(struct adapter *padapter, unsigned char *da)
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static int _issue_probereq_p2p(struct adapter *padapter, u8 *da)
+inline void issue_probereq_p2p(struct adapter *padapter, u8 *da)
 {
-	int ret = _FAIL;
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
 	unsigned char			*pframe;
@@ -3201,7 +3200,7 @@ static int _issue_probereq_p2p(struct adapter *padapter, u8 *da)
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
-		goto exit;
+		return;
 
 	/* update attribute */
 	pattrib = &pmgntframe->attrib;
@@ -3457,15 +3456,6 @@ static int _issue_probereq_p2p(struct adapter *padapter, u8 *da)
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
 	dump_mgntframe(padapter, pmgntframe);
-	ret = _SUCCESS;
-
-exit:
-	return ret;
-}
-
-inline void issue_probereq_p2p(struct adapter *adapter, u8 *da)
-{
-	_issue_probereq_p2p(adapter, da);
 }
 
 static s32 rtw_action_public_decache(struct recv_frame *recv_frame, u8 token)
-- 
2.30.2

