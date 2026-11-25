Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605996;
	b=YvXUk9uP2cYwSHpMAEBBIZ+38BTuCd7TuZRGd3vAc9qZO6WCXvrhQquX9ARYHM17+ygQ
	 4IQwqkeszEUe7GSmB5dEhv7tuVDUNKFTOQTrLkNKVUatI22283z7ExDGpzRCspCpW3p0f
	 hHb0M2HFDluZyvxsE+geoDxdbA+qg3c9/8eluQ+smJVfyk+70tuBGeHq3Fuork+I89ecG
	 J4F4XR/rlq+yRqmG9MDHZqdlRPDx5WQHlUuV+Oc3wRKr7lvx7+Gs+UYfwVGUzajieHxu7
	 2+xvxv1zwkTznJcyjwNMlFlTE8IvtIbi4OcM4xKpv+2iBc5fkvwILVb2wxI4WUcs1tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
	b=Hxzajob3vbexI0rGALVRsigWwljMrxYOEX29i2kXWuFa4N2JpV0D+cZ1X+34a+Sn4j48
	 XWSbOpJlcqDwVh9J3qY9ZMlvgUOqex1pz+U2FincPgJA+xgtOk9ikq3QncbcsSaYZJwcb
	 amie+P4p5bgYC3RrRaEdJs8ipURPksXxZGACH2cmIr0yRxXzuhxZKbz105Mc1sRs8SAkr
	 eBZPfWLCZneVaVXOVT6tMWv0RRz6kvejx/LDiMRhgOI/C+5TZ9zg7/gONChNMA2wZ2tKE
	 8V8DkJrFDuLhIK7WXPSdbd+97ohstXhTMFepf7FYqJjuhDlA2OPt+j/6CR1GHVR8PKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaLcfKOw;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AA3606A695
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46AA3606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaLcfKOw
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1221589166b.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605995; x=1796210795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=AaLcfKOwGwmTSuyICKCnNKmbZcSBaDJLTZ4fCXfYEBUqmdfow+2UpGN2s50bxdSnz+
         N4u1Z2f9Mz8yu2L0ih+r5of26PlR1Lg7Dy79wpQu3iWsCWa3JDomMqLKmqevupRZw+V0
         7+AxTHIy0ue2RDpKBGYQhZHGvnXn+un6ZzJGo9jhX7bjiLIxKeaD3st7Cqs18QQy+dWe
         12jR552GqHBWIr3o95z2EfqGpzcQv+ys9CT/8MvRlWkhSRgjf86dxLeBzuUEM1DcqlTF
         qS7XCdU3z+rUJD2XMJ9Ob/3xNd23ISO4iYq6Vnsbh8y3mVCr1B+zwurM8QxBCc+24pJc
         Do4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605995; x=1796210795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=N248Y9sBsvoojwdEG76beUB4yHzfYTz5m3yFgkdNjrf4igLfp5jS5CmlbQ/nQkv1uC
         v+vmomXUNyBZ7DaOiypYWnU2cZs+rlGHNzpasmuREaJ4xkLcqRXFfBdb47LCDkBlL9Es
         96RSDwy+ostpuPqDPUlcJQHTO+eqwU0BI9jZd+YX9wRu46Tp//RjwWG7mKbiI/kthUF6
         QxEF22OoNy6FEJWwJIixcfyqwjAXByYRZ/8FVj36ZnGzO/++XvAepSs/fijiIPzEI/qr
         EcdZSZUGowqELOybuPSMQH2d3QyNuAjMp61pi3T0WusXi02ATH4E7VSmR9vzBfAVnMij
         LYfQ==
X-Forwarded-Encrypted: i=1; AL+hErF1XyV0tOc0h27JUdz/r/NZAPCurYtt1aNhuCVs/OPhAAxFIBfDBXUHXqxz4QBIvb9iiD0ChRcDOpOcMiOP@lists.linux.dev
X-Gm-Message-State: APuU4Z/FYqPijmoR5R2AleX+r3ll9U/j7QOLRRuCKZeVjlD1pnrLmODT
	CkaM5y70xoLhURz5jUYdWvH+NveEZEKgFUtOSAKnTqMLZRw3pVl8ZOwV
X-Gm-Gg: AZFdTZfud8BBYRQroGoN4apCaz51qNKsj9NZ+8gn4F6m6oJ5mQW5sm171jplcQVVP2Y
	SB3DjNIo4rjt6jEOFMZ6FRunsYAONR3KNuCc3p3u3EdDi02wD9cst6v57AzoSJRXTP1rtfhRBl/
	rrTEUuEz2F+uCht8nL7HaL7b6rMQ65h0/Es9gmEE/pgtotJahBNFxNdBLvtb7fobfxhh4sH0s4/
	N0GzzuqHqqA7brI+xfYUgCcTYySof9+cOS67W6xmZXU6Pxnj+3NbPAL8B3gzSqYrEjLPPDX8YPo
	P/asWY474pjx5hpm82jLPZx/Ql9rrxkxLk9IeiwG71CSLJ9rFGnOGJGdvNIbGJ+dh1K4vfGpohc
	E89nKVMWdPVCCgLAG9c+VZgcbWttqnZ0DJpXRH6ExysmpEMFez4TF1084cjMOVYuF/blAUc7JMP
	IPHbVQdvB0B80Zl+4qGZXyrh6HCzYCDE4y4tX7SU2IJG5/4LJTK4vmEYncXttNHju2/MJMaWkQe
	3XVohpLrvjn8Upr+sUZp5R0Q+imfoPv5cgfB4tEpS5V1IGd2ozipnOB8lCFGsOjIBAka+FKU5LG
	apxXG/2L4+yQMywv2pLAPyOE39iIvX+hMkA4ycziHl+RPXE5O6s1t/585DPloAl7AY6y8uN9Qtx
	2iGRjFIZ5jz7jHVRIEBhQ11X47xTLb34=
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1522656666b.8.1795605994515;
        Wed, 25 Nov 2026 03:26:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 4/7] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Wed, 25 Nov 2026 13:26:10 +0200
Message-ID: <20261125112613.237333-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..6296f3ab1d0ce 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,12 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
-    items:
-      - const: csi
-      - const: csia-pad
-      - const: csib-pad
+    minItems: 3
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -121,9 +122,35 @@ allOf:
       properties:
         clocks:
           minItems: 3
+          maxItems: 3
 
         clock-names:
-          minItems: 3
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+            - const: cilab
+            - const: cilcd
+            - const: cile
 
 additionalProperties: false
 
-- 
2.53.0

