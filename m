Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146241AE863
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510128; cv=none; b=J3c3UcfS8G4ENeDNIc8/Nq07TTOxzy3b7Jpnal8g5iAsBxvRAprZAN1xx56zh03CiH2Ib1cwpDeAUu4HDUuLh+D8K7MrIm/Ye0+cdFFO9wsR8FiR9HTt+lzNkhXbBsWa7lhXNcsrg6cKtxrNnfFNluiN7efo/qJCiYFAB7r+4uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510128; c=relaxed/simple;
	bh=dJ9ClzDi2quDwJUM9XQEVfvXpVITJrJZC+B9arryLKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9B6UappUzxg5rUNHKf9iJbevHcIktPoKb3RNNvUfjvHJ4Rx5lQp8UwrnKWkApevvPo68SjogA2S2xymnHgblX7+YhZbdv0wt20srlVcsFou2ptyZg6MO5WzJlLJs1VjF+W0ifCWRXU6sqHS7Hvje90fMwSJqIXibJl1BHwEQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQcDb0+b; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQcDb0+b"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac297cbe017so23467266b.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510125; x=1742114925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgEysl13OPBv6BFUaZyKQ7UjemHKnyK7wK7vWTFZ5dA=;
        b=YQcDb0+bfzfGUh9xFjHZlqRnJ+Jj0QO110Alf3cDkHVrqi2p/1Xfv3XEUqZXqwPezC
         N8SB/Hm+qmjmUjwhmWp9bPiafxotbX0RXz6mV514lqbmqCKzuIf6kmCHbepmqFTa9b0v
         AeN/gfLclxuVcoOmPnOxhrr0SuwNgVVzyPlwq4ep+GCUbMWut2N0v6jlu852GegtPUdR
         /i7rBxMZikwubyma7RBcpSeXG4YDsemj23pQ1G18v9Yte7VXsRAdgoC4aZ6NUAJ+5cbt
         O26kxzG7bcsfJDPFbYXRtdjSGr7Hc2c+7cLcVFem1kw6B+wYPfgqj86eHVJHfKAFfraJ
         2OeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510125; x=1742114925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgEysl13OPBv6BFUaZyKQ7UjemHKnyK7wK7vWTFZ5dA=;
        b=sdkmhUDlhcMDPwEqHbuxd1Y4E18u+i8aRNT9HXkeJy+eA0Jt9R+1q2nfssMVR43Vp4
         S74lXKdrTzyPcG9S1yQuoZnc2phjXv1NbsMNWljR2+BWYydqCIxWc3V5K9wNFT/MRnMv
         CIJp3K8WU3W4d6Xi776IkHv33FggMo/2PmX1dtcaE6rwh+Pjurm6rn2Z2aKXGswGnqVx
         s76MI+7I6sKw2J1MtS/OKfZvBUKXH5dYY6nf4H5nN7MPlm5iKWLbkeskiOmYCBaYAaAq
         oG5PJ7l9UobLgnnfiM4kHILqW6wxbsnltMl8LbotuBTporieajc//eyc1W36p+owp4Vj
         ENcg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Z9D+Da7h/9Rt2Ugmg0UkJR9+OYXXO+228C4JH0PnEJFjsIYxHGku7nm2LOPrnRtuxmRSdCSfLTFIBvFV@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4C3eMh797xfqFBT6RA4qfztbUUrFpOHWJfnt0Y2DVg9EFqDqT
	k3BCStxTajRljyp5CuKlM6xSIrBpfH1p5dwF4rX9dEm4rfZZpgME
X-Gm-Gg: ASbGncvKfh86Y3arHkSF+olc+HxOeNIhBDSoLIu/J/u+qWMjLMD27316UFp2VGxp6OF
	AyppRTTTqBdpcbkvkTwuNIXauFUVpWaebiZC3QrXFqDejenjbP6gtseqCOSsFsH9fAUjaiXkOV1
	dYM5+4XiLcFdJLkhxkyEm2R7jFOzbdaarTLICZY4NqRTd+VgFkAVB6fMea/Z0/fY1eIhs7MDgYH
	Fn2RLGTzO4CnA+AzaQKD2WSBls1TsJrlaRBxdS1e4NZ9iifYPNGrg5D/ik9ivmu/DRIEiFhdGfd
	7mpFoEaVOcih18CgOd92U6n2csU7165AQUcC0vjSFy74aCyEozWn7IYNxA==
X-Google-Smtp-Source: AGHT+IHJpkt6LaAM5QKyrUuU+iBRJp7mmLxht9TMjFEsX0Ab2stz5/9LcnbbS6wVDa34wHlHd/EPJg==
X-Received: by 2002:a17:907:7f23:b0:ac1:da09:5d3e with SMTP id a640c23a62f3a-ac26ca45477mr637973666b.12.1741510123537;
        Sun, 09 Mar 2025 00:48:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:43 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 06/16] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Sun,  9 Mar 2025 10:47:58 +0200
Message-ID: <20250309084814.3114794-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
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
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 31fb62debdc7..02857f0364c4 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -27,6 +27,7 @@ description:
 
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9295A only supports pixel mode.
+  MAX96793 also supports GMSL3 mode.
 
 properties:
   compatible:
@@ -36,6 +37,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.48.1

