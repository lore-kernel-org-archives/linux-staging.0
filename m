Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65242F30
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 05:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478141; cv=none; b=aUUh2ONBjkiQv+IBNO8taSGE7LxEQ0n68ja7fyuAUus2QuFJUhCLR2IkdJsxv/k9oAnCb6R2VSTlV4739A8QMqiN4ptkJz2xpie74qbiYpG1UShxuQI5i7QDQjcLFxT8SgivSrS88KLWLKkG7Md81S81BE+EWnMhf6ExLkfBE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478141; c=relaxed/simple;
	bh=D6Si2bEd/gJd1CSLAqajZQzPBLVMC2TuZsR1YACoGVo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cIDWSj9agiso7/FYmmmWKBPlNcp6ICzb7cOcwV2Wexa7JUJeVs44NSCKdhYxJF01dAK05p2yub4mXlqveBF3q13cnMAUTUr6YHF6Kv1xRvqWAU3ONGWzZPCIZJ3Kbcj62NXG2POw6lD5KW0/Cn0xu2C0IKce4HbmsXTm+79mo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1HwkLM3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1HwkLM3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a7dc13aabso553462a12.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Jun 2024 22:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717478138; x=1718082938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2KFwSuk79X9DX5w/ku6Z9rjU54vKlCO06+DBoLY9A3Y=;
        b=H1HwkLM33WH3767XmS9THSXwQuLgYkf8liEXrXWli5i+vJgcXAx74UFmsCUMruv/uf
         ySeCFLjadDj05UEHfSRas43G4n8oq3fE+C1RN+mSAbrpvEZDJpf2KoVHRDMvgnEa4GVw
         szzv+Zy5zLLFimN4GOpRdw5rxq//DgmTspJ0V7qs1zWF+dG/6JuNpxJzo3liL4YXLS83
         c9u5YEJkWB/u5+l4/VKg3QLzsUkG9XStudu2l6anmzOzvmzxv7N0Ar5ZR2v70NfLXw8c
         /YPMn5zjaQxBE/RYDMhTgWn10AGI72rout9kK+HPjwegR8zyRdFBjRFe0Ql7l8cbx9sD
         PaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717478138; x=1718082938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KFwSuk79X9DX5w/ku6Z9rjU54vKlCO06+DBoLY9A3Y=;
        b=pKL/kJZEqpqTjPuBSlfpffw6EeH5NdYbRKXMq/EOU+7QRVrnn8ecrEOQpT6tDLbwb7
         o50vByLra0BPacrCZ3KL/sJpwEKAIw+/yIKSkY1Kv/cR7tQNpDC2yuO+QVweEbPM/H+E
         Fnq4JhnWdiYqsF78uQdoEtBeroVS5ovZjlokW+DkzHcIihBZUnK7cclY3XtkbvcLTAPV
         gzGz27KUDkiDKSrLRQeG9e0D69bqBlu2HVSUOxX1zxDqVYu3ZzAvvyYhqyV6N7Y65wyx
         fUQMwPWZyjPivcYTWptGEPlqEtvfzbmLF8eVxeMcFMcegZeP+1/KXksZ51V2cgImr/UR
         grzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVveFP3KV4mcHu0VB/TFuqrUZWdIQu6vAhrcgpgd3ftj/JvsQcaKz3TIS+iI+kQ83kmK4jFk28X/0s7SLcC5ASew6lOsAW9j4itc0M2ag==
X-Gm-Message-State: AOJu0Yz+WGJtVj8pmUwFfCT+I0h22Q6tGwjUXZ6NPMknrfMbV7KBWTKP
	ILh40owY8DvtCptnLPN3jedAzb5CZbSq2kHuCcpr5U1VZPGfS9Fm
X-Google-Smtp-Source: AGHT+IELwPjYkPPMjx/cOlLOkJTKS9byWM4fjPErh9dLotwDfRJJOfxB6eikJGAPgwJevRJtlecYGA==
X-Received: by 2002:a17:907:970e:b0:a69:228:8a6e with SMTP id a640c23a62f3a-a690228939dmr370899266b.44.1717478138040;
        Mon, 03 Jun 2024 22:15:38 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68afbaac03sm451896566b.149.2024.06.03.22.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:15:37 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/2] dt-bindings: media: amlogic,gx-vdec: add the GXLX SoC family and update GXL
Date: Tue,  4 Jun 2024 05:15:32 +0000
Message-Id: <20240604051533.3312944-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GXLX SoC is a GXL variant that omits VP9 codec support. Also add S905W
and S905Y as GXL chips and sort the GXL comment.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 55930f6107c9..47dce75aeae6 100644
--- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -31,7 +31,8 @@ properties:
       - items:
           - enum:
               - amlogic,gxbb-vdec # GXBB (S905)
-              - amlogic,gxl-vdec # GXL (S905X, S905D)
+              - amlogic,gxl-vdec # GXL (S905D, S905W, S905X, S905Y)
+              - amlogic,gxlx-vdec # GXLX (S905L)
               - amlogic,gxm-vdec # GXM (S912)
           - const: amlogic,gx-vdec
       - enum:
-- 
2.34.1

