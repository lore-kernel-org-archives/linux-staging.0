Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309CD288C38
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240783; cv=none; b=ctiSW5/WRmuOlOvkwsF1dtcYRkriMX1mv0mccsx5XLKFzeZrQ2xIq77uz6Ct/oGA5g65rlmiCi3csX7SzIgZ536p0LPQyeK1mU0Vb07nFUxUEJj5Nx2fZwlQ77Rlstkyy3l+VRvM4JNE0ychyedya0H9F5l3CctFYSKXir5sIvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240783; c=relaxed/simple;
	bh=15wPRCs9dOEXS8QCWnBMvIR+cz+8ycMORdur8CEVy74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUSFlkpaH5xSdXsSALZjpg7bSKehDaLj0hBEYcHDDxnmUYxYC1ep2qvC/TN2l7WM4o6P+YIE2ZegxJiS+36lG7xwBhMMXlG1ybtwyH6kHGpRhC2/upe01McrjN5Kaaz+MWQzFyT5iKHL2csSfe2xqAsd1bWzMnpFEwegku3jiC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ycy1pdqW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ycy1pdqW"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so13163608a12.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240779; x=1750845579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3K73ck1qcTjw5eQ/Cd3WvzHWsx2/6iy9qFn2EtdRrY=;
        b=Ycy1pdqWmuwoWeifPYGajozraqqL3DjN72ikuj4Dd/v8YCVgRhFPFiJm8y5HzPEzdC
         1Cz+cIqmyGpQkYFv9LHLJ836zJAP2T6wj+cZ6FR+cfK3fZPCRETZg/uKsKW+BTYFnWOK
         lY7s7zR71+ieKR8MGMKy9oG5CZ2n1IAbolJJSqD0idneSIPPsOdw8P10YCvveNMRWqf6
         hSSEhmY9Fl8TEIfGYMnoH8A6LE2xCoIIlWMo+59cNC640bmPW8IbxDoehlTQ2jfKU9sQ
         467RND/FJiue0xx/Mw4E47xsUGFhN0+tjXh1za+skEWMTrVnTUWtrZZDGYnAHZ4GFHxQ
         eGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240779; x=1750845579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3K73ck1qcTjw5eQ/Cd3WvzHWsx2/6iy9qFn2EtdRrY=;
        b=jeHvLthXL+5G1MsyeGx00aajcM+rysMocXqPeowe+H2zjtG4k3GYY6PYcX/ASd1vAc
         kNDLN17oRS+l2kY9PZQ4irIFyVvpRQzqyQZ8ziqTkzUJTMzxEBOkmHH+LLu0Frpq2Wex
         CAXYrKpSUIwNuXYtalb0fn3xhU62dHVkWDXwdiJLtaldVhNtwmwWXYKSqZgl7udAd6vC
         K9AcQz3fwi3mknwQL27QDjmlFVzHvO/l/gUCxXyTICbq0X2LYOEgDOyhxoJowipMGBbS
         cIt8/U2eV8oGjJlKHOxzh+vtv3meVSFQBB5XnYQsaGFd2RIBgad3zTCakSo4LsrAVGNL
         S+OA==
X-Forwarded-Encrypted: i=1; AJvYcCXZLRgpsLjYVk/M8/Kxq0wWhMHqynodmG2ggaxQiQmFnd+PLYnsvmWnuaIBO/H1Bpaj+xCDzQ7lGrUpCOGS@lists.linux.dev
X-Gm-Message-State: AOJu0YyJMtG4o/t1/8OjDeoLZ+Plg2HVZazrydmM072bRld+kHhxEwFD
	rU4w1x0i8V4DWsX6CFb7508bfXzCJOP3dFofjbEzmk/eOfMV5ll0SJ/O
X-Gm-Gg: ASbGncviP1JmtBXj0eXaB8rfunRrNBS8kcI5VjExzMQOkotGsxdtUkAAQno2StFudfo
	yvryqUJechxvRDM5SnFGz1c4pprF+MJUXYkfyeLrCejEbxvnFnFJAEO7bxNcuDerH/qLZ5d+BG1
	c+d2sGatgDvROabhe4i+AtGukj/8j6Y65jcQlxH2CNT93/I9N3I9iBQgXQqp7O03AiKgZsSIgah
	cOt0SY2PeEThDIl8+RuBHYfve5SQuyV79y2gEHHIiCivlPyW+Sldxxz2niN41u2WzpXMOD6/Y/x
	RWVbpazvmYjlxMibsSx2s606AoyzD9w/rbYYwdUHoc5SSttafWnI+x4vb9gKurNiTOMhDp3VzC8
	=
X-Google-Smtp-Source: AGHT+IHArPLOCNMBFG1nWDN3wTJ1+S5KnCdJplNWr3EV5d16jBetdbbdgiTcJpvFD7zmIwoGGtOE8Q==
X-Received: by 2002:a05:6402:34d4:b0:606:a26c:6f46 with SMTP id 4fb4d7f45d1cf-608d09475dfmr14830079a12.19.1750240779368;
        Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
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
Subject: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed, 18 Jun 2025 12:58:42 +0300
Message-ID: <20250618095858.2145209-7-demonsingur@gmail.com>
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index ab46a5f0bd7e..23f611177a87 100644
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
2.49.0

