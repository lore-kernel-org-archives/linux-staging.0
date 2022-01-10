Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F752CA3
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 08:39:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id e5so8182444wmq.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 00:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Y+fkGNLGqdfMAAiGU48wuA+SIBMA19TPv5MMqKzhcc=;
        b=MhigOSGLaWchHK24cy23CmZKOnM8CIar36SUtK2JCZhxA8+VIjZikqsO37xv/HiqeN
         Xt7+LZUymU6S8pjtqa+3fOJdrNA9aFx8FipBiqWSbNHx88XGRoyjpcFD/cB4FR0fL/lh
         xAm8cBuMDNokwnBBciJFlLakGRO+liwUXwnCIZ3FvJNHvm+P8HnUYDBPGqSxBRCOVTHf
         O+XNlHGdugLWchVGNcXnMzoLtfWP+7X+JQpzLceWKcKhbEPcWYVk7V22fLiz15gijh/M
         G/5PC7lTtPhB8X5OXsY6zHG72eZsPVQwsS+oB+zpqwL9ZdehlVynAg6eLF7/wpsuZn4X
         2ZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Y+fkGNLGqdfMAAiGU48wuA+SIBMA19TPv5MMqKzhcc=;
        b=rS2pXK+zHNqtB6Rdn0ZCTm6YZgyiPDrbaamojCTC+pP6/AyfZGHn9yETo/LlhqXInx
         /+JU8XJwlHYvtrCyuVp0V5aH6CGqDlFIXALyyOgccZJ3MKsdMeRgL8gbLHJgV4Q3kWRE
         3dOuaT/K/YtSiz4CX5zeIiX8fJDvkVKpj8rvHkuHJfSA0CeNblfJoIRsMCZvKzlYaDcV
         oCFuOTuZ81Vi83lygcCNzxHvLvAf5lvwLTG3zehJqjETgqPWzkJfCHtvU/gtLijRqzzH
         Qya3+LpDKPZL3+LbyxUd/sPNNiNA7zPbs/LNJ+2xz3UjOt4zWROXIFx42O0pcpDVP/Ax
         LaoQ==
X-Gm-Message-State: AOAM531NH8+XJVpuqDE5sffTaLnnvC6XyXR+Dn3ZzmtFPOEBxHNKYWxf
	4COMrejQjqrKtUlxCZGSd+M=
X-Google-Smtp-Source: ABdhPJycHdlLGlDD8T9SXQB3qKMTovwuGLnXIUg28UmVzzNF+rLWRW8LCju1eWkY9e6tNtzc/na3sg==
X-Received: by 2002:a1c:43c5:: with SMTP id q188mr11393626wma.54.1641803954064;
        Mon, 10 Jan 2022 00:39:14 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id m7sm508926wmi.13.2022.01.10.00.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 00:39:13 -0800 (PST)
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
Subject: [PATCH v6 2/4] dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
Date: Mon, 10 Jan 2022 09:39:08 +0100
Message-Id: <20220110083910.1351020-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
References: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
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

