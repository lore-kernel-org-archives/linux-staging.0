Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AE81FDB
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:54:54 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V5-0008D7-6D; Sun, 03 Apr 2022 18:54:51 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/11] staging: r8188eu: don't copy ra and ta before we fail
Date: Sun,  3 Apr 2022 18:54:33 +0200
Message-Id: <20220403165438.357728-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403165438.357728-1-martin@kaiser.cx>
References: <20220403165438.357728-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In validate_recv_data_frame, we return an error if both to_ds and
from_ds are set in the incoming data frame. There's no need to populate
patrib->ra and ta before we return. The caller will free the received
frame, including pattrib.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 47d4fd01824f..c200e1251545 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -974,11 +974,6 @@ static int validate_recv_data_frame(struct adapter *adapter,
 		memcpy(pattrib->ta, psa, ETH_ALEN);
 		ret = sta2ap_data_frame(adapter, precv_frame, &psta);
 		break;
-	case 3:
-		memcpy(pattrib->ra, GetAddr1Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->ta, GetAddr2Ptr(ptr), ETH_ALEN);
-		ret = _FAIL;
-		break;
 	default:
 		ret = _FAIL;
 		break;
-- 
2.30.2

