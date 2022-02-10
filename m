Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2468629CA
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 09:49:04 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w11so8505819wra.4
        for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 01:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yRYGNAl0pjBDWXPtAqz7vqkpRSHwTyJKPqb9oNWE6kY=;
        b=HeGoYP/rEatGVaml9kregQlj4BieZdcc6Hr/q8qOEE+zwHfIHOccZJxCp23L2LcDhh
         1qBplkuUzOpLa3OIrzGR5RpFGZrPqKH+LCOzB51nYmlsiiEqQ94cMMDZS+siEb+CK3Qj
         ZjEFQto/zsnriMdxKtSmvHq2npjJKxYZPr6BrcinSuIsaLdh1dqQnyWRSRaxNrFinOVs
         mkr3LDI6l2tGAouSwAkuQMO2wHgUT60gW2HLG+r0o400jEuNyz0xFKOl3NkC66ae76ht
         hx1M2aD45aShmjxzAGuv2DPIf0w0t9+M7P47N3kCekKKgThCudS5wFEdorCjuIsKeaVT
         3/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yRYGNAl0pjBDWXPtAqz7vqkpRSHwTyJKPqb9oNWE6kY=;
        b=stl+Kz62r9PJZ/TXLLdudA5Go6rWKkLI6qtO4xiTu36bIqqb29tAoF0Rcpo23sdiFj
         J6B//W8zvRuBmSBYWPhinVQMo2DAPq4jNX8hXpXlVi4SwkTKqy1C7p//yXLuuF4ZxAyC
         /8+DRCBBj9I9y8c5Y2LSL3U4GyD340rMVgKrlGvDVutFYChIJQ4/CYlhe7dRVsi6eq2e
         G9dkNke/2QNdyx4YXw9Vhh+lH1nADtzTMTNU0i9Ga1yirOT8ofTqzTA0FHIaS5Ko2ouM
         QCzQNEX9s+VQAtyWBJhI3n1zfLNuNUpjPDqVQTSE5XA0ppdO0a6itG95Tt0o93Eyd9J4
         ZOvg==
X-Gm-Message-State: AOAM531d2O+i3FGgtsz4+QET3d9bimTXiCAaL3ufc7+Dyt9mLpPGFeRP
	9/QajOzBS6kLdfIdVrpJqIg=
X-Google-Smtp-Source: ABdhPJxMtyxbSIk/k+sdqBups7FdUOW5IVuEgRYZUww7uBfCYCvpSjvX1C0BqI3TuFqFOm2X1Wg1MA==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr5528274wrs.682.1644486542341;
        Thu, 10 Feb 2022 01:49:02 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id j6sm6636601wrt.70.2022.02.10.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 01:49:01 -0800 (PST)
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
Subject: [PATCH v9 1/2] dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
Date: Thu, 10 Feb 2022 10:48:58 +0100
Message-Id: <20220210094859.927868-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210094859.927868-1-sergio.paracuellos@gmail.com>
References: <20220210094859.927868-1-sergio.paracuellos@gmail.com>
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
Acked-by: Stephen Boyd <sboyd@kernel.org>
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

