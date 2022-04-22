Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B17A
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 14:10:27 +0000 (UTC)
Received: from ipservice-092-217-076-017.092.217.pools.vodafone-ip.de ([92.217.76.17] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nhtzL-0000tV-8B; Fri, 22 Apr 2022 16:10:23 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] staging: r8188eu: fix the index check in mgt_dispatcher
Date: Fri, 22 Apr 2022 16:09:58 +0200
Message-Id: <20220422140958.239767-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mgt_dispatcher, we check that index is a valid index for the
mlme_sta_tbl array. The valid indices for this array are from 0 to
ARRAY_SIZE(mlme_sta_tbl) - 1.

An invalid index is >= ARRAY_SIZE(mlme_sta_tbl). Fix the off by one error
in the check.

Fixes: db84803cd8de ("staging: r8188eu: use ARRAY_SIZE for mlme_sta_tbl")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index f426e26341ee..839b0b85993e 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -398,7 +398,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 		return;
 
 	index = (le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_STYPE) >> 4;
-	if (index > ARRAY_SIZE(mlme_sta_tbl))
+	if (index >= ARRAY_SIZE(mlme_sta_tbl))
 		return;
 	fct = mlme_sta_tbl[index];
 
-- 
2.30.2

