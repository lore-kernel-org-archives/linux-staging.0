Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBACF747F
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 19:23:31 +0000 (UTC)
Received: from dslb-178-004-202-208.178.004.pools.vodafone-ip.de ([178.4.202.208] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pPTYt-0002XK-3T; Tue, 07 Feb 2023 20:23:27 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/7] staging: r8188eu: merge do_queue_select into its only caller
Date: Tue,  7 Feb 2023 20:23:13 +0100
Message-Id: <20230207192319.294203-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230207192319.294203-1-martin@kaiser.cx>
References: <20230207192319.294203-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge do_queue_select into its only caller. It's only a simple assignment.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 18941320e70e..4d6210d89533 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1609,15 +1609,6 @@ u32 rtw_get_ff_hwaddr(struct xmit_frame *pxmitframe)
 	return addr;
 }
 
-static void do_queue_select(struct adapter	*padapter, struct pkt_attrib *pattrib)
-{
-	u8 qsel;
-
-	qsel = pattrib->priority;
-
-	pattrib->qsel = qsel;
-}
-
 /*
  * The main transmit(tx) entry
  *
@@ -1656,7 +1647,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 
 	rtw_led_control(padapter, LED_CTL_TX);
 
-	do_queue_select(padapter, &pxmitframe->attrib);
+	pxmitframe->attrib.qsel = pxmitframe->attrib.priority;
 
 	spin_lock_bh(&pxmitpriv->lock);
 	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe)) {
-- 
2.30.2

