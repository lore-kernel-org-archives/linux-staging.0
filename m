Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74112F84
	for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 22:49:56 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id ef17so10412483qvb.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 15:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mkWQYP2tGzlG7VW0VXji+4s6uOm8qB8eLk1wC3hc8NE=;
        b=n6L+IVRzZwoOD/u/etS3e7RW+7UFOV9SsT5UAxyOlNVdUrd3W39L6zTrIgK5vRThUT
         MW2KxuMTSgwlVekgym0FyLR7uyynpaHP9LDkCetx6oYa1Q0hCftOfYri3VK3V4VnYs/h
         yYD33HnrQ4rmnF7q5wyZE6jz8kuZ1GjhRT8sTynSjhlnYW/FLEpGlAJoZFMIvH6xFP+K
         3RvEaja067fgjUShRTisjmglnzEA4uLGfkF4b5fUf7Z6+GTHtk6ViocGXxynfwMX7pog
         rqSeIR5I9aXIguYMstjrssUfHwj1Zob0owOjXNTuswrUkSwOf0uNH+bCtFyxKV+Yrzfx
         yXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mkWQYP2tGzlG7VW0VXji+4s6uOm8qB8eLk1wC3hc8NE=;
        b=p2b3wWnqGKaQmjBuLmUgiPTTxJClGOjNrEhiHeM+hK92DZaVrIhQWvfAr12t1ogaTr
         JTB3uuGKM+Eqf02GOuQnPXrQOrZpIUScFYKCvtMZAa9s1z96FFD+dQb7hIz2r1WhAjaq
         xj237iuM66jfZewN3jflpgAIJOO50td2eALQHVraOM1YeTN1RalET588Ohv4SeyUy06b
         vsf+H87z3jl80XYvwhrm5+wEuIjAW57BAP8EV5nRKHgMR1IWPs2ynF6ru85JAVjbfiVp
         v9gCr9habrvKaPSlAj/q4rkexkpKaufeacMMShu1jxSvAPobzrYJlFXRt56i0Kt08tq6
         W6eA==
X-Gm-Message-State: AOAM532vjmZV9f8hsEKI3Prh7PNGRmIZBp7Ju+jk7+uYnHudiPHV8lFF
	5rtRy39d1h3kDiIl+vug+D8=
X-Google-Smtp-Source: ABdhPJz/43wwZq2AVnaKseGvzyK3m7Ljh2nMRkBjdBwshuNUT9BI1KU/XZarclwYW/XmFcW7HbFAJw==
X-Received: by 2002:a0c:be92:: with SMTP id n18mr18993119qvi.31.1618786195941;
        Sun, 18 Apr 2021 15:49:55 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1003])
        by smtp.gmail.com with ESMTPSA id f22sm1225081qkm.134.2021.04.18.15.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 15:49:55 -0700 (PDT)
Date: Sun, 18 Apr 2021 19:49:51 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: staging: iio: cdc: ad7746: add binding
 documentation for AD7746
Message-ID: <54a9eaeaa42d47037b2a07bd933e6dfade745d02.1618785336.git.lucas.p.stankus@gmail.com>
References: <cover.1618785336.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618785336.git.lucas.p.stankus@gmail.com>

Add device tree binding documentation for AD7746 cdc in YAML format.

Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
---

A minor note about the adi,excitation-vdd-permille property. Jonathan
suggested the name to be adi,excitation-vdd-milicent, but I was unsure of
the milicent naming. With a quick search I found out that the common way to
call a thousandth is 'per mille'[1], but I didn't find any use of it in the
kernel documentation. Any thoughts about it?

[1] https://en.wikipedia.org/wiki/Per_mille

 .../bindings/iio/cdc/adi,ad7746.yaml          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml

diff --git a/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
new file mode 100644
index 000000000000..a2a7eee674ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/cdc/adi,ad7746.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AD7746 24-Bit Capacitance-to-Digital Converter with Temperature Sensor
+
+maintainers:
+  - Michael Hennerich <michael.hennerich@analog.com>
+
+description: |
+  AD7746 24-Bit Capacitance-to-Digital Converter with Temperature Sensor
+
+  Specifications about the part can be found at:
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ad7291.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7745
+      - adi,ad7746
+      - adi,ad7747
+
+  reg:
+    maxItems: 1
+
+  adi,excitation-vdd-permille:
+    description: |
+      Set VDD per mille to be used as the excitation voltage.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [125, 250, 375, 500]
+
+  adi,exca-output-en:
+    description: Enables the EXCA pin as the excitation output.
+    type: boolean
+
+  adi,exca-output-invert:
+    description: Inverts the excitation output in the EXCA pin.
+    type: boolean
+
+  adi,excb-output-en:
+    description: Enables the EXCB pin as the excitation output.
+    type: boolean
+
+  adi,excb-output-invert:
+    description: Inverts the excitation output in the EXCB pin.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ad7746: cdc@48 {
+        compatible = "adi,ad7746";
+        reg = <0x48>;
+        adi,excitation-vdd-permille = <125>;
+
+        adi,exca-output-en;
+        adi,exca-output-invert;
+        adi,excb-output-en;
+        adi,excb-output-invert;
+      };
+    };
+...
-- 
2.31.1

