Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429222C85
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 06:12:10 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id o20so5236589wro.3
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 23:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nNzJU9Y0TN+qNE5qJcuFSRHdr3qJUmf5dCSvTeevenI=;
        b=ANdB3oFZnXCafq+MQbhJNlRkccq1wVIELxjMlYiX2ZU+wsa/0SDckhCa28iFKISyDO
         b6aK+IxalKhIZnCeMIXYON9LbmPpSicfaD1i7rO4z0UeF0HqHM/JG+OMWvhmlrwVhhZI
         ZY4mU+sMEOPIA4aaQHMbMs14KiVZOPwi/AhM/nhveMT4kgIF9sBaiPtsg0cNTsPFcdqq
         IVvTxtQBCHxqpqBB0wn1C/LS2/2lOM4kVeDgWha6fPcDOF0mWcxwqL2wmp5zv//GsDmS
         hzgqimSCw5tSa+vC2Gt2KPZI9CjQqHX6aqgxEa42KBlDvTOtyfjlb7ubzM25TjGd+SPQ
         zCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nNzJU9Y0TN+qNE5qJcuFSRHdr3qJUmf5dCSvTeevenI=;
        b=aTLHmoBnfq4KpBF56Qbf9a699H8lf/5g1vjz/bMYqPUyiLTCrgbk4x8us+j3zy2r4Q
         MzfNq1LrPzO6S1UQZNyIqWDGtm0l9lHeZbx4Y8QqccfQdMdE2FGrJxv6xRwsdrtVNLbj
         CdLRPkTfBh6yIoywnAnooa8kEc4WO86NNMCCEB3+ZT7Nv5TQzYTAi2FoyRXUfCzTdMPA
         Xb8/qsP90VLmin3yfVa2eR8ijTtmHS+kYE/KTqnKCWgIrG9yuBPgyY0d9X5P14txELd4
         Gt4Oh91S18dBa2i/+ZO9HqBFwzoe9YodBcBdfwQxjllKZeOUcCmlBVSMp+aI/iThvppd
         1JXg==
X-Gm-Message-State: AOAM530UVd4LCy3JlTCQLmdQRMSlbvD7+wfaMYUryBFzoCKAKe70H2Bg
	tY8gSBplp67WbA/eQh2gE10=
X-Google-Smtp-Source: ABdhPJzvpHh7Kg9/PSeVa1E2N4RIAT/2jC9jWEdRpAWXy/1jh8Pzr4PTphK0flBGavRG4TUxUC4XXQ==
X-Received: by 2002:a7b:cc18:: with SMTP id f24mr7914179wmh.8.1633500728703;
        Tue, 05 Oct 2021 23:12:08 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e8sm3893071wme.46.2021.10.05.23.12.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Oct 2021 23:12:08 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
Date: Wed,  6 Oct 2021 08:12:02 +0200
Message-Id: <20211006061204.2854-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
References: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
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

