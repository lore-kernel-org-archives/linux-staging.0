Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC92DFA54
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852326; cv=none; b=qGPXz715bsqshPjg71yXlbRJR+tTZ4XvWYDvJ5tK3K53v7uGI8DFIK+/Ec+mNp7b5AB/hml3KnI/mReZk6qcKFml2NtyaPymu89F1YaLDyFdSN7XcM5PnaUqDlQVjKO/6qlCyRMTLnjjlOBBFSfyAJlfjhbmEgRDdJp5l6TX8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852326; c=relaxed/simple;
	bh=Le3fKPFnTnPrgHTj8F78EVXFR3HaOupXcG+QIrk9gZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FH3t1ob1YQ2w1s+ynfBCDHsD98Wb2O/81XTRrXxcEsoIN8eYKeS8OzLv0e6NNeHKCNtgbcD5ixogwtZ+nUkc2cCvmnXmv0+XX+MybZSg/KlPnsGzc2UN090yp6bQPfu2pSY7PYrRZIy6MyKh31m5VOizk0bD6BVEFl9skCPtKNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VImUf0Vl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VImUf0Vl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a522224582so1109012f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852324; x=1753457124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=VImUf0Vl3ZmPqIDx4HAaVOEmAEDlmW2dD5cWfjvywK1ixE+B5hICpYGNAGNTaWeHvG
         GsN4QGVPoUHISb5yqKeLWHAgBPAYoUrEE+5OC2a5Mub1syyCFwNGArA2ooS0puBKJBzT
         KtXf05odKqn6w0rYRxe54bA8RaNJssOooK5eIkD6mdhZdA6sPvDJOxSSdluks7bxBgBx
         9YxDCbh6HCG3TzuSEO/Omoi5xpjDeInqksExF2SToOqKllPX9HKASpwMBiCpjc50nJOI
         MCVxPX3RoooQc/DY6WJU/dNz61ah0ITTSQhHAGs+5ad8aJkmgnHjcB1rUmjgmYYdiwJc
         qlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852324; x=1753457124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=S2YUAMTDRRx18QSY5yQKROiiYv3VfHZuRi8wocb36aQwcodkz0ALCWfKVXyOEB5hpJ
         CVDcbvlzN5zmePnIJX7skMvbqZrrhMohOZbSInuexlEB0E6+BbgxIbHYR/oH7f61kIDz
         JIDQSZbDu1zjsUd9/Ncsf2Mc2B9kIyakW555bF8u+nVDwJK6kYeq7vu9vndqXpNTs335
         CNjBffWd9gK6vS24/kxfKkoaAaghmkB9TS9sTaxFuxDrsZv/bGppsY3bTyZv7NSUVsQW
         odxmis0iGMnF12FhsVSKgqXIsMdlbLTBZ/hUpDZLk8UhyQ/7UaLsw2jNRIVU9lTCC9kt
         o0Og==
X-Forwarded-Encrypted: i=1; AJvYcCUacEyVPkwjLi3o2qo3UfMAUkhpLRrwRxX7tywX9MX1DjPHhm4Fxnk0NOgF2isqeWLJKnWXnOAbwKr3Znqk@lists.linux.dev
X-Gm-Message-State: AOJu0Yye2UQiQuiXK97Ac+CQbcmMs7jiY55YvpP+Xtgueg4trETeC6tk
	1OrX99kPRi1RWuD3V/EEF5YDj7YR6fPSwoFsSPbtN4N9XG/1SsaT8H0z
X-Gm-Gg: ASbGncsBg2IUEJiMrLb3lPnUjxwp+u5UN/4Gc8ii9zBFq8ZkrhyZeXtTAugmF9fPLAl
	Q1Nl9+U3VZ3e8ulV2jzGxlmVA7aV2/cSY7AvrTyDzCYKqjlK9nfL7vNYLd1gSs5mByBPzQBisbl
	ojP+QtyEKGrutb+nnwigDpxJsX/fZoMadWtOaoKZbik40UO6tpf2fzunuJSlvX/6eY4L/QY89lv
	3/bLVEc3m3fSC4u/vzeLA57GZkw04/fklfIQvaZcc97e7B+VDM3kW5mWyHpDMhtTvCsCTmb1fNO
	jX9nulruMNr3OBltMZwVF45TKKWPn3q5IcCbvryxDwPM2NdtnWXAJm6e7gZy7fWRVo8pIoPlR63
	vS2uFoubYiWdrS0ky08Y0Ca8GCpVHZDXt1w0=
X-Google-Smtp-Source: AGHT+IEnXhOLq8dbtFmyNRqfijqOMFTS9WGlEktcFzyG2EgAKBCwRInZoSo1yCEAsrfb5BJlPoX6/A==
X-Received: by 2002:a05:6000:18ab:b0:3a6:f2c1:5191 with SMTP id ffacd0b85a97d-3b60dd643fdmr8953385f8f.4.1752852323423;
        Fri, 18 Jul 2025 08:25:23 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:22 -0700 (PDT)
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
Subject: [PATCH v7 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Fri, 18 Jul 2025 18:24:41 +0300
Message-ID: <20250718152500.2656391-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 9afaa8a7a3f52..78ecbab8205a5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.50.1

