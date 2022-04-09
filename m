Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6EA36
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 16:32:23 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndE0Z-0006Rg-Ss; Sat, 09 Apr 2022 18:32:20 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/10] staging: r8188eu: summarize two if statements
Date: Sat,  9 Apr 2022 18:32:05 +0200
Message-Id: <20220409163212.241122-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409163212.241122-1-martin@kaiser.cx>
References: <20220409163212.241122-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Summarize the two if statements at the end of send_beacon.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index d85f2182b816..2deb92e5a00a 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5763,9 +5763,7 @@ unsigned int send_beacon(struct adapter *padapter)
 		} while ((poll % 10) != 0 && !bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 	} while (!bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
-		return _FAIL;
-	if (!bxmitok)
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped || !bxmitok)
 		return _FAIL;
 
 	return _SUCCESS;
-- 
2.30.2

