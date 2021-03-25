Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F072
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 15:46:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49D8561A2B;
	Thu, 25 Mar 2021 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616687207;
	bh=Q2tZBsdPQDvnqOQufuHyqZzw7WUjXHdEbtYO9wUPA7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgJ1+6VUtR6AvnqScBQBWyFBFRVXal2dKi+M5i981iXMuI7Er80NIyBgyXrib6aJL
	 Z8d4M4dllKxtWQShQAcVfiajQU/VnrTUehSZhfnFVLa+P/DQE1eMDsCuhsO+lg8bBY
	 7I/8NvXWhGw6iVrBFTMWYjBXUF4mYbZcj8Zkyq7dEBaAuvuLF7MzEHhXlP3PN8g9OT
	 qClYRRAx7qGvVNnRIjWu9jBbEm8EdysHc/xdPInn20NYJFmXLlxz1bglm4Jlr/x2Ck
	 0FuMErfOvyxFRcO0ilbisvyQAnU2zu/45DMpYeUM1e2d0bBEYknpEHRnc4sURFsZUP
	 UF2ANbVRFEJTQ==
Received: by mail.kernel.org with local (Exim 4.94)
	(envelope-from <mchehab@kernel.org>)
	id 1lPSC4-001FYn-6n; Thu, 25 Mar 2021 16:46:44 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 2/7] staging: hisilicon,hisi-spmi-controller.yaml cleanup schema
Date: Thu, 25 Mar 2021 16:46:36 +0100
Message-Id: <4e4a80d3a1b84a354d3c40be374a1689ae6c0fb1.1616686958.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616686958.git.mchehab+huawei@kernel.org>
References: <cover.1616686958.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Remove some properties already defined at SPMI bus, and
place the type for the spmi-channel.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../hisilicon,hisi-spmi-controller.yaml        | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml b/drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
index 21f68a9c2df1..6b755039a74c 100644
--- a/drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
+++ b/drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
@@ -16,7 +16,11 @@ description: |
   The PMIC part is provided by
   drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml.
 
+allOf:
+  - $ref: spmi.yaml#
+
 properties:
+
   $nodename:
     pattern: "spmi@[0-9a-f]"
 
@@ -26,13 +30,8 @@ properties:
   reg:
     maxItems: 1
 
-  "#address-cells":
-    const: 2
-
-  "#size-cells":
-    const: 0
-
   spmi-channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       number of the Kirin 970 SPMI channel where the SPMI devices are connected.
 
@@ -40,18 +39,16 @@ required:
   - compatible
   - reg
   - spmi-channel
-  - "#address-cells"
-  - "#size-cells"
 
 patternProperties:
-  "^pmic@[0-9a-f]$":
+  "@[0-9a-f]$":
     description: |
       PMIC properties, which are specific to the used SPMI PMIC device(s).
       When used in combination with HiSilicon 6421v600, the properties
       are documented at
       drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml.
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -63,7 +60,6 @@ examples:
         compatible = "hisilicon,kirin970-spmi-controller";
         #address-cells = <2>;
         #size-cells = <0>;
-        status = "ok";
         reg = <0x0 0xfff24000 0x0 0x1000>;
         spmi-channel = <2>;
 
-- 
2.30.2

