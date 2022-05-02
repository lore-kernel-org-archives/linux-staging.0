Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48C3210
	for <linux-staging@lists.linux.dev>; Mon,  2 May 2022 20:07:16 +0000 (UTC)
Received: from ipservice-092-217-077-109.092.217.pools.vodafone-ip.de ([92.217.77.109] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nlcK8-0007ch-T6; Mon, 02 May 2022 22:07:12 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/9] staging: r8188eu: remove unused action handler prototypes
Date: Mon,  2 May 2022 22:06:46 +0200
Message-Id: <20220502200652.143665-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502200652.143665-1-martin@kaiser.cx>
References: <20220502200652.143665-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some action categories, we removed the handler function, but we forgot
the prototypes. Remove them as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index c68b3c77c378..136879a0a0f9 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -567,12 +567,6 @@ unsigned int OnDeAuth(struct adapter *padapter,
 unsigned int OnAction(struct adapter *padapter,
 		      struct recv_frame *precv_frame);
 
-unsigned int on_action_spct(struct adapter *padapter,
-			    struct recv_frame *precv_frame);
-unsigned int OnAction_qos(struct adapter *padapter,
-			  struct recv_frame *precv_frame);
-unsigned int OnAction_dls(struct adapter *padapter,
-			  struct recv_frame *precv_frame);
 unsigned int OnAction_back(struct adapter *padapter,
 			   struct recv_frame *precv_frame);
 unsigned int on_action_public(struct adapter *padapter,
-- 
2.30.2

