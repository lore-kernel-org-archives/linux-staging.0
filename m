Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585929CA
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:02:22 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so10604914wma.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hCQNOMNyM55BALmAbQOnxmGoDHPEw3FntTC8rnetrBc=;
        b=JMmmGDnOo3PY1Ix16BVcnJO8EwRXCPXX5sP54wcBNSKOh/vdQL3sK+sk98g+wiEQup
         ez3RcbHrhQ/tzeWwXrZs3q60PYo38SLegYLTsgwaDnXbhh73IKI7yxebHmHMMUbmTKKE
         p0LSZYgfKVRUXdc3KfRaBXYYgY0ZajCYh5WmoIaF2b3Fjv5GZOFfrBj/p1i2mIPp5TKk
         1bFFwT/QR/RLNJu2lMNgO1ZEgRfDEgzZUb+YCuAp8crf03P+Cb/2MQLYRr6KWpX+OAtM
         AHYWpQn3CoWBNEFKGh3vibi671p8RWM7bTSrMxlnp8EMg7OotRqrdgLqVjPKwJlkJvoL
         7HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hCQNOMNyM55BALmAbQOnxmGoDHPEw3FntTC8rnetrBc=;
        b=tB16izb07yefgqQTytCuxK/Du8daR2cqjZAKukOd3D+Aqu/ZRJpLblJsrMBcEbzhel
         DB9ASAZ+yFquboNbHj4EprU8taUxCovUpOHEuRIM8FsVyuJhs2iyMRkNcOGTnUMnMVEM
         OOSlAwwPWMv2ciaoGwgAJiHzbgrgoEPZAkVXEfyXfZCs3bIjCrEgN9L96v4a+9HtGTLM
         84PQGC8AyT1J3aAjF7gIK8IQCSGnNTjfLyn/dIZ7CvX5PVTE1Xea1pidfCsUAuI7KsbW
         eEVFL7WZrdsyrpm0LGKRprLVP1vebfgTFzNYd7HVpvwJWItfJdqoKyLbIq1h2isC7Kad
         G95g==
X-Gm-Message-State: AOAM531G1qO+OJzpRWjBnJx8p5IKh7DDHEwOp6ycBdTdKBR3koKnNw5I
	B1ze8QdzcHyStLtbsd2S2Qft4Zh19fo=
X-Google-Smtp-Source: ABdhPJzaVd7Im4aDpIuteTlfOL/2uidMM2lEf0wS2u53VUGzEIM7YpNuzG7PdC/8d9JSHFHX3A3kVw==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr16177352wmj.144.1629720140916;
        Mon, 23 Aug 2021 05:02:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id g5sm901332wrq.80.2021.08.23.05.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:02:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/8] staging: r8188eu: ensure proper alignment for eth address buffers
Date: Mon, 23 Aug 2021 14:00:59 +0200
Message-Id: <20210823120106.9633-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823120106.9633-1-straube.linux@gmail.com>
References: <20210823120106.9633-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add __aligned(2) to eth address buffers in structs rx_pkt_attrib and
pkt_attrib to ensure proper alignment for usage with functions from
<linux/etherdevice.h>

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_recv.h | 10 +++++-----
 drivers/staging/r8188eu/include/rtw_xmit.h |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 81594e7aed51..1b41f8d7d079 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -109,11 +109,11 @@ struct rx_pkt_attrib {
 
 	u16 eth_type;
 
-	u8	dst[ETH_ALEN];
-	u8	src[ETH_ALEN];
-	u8	ta[ETH_ALEN];
-	u8	ra[ETH_ALEN];
-	u8	bssid[ETH_ALEN];
+	u8	dst[ETH_ALEN] __aligned(2);
+	u8	src[ETH_ALEN] __aligned(2);
+	u8	ta[ETH_ALEN] __aligned(2);
+	u8	ra[ETH_ALEN] __aligned(2);
+	u8	bssid[ETH_ALEN] __aligned(2);
 
 	u8 ack_policy;
 
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index e1418a3f7ed1..5f6e2402e5c4 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -122,10 +122,10 @@ struct pkt_attrib {
 	u8	ack_policy;
 	u8	mac_id;
 	u8	vcs_mode;	/* virtual carrier sense method */
-	u8	dst[ETH_ALEN];
-	u8	src[ETH_ALEN];
-	u8	ta[ETH_ALEN];
-	u8	ra[ETH_ALEN];
+	u8	dst[ETH_ALEN] __aligned(2);
+	u8	src[ETH_ALEN] __aligned(2);
+	u8	ta[ETH_ALEN] __aligned(2);
+	u8	ra[ETH_ALEN] __aligned(2);
 	u8	key_idx;
 	u8	qos_en;
 	u8	ht_en;
-- 
2.32.0

