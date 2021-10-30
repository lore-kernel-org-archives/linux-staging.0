Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E22C87
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 14:40:20 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id b2-20020a1c8002000000b0032fb900951eso5811973wmd.4
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OJp/wZiERGVBUU7HIuspGPpojRpXm2e3BfdSR6ZgDTc=;
        b=d5toudcTVdIEVYCVYXWFZjlG/GeMQ4BLjm/uq9/kHYBx/ZXd8GIMr2n/DGTWCGJ+9f
         PzR4W1+x84oIoruGgufXmG91NGKbaj85h94ZMW7tqrO7t+bBkbJQoxI7dd0+0w6Xok2e
         5oj4Wo8+Jm5s8wcu1aK6L6gkKVzLSlK81RPk7V/5oCKLONIygzWkfveHW7E3Ob/e/YIO
         40Ui1GAGSwtz/xsChZ/3pRdJCl3Jews/X05cxlVXXjTTJUzQ9w2J55KLdKj9D1RZ5GKy
         7zuhmxQFW908SyOI22BYyT2fJrx2CgVcMJhh6n2HiEdj+ZzADR+LGEjDZG7kMsa/6WhS
         c3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJp/wZiERGVBUU7HIuspGPpojRpXm2e3BfdSR6ZgDTc=;
        b=2d8cJ7Y8NR1SZFXCSluiFLsUsfc5LB1xP/Xzdiyf9hSGNPBMFRszW4Sr/l3J+pBB84
         WPkdKnqBpABEP0YxTJLY7jqPVxa9qRjg9PKIPlHfxUX2ZYouBiDSzsZ0IlrCAcOOT/ko
         eXBB7rIvlbetBwHo6Rs2Wljzbrs7+HoO6egEEbFwtj8BywG5jcL9sNJca2WtmpRyaSlP
         yxleyvlcpLzceKrCzpVJlgvRA08k3BHFMGcLRxaY2LpUOZgzuDKifV4WUoCnc6tkAIA0
         BUy+WGH0WgmxOf31jYmdvzTK2MF8ADyFxmHHnFkZWEPBjbgFqSnwy0aK5q4ZlVIU8Bpo
         /L4Q==
X-Gm-Message-State: AOAM530wT8ac6FTcNvZ1qS2/4wKBEVO3EKTlVvSGIwBhg2X9KBNr7pqt
	uCVWs9x6sO8IWP9+JH07zSPE3DzbQe1oyw==
X-Google-Smtp-Source: ABdhPJziKvxTucgWl5y9YXjQAT3kxG1nEmAYfSWwkfmBh7bm7FI5+fEy15cyGehOUUzIzYPcRsvIdg==
X-Received: by 2002:a7b:cc11:: with SMTP id f17mr19406047wmh.122.1635604818629;
        Sat, 30 Oct 2021 07:40:18 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id u19sm483602wmm.5.2021.10.30.07.40.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Oct 2021 07:40:18 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	john@phrozen.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/4] dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
Date: Sat, 30 Oct 2021 16:40:12 +0200
Message-Id: <20211030144014.26315-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211030144014.26315-1-sergio.paracuellos@gmail.com>
References: <20211030144014.26315-1-sergio.paracuellos@gmail.com>
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
2.33.0

