Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF1B2E2EF5
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694312; cv=none; b=KiPjFxm7sV1ImNpMkh2/2gUlwUNiTtSWghIY9uTm7A7eERkhmN/PLFaNkQR1ks2yxYofFBBwyqFebYM27SxCjQxPIZiQmcgvs6B5DhJVkzOio6pwCfVqRvqWhUi4STqHI4fK8L2v5Cv5MmoW9GJmI62WR3yKBWdFwoXE56j7Eis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694312; c=relaxed/simple;
	bh=6IaLZk5ajCLYmQ3Mz5pBghgvBkfz9rSnhglhzXJVewI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgpNeAlFR6W5U4FM+BLKWj0TX7v8vQIqZoS43LJ/42/oof+isHaph/UT+K5bI1+rNNyieWP+MDUbIy+D4OXn/KZiaElXaIJj8fi97w5juvztn8q0oA5U7q+3b5ndI5nDxd8k+0ZohKYMjWgrwgoDRF0r1Je3hamxJgATQmr5TV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq6x8oVw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq6x8oVw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae361e8ec32so33281266b.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694309; x=1753299109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=iq6x8oVw4FzZ4zajQXMTQE92ObV/0omAFp5pQcsYlfid7FqQSzDbVfkc9zWJhpJVo3
         t2vuG3KqHL78WhCN3FZuxelRmCm/VSA+kcROJKk98iIiWypixWfE/0afp67GvRYFQhHN
         6iiWApF/2pctG6YiLafSi4zLW66PcAIZPuoVbnWyD2E5J7aEj/5c/dsAiAf6fwkZkdhP
         L8vAl6ITqwpvxFKj6kvuoI+EbWPrXEPJUZFcaoCRw8YznWfX1WbgrBJt5EZhkqe/vFDQ
         gx9J6fhj8qo9+rWyzSlbQYHQk9LzCDFCnunesLao+W43tCbV8lrtQyuxWVK7SmLJ3+8o
         ppmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694309; x=1753299109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=MDUHEyHS9IH0cRIkir+WMhFScelfh+jbVj/SyFXTW5HSUTBeIeDxRWWlLKzfOnCQI8
         SPGwCIV01pdBqDkev7oGXfa5Z5THpUt+Wva4qEj5ToKNZD8Em2hh2xQUQpNGQttH4lYv
         WG0sqhqanu2LH2lYw4Uj5LXIjj5quxmk/E9pDzFKyYXqYkB87UzQKTK9DH02IaHqjgPU
         NKSSJnydmTIzTO4104Q2SQekyYXKzEw0aDJTRCjlF7tYjKUte5MkysEDO/f09EbL5umO
         F1lsYE5Hep8hrgnIr2QPM9YoJo4crpb9pttVxpp0bsprv3HD1Oq48/aBPd3tr0aUMx4O
         VZCg==
X-Forwarded-Encrypted: i=1; AJvYcCX1NsckJq0M6Y7qHyzWMyEYi76G0Bt/XETftBVUMp2a5m757zx7jmsn470vEZihWxJQhswVCiB8k57C5Dw8@lists.linux.dev
X-Gm-Message-State: AOJu0YzugmdfnJJ2HIBU7oP7BsLwsKmOvGlW0vXtyZYcdNHwgHGTokb9
	2fM+4yfaLIFBH7TfSZiHOj/VBmdWQDiwbkSfbn2WpBBPfS9HsmGhiPvI
X-Gm-Gg: ASbGncu6OzCiUqN4sHpMbqJyKTj7NFa9AyMSEB+RbwyZ9BReixiBMfMaBMLbySBksIH
	k2/yBJTupz2GMjTz68ds1uyJhBzRj10UBkKGFshezZ5EIVa5huW8tjGKhbjazLK+WzY8oAB/8Mz
	Sc8EY22/uMscfbrhETZfq5XwZdfIpzReZUYh3GfP+yal63ocVILAspmapfQv2gbJaPytpVpOShz
	OZoC6XAxWYUiw+qoFt3vLN4NJIKlp+etKECJ//1auA5OFhFLsubFbjryH7LyELbF0xCx6IFxXK0
	1Y8BvAznCGulO2xwh/bOdAMBZ/ZWU6uqNfatNeZrPhjn7KTtcHJKLaUa2cSDQNTL9N+/0E1rV7Y
	K33PmAurOGfyNdMkXtdkkdDzPv8IqA0t745U=
X-Google-Smtp-Source: AGHT+IHHlWroyZIAzbjIooKRhrsUTXEx8/lblNbRFcxi6xG53BBEHU5lpzkZPyY/mfo8NS6RlQGa6w==
X-Received: by 2002:a17:907:9450:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-ae9c9b15e4cmr504054166b.38.1752694308932;
        Wed, 16 Jul 2025 12:31:48 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:48 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:57 +0300
Message-ID: <20250716193111.942217-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921b..f53c72e5c5727 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 3117345d0619c..93e22dfd61c17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14755,6 +14755,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.1

