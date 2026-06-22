Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47E376A18
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141923; cv=none; b=We/DVJDsRU8mvtdpVn5Cb8G4vM9HKNIh7UhKPEOPXaDQnCsfnw+/Rr0j1zol0LOqKtuX1pr+JMYeWW2Xa00P0BJZy2wRGqohQU4LlyeG28ZcWPsH6rK4owrCP0032xYnxq/q2PGbqoTbjfXi2N+f5rjyMwbD/iZ+D4VBe86IiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141923; c=relaxed/simple;
	bh=pemz1FNNs0kpzhepFGC9w+PchSrHijunkMIG4FZdyOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoRN+IwFXkjRzXnSDphLv2UOZ0dsvai6K78kNGozbfztScyLcTlECej88YRX6svnpTGUBG8YrScEXX6zPrnv6lQPbiNahX790WNWCg2fj0JT9LAjWLV3cUwlc+MDKQXk/Fkqia6X8Ry7Ey6DzFuaLIE6yjZ4b0M+mQosE3MicEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n57ueob2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n57ueob2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso68207505e9.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141920; x=1782746720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0qw7KTWnyC881EwxaOjThj92Q0RuccaSWAdkHLFKrM=;
        b=n57ueob2kAk4pVC6pzD3+qeKdij+/a1UTJ7dk1rrFtCcIi/OXZ2WC3rMi+Zdphwp7v
         UmcOVWOZVHtslazuhVcAFBnhNSWtdExMuEoMJH+j4htaW7nMZWoeSOQ1BpP0LRE4zFXM
         Ovd7VlxhN6TjnobfnLo7H6bibrGB29kgBBqz+lU3oAgKs4sc9QlkamSWSIbWfXFCJJnF
         BSXf0aZOahbuo2dDkAQWANAiS4WEXTjn4dUXlcwkAClLfRny/Mm8/hJQpSgMUc9guEV4
         EeatpOMBmpoKp9rmISLhaHkiCQvzeQbt5okE6WJeXnx6Y0+XUr256HR9XXiWOxz5W1t7
         7CQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141920; x=1782746720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z0qw7KTWnyC881EwxaOjThj92Q0RuccaSWAdkHLFKrM=;
        b=PQkWjwB27ACA7z7yNUDSrN9qqb6c1xy51kaOIUsrp2c/KCxckJGAbJmOEsJWLH+Bq5
         TZ3LVxQvUE9wUJK0HTY1AQl93pqsmuwDhqx6ubnlWKb40c64MAyX4ylDK/kiDFzPskBi
         b1DEEyiTxQzybFFxvO+QZ9dr5HuCn/sUE3a9H0Np3mPH5RYYmZpzqESnNX2/ray6jppj
         pvrEur8SS7Hvy+jxsvAVrNBjGJ7uki975C8txX68C6TzUSI0cSfBR6MDWJFncqA91kF3
         p9HzSfDNHhjEz5KEtPBUCrwz5Adh2CUPWVLadLG8IMZOhPnaJgLb6bVTvrgRUO4zSYF0
         HOzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SDC5+spx1JyYcdU6iyrGDv1UKZpeRBEIktCW9CmMq8sGnrz9l3OzT5EDjDTaaGhR4ZTGB17d3pZhpBwwW@lists.linux.dev
X-Gm-Message-State: AOJu0YxlhRPsXzJQQn5ShYoBp9sS1sPliY8HJZ/s/uHxvpoGYc+fg9MS
	UdGQ7wrx9zk6WRKtUAV3bQc4HBDY0/Ll6VklHfGBKMnV71zz2QCsd8w7
X-Gm-Gg: AfdE7cnT0SDiCX+SMN//m/fl4e3c6R5zeF3mfVe702PRjksegtDb8BQR2H4HaMo7RyK
	vQiHPQwYRF3mCBuBxveVvaBqmV6FISpDrJZlMay1wScyrDOtej8OFU7mnciOQ7qEdkiME6xcDuG
	/sXfR5+jojM075ChL/vWmsVeRf8N5sSO/3JfamJFaWYFe698wO9+cV54CJm5kLz+M3vRu9K1oFR
	coFePPDEs7ANxJO8UAAjVbOMGgfO9mOo9sH8rp/UgrFHFuVwmZBrmJHjU1eXJzi596BkeryUvn5
	an3+ISd1QS3NFPZQxhAWoedwvnWgssFug4ReN6zuqzYp6qZNt8zu17MQMlLlgtNOJu9hrnKk+p/
	fyXSh5aVhKAzhf8o8paMxGAtzdBjhJosVnGo/dZikR5Ql8oqxZ9FodMAY5mVF1FPSMRCh3zz8fp
	GQFKOdami0VQXquvhHWzqq4tyhpU0=
X-Received: by 2002:a05:600c:3b15:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-4923ef47e73mr298830265e9.3.1782141920248;
        Mon, 22 Jun 2026 08:25:20 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492492338dasm217883655e9.1.2026.06.22.08.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:25:19 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	deller@gmx.de
Cc: azuddinadam@gmail.com,
	chintanlike@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Mon, 22 Jun 2026 18:25:03 +0300
Message-ID: <20260622152506.78627-2-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622152506.78627-1-amit.barzilai22@gmail.com>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
RGB OLED display controller driven over a 4-wire SPI bus. The binding
builds on the shared solomon,ssd-common.yaml properties already used by
the other Solomon display controllers.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .../bindings/display/solomon,ssd1351.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
new file mode 100644
index 000000000000..80850c2ab5b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD1351 OLED Display Controller
+
+maintainers:
+  - Amit Barzilai <amit.barzilai22@gmail.com>
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1351
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@0 {
+            compatible = "solomon,ssd1351";
+            reg = <0x0>;
+            reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+            dc-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+            spi-max-frequency = <10000000>;
+        };
+    };
-- 
2.54.0

