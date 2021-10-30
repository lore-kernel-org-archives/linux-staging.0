Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84F2C85
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 14:20:14 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id b12so16775634wrh.4
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OJp/wZiERGVBUU7HIuspGPpojRpXm2e3BfdSR6ZgDTc=;
        b=JEUQHEz7bQf2OP6y0/Ta376kQgRSsPMSL15aqYo0Z0p5RG85Z7g+/dIDirWzrAnUfl
         DLW09vDWRWfRHCE9mv9E8t92lSwRPEIudUygoA8GiaFa2iNLeSkZkAyHZMxV0K8RFg1g
         rbmAPkTiqbuXuH/zf9DbxaS97uW9UTIJbJD1Jb+fD0NkhMWHsgkrTRJld7h0cj9dU4Fn
         +aSWb7HUKsh8LLWR1zk+3j2DDdW/xuVhAKhRcwS+gVHyClNW6w4IkRMcuhzCfYkqcths
         YyaEN4z4f0vHpU4zd0W0u0rLzTB9eQ6pV4ZPV+9NNnZtDXP/1r+vaUefUOFmggI517uX
         lslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJp/wZiERGVBUU7HIuspGPpojRpXm2e3BfdSR6ZgDTc=;
        b=Kf/2ylY4ZvztBHyIwVVV+UVGglTy/f2V52/EXmhke+799ihNxpxBihFJjDhrb9Lq2a
         7/vycztCrcGJTjc34XzNuJRLmdpwE74YDElQiR5toG3KNTLA+oGyC5Ratl5uBNXA6AML
         MMRDQooM/LVmsoXCDXbrNC52fIE+AKgFof0dxw4G41MmsCOY41wYQkZm39u7/8ub0t1H
         zLMupF0i9Yd7JLNxzpOo5EVr6ZAFwAlMRWu1UinVfWSqatG/Ht//1J/qYdoij0UYRFMy
         nook+kNPXoPBJXeBd0PLDw9Pxhbuyfbtldj2hZgkfsmaqVxrc1/qmOSUdrmKAX5S5+In
         EFsQ==
X-Gm-Message-State: AOAM5317neiymz6+T7MiyiTAv6x33wOJGsMDT8G21VwN6gQyOUrlxJS9
	CqNlzZmdoq2EeBAeX/k19sM=
X-Google-Smtp-Source: ABdhPJz7QSlwLY1YRbetjzWjw7/3EjxA/mbkzu0Xnm2Awq8L+ztW9XbXGuoUMg4NgTlWGt7KD+Qi/Q==
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr22897326wrr.141.1635603612739;
        Sat, 30 Oct 2021 07:20:12 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id m12sm8208521wrq.69.2021.10.30.07.20.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Oct 2021 07:20:12 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	sboyd@kernel.org,
	john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
Date: Sat, 30 Oct 2021 16:20:05 +0200
Message-Id: <20211030142007.27085-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211030142007.27085-1-sergio.paracuellos@gmail.com>
References: <20211030142007.27085-1-sergio.paracuellos@gmail.com>
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

