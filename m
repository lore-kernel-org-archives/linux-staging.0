Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C92C89
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 11:23:11 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id m22so7854307wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nNzJU9Y0TN+qNE5qJcuFSRHdr3qJUmf5dCSvTeevenI=;
        b=DvkR5dgnWDdBS+0qZqDLqptsMrO48mZFBOoVfrhVp1wxj0c0lqbipUlch7OZ2zz6Ju
         FJ808jczCkC64MPyLQ3ZaKyj+N60OlK4MlMcS+EKYeBqdXvtsec4ES4LUhDg+Cb9igbp
         P2qfaBhC4M3KEmlyTrfH6d7CZObxFLz7co3AJM8bwypCl6XkaeiexgM2xkaNWqQ6Zqok
         56RiOXUbl/GGEhcaCu/ffI6h9/qneYg71jDglCCaVPNfTXtWBPutm9YYGaEGR7Vs+Id1
         54sA9MQelc5oQvRlUJ3chptIlSUGFO4LaM/DhnzsUQLB29hbkyQoQahqA3qBJruBF7O7
         JtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nNzJU9Y0TN+qNE5qJcuFSRHdr3qJUmf5dCSvTeevenI=;
        b=Om/yKGFaCo7NtaMQPWGnXELNC5drZX8ePa/MDbk9stD1lzc6/Q50sGT+/Hhthv+pq1
         9NJ9qLEvpQlUQLlnADMaYHCT7HELjSXUYFAO7lFBSdETwsKvAJUuP5xl7H+zar/yun7t
         NDjkqM+SgRuLEkS5ACZnN+do9BAY+2iMkrNtBWAfLB9SIf3CP+Cp5zgEXvNEz0utia9h
         EnOdBzoUi5eHeI2bwg23RiXfOU4VRaoJg9Ir2cifJdLdGEBtJ9vc+d+YjdgO6piZZUMn
         G6IjnxRBPbOf5ma5eQvwoowBaRCXYz09JlzKArI54rcOJ+dBWrCzeWoIfUjA/QpKZ5qZ
         sN/A==
X-Gm-Message-State: AOAM532gL2vi9/Yqw0WboyYXgZaKv7k9KQetiB23cAg7MbciaU+jtf92
	aZoG3nWvyWPRhwpDGGY0HMIJ4yB/zbw=
X-Google-Smtp-Source: ABdhPJxnXLZqC6UG7sG5RazrmyOBoNZVOuzAPL7APxcEs7FsSvkkn735SXc27MC7cXQ47Hksg6RmUg==
X-Received: by 2002:adf:e74b:: with SMTP id c11mr26414202wrn.362.1633519389838;
        Wed, 06 Oct 2021 04:23:09 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e14sm10801985wrw.33.2021.10.06.04.23.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Oct 2021 04:23:09 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	john@phrozen.org
Subject: [PATCH v2 2/4] dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
Date: Wed,  6 Oct 2021 13:23:04 +0200
Message-Id: <20211006112306.4691-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
References: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make system controller a reset provider for all the peripherals in the
MT7621 SoC adding '#reset-cells' property.

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
2.33.0

