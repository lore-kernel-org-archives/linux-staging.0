Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB32D2387
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694299; cv=none; b=M6Cb6k3gWtfTMjPsKbV7Ia+1UZSDx0cZdQLPi00kL0uNh+6JUqSXch9faJVwww3ksTIg6kgxV7w98H4zRir7mD4fPY8pQqxC69flUp4gUsFxBVqjD9uwMKCfTKUaUv0xx5PK3gPiaA/tyW6XNtEKVtE8RRnby0Q3rkDFILFWPYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694299; c=relaxed/simple;
	bh=yFTG/+IvVw+bzb3MnGzM0TmgGas2u22oztjAItw/ZPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JC+sjT4zS8lNSzr8lwJ1fOcb6CyX3hOt30j1cH+ti3RbFs+nTmYxDJEGVg4Cie328Tq+6TMNB8jIwQSGs+Wz/FZn0dEaSwt4tf7hk/FgToV/q4dk14Z7lP4bjiwFKD4RcI9S3VvoG3n+47KImn/G/xB+5uD4qTcvcVWF/9Vcihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj5cSJUE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj5cSJUE"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so302889a12.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694294; x=1753299094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=Gj5cSJUELabiijhUgrCZcwwnXxrEN8mllhuPhZ4dznfqqr0PKAHFofT2JXtlSgv+6g
         PumX9mtrQ+iKWCmGBO8o5KA3sLvE5zGO1VtOCbCfAdoXIA/A0ERw7wrinDasaRlL0Ggo
         20aIDiOKaOM5JYLSYo9UoE9hqQkR05PLS4Duw/54dCEVoK8s4KXW5OkzkM9FPptKhliT
         3dlm+zHPWUSz0YWRdqAYI4dMSZAO/JYQVNbQboyGoXi1e5dVwjf8TMZ32paddspjh3L8
         swZWO6qkIA+3lw4ENJhZ2ew4Bxd2NkZZlpjzId7Gy0aOg1IgVZ+ekoMbaY266h2OfBBT
         uHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694294; x=1753299094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=eLXGFa8LEmP4yemNZIHN6R1jKfTODG98bMwwm9CFotXN6XQf6Cc8KtRMQL1tFJ2kvv
         2ddgLr3tmT+rcFhqv+4QecCHF3IMgcI8S5aUIeAxO834P/i9do8K7vMsOm6hUDEdY7om
         TwnqepeHARxlBbVn2Gm6QasCW1uX4scmjNVRpqAxQ5qxvR2vhRifKah3isEkfB+Gc3ir
         Ptnup1/oEGcjSAVJfT/7Op5ul75+MeMIqRH8x87pLdXekcrtwWoAUkCvcuZKV3L7LP5m
         Vf8EOeWa2QXzRxra8X7jjt9Bf0WqGFjSeBZguj+NEPI8kq+3+F4qZV/YUdBqQloE1eiv
         kbXg==
X-Forwarded-Encrypted: i=1; AJvYcCWV7k6vxGf1j94qxdZoJ2F2uUjUrwllV8gUB4s//MAf1bCp0tMJ9Lt6mtRVvOnvonDLZftf8CB11q1fDsIw@lists.linux.dev
X-Gm-Message-State: AOJu0Yygy+jUxCKmRnxMW0s6+m3kOX2EgkoovL2c/Bt38/ppvcCOVXLY
	EpPZgDHS7wwQmcR8o3l00dFW8mUV4Ht10TTSgh9QJwWYQvVDUkzF3001
X-Gm-Gg: ASbGncvhQdVNKicJ/DeZKdck7wNndszd4+iT97NXkIy6CFPTvUFWOb6pMP0UY4/bhZZ
	7Eg4S5D4bQzUjt02FYIrVIBDxpcx6C4qeNdh9eeU8VTuMePSiAU8gQRvFeSv5etG+gHsOZ3NcK+
	B+AQUzL51wknG0Qq9GIic9G/TPyGFVPxa7OlQvOR0Bid0C0tGCUz5hsw/jCWvbTG8w52cJbAdB8
	SO13cVzxM8u42PtVXUwUHfGdnCsrVgpkFEX77Qlu6+h0076Pyr9dPKnMSdJp7LmiLyyglXOuJmq
	gv6trAGK+BB1EiH+Y2GKjuyU851dOFhiMv6U2CSBU09DN1QmNUMoOfcHhpNNDUd6QIhRUSDUn7E
	lmf+eflg3RVVL2+kpJC44nI8Gpfpe8YhWi44=
X-Google-Smtp-Source: AGHT+IGnJYrIFL/keKJceZG4RSgfZq1LbZ/S54PA0u92gPmYWNBKcE22dBkVtcHoD3MVexHsQ2rApw==
X-Received: by 2002:a17:907:d2e7:b0:ae3:67c7:54a6 with SMTP id a640c23a62f3a-ae9ce07df63mr338641966b.34.1752694294157;
        Wed, 16 Jul 2025 12:31:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:33 -0700 (PDT)
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
Subject: [PATCH v6 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed, 16 Jul 2025 22:30:51 +0300
Message-ID: <20250716193111.942217-7-demonsingur@gmail.com>
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 78ecbab8205a5..02a44db982852 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.50.1

