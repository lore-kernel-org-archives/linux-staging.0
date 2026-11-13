Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586726;
	b=DaSSNzguy4PfXKq6HZAlJYTHuGBKJFQUI5qMfTgDUDv3+3pjDPljxmJRKi/6OY5AQgY6
	 LaU740XawkEaUtq6Zl6I13oWxpaN2wxqn1lJlPTCkKhHhPHLoLTOAmS/60wBBdaQvsAe9
	 vQvutX23z0GHJOLhW4zkJTE8Ar2yboWsmnYSM3dqNtm+gti0Jg+sJBrOhKgtBjRxS8jeM
	 hNJ/28TijH1TLOimvoeVTduOVI5zSg2gnz5zHG13mLDwtsz7Ep/dy+jjeXSXHoM+Yrjoq
	 y8c1UI68gebmvzmigxXAlX0z9w9zf2WvNxNXmQ/WjlHbHIOtmUTAQxwETM5rO4dZYsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
	b=LltMKs5pE7NuDu3G+m1rk3YSc1Ip6u6WMyMhpfhzirDL99k/p+s9r3pSafl6HC1JCfnj
	 tSBJPKLT1l6G4b9YFx3l/CpPJS/KpgPzlGPrcwIx8giQIk00lJh9KrKtiE+IAVFI/fLjF
	 IbShvHfWdEY8YeLJn/MrN0lyqPOzreyayeoe9jPoKU0T+TOrAy75O4f+ceCq8lwxRXwdf
	 g7m2q9n3VZJVUuYUDswTgSe2Ux3rgFNdYedbWO+JaZkZNwlMPzGf1sKlpwZWqZIIDH74e
	 VttoI5r+PDK1QEyPWKPM6egtB929wJVR8FHFkdD0r6A8mrKpluwA9oUD0elRSw44HAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knNaUE23;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31D606B2FD
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A31D606B2FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knNaUE23
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c45551fa84eso305055466b.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586724; x=1795191524; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=knNaUE23dSEnl7U+MzLBlLCsSZmvnWh3H966PFn4tfzbkWKbGEv1Mm59JOq0E58bx1
         jnFf4FLDkeUpL4OTPhN84yw+Bmh2OgAgHfvWurnLkkDP0TV78CdjNtB/Qk1GGE8oW+Qk
         A04LEhiimt3Q/w0aeMN0ODngrds3eGy/klFE4cThCEkREfbfVPsA8lvwUtp2LNIBqAkP
         Y1NzntrCOXAJEb7gtjyl9pzed9hDJADHmDoRrkjccwFUloW9ty4tnppPv7GioaNi5DjL
         kPFgBnt5pdjUnPlVZS1kpqOZ71sa1sn6Im7q2ugWN2ileuFhqzQOFZpYmoCuNnXmOFxg
         AenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586724; x=1795191524;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=ooFySnR6VbzU2OivTb4LRzNlw4IvV0IYxOSUFRfV5+RHA/DyFr8kDXpS8UFtEHTVCf
         v3d4XQsn8ttlg1PJOqX8UYoYZcHv98MqLVKY0fBYIkVhlm9JdbGXkobO0kaZhtdGxMgE
         RUhKKTWNZX+vkTI/Nf3tY/e80ESjhbHTCSjVqrPN4FhUTLvVyXYB+3Ot66io2FLTmwev
         7tFwXGGKcnOe2i90DjfOiwKiuehdXiws0eovSaiv14pbidO5txST80IBvdMynes/+J3c
         6mhb3YCV5mD8/8xfITto0PA5bAO7XccOTxs0eeGkPMdYBkDMZBkDrBIkd2ZycRJVBOnO
         UTwg==
X-Forwarded-Encrypted: i=1; AL+hErH+JFs9no0U6NOAUcZFtCGlVXdXJhJecQd708JcbH5BR7wrA9ih0dJOrQzIihYjERpB4IMpnZdM0DAVcKXf@lists.linux.dev
X-Gm-Message-State: APuU4Z8NwlgnY/uLosExWaroRCjnpHd8vxO2YmZyS5y+kGknQfP5cbLa
	BJvW3xWw9wmHNvZjSdZu8+DfrFlR6aewVo7J4FMJPlCgbcOhEbznCG0J
X-Gm-Gg: AYBFou1R3tNiZJC/QzY58Z2VTifwg2PYGO94zHJ0RnG20Z8sK/JmBTtsgN3blDpcnI4
	JvrvTA+EU3jjcH8nI41txgjGZhV1jQ90G5Eaow7+5SHUsSws6zQr9PWxEvsnLkYBK4NACmSUtTj
	S8W0NhAlHXThJi1i98XJ7H3YAUkQ2dtOvGjbPqHJxRkYoH12n5ZOcwU6hFFM3x+0PT5aXmkQzEL
	bLRaVyFKKewrFo05Zo1xOoLvhSfwxHAiCZEvYr9mf20A/gE94KCjzM76e+6k4OVuYZTgG30evWE
	nSyFLeoHbOuAGXbgfrpMoHyqNMNF54Qww/+7poDbZhLTtngpShLqxtoxdKMgRN0OqkxSfEmhDvH
	mp9y1WQOlfQ/bMMKMbbOT/OAD14wExaYmOSx/nbiI2xlow1E91BuRpYX+/mchLETX9IJNurdESN
	sA3YqLBsLf3eJp+Ezm6aUGQzbKEriZrXpQTmbgKpcaCq1z3FLC/nGDbTFo/KJlWgiSFhrfVfLVb
	q8BsUBNWXuRr4EDpN08HPMJGu9GE26Ql6eYpDF5WsDfsIRss0mbiQR4IRy3+EXPuoxBfqTh7ZUm
	N/vngKDq/h5HgbrmLKgkaDGOcHMIscfjdfd1FGdaJkZpCpIThBA0mCX0Ln43V+2aLlhQ9SyNa1A
	mqTlvpfvNxyQ=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277084266b.9.1794586724367;
        Fri, 13 Nov 2026 08:18:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:43 -0800 (PST)
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
Subject: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Fri, 13 Nov 2026 18:18:11 +0200
Message-ID: <20261113161819.36847-3-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After further investigation, I have found that Tegra30 requires a slightly
different programming model than Tegra20, the maximum VI clock differs by
nearly a factor of two. Additionally, Tegra30 does not require the
APB_MISC workaround.

Therefore, remove the fallback compatible and add a dedicated compatible
for Tegra30 VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index bb138277d5e8c..2d5538a1804f9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -18,16 +18,13 @@ properties:
     oneOf:
       - enum:
           - nvidia,tegra20-vi
+          - nvidia,tegra30-vi
           - nvidia,tegra114-vi
           - nvidia,tegra124-vi
           - nvidia,tegra210-vi
           - nvidia,tegra186-vi
           - nvidia,tegra194-vi
 
-      - items:
-          - const: nvidia,tegra30-vi
-          - const: nvidia,tegra20-vi
-
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-- 
2.53.0

