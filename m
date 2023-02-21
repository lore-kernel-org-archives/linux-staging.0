Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12BB8C0B
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 18:32:25 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g1so20750225edz.7
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVgROdQULqVTm5cZsK90w6/mn8hCbHN5YbVIzDSMgeI=;
        b=XthLSfsJ3sDWeedA3vMFgH+nYyTWffN3ykvdKMIgZCII5Lp0jEbv1STD7zYnHiAXsu
         HbvRZ0JONBH3SVuVB+D0CU+OjLkg8WrvZOXAe8YXc7Xs3p4civ1HOb80g6Tv3mnRfP95
         9sDvNh3FXGQz+/yu7FB5/GsOZLhL+JO0XCqNK3uF8VLDnB+TJ8TX/6mn2YAqLu0HIxIX
         vr7d7tzQV75/NlCycYQmnXfYXZPj+dE/8KeQcg69mWpegtRdxTHv4Pr/act1AhAqOqY7
         cgGIryvz4WE5E7Q5hzUSNbz7aYTdhQBOuwDn4qbY+NnweeqjJBM0oFLTCbhT/5SFR52S
         VNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVgROdQULqVTm5cZsK90w6/mn8hCbHN5YbVIzDSMgeI=;
        b=BvSSj3u2F+71CQkbarcM3S0bK8Hf8ZM9ordGFRWrBTU8ZLm0N8W8SE8gjpx9mjw4Xn
         I4sh7m0gJ/6R3z6VFoEnM9JVyg3XYJXZT3oimRk7/Ysg5AJwRR/fuKiwitr7ILp1RQZJ
         zlXQpLxn/aaoSLsgVeFmP3h4VhVzyHtclaQ46tzmLo9n0ULLO8qFqUuO9XxZSI3LTdsF
         cSeQILam4+0eEmXEIApgJS8F/yWmLt3KbYKlFcvQbkj72dvqnfPAaITdazS03ZAwz/YW
         od8RelavRU6/t9aTBN2+jdBlofF7J6SpAqnMkeR6EdW+LFiz5Jf+nw/DUj4/RuwvI281
         4upg==
X-Gm-Message-State: AO0yUKWhOdCXGTdi0phGjJhUC6Dg8e0E/3cvHe46zS94LZ3vrCYW095C
	CKafJ+i3UR8YJhV056YiFBU=
X-Google-Smtp-Source: AK7set+jQ+9BvsQ5gp+9b4ZiiTcgH/+mt6qbyEDN5u7cOiJ5nhFbV8IA7F8K4+TrBiJSTmaG8DqX7Q==
X-Received: by 2002:a05:6402:406:b0:4ac:b8eb:e398 with SMTP id q6-20020a056402040600b004acb8ebe398mr4582455edv.6.1677004343982;
        Tue, 21 Feb 2023 10:32:23 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [PATCH v1 01/10] dt-bindings: sound: nvidia,tegra-audio-common: add new property
Date: Tue, 21 Feb 2023 20:32:02 +0200
Message-Id: <20230221183211.21964-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nvidia,coupled-mic-hp-det property to use Mic detect GPIO only
if HP GPIO is in active state.

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

