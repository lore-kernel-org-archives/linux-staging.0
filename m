Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEC78F51
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 17:33:52 +0000 (UTC)
Received: from ipservice-092-217-067-184.092.217.pools.vodafone-ip.de ([92.217.67.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opCBr-000469-CG; Sun, 30 Oct 2022 18:33:43 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 03/13] staging: r8188eu: make on_action_public static void
Date: Sun, 30 Oct 2022 18:33:16 +0100
Message-Id: <20221030173326.1588647-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221030173326.1588647-1-martin@kaiser.cx>
References: <20221030173326.1588647-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The on_action_public function is called only by OnAction. This function
also lives in rtw_mlme_ext.c and does not check the return value from
on_action_public.

We can make on_action_public a static void function.

The ret variable is no longer needed if we don't return a value. It can
be removed.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
Changes in v2
- remove ret variable, it was written but never read

 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 12 ++++--------
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  2 --
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 7d4f208d161b..88600f62ffb4 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3813,30 +3813,26 @@ static unsigned int on_action_public_default(struct recv_frame *precv_frame)
 	return ret;
 }
 
-unsigned int on_action_public(struct adapter *padapter, struct recv_frame *precv_frame)
+static void on_action_public(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
-	unsigned int ret = _FAIL;
 	u8 *pframe = precv_frame->rx_data;
 	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 	u8 action;
 
 	/* check RA matches or not */
 	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))
-		goto exit;
+		return;
 
 	action = frame_body[1];
 	switch (action) {
 	case ACT_PUBLIC_VENDOR:
-		ret = on_action_public_vendor(precv_frame);
+		on_action_public_vendor(precv_frame);
 		break;
 	default:
-		ret = on_action_public_default(precv_frame);
+		on_action_public_default(precv_frame);
 		break;
 	}
-
-exit:
-	return ret;
 }
 
 unsigned int OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_frame)
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index c8beaa927cba..ec2e9352011b 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -538,8 +538,6 @@ void start_create_ibss(struct adapter *padapter);
 
 unsigned int OnAction_back(struct adapter *padapter,
 			   struct recv_frame *precv_frame);
-unsigned int on_action_public(struct adapter *padapter,
-			      struct recv_frame *precv_frame);
 unsigned int OnAction_p2p(struct adapter *padapter,
 			  struct recv_frame *precv_frame);
 
-- 
2.30.2

