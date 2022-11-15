Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A8D3C2D;
	Tue, 15 Nov 2022 12:40:51 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id d20so17298441ljc.12;
        Tue, 15 Nov 2022 04:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9K7OHdISQ9ndYJcM7FeOopDqicN3TnOW0AKBc0hd7r4=;
        b=EVuGADnY9FOdegDv7u0W/l+DAgxjrGyqM1nvo/0V8YD48lTvchKrzuP2BgRcg3tDPJ
         VTWFGGJ+O2+qzQQmKcehwOqfck9Ko+M7mEXMZ+po+CfyuC2AiDE6LEoH7T2i+BcNLzOv
         vd2wqOughcTVA4qpAdm2s09ax7/ayxh+CvjNp+MjGUOjuk3h+5B3pAeB+WmesJJmzczQ
         druyVSwW5blhk1WfLwcnfBoTGcD0mDTYDvfY26njwbp1eXFC9py7fIZTmoHmJ7J6UG9w
         i9D0UovTO6iCe4qUvwlgs/yq6gNIdSRlmxIr9x41MI9Z3nki6BIPmTX8VbKxA3RVMgzm
         Zv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9K7OHdISQ9ndYJcM7FeOopDqicN3TnOW0AKBc0hd7r4=;
        b=e8gUDYDdnaOYn2p6H5utpfNAJWlAtS2ns+WQuGD5TYweBoUN/7HKpPGSF3gNzo9gkT
         O4KzI8AIfa4qocg4WzslT0szZOdWZwzFyrBkxxtG5WKM2Ogbx0gJMG+dV3SyiYNuaSJg
         aP79U8GbLGg6rEDlCftQfQqBll8wrwCVaTOgfczHHsQLqmLsXntOCif7CA0xhCm9KSKo
         vgc2ey0L8iAxAtDNq5lox8M/C4cS5jboS809UPSnZTdSoRDqj/zJqgw/4Lirqx3IpsmK
         P0gVjeHwzW05oVjyejOKW/nLck672U53OxL4vEFjnLJCrsJqXVMsWvFklZV4eR0r20h5
         eJOA==
X-Gm-Message-State: ANoB5pkcxaXzCILTVeFubDiEydW4ae3vm6rWMIxvR18JhWOwQ5kJePyd
	2omkJRMq30Zb8Ug/jXET4m6LPibfub1dWQ==
X-Google-Smtp-Source: AA0mqf63kRve2WrOP8O0jvw0gQ3MiYYKl3f+DbyQEsGsomyVUGztVQISw5/2YzfQkk0nH/qPGRziAg==
X-Received: by 2002:a2e:a814:0:b0:277:40f:4c1c with SMTP id l20-20020a2ea814000000b00277040f4c1cmr5301342ljq.410.1668516049622;
        Tue, 15 Nov 2022 04:40:49 -0800 (PST)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id a3-20020a05651c030300b002772414817esm2495208ljp.1.2022.11.15.04.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:40:49 -0800 (PST)
Date: Tue, 15 Nov 2022 12:40:48 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: vt6655: change the function name s_vFillCTSHead
Message-ID: <Y3OI0Brhp90/tbBh@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the use of Hungarian notation, which is not used in the Linux
kernel. Reported by checkpatch
Add indentation to the affected function to follow the Linux kernel
coding style. This improves visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 341e23054817..869685d27abe 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -21,7 +21,7 @@
  *      s_uGetRTSCTSDuration- get rtx/cts required duration
  *      get_rtscts_time- get rts/cts reserved time
  *      s_uGetTxRsvTime- get frame reserved time
- *      s_vFillCTSHead- fulfill CTS ctl header
+ *      fill_cts_header- fulfill CTS ctl header
  *      s_vFillFragParameter- Set fragment ctl parameter.
  *      fill_rts_header- fulfill RTS ctl header
  *      s_vFillTxKey- fulfill tx encrypt key
@@ -724,19 +724,15 @@ static void fill_rts_header(struct vnt_private *pDevice,
 	}
 }
 
-static
-void
-s_vFillCTSHead(
-	struct vnt_private *pDevice,
-	unsigned int uDMAIdx,
-	unsigned char byPktType,
-	void *pvCTS,
-	unsigned int cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-)
+static void fill_cts_header(struct vnt_private *pDevice,
+			    unsigned int uDMAIdx,
+			    unsigned char byPktType,
+			    void *pvCTS,
+			    unsigned int cbFrameLength,
+			    bool bNeedAck,
+			    bool bDisCRC,
+			    unsigned short wCurrentRate,
+			    unsigned char byFBOption)
 {
 	unsigned int uCTSFrameLen = 14;
 
@@ -891,7 +887,7 @@ static void generate_tx_parameter(struct vnt_private *pDevice,
 			buf->cts_rrv_time_ba = get_rtscts_time(pDevice, 3, byPktType, cbFrameSize, wCurrentRate);
 
 			/* Fill CTS */
-			s_vFillCTSHead(pDevice, uDMAIdx, byPktType, pvCTS, cbFrameSize, bNeedACK, bDisCRC, wCurrentRate, byFBOption);
+			fill_cts_header(pDevice, uDMAIdx, byPktType, pvCTS, cbFrameSize, bNeedACK, bDisCRC, wCurrentRate, byFBOption);
 		}
 	} else if (byPktType == PK_TYPE_11A) {
 		if (pvRTS) {/* RTS_need, non PCF mode */
-- 
2.34.1

