Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA521F5855
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458962; cv=none; b=GvjBEaPjrveqh07gxmSt6NvE3HbGBNYOHRpoUvvgghPwWk0YGB8JeuUaesb7uT6b2GEe1JDd7gSmDffE78Z7AvOTHD9RnYli7iS+MTQQBVyoCBfKrZwJtMxku7sILD4a8SUaQU9TNDmReZvDcu1hZNnjD1mFVng3xvLgHPc+SP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458962; c=relaxed/simple;
	bh=9o7dWxkAzzvkB2Imojs5J6AXrsEiMQLNW5n5ACM0GTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5JC6IkZIKhaVpruFmLxmsbzy3umHmjhtlzWHFwFFimpBIlfL9ULIu2Ik8Mi6iaoNY4cEoJruOy+jPEyAYn5ovDC88w69MkQIGY8x/P/g3c12/wEcrN00rTxFD2XQ5OFK1umuin2rqcM9RU1p7/+KzF6cv3ewg9Ee0C6ZENzinc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKaElURW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKaElURW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac1f5157c90so485819866b.0
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458959; x=1742063759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=WKaElURWf73dFz4/y6iosj9b+Tp3hVhhdQggEGkVHavY2qqqGNqp/sIkfM5Vs5hWeD
         6K0DGO+BhMvsH2efamFzgaeR0a5mpOBbhxKQqMTBP766ScuFT6pKkk++kIpnDWWdjpcz
         RqaB1Ae0k8dGzNNoFZ6QBXo8UBLsRf6pN4mF6QS6f9YLMUIRLQjyKIfAhyuV5zWg4SFl
         gmboSD/AywQaDHDuyjdLIcNchzWbB2S3Od1wwUf8F3hQ7RG8GLdHBpEfVyYN5HdLmksL
         VPorioM/XaTF2HOU5G+6a3wwfQTir3CKiTpy5elGTh3dvPuBp+Pjs5OLF/0i+3uQp67o
         XkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458959; x=1742063759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=jwxVPUPvBiPmC1K5reMP1ZZiKpsb6/pqTuk/Sq06yAb8giAgpfJXyQyPbPFKbocF9v
         b9snLaxz0QbBJEmR48cZnH4FifdZEQkkgEt4II970/DWOo4G56N6jNerOXaSm5Zh9ZxH
         2Sc73c9zvmSS5aCsDiSdI4NYm8lfSfBvfUf2qiSfTErxHhVi+06lDA9Zh0PrNjgZtZca
         GOFHwOcrlyspl8cy0EwJiqWGQ862Sjl26WGJT8vIzDbDuNQu3R9iz/4fBVASy77Be832
         l23FGOqW8FCTMzf5DQJN9GNKxBribF3NEtLtgUpUHuql0dq0HHIXCGlsASA/ZuRXLAHe
         xqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW09DTIeAyTRsPYCS+dPvGUakOTJ7/ysb2eiGnNxDNcAPWCOyFbzPadmqNLnesLAAEi7Dma+QRwONvtJH43@lists.linux.dev
X-Gm-Message-State: AOJu0YyPkY5hVLJUySTzO5AwFGDp46AACNvvjN6MY69V3cJxNFprS3ja
	Au4fkPgTIIDp5J92KJs1s9dYr8OpLd50ksf/c9NPcsevPw1NAuxw
X-Gm-Gg: ASbGncsOjXxmgsrIjfoBshPeZc17escFW+wSubJj+yYHVBkvhY8/bwpxrF8K/31iihK
	hTiIY49Z2wZ+6FByXrFHBVVo3tEV05PtoR9IQx2ELjQFL9np2ID0NmlbM0CtuyxAV2gkvNSbyhu
	wUnmWyLHuJh0/2YsTT7Im5MfHD5VB2pCYvq/zXmAmvX8TsVj0Eym2tAHET/KTV556ZtDSyQiI1B
	EV3u7swHlWuSoZTJ9JTyE4cZIbLqm5Gvye64jzPjLjbevAY6zDjIkkQORAuHd/VGZ0VE9Sh9/r3
	ylfh8jDJHhVITnypvgtaz0I+Eqo9xPPdo9UfKtDdaBTK7PlLM7SALLyQZA==
X-Google-Smtp-Source: AGHT+IFeTY6f+Z5x+qQcdIB8S71nVbnmrDN479LQd6qexMksrmnIptmPnmurHuelrlJDcIOha3YkMA==
X-Received: by 2002:a17:907:2cc4:b0:abf:5fe7:40db with SMTP id a640c23a62f3a-ac252b5a1fdmr879505766b.31.1741458958420;
        Sat, 08 Mar 2025 10:35:58 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:58 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Sat,  8 Mar 2025 20:33:50 +0200
Message-ID: <20250308183410.3013996-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.48.1

