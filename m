Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C07A29
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 15:16:14 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndCoo-0005k2-1o; Sat, 09 Apr 2022 17:16:06 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/8] staging: r8188eu: make return values consistent
Date: Sat,  9 Apr 2022 17:15:52 +0200
Message-Id: <20220409151557.207980-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409151557.207980-1-martin@kaiser.cx>
References: <20220409151557.207980-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_pwr_wakeup should return _SUCCESS or _FAIL.

Replace false with _FAIL in one place and reformat the if-statement.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index c43759500ef9..a7471468e2e2 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -392,10 +392,8 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 		}
 	}
 
-	/* TODO: the following checking need to be merged... */
-	if (padapter->bDriverStopped || !padapter->bup ||
-	    !padapter->hw_init_completed) {
-		ret = false;
+	if (padapter->bDriverStopped || !padapter->bup || !padapter->hw_init_completed) {
+		ret = _FAIL;
 		goto exit;
 	}
 
-- 
2.30.2

