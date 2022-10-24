Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B437EA
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:14:48 +0000 (UTC)
Received: from ipservice-092-217-079-032.092.217.pools.vodafone-ip.de ([92.217.79.32] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1omsbc-0000nk-US; Mon, 24 Oct 2022 10:14:45 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 17/17] staging: r8188eu: go2asoc is not needed
Date: Mon, 24 Oct 2022 10:14:17 +0200
Message-Id: <20221024081417.66441-18-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221024081417.66441-1-martin@kaiser.cx>
References: <20221024081417.66441-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the go2asoc variable in OnAuthClient and call start_clnt_assoc
directly. This makes the code a tiny bit shorter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 77402e55f640..ffb708f242e6 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -796,7 +796,6 @@ static void OnAuthClient(struct adapter *padapter, struct recv_frame *precv_fram
 {
 	unsigned int	seq, len, status, offset;
 	unsigned char	*p;
-	unsigned int	go2asoc = 0;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->rx_data;
@@ -843,15 +842,12 @@ static void OnAuthClient(struct adapter *padapter, struct recv_frame *precv_fram
 			return;
 		} else {
 			/*  open system */
-			go2asoc = 1;
+			start_clnt_assoc(padapter);
 		}
 	} else if (seq == 4) {
 		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
-			go2asoc = 1;
+			start_clnt_assoc(padapter);
 	}
-
-	if (go2asoc)
-		start_clnt_assoc(padapter);
 }
 
 static void UpdateBrateTbl(u8 *mbrate)
-- 
2.30.2

