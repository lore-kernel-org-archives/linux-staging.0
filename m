Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E2B29CA
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 12:08:53 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.122]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mn2iP-1n64Gr3FQt-00k6kE; Sun, 31 Oct 2021 13:08:34 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Mwesigwa Guma <mguma@redhat.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 2/2] dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq to json-schema
Date: Sun, 31 Oct 2021 13:08:06 +0100
Message-Id: <1635682086-3200-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635682086-3200-1-git-send-email-stefan.wahren@i2se.com>
References: <1635682086-3200-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:BvkruI4+bJ2+q1yCTzxfbVcw0LKTklBvoa5CX0rTeOR4nuyH2vX
 gwmqRAZgCnPZcCZGgAV+E6D/4s1oLsmL47vTc9WnGuB19+wj6ngMQWadWFg6EEqpcFuMM/S
 Jomv1NxSA7ixJP7eXm9FtXqmeTSmRdX2E0alEZLIneZmkMrvtTKnQ2SRdyqG+mdwBsxINy2
 cH2w9bns7y3z3qdoGph2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mxChIPk60zw=:vl5z3GZGrpSdcVIgRwisV0
 4GfB6epJIR8s+TyrD9xm0LWcxbHfrfz53nioUEyEK62hoTglwLnUYaQ1vaW5cwdACQHHPF1e1
 63CJnj898NLtE0w7KL8mVFPDJJzpmzJeV497snIU7grcGE5Ys3Ad2Ubkl/6Aipa9w/fITmM2Z
 peqDgXVbebaA8Az5qSBsTWJsuPcaR4j8RQE6JAEanMTwjs6ncSoiWoxkHuOnPeEgmikSNwKEx
 xaRpeHMm/X1kvAeApG9Aj6InyxRZ1uYU2lv6PiSrJGVa++U1pq9i9ZiWH4W9q0UIc/zNxtCV5
 gtvJnXVMzi03EZlCERcUagY9+r+KMlhaZeV4AfAsWcDFGASEl1ObkbVyOx4WYX9WmtXzpYU5P
 9TeQJI1LaFM0UyD/Th2AzXEdpgTu6JYfmgg5AK9/vmms1nSyNB8NS7hYI9ilP193WvXB0m5pP
 Q/AjNvQV+uwkl5OyoI8xNp0MDRLp36Ub3c/ZA7p9rbgKh4i718bb7Uzkse8yc/Dca5cjCOoL2
 lIRJ93exd+SKJvSiPhjXAXyRxHD6mHBiMMGR92gqAKj1GCGhQSG4j22+FoYZVkpNixTjxaoGE
 ocAfMWrDr+b11WIFW/M5CAQGBCHNQphfYXFd38b9c7VerY4nGhiuhmvquV+3NOoymNtxEjnHS
 N6/KykaMTv5r3WP05dyiOjt83xm3P37rb375adTEKWip22AITPHRq08gjyEhS+0oWm7/9YvGC
 /sRocNe/RyQSI2Hk
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This converts the VCHIQ bindings to YAML format.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 17 --------
 .../bindings/soc/bcm/brcm,bcm2835-vchiq.yaml       | 45 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
deleted file mode 100644
index f331316..0000000
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Broadcom VCHIQ firmware services
-
-Required properties:
-
-- compatible:	Should be "brcm,bcm2835-vchiq" on BCM2835, otherwise
-		"brcm,bcm2836-vchiq".
-- reg:		Physical base address and length of the doorbell register pair
-- interrupts:	The interrupt number
-		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-
-Example:
-
-mailbox@7e00b840 {
-	compatible = "brcm,bcm2835-vchiq";
-	reg = <0x7e00b840 0xf>;
-	interrupts = <0 2>;
-};
diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
new file mode 100644
index 0000000..a1d5cd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/bcm/brcm,bcm2835-vchiq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VCHIQ firmware services
+
+maintainers:
+  - Nicolas Saenz Julienne <nsaenz@kernel.org>
+
+description:
+  The VCHIQ communication channel can be provided by BCM283x and Capri SoCs,
+  to communicate with the VPU-side OS services.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-vchiq
+      - brcm,bcm2836-vchiq
+
+  reg:
+    description: Physical base address and length of the doorbell register pair
+    minItems: 1
+
+  interrupts:
+    description: Interrupt number of the doorbell interrupt
+    minItems: 1
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
+    mailbox@7e00b840 {
+      compatible = "brcm,bcm2835-vchiq";
+      reg = <0x7e00b840 0xf>;
+      interrupts = <0 2>;
+    };
+
+...
-- 
2.7.4

