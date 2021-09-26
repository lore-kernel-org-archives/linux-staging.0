Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB13FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 14:59:37 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r23so18677931wra.6
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZH69dogAiUsc0vcOKuP2NNxCrcS370MSfEo9cfsO44I=;
        b=A9mmrHjHE7JU63qkvaMiVQskM8mO+HnGoWwiqPSezZR+qltci0MHMejYjdZxm/4/Wc
         3L19PtBX/TIzz4JmYtZxMxaigWU4XSgeHQ/ard4kt/rW59R8Kl8Tvk1Wn1QuXNGf4nUM
         ybIHPLl8eJy2VBq6WscAU56mpbhrWDnp0SQI2KVbpNigQNAIQeWRZw2BeOnOTRq5prPR
         BQ6xAb9g5cWggHfa6d1hPqJOq8UDH+xTAkV9Ch/EZynbfQfxUSX2BERlm2F8LIbDQQbF
         X5VP8x0j8AIXFd5EGLRrn3JHdM0ZfkXeduaJmge7serr1zGYhVi9ORT97xIE5kKxhGnD
         qBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZH69dogAiUsc0vcOKuP2NNxCrcS370MSfEo9cfsO44I=;
        b=d46yu9M+6c/4wAcw8C1s7JsTDKCf/dhqKLc2yFXlIAZAl3I0X8sw6j/3gZIyh9qo3t
         11WGkb3aum49WAf655g4s6RVCQ6vn/jxLSUYe3Y4pPFRywJX1QhlDSaQ9AAeMZ1tWzJE
         xLanK3wxP3hvr7HHZBzD3NV60v0PdCaorP1rycsr5xaCPgPb4KC00+KgZ60NraKJMnvl
         etoWK1WPZAneLHEQtc1ltfbnim6aKf318NsRBXPpWMKxg59eFMnuTWKrtzGu21uu8slA
         rCR+b/l8MI5VZNkOlKzGPkfsq2KlxsSbUf1VB3fO8CpIH6u/n4bOhDe88bdTun9bTZyJ
         sRDQ==
X-Gm-Message-State: AOAM531gMrEwCvQ6Ydd9g3QNyfVeE50x+NEdjeSa8RGDUsPxpL5oOYwy
	hv+syvnyIzuescPIiNm2AZuurOBzhhk=
X-Google-Smtp-Source: ABdhPJykeFTvzIGy1Xu6uLb+dEfkecnJ/oAnExmqiiZsC410NyA/JxX0jtVnmu6wpIjwDSOPccENfQ==
X-Received: by 2002:adf:db4a:: with SMTP id f10mr9368194wrj.140.1632668375389;
        Sun, 26 Sep 2021 07:59:35 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id n7sm14143840wra.37.2021.09.26.07.59.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Sep 2021 07:59:35 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: robh@kernel.org,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt: bindings: add ralink RT2880 resets device tree binding documentation
Date: Sun, 26 Sep 2021 16:59:30 +0200
Message-Id: <20210926145931.14603-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
References: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds device tree binding documentation for resets in the ralink RT2880 SoCs.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/reset/ralink,rt2880-reset.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml b/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
new file mode 100644
index 000000000000..88eddeb4ee45
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/ralink,rt2880-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink RT2880 Reset Controller Device Tree Bindings
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description: |
+  Ralink RT2880 reset controller driver which supports the SoC
+  system controller supplied reset registers for the various peripherals
+  of the SoC.
+
+  See also:
+  - dt-bindings/reset/ralink-rt2880.h
+
+properties:
+  compatible:
+    const: ralink,rt2880-reset
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - '#reset-cells'
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/ralink-rt2880.h>
+    rstctrl: reset-controller {
+      compatible = "ralink,rt2880-reset";
+      #reset-cells = <1>;
+    };
-- 
2.25.1

