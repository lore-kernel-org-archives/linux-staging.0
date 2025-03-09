Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3F1AF0BD
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510123; cv=none; b=MF+DNaeGRHwPKHeNSIv/x1ypOKBZu6RyRDRPd12qTBoo/6XE1kcTzSIOmtgKXJnNiHK6MUpqXQ+RLO+lo4h3R8iWeG2uuU4Mlsd8NGLhQvtHBjGALCbknqd+eCtzqm5SspUUG6J9MD6ThqlUMWF4q0yxek7p61aOLqc2JkEzyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510123; c=relaxed/simple;
	bh=ANWQWoRfpwfrNfunB2uoB5OyyjdD2i2V6N7Y100R4W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSRMIMBqMb9AGHfpgmZGQnY0RKXZ24pkRYrXyEC1cgtm2eVACgrFK7WvSe87lzW8XhGnCMTnqi5uOTtDSYwrlpCRy9Dozf/lWe0zcjQYPU4BwwI+oK0KZod2kPKWsMm4amFjSPE9OpkRgeXl4LaW8Prw0uUorGG1f4zGzt2gU1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBnaovIO; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBnaovIO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so470404566b.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510120; x=1742114920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77ZQnV/idoKQSJwHe+JyKu0EB24gfw5+CVNFL3AarEo=;
        b=lBnaovIOsec6FdvEKopfxrYZoaheY5pBsrMsVvuuhDZUS9taHODxY7REkfZ8LqhyTi
         Tsk0ysZFxJbfYgb/O88c2uZBj7H2kqAlSOiJATTJkQvPvubGF08A2y3WDUh4fAqKM55n
         q0vNOXFrfMz9h8QFqNIvVlRmJr85HwiRe3l7r/7D/KrhXlEg3dfoK5rKhl0iwNFdg9bq
         NL1dbQ86Zd8Axx8BcFjgihraRUPCA32CWwYuge4l01KuR/skuBfNp/mpntETByoMn0s4
         Fh8FUU0bZQGI/xYjdqai+NkN9AkI+YeF7jogcrIGIndT7v/Fk6wXM59bQZJWofR25vTk
         /OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510120; x=1742114920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77ZQnV/idoKQSJwHe+JyKu0EB24gfw5+CVNFL3AarEo=;
        b=lDbApwe67+Rc8rzRTSUNyErFmQAHqQxmQDXXQAvyAYBOawkVPciJRcIz1Ntm6xL3Ri
         EdKQhi4xOMsY0goysE1Vt16gbgG9BlBaJRmr83GbBhBNeo9pQz3DRy0/mBI0HwT8Px1z
         85Rj4d3H092FmybLL2Tu9whCwg8mctWjJD+Ct/5tk7wXBJ5BGki+lnObRXs/Tcqaj2dk
         kwNZG7pARw6LMm+ngu7JWsOvOFDzMzabVS82MW7ZTGUuVbPRUU8QoSrdpV9n8CAlIrGK
         sfVS6kmwwmmrDFBsLknGgpzlUNpL02JuLPjnEyypPjT5uDM6+cdfd9cW1h13UuXVIp6i
         BS3w==
X-Forwarded-Encrypted: i=1; AJvYcCXDXxut7wYHxUMPjUwdy249R95tlTrVy1G2tkG/mIJcchEIxKPysKWQrKE5kP2K93boPT6TcDeRB0NRnufJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwfRfbTHAk50ZD8rRkToLASb6nEN1Gv2pADzHIXxDCMiqdG5a1B
	8QNFEMYgK3GM+FnUcvCEp373DRO22othPSM10z+EcZdWadf6WNNB
X-Gm-Gg: ASbGncu/p3WQVSZg0QvMOAxXiQrEc1KZMZv0x5L0bMLcffi1BX+p+KeaJZMlJVE0Zf+
	qny+wEm8/EpEfSIpuAv2vmVXmetfgCNLaV/HW9wb8DK7CYsKc9/YtcKS4ObIFXJNn9Ht9OZE+00
	R5vBEtKLb7yThxqtONexlYMH5wq8LH4j7W9qwwxqqV5oLvCpDg+Z9YMQt30mUmq+qf7HfSbfWvF
	VWjJleqKom3a4+hB9ZpyM4O/2DZUIF7+uJmPPmlKU6IknWsbdU/eb/4Emby9BYP9iOaKkhW4BXB
	+xa2vAkbvWf/XGvY01Yt2W47Yz/oCSwvn27U4mtKnhwedgczmzgMDGnsUax+wamlr06g
X-Google-Smtp-Source: AGHT+IG0K1+lHlFBOdHDt8tr0ZKEi9pxD/wAXNM/pWihzP5DjPiNDmSdaUAc5wV4ZJZ+UdarW2Vo1Q==
X-Received: by 2002:a05:6402:35c7:b0:5e5:c010:e67e with SMTP id 4fb4d7f45d1cf-5e5e24bd6bemr20287512a12.31.1741510119914;
        Sun, 09 Mar 2025 00:48:39 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:38 -0800 (PST)
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
Subject: [RFC PATCH v2 05/16] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Sun,  9 Mar 2025 10:47:57 +0200
Message-ID: <20250309084814.3114794-6-demonsingur@gmail.com>
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 0a43582168a8..31fb62debdc7 100644
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

