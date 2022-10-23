Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5869D2F5E
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 17:08:28 +0000 (UTC)
Received: from ipservice-092-217-070-181.092.217.pools.vodafone-ip.de ([92.217.70.181] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1omeSR-0000Rj-98; Sun, 23 Oct 2022 19:08:19 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/5] staging: r8188eu: remove wait_ack param from _issue_probereq_p2p
Date: Sun, 23 Oct 2022 19:08:07 +0200
Message-Id: <20221023170808.46233-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221023170808.46233-1-martin@kaiser.cx>
References: <20221023170808.46233-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only caller of _issue_probereq_p2p sets wait_ack = false. Remove the
wait_ack parameter and the code that would run only if wait_ack == true.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 61d2680cbafc..d44e455f09ca 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3291,7 +3291,7 @@ void issue_probersp_p2p(struct adapter *padapter, unsigned char *da)
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static int _issue_probereq_p2p(struct adapter *padapter, u8 *da, int wait_ack)
+static int _issue_probereq_p2p(struct adapter *padapter, u8 *da)
 {
 	int ret = _FAIL;
 	struct xmit_frame		*pmgntframe;
@@ -3564,12 +3564,8 @@ static int _issue_probereq_p2p(struct adapter *padapter, u8 *da, int wait_ack)
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-	if (wait_ack) {
-		ret = dump_mgntframe_and_wait_ack(padapter, pmgntframe);
-	} else {
-		dump_mgntframe(padapter, pmgntframe);
-		ret = _SUCCESS;
-	}
+	dump_mgntframe(padapter, pmgntframe);
+	ret = _SUCCESS;
 
 exit:
 	return ret;
@@ -3577,7 +3573,7 @@ static int _issue_probereq_p2p(struct adapter *padapter, u8 *da, int wait_ack)
 
 inline void issue_probereq_p2p(struct adapter *adapter, u8 *da)
 {
-	_issue_probereq_p2p(adapter, da, false);
+	_issue_probereq_p2p(adapter, da);
 }
 
 static s32 rtw_action_public_decache(struct recv_frame *recv_frame, s32 token)
-- 
2.30.2

