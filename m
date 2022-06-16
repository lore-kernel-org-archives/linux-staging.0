Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC17A
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 10:28:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 00C54CE28A
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 10:00:40 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id EAEE81BF215;
	Thu, 16 Jun 2022 10:00:30 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrea Merello <andrea.merello@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jacopo Mondi <jacopo@jmondi.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: staging: iio: imu: Document CEVA BNO08x
Date: Thu, 16 Jun 2022 12:00:05 +0200
Message-Id: <20220616100006.22045-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616100006.22045-1-jacopo+renesas@jmondi.org>
References: <20220616100006.22045-1-jacopo+renesas@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo@jmondi.org>

Document CEVA BNO08x (080, 085 and 086) Sensor Hub.

The BNO08X family (BNO080/85/86) is a System in Package (SiP) that
integrates a triaxial accelerometer, triaxial gyroscope, magnetometer
and a 32-bit ARM Cortex-M0+ microcontroller running CEVA's SH-2
firmware.

Datasheet:
https://www.ceva-dsp.com/wp-content/uploads/2019/10/BNO080_085-Datasheet.pdf

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../bindings/staging/iio/imu/ceva,bno08x.yaml | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml

diff --git a/Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml b/Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml
new file mode 100644
index 000000000000..f7d6ea6d9147
--- /dev/null
+++ b/Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/staging/iio/imu/ceva,bno08x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CEVA BNO080/85/86
+
+maintainers:
+  - Jacopo Mondi <jacopo@jmondi.org>
+
+description: |
+  CEVA BNO08x is a System in Package (SiP) that integrates a triaxial
+  accelerometer, triaxial gyroscope, magnetometer and a 32-bit ARM Cortex-M0+
+  microcontroller running CEVA's SH-2 firmware.
+
+  The BNO08x family is documented at
+  https://www.ceva-dsp.com/product/bno080-085/
+  https://www.ceva-dsp.com/wp-content/uploads/2019/10/BNO080_085-Datasheet.pdf
+
+  The SH-2 firmware reference is available at
+  https://cdn.sparkfun.com/assets/4/d/9/3/8/SH-2-Reference-Manual-v1.2.pdf
+  https://cdn.sparkfun.com/assets/7/6/9/3/c/Sensor-Hub-Transport-Protocol-v1.7.pdf
+
+properties:
+  compatible:
+    const: ceva,bno08x
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Phandle to the GPIO connected to the chip H_INTN (Host Interrupt) pin.
+      The interrupt type shall be IRQ_TYPE_EDGE_FALLING.
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
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bno080: imu@4b {
+            compatible = "ceva,bno08x";
+            interrupt-parent = <&gpio5>;
+            interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+            reg = <0x4b>;
+        };
+    };
+
--
2.35.1

