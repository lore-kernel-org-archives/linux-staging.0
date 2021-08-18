Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1162FAE
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 14:11:57 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so2391763pjl.4
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nbJfLcBBh0T7Dc0N+cilO3+FM2vIRTLzi1Egk/lT5Q0=;
        b=m9fkuRUpcoy9zsrCZobM1MB5TyNmRahBWDCWcHACkVpwyjwylvzEfgIU/MDoV8t+OX
         tTQcXFuvpxwipitv4J/VpasrG51QyB0o0fVLc+BZfXDlTZXHsNLRNiNxIQZTxhUwWPvy
         HfzcuQjdALg3LmZlCEEdRMGU1kRWKxF6oeTx/HeEutDZtFQcVik+kB3kuX/03q4SlPq5
         cP2O9ib7DrSHxxvueqnGcvM/iO7qnqlV0CvraGo+WhxMfRFeSC6Gnl3AiIpCyP+0uEfT
         JhXR8fesTzX0VK9gr0Sj4FtK35RHc/gIF7l4rEVyFMEDIH/3WQR6Q975ei2j7LbxIy61
         r7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nbJfLcBBh0T7Dc0N+cilO3+FM2vIRTLzi1Egk/lT5Q0=;
        b=l1zjFU2Fc+hxql966oK2qWHybVjR7Dq7tWcsJAtwFZe2G0bZJDeRqeJLvlVO0PDyPP
         QpFuppD/DfDBlcHt8/9tRt2Gn0Z3/mDkRDw/v3OdCKZbq7PiXasLOYVoQ4DXRRpPvTMi
         tHVZtA4V5XbEyTgy41zNtLxvK6XuuQ1jIZ4oXOU7KJDinls7++lPgumT/3URcjryslNp
         4xK3OkaPE8Yk77j6nZkeQB0HI9r5Z6e8B0rq3jGqf6U5aV08P+13MLJPc0VmPc+9HILT
         f4jry1lZvcAKkCOSWnqsR7UWcXSJPMeOwR7/SgcsKydSnHH9Sm0ZF/cBovzk+4Ur4o/C
         qzdA==
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Gm-Message-State: AOAM532ObMCI67stSZwDkNzGmZqFiOBOEAFqbzISslY/MwKnYtHbFw/j
	RPZ/az15SFDVoPUVIDQCfkzoC97h6RjETivDN/YIk2RQwdxdHXhNxJHZpZTk+HAZf0xoEjvPVyz
	Avdf3UA0hjslcoX3DXlw=
X-Google-Smtp-Source: ABdhPJyrmEZJ7YjlE9bPn0TfMvr4ag2Dd80gBPUmH/OoCxGa0YhSuKBbDHUhIHhYQPf+IeUNPASB8Q==
X-Received: by 2002:a17:90b:3694:: with SMTP id mj20mr9341705pjb.5.1629295916640;
        Wed, 18 Aug 2021 07:11:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:11:56 -0700 (PDT)
From: sidraya.bj@pathpartnertech.com
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: prashanth.ka@pathpartnertech.com,
	praneeth@ti.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	praveen.ap@pathpartnertech.com,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 01/30] dt-bindings: Add binding for img,d5500-vxd for DRA8x
Date: Wed, 18 Aug 2021 19:40:08 +0530
Message-Id: <20210818141037.19990-2-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"

From: Sidraya <sidraya.bj@pathpartnertech.com>

Add the dt-binding for the img,d5500-vxd node for DRA8x.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 .../bindings/media/img,d5520-vxd.yaml         | 52 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/img,d5520-vxd.yaml

diff --git a/Documentation/devicetree/bindings/media/img,d5520-vxd.yaml b/Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
new file mode 100644
index 000000000000..812a431336a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/img,d5520-vxd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination D5520-VXD Driver
+
+maintainers:
+  - Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+  - Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+
+description: |
+ The IMG VXD video decode driver for the D5500-VXD is a video decoder for
+ multiple video formats including H.264 and HEVC on the TI J721E family
+ of SoCs.
+
+properties:
+  compatible:
+    const: img,d5500-vxd
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    d5520: video-decoder@4300000 {
+            /* IMG D5520 driver configuration */
+            compatible = "img,d5500-vxd";
+            reg = <0x00 0x04300000>,
+                  <0x00 0x100000>;
+            power-domains = <&k3_pds 144>;
+            interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fd25e4ecf0b9..163b3176ccf9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19531,6 +19531,13 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/test-drivers/vicodec/*
 
+VIDEO DECODER DRIVER FOR TI DRA8XX/J721E
+M:	Prashant Amai <prashanth.ka@pathpartnertech.com>
+M:	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
+
 VIDEO I2C POLLING DRIVER
 M:	Matt Ranostay <matt.ranostay@konsulko.com>
 L:	linux-media@vger.kernel.org
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
