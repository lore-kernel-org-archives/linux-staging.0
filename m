Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB0215042
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458902; cv=none; b=Qs0m3RjAHB6y6lsbguGtfSZeQzYH8xcVCVlUKglhdqAJAkp0v1ieaVvTaTCadaU98mggzIYqioafVywlXRsR0u3lXxLsKqq0lnwgTKJScmEK6GU2uKxoRaVXvof9racIYX2zk+OLtPYURetaz0WQqdqI4Va/VLxrWiGPVXPYWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458902; c=relaxed/simple;
	bh=IbJ825DoJSnWvL66nJwG6v88Bdb2MBA2bKmwG3S/oCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtVY/6/sNrE5OyMtFllog1UkpQjKFfnNNaz1/7Ei2QGmXoQoC2RePDxHKeE5B36/iPSF1DAz32sDFIidUcD9769MdDjZz4TGodFsxjxo23b8P3GgBrr2fkS/qohYG2rMoG/YV7xR0fB9DC6C1llNdWteHR6tw0cW0VMQycHdFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkpHvRW6; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkpHvRW6"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaedd529ba1so361110566b.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458899; x=1742063699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAQhDQpxTrgqUBQBlshc++aOCj5PQ0JybfWXWmVqz2c=;
        b=dkpHvRW6IdYJ9kSAJj6zOycb4e3+u5WD9YZRhMKiB2bWyy6q3bTJLFg1wy61FAdRb+
         7Jm5BL2lITxex4Sv51eBhLyW68EqQCLtmZQNdIkJ/1cKCFbugAszwU8Itg/eqaCHKOD7
         I+BIu0nDNscEDj7nywCtd5/vqD+O5L9rfCGH5ZmvNyOn2Q11N2VIyZvbPatbtF9Xfn2c
         /e1Tl85W2IkP/jLtS0od0pql+Gw/JVUW0AsaKj/9pZuYDG21ZeIhola994nZ6vcQPMns
         80QtIBWZoQ7ghv6qrBUMycfPldSxv0/SYZK/1IrZ1K5BoFJuybuFKgzWmd2bJEY0Uxz9
         L40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458899; x=1742063699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAQhDQpxTrgqUBQBlshc++aOCj5PQ0JybfWXWmVqz2c=;
        b=DRekHPNhlhOodEL3X3G4tCmA2lllcns06LeOXih1ZxbQ7y7OyrLWCRSi6OaK3sca5I
         GNccPckbM6EVdCtf4SrnyIChW7GqUaKjRz4NVGSoMPhX9Jn/EOPMXS/SNJ5pJgHWnQG0
         KQqQAWonP19VgtkKuML4LuEMMF/tbf9vazzPT3wDjV0olmKmLZbnAgqdciN2Ld6uJLbn
         nEDmU2FIH7kEerxKEtmWmkFE0cOZ5u48B0DKOhGgmh/Zakj+e6BvQGHM/zNxYbkM1wzE
         VFpFegHq1LnpvQfMCMpQKIVKGo92oqOydtIq1S0CaWyt4joyIEmMxkgEUxHRle18ll6g
         9FYw==
X-Forwarded-Encrypted: i=1; AJvYcCWYr5/4VOxypTBry9YHoJvnxvh9/XPg98+u9DTzBPkTjDyKgNvsP3fcwFew00birDtBlHgjoLByJl4MBLFS@lists.linux.dev
X-Gm-Message-State: AOJu0YykgWYcMEXzdfGN3u5x1K6mA/q6Pu90I2uAk0PgN2IgRqxPO+/Q
	c48Hw7+dhDBbJhh/+rXPFNAATRm44XSuJIyviZ9HKkUngWO6pCYH
X-Gm-Gg: ASbGncsXb9XxzK5MPjAI+4mkuWckQRUCvxFQNn8Y0Rq5ryim4u62H3ldoqtOfEzbSeJ
	ooMaJdIECSfpaxMwkBp2qT9yDcplb14YwWBAZQzJNW7iNW/aTiVQA1Gxn9hKiiQjVUi/cam2CMS
	XFCKOLPb9uZaV/ABL91AjhkpmFDkLV+1IQEJhkj++sxYpluPckpQ/ogYyuMikkKlJYBZx9t7O0v
	biT8cRK684R1RadMj3HwMDl5NdX7jSccL6SYibt/QucUrcyskg5EFUIiH+O9VSIc/iJ0bjryFm2
	f5EeG0tHCTipTPrZqDIi7NUMKQANrhappkOSwH/J+7ZZCPdruN89GndDDQ==
X-Google-Smtp-Source: AGHT+IH2YosUhqi+STAQ/nY4ti7PQvH7nJrNeEszlj7Q84z3kvlLkPrCo3BZtLhHfeHuHBAcm4ROyg==
X-Received: by 2002:a05:6402:4617:b0:5e6:17d7:9a32 with SMTP id 4fb4d7f45d1cf-5e617d7bb68mr11479433a12.18.1741458899040;
        Sat, 08 Mar 2025 10:34:59 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:58 -0800 (PST)
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
Subject: [RFC PATCH 08/24] dt-bindings: media: i2c: max96714: reflow text
Date: Sat,  8 Mar 2025 20:33:37 +0200
Message-ID: <20250308183410.3013996-9-demonsingur@gmail.com>
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

This text is using weird line lengths. Fix it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml        | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 44667b74296c..2f453189338f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -12,14 +12,13 @@ maintainers:
   - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
-  The MAX96714 deserializer converts GMSL2 serial inputs into MIPI
-  CSI-2 D-PHY formatted output. The device allows the GMSL2 link to
-  simultaneously transmit bidirectional control-channel data while forward
-  video transmissions are in progress. The MAX96714 can connect to one
-  remotely located serializer using industry-standard coax or STP
-  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
-  the MAX96714 can select individual video stream, while the tunnel mode forward all
-  the MIPI data received by the serializer.
+  The MAX96714 deserializer converts GMSL2 serial inputs into MIPI CSI-2 D-PHY
+  formatted output. The device allows the GMSL2 link to simultaneously transmit
+  bidirectional control-channel data while forward video transmissions are in
+  progress. The MAX96714 can connect to one remotely located serializer using
+  industry-standard coax or STP interconnects. The device cans operate in pixel
+  or tunnel mode. In pixel mode the MAX96714 can select individual video stream,
+  while the tunnel mode forward all the MIPI data received by the serializer.
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-- 
2.48.1

