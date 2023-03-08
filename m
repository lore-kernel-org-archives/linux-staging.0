Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F4D812
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 07:35:25 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a25so62257216edb.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 23:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydV0x0rwcG3ZlgXY+mzQMZLrMJgGqY0Ocp8WqRfbhXI=;
        b=gZlq2Kkuk9VLf2wxgDlvBqUxwWF3QUw0OTvuvL7dyaApcUu6d9KZd+JG8HMT8ap3JW
         Vx0G32zrjk7Qq6UIsYqSLg7fAPNk3ZBBI4Zw+vKtZUNAQELBG8jT55lEvaLIaBFC/4Uw
         9RrR5NmXkShLV4u+rXiFjbujReIG/tUArH2pXfQczAe3ObVR6ijZXXziCIXvfCB8ANS4
         umNWknNKdgS3mcr1PMkYI0jgoVJCpQx+/HfpsLmCv76fHxfuEShXpo6469Y8iCq/VY8T
         AE5lBlFm4Luuy/Wu/Mt/aPjTrFrjUP+10XLRw7GfR3/IDq8xLSWJGWlClXgZaqHrQ8vK
         VofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydV0x0rwcG3ZlgXY+mzQMZLrMJgGqY0Ocp8WqRfbhXI=;
        b=hOC5kE4/utSM5Lf7TTWaiVhszuDnKxPmeGpBD1fZjf+grwJ7HTuP8253EZW4qYbvo4
         lK7VsyS+aFMJYm3cJOMm4E0+OV4Jv9vgdqNevZ/7gX3Aqp9Ps0ODChm+8JlVg/e7Lhml
         ab2dkvKCbnZZbEiwLqwz8ZpYjegbAjWs+C+UcEeEJGnFej7EnF1jGQSLHBlJSWV95KB4
         bJ3TV3SRaKaAhJYn6z83hX/f6p/XZy4ElESzRwabU8HdPCFXTS0x3D5HkenAYLObocSd
         yIT+W2y/tyz5Wo1VAJ1c5JY/YMW+S/4ZgN18N8edBy/NZmEXGUjnoDOIS3rLkcGEr1bh
         haWQ==
X-Gm-Message-State: AO0yUKUQGrt6JzjyHVuEoguj1iV/jIuXrrsIqmHXeZAPy3rmIU3adj6e
	/ru9FjUBUWZRwEjCYxb+NaM=
X-Google-Smtp-Source: AK7set+MqghAbh20u08oxbKMjKhLU7Z9/418ZjJYV3F5ElaxH2EboSHQ2QntlQLxgJ4yVw5eng/I3w==
X-Received: by 2002:a17:907:7e82:b0:8f4:6efd:833f with SMTP id qb2-20020a1709077e8200b008f46efd833fmr21620650ejc.3.1678260924049;
        Tue, 07 Mar 2023 23:35:24 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/8] dt-bindings: sound: nvidia,tegra-audio-common: add coupled-mic-hp-detect property
Date: Wed,  8 Mar 2023 09:34:55 +0200
Message-Id: <20230308073502.5421-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nvidia,coupled-mic-hp-det property to use Mic detect GPIO only
if HP GPIO is in active state.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
index 82801b4f46dd..7c1e9895ce85 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
@@ -80,4 +80,8 @@ properties:
     type: boolean
     description: The Mic Jack represents state of the headset microphone pin
 
+  nvidia,coupled-mic-hp-det:
+    type: boolean
+    description: The Mic detect GPIO is viable only if HP detect GPIO is active
+
 additionalProperties: true
-- 
2.37.2

