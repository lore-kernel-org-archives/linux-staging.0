Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37DA211A36
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458890; cv=none; b=gXLwrToWS7R771GozeN9wW9aLFth/u6X5d1NMCJk78NFdaAajhLHG35ZMdzv6xD7CFvmO+mFUTI4ZOL9Q+ATzQa8/s6+e6e8Fyk/CLIscmqJTrjSZEPV6pO+PI0AVY1aLqlMN279f5dMvCAfIZExTlHOhkg2FaSK61ISoIUnKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458890; c=relaxed/simple;
	bh=5BmJ708+8yLNhEiLFxS9ZrT1GPmVWS8r+iO9v8SdOuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKxWhc3G3fIG7NnpDfrGWrwnvMTyoxLXZ5bIyzjG1YWjPm8q/zw/QrIp85j4iH+D2m4BKKaIDza2hQqznbKO5hIQti+8Fgns6R69TPgj8rDnc4z+HQP7uJXoRDygZiFiqQ0BrBqPBVLtPLyeu8yWE21sbBNVhVUyqMjw/hoH8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzA0mcIA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzA0mcIA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e64700a38cso369094a12.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458887; x=1742063687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niTukLIvAiAEZdTX9VzP25J+OMwBy7xtkz5/2stDFtA=;
        b=AzA0mcIARDl0O3UmIW6+/wIyZiUTpMotwiLBGeKH025N71r1U5pSOr57dC40wSHU1O
         urowxA4WFb+BO+JA6dEiRKJPyiXWQMpvig5cKCa0YdtYGPDFShWlLuJrreBOy94alO48
         C6ImbxeOIOsL4B3PCNmUEjY4RmEigOt+7jDsfrJS8yR6BNPtP7sRHUvtwDzSWdu6aSs8
         UbqJavVej0J9WpQyVd31ui3PMsAWuq7Yyywo02nD1a57I7WKuB1PfTWnRZa+QpnActED
         vrLoXoZULvKCD+vNBeFKlnHopjq8abfwkaxxw5v/X/WUcNfMlsTsaGNHbcJHz80/GNWb
         xabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458887; x=1742063687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niTukLIvAiAEZdTX9VzP25J+OMwBy7xtkz5/2stDFtA=;
        b=ru7LS1KOQ8PTKHQJsbp6OKvKbwwECVUDkq1hY+j06Iv14SSF06ShUkcvImG9moS+98
         N0OBNgXPlU0qr0YziA2/8CsHCL0Nns2POr82eZn64XrZ8CYsFU6rqpfbcMOuTZ+fDOh4
         MNpHZ0Yhvgs6mhZADGk/s/vyscE8atWKnzfvJ7axFGtDUvgyFOXlU/iy045/vxmQDdUa
         YZ8j3ZAhz//JX6ZJiKl97EYWYqh5FOYhtrz3qqV0RQlpyew9rBnaT5ldWpJR+GTw85UB
         grcwMoeLQ0waHK8FggNb0GL2yABahWVxStcn7PBHjo/E4DrSS6s6G46GPLAt0BE5tzDM
         saHA==
X-Forwarded-Encrypted: i=1; AJvYcCUhJRzpKBDXglCrUdex8wQyuJ/8ZiU3oJVphK2RBPY/nTMvKNB9mP6ZvW/olcrpji7hE+MswK18Z4/m8fKR@lists.linux.dev
X-Gm-Message-State: AOJu0YwcODROBvvxEXMoXLZcDXPF2oQQ5QoKWnuGcXfhJ2BSYVMFTwPw
	p2TVzL/rNw6Bi0rKSDpyc3HzYkfGtY9BfkxLkv/0vwNjWuCOLL1f
X-Gm-Gg: ASbGncuSGAH70BKge0NZx9iA21jj10L3Fz7Af+KD5p6by+6oJMkRCq/5YrFPYyBWNfW
	h9VVqRl5sNXZFnAFU2eHF11kHnm32ODaHRhYJheCxe5CIvI91DmM8l5qAdC5xHydt2bPS0rMTq/
	xsVtJEOgn/Gpw2tEvo4GuZPf2XaJa9sA+28hIakPWhLM14FI1KxrN94Sp6shzALLtPI0K28kDis
	rGA2EsKSdp5B0XFY9bXR0BR+8brjA/dtM5HTW6btXGuhUyrzfRvZTkosdoPW83OL7A9BaE2Ck0d
	Wh/OXE7paowYlalU76wovfuLhY3REex5a03Zu5hloANAb5kNRvFY90i4lQ==
X-Google-Smtp-Source: AGHT+IEYfnZZSKKwlnhzVkFTovCEetnxmc3aAYiYEW+59CxQQ6vlMjKTl8zXdIYjCmymG9n4u7FXQg==
X-Received: by 2002:a17:906:f59c:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac252a9e5demr952699666b.15.1741458887103;
        Sat, 08 Mar 2025 10:34:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:46 -0800 (PST)
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
Subject: [RFC PATCH 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Sat,  8 Mar 2025 20:33:34 +0200
Message-ID: <20250308183410.3013996-6-demonsingur@gmail.com>
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 20114c252e01..1e5b85167d0e 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -24,11 +24,14 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
+  MAX9295A only supports pixel mode.
 
 properties:
   compatible:
     oneOf:
+      - const: maxim,max9295a
       - const: maxim,max96717f
       - items:
           - enum:
-- 
2.48.1

