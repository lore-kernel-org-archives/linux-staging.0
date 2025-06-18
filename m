Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165022980A8
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240789; cv=none; b=QV3e+sWMRM2+USNjFMETrpX5pAevHPxC3+FIev1Any98Ke1Q5kCbI94n+hg0qP8cQTxbZDYTPXj+Aod8KigZXJMTQ6vxySzLPND6Xfj8G+cQ8EIbraajD0ksassbGxlZHRD75+PsfMACH64wnWyai9JNp+sp53s08KSXfJQ/bDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240789; c=relaxed/simple;
	bh=npU5zmbq4m16yFFE/UvTeSSqz/GjiLDGvge4SkV+dOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2RRbb2dUxAH6/vvBes51/Em4/yvzENrnAWVsPZVPLwxCD51xOJi+TsuTS7EXNPQN5UMuWKtEi3LaDhabdhdJ7RNPdjlNFpP7A+ozYEkvQGXZSuQbLIf2kerL0zolnB/swoDQ2obw/PV1kym/fSWTpXDlXf3Qr62OQ1259D56H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViY7R51v; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViY7R51v"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so11389310a12.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240786; x=1750845586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zlxe0FWKSlX6ZpjYCnKa20yGhgX4GJOUiHsNsl82fo=;
        b=ViY7R51vlFpklmClUfMaU27GcyD2qALINXjRs1Z+bhOtcjsirm+CUmSxICJVPVBExs
         XvCFahxD0RHXAJnWfxdvPkndpz6drZCbejJb5q/2sEBUxZmXoMCYk7+p8Eb5pY0HGHw/
         Z9NLfQMd+Ua/p00KherQlFQfEFk/iiosmRjmlSnXWNzVyFmIKIds/SI8hhIqAUkPtR+J
         ZVn9Hr6hsvGK1cp13SFqoYg3BjlFHKc9JI2SO3/zcnsKcJ1291XwgcNt4LqQRlfP8ySt
         g3r8b8MgcT5L0S9Ca+xn72zH5qS+pm+tppdtu035QuB1/PPpjalyR2Hln8oqaMwqnPkn
         64QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240786; x=1750845586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Zlxe0FWKSlX6ZpjYCnKa20yGhgX4GJOUiHsNsl82fo=;
        b=uJ3/9uaHhyPKYyOdi4l6JfZKJvT0ioMByo21Anb+mBQNOUxQmh/M6XuuxbA49kjMvD
         qOdbkXrOcfuprQl4uzmd8kdUbquOwahMsrDjeBB4EoL2ZZ+wDwAzpJGojHGhiwDxZrRn
         i6Kbyrk+NkTCndn26MFoFlgRDwiXqf8zVJIYtz9SI2zNPqt3Ljtah10fbm3QJQdXYZz9
         D4mYM4yEJqrbTrW79wIK0jpMwwmiaA+8H8fqv1LTFeAVl05fbPqHVgXuBVvWeyCWnUJq
         FOGdBXiqE2uBpnm4k5OukYQvGyFElxGzxUJlM8DBU121vaIKwLw0iXJf1e4gzXG41EgQ
         X8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW0xq07w7UAIg7j6rtqxHh/hqUjm8yLF1Rr0nVmigU7ELU7tgUCpKdnG9Oyx1QvWI3kRIslFFYNWiNFOIiX@lists.linux.dev
X-Gm-Message-State: AOJu0YxZqS+ttgRenCWVSi+DZKFjyyc9zuT98K2J2kCkkHstPa2aBwNH
	PmXMc2yYwU07LarYWXzcTH5CE1S1gl/ewS9gQcMjYltl5J+ryb1MITmA
X-Gm-Gg: ASbGnctoO7Mp8WLcghZXbmSwet1SbG3ldqrNKvbVzhxBNvZpYGlySx+YukZ3/gB318M
	4yhF6KbrYAJOkteugYQF3Ai48mJauoofUOPNTZqCwHBO4WGc29gl9ZGDYBEgBDzTje5yUR1pqlL
	gYsdNeUovjaAHF5X6m7ywvynWgKcXhcrFnCZXxuOhHh7jboEZvTIXmipHvZzrCkyy1qqDgk7Boi
	5/OjTMPgfn+5f6K70Wj35EOuw0+SwhkEyEzxQqTEfFUSNd2POJJCZCijKy8BMk8NriDm7sOVRY/
	AaYEkoarMwqwU7MuYjdYYA7jrYc67zR80fO9WSup1da3rwCp+zHcqAf9kdZKaUvgwX9bZ5cN4QU
	=
X-Google-Smtp-Source: AGHT+IG9penIGaVwsHptDJX0KM1UF66PREWfOai3W+uhZxrAvJnSPfX131I0r9nwPgeEttHzQcYPTg==
X-Received: by 2002:a05:6402:34d4:b0:601:ad95:ca6d with SMTP id 4fb4d7f45d1cf-608d08616b3mr14849444a12.8.1750240786236;
        Wed, 18 Jun 2025 02:59:46 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:45 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 10/19] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed, 18 Jun 2025 12:58:46 +0300
Message-ID: <20250618095858.2145209-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d..b345305acc4c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.49.0

