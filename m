Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251072585
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 12:49:18 +0000 (UTC)
Received: from ipservice-092-217-068-220.092.217.pools.vodafone-ip.de ([92.217.68.220] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1orf5P-0008Dj-5T; Sun, 06 Nov 2022 13:49:15 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 9/9] staging: r8188eu: remove checks in dump_mgntframe
Date: Sun,  6 Nov 2022 13:49:01 +0100
Message-Id: <20221106124901.720785-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221106124901.720785-1-martin@kaiser.cx>
References: <20221106124901.720785-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to check for bSurpriseRemoved and bDriverStopped in
dump_mgmtframe.

The sequence of function calls is

dump_mgntframe
   rtl8188eu_mgnt_xmit
      rtw_dump_xframe
         loop over all fragments

For each fragment, rtw_write_port is called. This function checks
bSurpriseRemoved and bDriverStopped.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 324757699716..17803aca83c8 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3959,9 +3959,6 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
-		return;
-
 	rtl8188eu_mgnt_xmit(padapter, pmgntframe);
 }
 
-- 
2.30.2

