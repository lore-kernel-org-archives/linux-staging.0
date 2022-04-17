Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37EE7A
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:22:41 +0000 (UTC)
Received: from dslb-188-096-140-061.188.096.pools.vodafone-ip.de ([188.96.140.61] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ng236-0002FP-Rk; Sun, 17 Apr 2022 12:22:32 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/6] staging: r8188eu: the frame type is shifted out
Date: Sun, 17 Apr 2022 12:22:18 +0200
Message-Id: <20220417102221.466524-4-martin@kaiser.cx>
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

The index calculation in mgt_dispatcher does not use the frame type. The
4-bit right shift ignores protocol version and frame type.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index be1afabe77d1..77a14f55b743 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -408,8 +408,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 
 	ptable = mlme_sta_tbl;
 
-	index = (le16_to_cpu(hdr->frame_control) &
-		 (IEEE80211_FCTL_STYPE | IEEE80211_FCTL_FTYPE)) >> 4;
+	index = (le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_STYPE) >> 4;
 	if (index > 13)
 		return;
 	ptable += index;
-- 
2.30.2

