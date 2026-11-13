Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586739;
	b=HbhaXLbLB3aEtsPaQdNdNNsOzmOn2qRxBy2QV2VRFXijmEcjGr5UxWggUdKePNbKy3Km
	 Y7R2P6PXeB3Iyer0EPdvXyCecRUZ7kaTELtcVMElgHRIQ3sAYqiKbWavkGmnxmldLKisc
	 8nkjO86RgQdwC9WzjQIU9qG8AT4RiBp3VGpyav7ezDf0nt40Ox+W2W6OJP1f3p6QJrv+q
	 k4uELddeyYLYH9QvM/BTLLcp65ByJ6yL3zQKcPtODib1xwKwq9yQphVZ/u2xVJKkbU3p8
	 kUi9atcm69EATcCD6H3jcRtrk924CxNqXQdZteCYWZvawH2ZcQhr3lcPV/T+f75J40A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=XmkT1yxG14q7h/X/Dgk9y+QtVWPDwG7I/XaD/aQXqK+CpV7bqSTV2RlkXfqrcCItD3+j
	 rj4CS+8eKfX2Vj8bP2gYDhvVAC6RuJAEkuYbdGkynsKAY9wsiVZOv9SmRcAjkQotZlpLB
	 yBfm073UGEbuT9yqV+35kRrkkZDPvjMaoTMXnKb7Gv2/XTNBSTIXd5HqJ47BKKKN4jTFH
	 Lf07m008RO+PC8TyD/5FYnWYXAYUiZ4uzT+TyyDdvCG/RLcwixG9srgxOrzRhLIn11gHe
	 5P3krH3y+HLWukPJr2Pfo8VoLc60qL/GbU3y+zW8wrxypsISyUncJIKBzqaCgAxxq7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FjgewqMU;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D930760A3834
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D930760A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FjgewqMU
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4682977f9aso237971266b.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586737; x=1795191537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=FjgewqMUouWPQ9lQZu4kGfNKKNu/FgBdRtdfJKy3Sb52wryvyODDawTPvtfKJdwFZS
         rxabavf/46t5vhdVDqKDtqf+8yKoiukzZnY4q3M8SFBGGwKcy3AVESJvPSVUHlrgY1LU
         PPk/gYdsulMf4R0IDooZs7/RcrrFvTjaNjhSrg0ObcFrqeM1z7o0Efjz/Jbrfyi/9VZf
         BeGlsvTXUfImEhzoqcYfmgQoDKa+WyaKRDLgfN3iwDNMHDeaWzyNXUlXM4RwQopRkuZ3
         /oH+eRWECDX6Foj4XJ/C6xojByRjfh7XjoTooxsHWt+YekGDil6CHVZ33OHRYfQQewqe
         MpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586737; x=1795191537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=lautmwjOadZrZJG6KpnbJ9QfaONkvSyDDgy3rjMZ43XIWBOb2LBJyL+/95kwroFKRs
         PeNXpWuiAFajoEkUeWylasTSAzGv3zg2jhsLyEca0XagrTiBwMQC+mT6GRspSIWBksx/
         +frMwNr5tC3y72c1K6tV4dI0txgiISitW3ASKD3fn8KwPTIT6T7xiAbb6cyUPHG9sKsO
         9eEUTw7RtR5QaeCbi1mt9ZtOyxDGmJDZwSWpWrOZSwlmaNe9xIEJL8AVHtC9iLiNO2Iz
         8LVeEFcMKKwR37JiFm8lkFpIgPMedcsquo/bN+3pR0uWUSf3Lq3PJnDufkPYwrQP7a3k
         7g5g==
X-Forwarded-Encrypted: i=1; AL+hErE2Lpwad7r6V7J9Y9ut3le3T4KOAsqvZwEx5to5ShyPprhhXnODb8d8uqgv2nfJD4D3SjRRWTLAhaUpg1Pu@lists.linux.dev
X-Gm-Message-State: APuU4Z9i+ouyrJ72PcaoaBxhAaVcc2LN0yxR6NVz6CwPgczMxIC6Ctj6
	Iy+HbEBZTHObsKUQLJtB0RZeVOizgYEGHq7iT6GUW3Wr3PmvNNwsPU8V
X-Gm-Gg: AYBFou2wadcQLvY2nhknrG8l2XgwNP+ZqMxtRLAxuciK/4UmL5G7Pq+qcDGEIxe28iR
	tCB2J/o+63AfwsXm7nMQtALpgf+mrwif3xFBfCz1TeH2IIHWGuLK61lbguiRyTEI2gXfr3UzpNp
	0E/I7/E8QdAunLqtvAPZVgv94htVdRt1rdxUpCNUGVIidWyPnhsMLWw8GUBmelytWPKD0xr0Blw
	ql9QD7gFAoDAqKg4kiuvLhOx6tC3/M8jwam2TYoffBgSmaZJaruJuD5keVEOCcujdnaNUqPTIAe
	n3OgzGr/RzSjUl1Om3sDuAWdPae/n6jZ8IKrclgYg2yEsuAuoLTrc9WHTJ/JmEjJHcyyYaeNC11
	WKT3vUFhACU9wK7tRZsvOS7ewopjCXCZdcujorAcmhEP2vAXXCG9t/H8Fjrl5xCLq7QZLRvjf9r
	FvIjFv86FcXu/T7qPYklGTD+cSjzQ553f2zbCADAQtZG2OpuotjsXB5bRGC2oTOeI4MpuhKWTyO
	b8cVRwFJu55ESZs/4HbIjc6pmCK/37iNgKc7tmXhvy3Wo+iOUp9Y3nL7TD+qPtc+l2e/KkVnQRm
	ABka5ZmT7XnGsbI56Gr4C+dRDvPCQLOwXy5sbRbPZk3K8LklPHWv/3ja4cY7ZmJSddXdbJTKxkK
	omuhStym2mkKLyO1OaKUSFqA5ZFEHPTc=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277155866b.9.1794586737209;
        Fri, 13 Nov 2026 08:18:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:56 -0800 (PST)
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
Subject: [PATCH v1 09/10] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Fri, 13 Nov 2026 18:18:18 +0200
Message-ID: <20261113161819.36847-10-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

