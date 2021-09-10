Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07152FAF;
	Fri, 10 Sep 2021 18:42:45 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2F955240011;
	Fri, 10 Sep 2021 18:42:42 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 18/22] dt-bindings: media: sun6i-a31-csi: Add ISP output port
Date: Fri, 10 Sep 2021 20:41:43 +0200
Message-Id: <20210910184147.336618-19-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Allwinner devices come with an Image Signal Processor (ISP) that
allows processing camera data to produce good-looking images,
especially from raw bayer representations.

The ISP does not have a dedicated capture path: it is fed directly by
one of the CSI controllers, which can be selected at run-time.

Represent this possibility as a graph connection between the CSI
controller and the ISP in the device-tree bindings.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/media/allwinner,sun6i-a31-csi.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index c60f6b5403fa..9f796cd89a2f 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -104,6 +104,20 @@ properties:
 
         additionalProperties: false
 
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: ISP output port
+
+        properties:
+          reg:
+            const: 2
+
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+        additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
2.32.0

