Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C0429CB35
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085368; cv=none; b=FBgYJ9a2Y0OV3o/heFYTqR80jOmAiclQD7+mUfM2FX4Uc+CkMcnUS+mpcme9mttjETOfciflF3vMKYCAghxn2xiskAvVf07WqBl9kPQZIA6BSYbpKUW879NcWOLesVU9UHDsTT7DxB8MgKeDZY3VH/+WwMGbXFqhQH7mhY3og8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085368; c=relaxed/simple;
	bh=6/hWs9iUt5Ui+lx+1OO9Uvb8OroHkgOYmK/XVAYbSHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bG+8jNYP7zcZRWIdUa84SIJo3j7R7pmaPX/OWxBduyv5bddRFOy4d9FM4U1KB2/N+2QxNJDHgFhZi+DENdozZrZnLzNcrUfEVBbRnobdg2aEiVD/M9ifoyUsgXbPBBMP/wypwHSeObcov2yJ6mt98j7ehOLujFklnOOVRP7tM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVRy5g90; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVRy5g90"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb5ec407b1so858388066b.1
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085365; x=1747690165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wj/D5H6Qe+Mu8ENnwOehkOgYhIq8MIIeAM0Q4Nh29A=;
        b=BVRy5g90+F7ZUHJsXjPg1Jpfu+drHMXGwSaJK7T4TolTr0/Kn11dwO17YguS3r4m8f
         +PtkSyqDTcxfN2is25CoIKF2lrSHuHLa/LzT6fXOzzL3Jiuws6uAKjTn5Ywq+T/Fs40A
         6xd26wObAzfOD5hvlOpNoNecVBXDAWhHSaFJwEtDkpFuvtxmIipwA3Ixu1o8eHNMBVMp
         RpwAXr45ObIiWd2GOzTf5xbJFHH+WaKosl+4RUeoMeO0Ja24ASP+XW2ejoPnWX7rhg5u
         nFai4Kt8S8BIdpuhtU4Oodmk3SnR8qVcy4WVQ+B0mywZIgZvNmBGKUMY4JEavTbJ3g8U
         zlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085365; x=1747690165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wj/D5H6Qe+Mu8ENnwOehkOgYhIq8MIIeAM0Q4Nh29A=;
        b=bWw0c0Jfv1aAA2tPEm4yuba+zAeDVVJa5FxZ5vH4esgv2PatohM7mvkLsvADvDRzIO
         xaETlYY31s7GtmtZ0SV7JrbsMKf1boi1mwu1xq2fzBvYPdWPTa6uxSHyxLL5dTnRP2PW
         EA/2llBNN7R8N222Yci0LQbwEQzKDFL3m20WsC8Jj57j9/xCoOAtHtD9tNlpw2+ex9rv
         h43eTLZbplgpoN9hY6qDQnyf+UNlBt5V27IT148ukApVGEKO+TRe79rnUBo9fbaB1Tu7
         CWZSDvOIXNNLQeRYZjz07ouzXsYPNh3nftPpqmYpYLEfYSqSsl5FFvitPpr8Mxku+Zu2
         r1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqu3vWc06gOmtf4BvneWfpNs/jZA/cXoWjphCkIpr6WgKweedNHe9SRoFhMF/Jpo8g1UvFir/VeNFsajjn@lists.linux.dev
X-Gm-Message-State: AOJu0YwVvjoBqy8K7nDuSmzox5lIV1RJXoVoGznJviGruFCXocHFGQrW
	Nf1KoZYh+XyPrUSxUJ7fhyi32HVP6rZuZ596q6NJHZSRm+o1e1ZM
X-Gm-Gg: ASbGncs1rrzgpEn5oMwgVayMtQom3W6NwlPNItxU++dCdG8oJ62PcpjlKJZOp65v50a
	3RV93gbe+m4hPC5gm2NWpQ4fawgQHr6yFKqY4VQ/xJ28RjC9p/UowL10DWPr9Y2smPdtAPRH3ow
	Q6796ADXxZ7xFwuHgPGKieU/nrqPWKIWdmMotBaHtmcZhl4j2boKzSVkeG7f+98ZNFNv8AzznlN
	i79sNdHEpJXjAPfl4ktEvnKhiatNOIH7xFo0Bpt2RcLOWPb0bq0RQ5A96RzNaut37R1y1PXjlfm
	xSpZ5yEH+8xBJ3GX8fhijjFNt95Iv/FrH3wO/UbRCmMSwMmRTx+9FYkUmzr8M0Y=
X-Google-Smtp-Source: AGHT+IF9mrznUIGYs+0D303n81wrWCXoOyXY7upv/Aad3B9G+edHBUuhmp9z4B5iKaMEI6AxjGibgg==
X-Received: by 2002:a17:907:3f29:b0:ad2:50ef:4925 with SMTP id a640c23a62f3a-ad250ef495cmr634015066b.25.1747085364606;
        Mon, 12 May 2025 14:29:24 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:24 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 13/19] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Tue, 13 May 2025 00:28:22 +0300
Message-ID: <20250512212832.3674722-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c572..1c97624833eb 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.49.0

