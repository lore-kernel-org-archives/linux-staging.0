Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49987EB
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:14:44 +0000 (UTC)
Received: from ipservice-092-217-079-032.092.217.pools.vodafone-ip.de ([92.217.79.32] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1omsbZ-0000nk-1l; Mon, 24 Oct 2022 10:14:41 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/17] staging: r8188eu: remove unnecessary label
Date: Mon, 24 Oct 2022 10:14:13 +0200
Message-Id: <20221024081417.66441-14-martin@kaiser.cx>
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

Remove a label on OnAuthClient that just calls return. We can return
directly instead of jumping to this label.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 074c95f76e27..01fe5019b333 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -823,7 +823,7 @@ static void OnAuthClient(struct adapter *padapter, struct recv_frame *precv_fram
 		}
 
 		set_link_timer(pmlmeext, 1);
-		goto authclnt_fail;
+		return;
 	}
 
 	if (seq == 2) {
@@ -833,7 +833,7 @@ static void OnAuthClient(struct adapter *padapter, struct recv_frame *precv_fram
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
 			if (!p)
-				goto authclnt_fail;
+				return;
 
 			memcpy((void *)(pmlmeinfo->chg_txt), (void *)(p + 2), len);
 			pmlmeinfo->auth_seq = 3;
@@ -849,18 +849,16 @@ static void OnAuthClient(struct adapter *padapter, struct recv_frame *precv_fram
 		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
 			go2asoc = 1;
 		else
-			goto authclnt_fail;
+			return;
 	} else {
 		/*  this is also illegal */
-		goto authclnt_fail;
+		return;
 	}
 
 	if (go2asoc) {
 		start_clnt_assoc(padapter);
 		return;
 	}
-authclnt_fail:
-	return;
 }
 
 static void UpdateBrateTbl(u8 *mbrate)
-- 
2.30.2

