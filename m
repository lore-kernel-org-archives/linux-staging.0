Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E48A95D
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 20:56:43 +0000 (UTC)
Received: from dslb-178-004-206-224.178.004.pools.vodafone-ip.de ([178.4.206.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFLfi-0001pw-NV; Tue, 10 Jan 2023 21:56:38 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: refactor status handling in usb_write_port_complete
Date: Tue, 10 Jan 2023 21:56:23 +0100
Message-Id: <20230110205626.183516-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110205626.183516-1-martin@kaiser.cx>
References: <20230110205626.183516-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the satus handling in usb_write_port_complete. Make it clearer
what happens for each status and avoid all the goto statements.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 257bcf496012..8494b80a08e5 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -48,21 +48,20 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 	    padapter->bWritePortCancel)
 		goto check_completion;
 
-	if (purb->status) {
-		if (purb->status == -EINPROGRESS) {
-			goto check_completion;
-		} else if (purb->status == -ENOENT) {
-			goto check_completion;
-		} else if (purb->status == -ECONNRESET) {
-			goto check_completion;
-		} else if (purb->status == -ESHUTDOWN) {
-			padapter->bDriverStopped = true;
-			goto check_completion;
-		} else if ((purb->status != -EPIPE) && (purb->status != -EPROTO)) {
-			padapter->bSurpriseRemoved = true;
-
-			goto check_completion;
-		}
+	switch (purb->status) {
+	case 0:
+	case -EINPROGRESS:
+	case -ENOENT:
+	case -ECONNRESET:
+	case -EPIPE:
+	case -EPROTO:
+		break;
+	case -ESHUTDOWN:
+		padapter->bDriverStopped = true;
+		break;
+	default:
+		padapter->bSurpriseRemoved = true;
+		break;
 	}
 
 check_completion:
-- 
2.30.2

