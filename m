Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E3321F
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:55:58 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPto-0004Tu-Qp; Sat, 06 Aug 2022 21:55:53 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/13] staging: r8188eu: move endpoint init functions to usb_halinit.c
Date: Sat,  6 Aug 2022 21:55:31 +0200
Message-Id: <20220806195540.777390-5-martin@kaiser.cx>
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

Move the Hal_MappingOutPipe function and the functions
one_/two_/three_out_pipe from hal_com.c to usb_halinit.c.

After this move, all the functions that rtl8188eu_interface_configure
calls are in one file and we can continue to summarize and merge them.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/hal_com.c     | 108 ----------------------
 drivers/staging/r8188eu/hal/usb_halinit.c | 108 ++++++++++++++++++++++
 drivers/staging/r8188eu/include/hal_com.h |   2 -
 3 files changed, 108 insertions(+), 110 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_com.c b/drivers/staging/r8188eu/hal/hal_com.c
index d24e0e5924eb..8416a65ba47b 100644
--- a/drivers/staging/r8188eu/hal/hal_com.c
+++ b/drivers/staging/r8188eu/hal/hal_com.c
@@ -138,114 +138,6 @@ void HalSetBrateCfg(struct adapter *adapt, u8 *brates, u16 *rate_cfg)
 	}
 }
 
-static void one_out_pipe(struct adapter *adapter)
-{
-	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapter);
-
-	pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-	pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
-	pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[0];/* BE */
-	pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0];/* BK */
-
-	pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-	pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-	pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-	pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
-}
-
-static void two_out_pipe(struct adapter *adapter, bool wifi_cfg)
-{
-	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapter);
-
-	if (wifi_cfg) { /* WMM */
-		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
-		/*  0,  1,  0,  1,   0,   0,   0,    0,    0}; */
-		/* 0:H, 1:L */
-
-		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[1];/* VO */
-		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
-		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1];/* BE */
-		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0];/* BK */
-
-		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
-
-	} else {/* typical setting */
-		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
-		/*  1,	1,  0,  0,   0,   0,   0,    0,    0}; */
-		/* 0:H, 1:L */
-
-		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
-		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1];/* BE */
-		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[1];/* BK */
-
-		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
-	}
-}
-
-static void three_out_pipe(struct adapter *adapter, bool wifi_cfg)
-{
-	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapter);
-
-	if (wifi_cfg) {/* for WMM */
-		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
-		/*  1,	2,  1,  0,   0,   0,   0,    0,    0}; */
-		/* 0:H, 1:N, 2:L */
-
-		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1];/* VI */
-		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2];/* BE */
-		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[1];/* BK */
-
-		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
-
-	} else {/* typical setting */
-		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
-		/*  2,  2,  1,  0,   0,   0,   0,    0,    0}; */
-		/* 0:H, 1:N, 2:L */
-
-		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
-		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1];/* VI */
-		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2];/* BE */
-		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[2];/* BK */
-
-		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
-		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
-		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
-	}
-}
-
-int Hal_MappingOutPipe(struct adapter *adapter, u8 numoutpipe)
-{
-	struct registry_priv *pregistrypriv = &adapter->registrypriv;
-	bool wifi_cfg = pregistrypriv->wifi_spec;
-
-	switch (numoutpipe) {
-	case 2:
-		two_out_pipe(adapter, wifi_cfg);
-		break;
-	case 3:
-		three_out_pipe(adapter, wifi_cfg);
-		break;
-	case 1:
-		one_out_pipe(adapter);
-		break;
-	default:
-		return -ENXIO;
-	}
-	return 0;
-}
-
 /*
 * C2H event format:
 * Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index ed0faf4fd51d..8be93c44c903 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -35,6 +35,114 @@ static void _ConfigNormalChipOutEP_8188E(struct adapter *adapt, u8 NumOutPipe)
 	}
 }
 
+static void one_out_pipe(struct adapter *adapter)
+{
+	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapter);
+
+	pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
+	pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
+	pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[0];/* BE */
+	pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0];/* BK */
+
+	pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
+	pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
+	pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
+	pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+}
+
+static void two_out_pipe(struct adapter *adapter, bool wifi_cfg)
+{
+	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapter);
+
+	if (wifi_cfg) { /* WMM */
+		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
+		/*  0,  1,  0,  1,   0,   0,   0,    0,    0}; */
+		/* 0:H, 1:L */
+
+		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[1];/* VO */
+		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
+		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1];/* BE */
+		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[0];/* BK */
+
+		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
+		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
+		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
+		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+
+	} else {/* typical setting */
+		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
+		/*  1,	1,  0,  0,   0,   0,   0,    0,    0}; */
+		/* 0:H, 1:L */
+
+		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
+		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[0];/* VI */
+		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[1];/* BE */
+		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[1];/* BK */
+
+		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
+		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
+		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
+		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+	}
+}
+
+static void three_out_pipe(struct adapter *adapter, bool wifi_cfg)
+{
+	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapter);
+
+	if (wifi_cfg) {/* for WMM */
+		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
+		/*  1,	2,  1,  0,   0,   0,   0,    0,    0}; */
+		/* 0:H, 1:N, 2:L */
+
+		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
+		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1];/* VI */
+		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2];/* BE */
+		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[1];/* BK */
+
+		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
+		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
+		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
+		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+
+	} else {/* typical setting */
+		/* BK, BE, VI, VO, BCN,	CMD, MGT, HIGH, HCCA */
+		/*  2,  2,  1,  0,   0,   0,   0,    0,    0}; */
+		/* 0:H, 1:N, 2:L */
+
+		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[0];/* VO */
+		pdvobjpriv->Queue2Pipe[1] = pdvobjpriv->RtOutPipe[1];/* VI */
+		pdvobjpriv->Queue2Pipe[2] = pdvobjpriv->RtOutPipe[2];/* BE */
+		pdvobjpriv->Queue2Pipe[3] = pdvobjpriv->RtOutPipe[2];/* BK */
+
+		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0];/* BCN */
+		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
+		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
+		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
+	}
+}
+
+static int Hal_MappingOutPipe(struct adapter *adapter, u8 numoutpipe)
+{
+	struct registry_priv *pregistrypriv = &adapter->registrypriv;
+	bool wifi_cfg = pregistrypriv->wifi_spec;
+
+	switch (numoutpipe) {
+	case 2:
+		two_out_pipe(adapter, wifi_cfg);
+		break;
+	case 3:
+		three_out_pipe(adapter, wifi_cfg);
+		break;
+	case 1:
+		one_out_pipe(adapter);
+		break;
+	default:
+		return -ENXIO;
+	}
+	return 0;
+}
+
 int rtl8188eu_interface_configure(struct adapter *adapt)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapt);
diff --git a/drivers/staging/r8188eu/include/hal_com.h b/drivers/staging/r8188eu/include/hal_com.h
index 3dfb61e64ee0..e8007295cd79 100644
--- a/drivers/staging/r8188eu/include/hal_com.h
+++ b/drivers/staging/r8188eu/include/hal_com.h
@@ -143,8 +143,6 @@ u8 MRateToHwRate(u8 rate);
 
 void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg);
 
-int Hal_MappingOutPipe(struct adapter *pAdapter, u8 NumOutPipe);
-
 s32 c2h_evt_read(struct adapter *adapter, u8 *buf);
 
 #endif /* __HAL_COMMON_H__ */
-- 
2.30.2

