Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD35629
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:22:37 +0000 (UTC)
Received: from dslb-188-096-140-061.188.096.pools.vodafone-ip.de ([188.96.140.61] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ng238-0002FP-Be; Sun, 17 Apr 2022 12:22:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/6] staging: r8188eu: don't call empty DoReserved function
Date: Sun, 17 Apr 2022 12:22:20 +0200
Message-Id: <20220417102221.466524-6-martin@kaiser.cx>
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

Replace the DoReserved function pointer with NULL in mlme_sta_tbl. We can
skip the function call for reserved subtypes.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 492f481b61ec..abb910f33c1c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -22,8 +22,8 @@ static mlme_handler mlme_sta_tbl[] = {
 	OnAssocRsp,
 	OnProbeReq,
 	OnProbeRsp,
-	DoReserved,
-	DoReserved,
+	NULL,
+	NULL,
 	OnBeacon,
 	OnAtim,
 	OnDisassoc,
-- 
2.30.2

