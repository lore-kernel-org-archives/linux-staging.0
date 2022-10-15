Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941572106
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:24:54 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojj1v-000722-Kn; Sat, 15 Oct 2022 17:24:51 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/9] staging: r8188eu: clarify the bBusyTraffic assignment
Date: Sat, 15 Oct 2022 17:24:34 +0200
Message-Id: <20221015152440.232281-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221015152440.232281-1-martin@kaiser.cx>
References: <20221015152440.232281-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bBusyTraffic is set only if we're not in WIFI_AP_STATE, i.e. in the else
branch. If we were not in WIFI_AP_STATE, we'd go into the if branch and
return _SUCCESS before making it to the bBusyTraffic assignment.

Move the assignment into the else branch to make this clearer.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 5c59fc91ecae..fd2daeca7112 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1515,8 +1515,9 @@ unsigned int OnDeAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 
 		if (!ignore_received_deauth)
 			receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
+
+		pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 	}
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 	return _SUCCESS;
 }
 
-- 
2.30.2

