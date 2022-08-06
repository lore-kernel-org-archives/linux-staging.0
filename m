Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28373321B
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:56:00 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPtr-0004Tu-KV; Sat, 06 Aug 2022 21:55:55 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/13] staging: r8188eu: remove comments about endpoint mapping
Date: Sat,  6 Aug 2022 21:55:34 +0200
Message-Id: <20220806195540.777390-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220806195540.777390-1-martin@kaiser.cx>
References: <20220806195540.777390-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the comments in two_out_pipe and three_out_pipe that show the
mappings. They simply repeat the settings in the code and provide no
additional information. Keep the info which RtOutPipe is high, normal
or low.

Without the removed comments, it'll be easier to summarize and reorganize
the code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 24 ++++++-----------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 664028c14141..e561c92f1dc9 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -32,11 +32,9 @@ static void two_out_pipe(struct adapter *adapter, bool wifi_cfg)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapter);
 
-	if (wifi_cfg) { /* WMM */
-		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
-		/*  0,  1,  0,  1,   0,   0,   0,    0,    0}; */
-		/* 0:H, 1:L */
+	/* 0:H, 1:L */
 
+	if (wifi_cfg) {
 		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[1];/* VO */
 		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
 		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1];/* BE */
@@ -47,11 +45,7 @@ static void two_out_pipe(struct adapter *adapter, bool wifi_cfg)
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
 
-	} else {/* typical setting */
-		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
-		/*  1,	1,  0,  0,   0,   0,   0,    0,    0}; */
-		/* 0:H, 1:L */
-
+	} else {
 		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
 		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
 		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1];/* BE */
@@ -68,11 +62,9 @@ static void three_out_pipe(struct adapter *adapter, bool wifi_cfg)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapter);
 
-	if (wifi_cfg) {/* for WMM */
-		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
-		/*  1,	2,  1,  0,   0,   0,   0,    0,    0}; */
-		/* 0:H, 1:N, 2:L */
+	/* 0:H, 1:N, 2:L */
 
+	if (wifi_cfg) {
 		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
 		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1];/* VI */
 		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2];/* BE */
@@ -83,11 +75,7 @@ static void three_out_pipe(struct adapter *adapter, bool wifi_cfg)
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
 
-	} else {/* typical setting */
-		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
-		/*  2,  2,  1,  0,   0,   0,   0,    0,    0}; */
-		/* 0:H, 1:N, 2:L */
-
+	} else {
 		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
 		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1];/* VI */
 		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2];/* BE */
-- 
2.30.2

