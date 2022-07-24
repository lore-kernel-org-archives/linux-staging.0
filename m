Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC6533EC
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 15:59:38 +0000 (UTC)
Received: from dslb-178-004-201-227.178.004.pools.vodafone-ip.de ([178.4.201.227] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oFdd0-0004Lf-2s; Sun, 24 Jul 2022 17:34:46 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] staging: r8188eu: remove DoReserved prototype
Date: Sun, 24 Jul 2022 17:33:49 +0200
Message-Id: <20220724153349.138741-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724153349.138741-1-martin@kaiser.cx>
References: <20220724153349.138741-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DoReserved function was removed in commit 869ddbfccdea ("staging:
r8188eu: remove dummy entries from OnAction_tbl"). Remove the prototype
as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 83d0980b5bf6..2d7856c74542 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -546,8 +546,6 @@ unsigned int OnProbeReq(struct adapter *padapter,
 			struct recv_frame *precv_frame);
 unsigned int OnProbeRsp(struct adapter *padapter,
 			struct recv_frame *precv_frame);
-unsigned int DoReserved(struct adapter *padapter,
-			struct recv_frame *precv_frame);
 unsigned int OnBeacon(struct adapter *padapter,
 		      struct recv_frame *precv_frame);
 unsigned int OnDisassoc(struct adapter *padapter,
-- 
2.30.2

