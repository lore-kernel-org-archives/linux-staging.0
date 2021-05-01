Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206CC2F80
	for <linux-staging@lists.linux.dev>; Sat,  1 May 2021 12:32:36 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id z5so523728qts.3
        for <linux-staging@lists.linux.dev>; Sat, 01 May 2021 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h5m2DTNHNLXWhh9S7FYl1vIhEyv66QJBu88/urj17ag=;
        b=jH0zM08ZNJuiKXKb9FZ53kmA8gS8CfJHQixQZxVpZXgjyNyBZ222OG7ApFh9IVv6f3
         At6T7IWsa0ZZ5q46SG6QoHh6uaXzLcUlcrUOpYfblMFDdZcofKps8P7yBvXD7Mthx8ni
         /WyOpfbWURTgxjOyCwiDVDEc4j3qdPP6O2SoeB3cM186mXxjRAWHGUsIFQ2n+s6cGArK
         OI4QiafPUe9Bjy6IGjJmG8B5aTeF3OPfZch+de74NK/+wuk4TxtrWrPxfw5ysmXkQBmV
         oBcmBB7CGlSRIK1VS//WXO16iKlnfj+K+RUtr9LwanpXdVoQ/LU+jLz+YSXyKDsX3BFK
         0pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h5m2DTNHNLXWhh9S7FYl1vIhEyv66QJBu88/urj17ag=;
        b=LT12ddY3DkUnLgUMB8ymz2Yg61j4YDyFj7Fw7KDUpF6lBGqhzSnZmlBmKFp6rlSfnp
         JSREBMkL0Z2ZdW08b+M9SiX43bQOjD0/CdK71iEdeKOaDPPbLk4oeSUVLy6/oa7IHaxQ
         kIEZnrki2q0Z2sNh8T1MW72jl1tCDUOvnafOy5h4m/7lzCOp1wSrf3abpaTzE18aoDCd
         WUfFT8JXn3Q3JI2uYwQQoj6ihcHwesvJreyuiBPqo2RVdY2KJVI/C5A9eKir0IngZgaH
         UTh/hcU2MYhAx1lFBF6F+HB5yYXJUxN/GoXt/6YQt3uQh7u0pDlILWsd6dfSyQmh6TlJ
         FTFA==
X-Gm-Message-State: AOAM530wkdKEFQZoAPKQOiMpJeROBtB3sOJiZZF33+VCl5kZE6bt9Qrf
	93BLfVj58s8uhgnnqJ8TeLw=
X-Google-Smtp-Source: ABdhPJxCCM53wefrHv5mgx7CgvblhDV8G4zFxgNm+fXc64Ol4pyPPnxxbN7xBNlcs8u+4RlhAVAdSg==
X-Received: by 2002:ac8:a83:: with SMTP id d3mr7330715qti.91.1619872355283;
        Sat, 01 May 2021 05:32:35 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1001])
        by smtp.gmail.com with ESMTPSA id 66sm2839139qkh.54.2021.05.01.05.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 05:32:34 -0700 (PDT)
Date: Sat, 1 May 2021 09:32:31 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: staging: iio: cdc: ad7746: add binding
 documentation for AD7746
Message-ID: <2c2f4d486a94e0740e112bfac0d9306bdb7ea69c.1619841953.git.lucas.p.stankus@gmail.com>
References: <cover.1619841953.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619841953.git.lucas.p.stankus@gmail.com>

Add device tree binding documentation for AD7746 cdc in YAML format.

Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
---
 .../bindings/iio/cdc/adi,ad7746.yaml          | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml

diff --git a/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
new file mode 100644
index 000000000000..a02036ef9e8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
@@ -0,0 +1,77 @@
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
+    description: |
+      Inverts the excitation output in the EXCA pin.
+      Normally only one of the EXCX pins would be inverted, check the following
+      application notes for more details
+      https://www.analog.com/media/en/technical-documentation/application-notes/AN-1585.pdf
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

