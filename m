Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001ED2CA4
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:10:42 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q8so25947839wra.12
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 03:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Y+fkGNLGqdfMAAiGU48wuA+SIBMA19TPv5MMqKzhcc=;
        b=WEPjMZtOAXr7fZIRboXRNF6OMOzS5/39hE9F4zXCYn2EdfnL786zpdkn28+k8Fidky
         RwnQeCtuTO8AauTUqcvS0suoNpCm/R5Gy57MpjQd7W9nzIMyUS4Xzug1zthyBgH9LRo4
         svZqq2ZJtU2z9RTKt9ibxBu7W6GbdzGjpGu/YREmAIIjJOZ8ghee7LsjVlmYHk1BzV5O
         E0B95Zjybm1NmMJK4J4xfholJEsZ5K9iotEbv1T3UCmSk6EYIMFsejR2wSO8POCIh/ZM
         sEa+79OjjjSCtk5n+fMdnSKEECJfyjkbeypV2SSEE0e14J1/42e38OEAEcCfEWR4fBTi
         rryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Y+fkGNLGqdfMAAiGU48wuA+SIBMA19TPv5MMqKzhcc=;
        b=Vx1f2d150X0ocw0IC3ebEHNMtQnpf+D3/V6cc+CXO5KRhh3d+zUaCne0hHIxAwfnCm
         6ZD7SRqU4BzlZnHBd2FKMUACSFWCdvimWhWAZ/hKlK32AdyCZIzZnn1ax7ImyoQaU9Qv
         kkKvwrxMLdl7/CyHe/n/UuG0H9XRfKpRFmazFTh17it3AnSYBa5duWvIRtculzNs13yM
         GleZoawWSZ3KA10N+1PG9DRGWienFWNupoMMyEYHUNS++pDOrEuHHIRzBJegZEY+ypVS
         z5LF1EZlkY5eoP8lQuM/6yGMhOc5MuZq+MKYagFz0s8GdAuGZ6s0qE7aYnxRhSOF7V6o
         Yt5g==
X-Gm-Message-State: AOAM531OP3gz8Fkdnf68KaA/GTI0lbL9FqVUM1pwx1wZFMr7AJK1RFhv
	9nDH572IOMfPJrFebaEjLw0=
X-Google-Smtp-Source: ABdhPJwW9kIN/9Mh/TG8AKFuyWScF5czudxJwo1Pcxa3oPDf+2UX/F48pWPW1R/oPWWcYS1b30TCLQ==
X-Received: by 2002:adf:a443:: with SMTP id e3mr3841195wra.183.1641813041463;
        Mon, 10 Jan 2022 03:10:41 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id x8sm6256733wmj.44.2022.01.10.03.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 03:10:41 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	sboyd@kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7 2/4] dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
Date: Mon, 10 Jan 2022 12:10:34 +0100
Message-Id: <20220110111036.1380288-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110111036.1380288-1-sergio.paracuellos@gmail.com>
References: <20220110111036.1380288-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make system controller a reset provider for all the peripherals in the
MT7621 SoC adding '#reset-cells' property.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-sysc.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
index 915f84efd763..0c0b0ae5e2ac 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
@@ -22,6 +22,11 @@ description: |
 
   The clocks are provided inside a system controller node.
 
+  This node is also a reset provider for all the peripherals.
+
+  Reset related bits are defined in:
+  [2]: <include/dt-bindings/reset/mt7621-reset.h>.
+
 properties:
   compatible:
     items:
@@ -37,6 +42,12 @@ properties:
       clocks.
     const: 1
 
+  "#reset-cells":
+    description:
+      The first cell indicates the reset bit within the register, see
+      [2] for available resets.
+    const: 1
+
   ralink,memctl:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -61,6 +72,7 @@ examples:
       compatible = "mediatek,mt7621-sysc", "syscon";
       reg = <0x0 0x100>;
       #clock-cells = <1>;
+      #reset-cells = <1>;
       ralink,memctl = <&memc>;
       clock-output-names = "xtal", "cpu", "bus",
                            "50m", "125m", "150m",
-- 
2.25.1

