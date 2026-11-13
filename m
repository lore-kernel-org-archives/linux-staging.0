Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586736;
	b=s90Dpjkvl7jnvPQudSpvhOqfO5yA95HtEES1G2r2lM9yUHEvQ4RN4aryLcz6ztex4YjR
	 f+jgysn7qSt4qQX+D4qgBzyuHt7I1rA98MfwqVr9YF0mQcPjfpjaKuFoHtw/lL4ZoHj7i
	 /fTYMS0Fnsraoxq4yU5tTIVMcKGB3QwpmEWZ4wrnz7iin69jN3gLZ8ZBCuWwLoBJf8Jmd
	 IdelXnfiM7abV3bScPwgcRRT9iFKb9wLEqm2Z8CagKfTHhgGPvn7Pg8ZZZSHozhfCeLUV
	 vzBpPBm9TKZ6Fm7KDeDoyeNpYwZJV2IcYx5x2ziE8Iex64beCVAAkOLWOJGRZuFemqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
	b=hgKr3Uc/zabLKbBkKSotowF0RNuuX7P0cQw7QXCY2ExvvzGzfa1GorXDXZIBdSBUeW34
	 NEUjnBJBsWCccu51n+JZiJwP8ZGKKFqgPLbwSVuJ2OygM5I2n0S6+QHHGhC0SW/PZB2fw
	 HbTxmB5JWe1nmlxR1l4igtjdn2kpqHTZQHDT7RApLX+2h4GuRQf7UQ1nN4SNHhzb4cEtK
	 WhD7nnsrA2TJpWbPtvxYuQWP3DSsX1XueFjv3M0T/vFMJ1UL96Se/LL2G9ot0P2rnYvXy
	 BQfPfmRbWXHS1Ecjy0ekyHNrlShZCEszTXt/7cwNePzu8XKDtbMi4zR8sGDJM2B0kpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVpnTCUo;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759960A2617
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8759960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVpnTCUo
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so216152466b.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586734; x=1795191534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=rVpnTCUoipZKXQrMl8yJaiCain1yEnMP1HOXq1H5fQL0+pYvUPtPQ0YOiEbw2fHrHH
         oySv99jSMR3Tjo6DY4GFC2tPrnadrvZlKu9Lo7cyb5sET7Ko/F82hafJsoGz9gF6DeGj
         OHFceq+vdbvvw0+OZO9B/YnXgvrgT5vhqNvYynjMEvxm6hAyVBYCP0VkxmSUmJ024hno
         f3XwIVUotqrlcIiv4wId4eo5ok6L4yRvzUagU35MskWLyGkNZYAJiX2e2NOcGkK4/W3d
         naa529F6EP5YSq3TdScWF/CRVKu3QnfPTCe7y09x3FapcPfc24vMLZIn4FpQHFivZtrk
         0Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586734; x=1795191534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=m69mIVZspot0ux7iznHxlZPiEnq/aXxxuwdxeG9KBGBj9TNa5PQtqxx7wsgNHAy1al
         C4Y+kgi/aH6GGyjCo/mk6HePgvgpkW07R/9XqDzJFfF/saiOsE2WUtpVZnxZCftlSPL2
         kP9ohD9fOVZG3fHvib3nx1ctVUiMmJIFOW6Yv9yO25Gdtf3rQZEp71zImx/Nnus8vtLR
         i6rSMVw+y4y08D19s3Ta0h+VLPhX2f++vWp+1dghPHDidTcZNLKWSEsZLEfBVtbVno1J
         a523/oN3GUedVse8ty2sjzgtWZ5FheyVfminpwtvKgXQP6aeqBVLqwHhwFpR5HujnuWz
         0TiQ==
X-Forwarded-Encrypted: i=1; AL+hErEZkwi0loMGAQ6G8ljHKDVFRlONNyxIJfm74Ek6Ws8szktuMzANuGPteb0oEx4JgprNl8tDvk6DBrJL7PCZ@lists.linux.dev
X-Gm-Message-State: APuU4Z9JNoXGpAefztzNIg/2twPykk5hssmm6qt9MN+z1sjuYXtssxrp
	YgwnFzJJQX6ig10c/eBPrb87yLhY2eEvYu+KrLZ7ajyBLJw9/Z8QrVya
X-Gm-Gg: AYBFou3DO1eOLD2y2ohNYT+lR1vptLc42gul20Ju00gW7FD1gamzXRA0mhc31FnuGHI
	cyAf6afNZSydewQfFneG0Icgw89cWlUxcrPH/Xh/EBm2KxXzM+3E5ATzk26kVq9EYJAp3mEnJEV
	SrSF9ic/ATww863/Br2VJNkbuONoiX6W5Vnwo0Ozd8zJJer48zUeFha49NoWeeL12b1O8v3jSQs
	T6ekgyTCcQDv8HjRdivhh85aApXX3qVP9LxJjkuJzU2Ec8dVM+3dnm5nE3jWfVzyhekSwfwDlyd
	qIPyOaAlcqgHhLXy8sD9Ooc4DjNu5riFQgBnIbWYr7MIrEXVBgoAXQ21xW3/vRFeYQ8Vd4ikPo6
	dy6ntRuuEP4GtrMnTnJw5SQpjqHqgkRdfRCxGxml557wNiM1Gt+5BizizhmFcfWU7sT05zAGycE
	7Q0nLoVB5pkAV7Wg4QpZ4yFGGRSu99LpKb0NBT7+4MdFCXc4i0aWurG4X3sJCmjluZBruAw6aKq
	0SvPLPhUiQDlKKgWfMrFBO5AQBasHmRm2EzNn7docGCLU0AXCe+wQjvqCuUwou/iM25DwodJ1IU
	TWGQK61vlMia28Zbcrql9GyJn5lew+dqd2QiRAbx4vpOgMVu0LlKPfz8uOb5iNJfAAmiY40bANe
	cfCcMvggxBQ==
X-Received: by 2002:a17:907:3e9d:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c5096396e4fmr271748466b.28.1794586733814;
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 07/10] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Fri, 13 Nov 2026 18:18:16 +0200
Message-ID: <20261113161819.36847-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..0c18ac81c6d6f 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,18 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
     items:
       - const: csi
       - const: csia-pad
       - const: csib-pad
+      - const: cilab
+      - const: cilcd
+      - const: cile
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -125,6 +132,22 @@ allOf:
         clock-names:
           minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
 additionalProperties: false
 
 required:
-- 
2.53.0

