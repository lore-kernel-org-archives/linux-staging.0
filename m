Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC54215F7A
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458920; cv=none; b=RXvjnPSQndi0aj3MkzN68Wz6XDP9O5B171P+m8s+GBS6NPv77+QOCYEj/4aLJW0WOi36zuXBoLWlpC4eCTYiLrX4YD4fDUQtqcWPkk01tM4593ry5xBRLpRbZB63xUpmZu/3u1PbrupEUKUqk6Tgs6JJgafqIuYsHrRr+Ck0iL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458920; c=relaxed/simple;
	bh=8ZE9rC+k0ylA9+L3TmlcZKYr0Wjz0Tht4eUfO+AkCjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtgw8ooaBbz9LxDc3a8QmoeNyBPPK0FCrTany4AHGWRSQTN48dotih+5jtFzqAsHP5lbvdFBRTsbPrmdyXn17kLuPQopoPBDISCP+lsaFjji9v1s2cw87laibCjJ3XVoIkDVmHRWIMVTSzcfXktgtCztfBllCHNXizqKOXLYHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyuHokFJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyuHokFJ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab78e6edb99so447388766b.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458917; x=1742063717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH0nLPR7+Nln01PT5ZZw1hoLmM980Fwy2kz6sbBJysY=;
        b=ZyuHokFJ1d/wJTvfTseQsqAVBXzpMc8mv5E7DwoBFDJFOuUZ8SOb9ThWPd10FgCdl0
         YvYs5iN2xjfXitn/E+JSxQHG3QoeKIfbU93rxLSZD4WB0WyQEkA5vJRfM7h5iKCJSU7Y
         HUgHNbD7aQJNljg77ko/rwLoigxttUKkdQalzfy0eTSJuMMaf81HdmpftJf1L1miGCzx
         Y8ofG2Nuqdu8RaC7myOvZkfkXtJaQsp5g1tI2cjqILWFR7NJkdoDCOq2SrXzTFqj38eg
         OEtfHgkOGDWLHTsMxK5t9nRqICuRzXGXqOWYCZiqr0ty+3CDzEkm8kghMXUU/chcOC8k
         RRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458917; x=1742063717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH0nLPR7+Nln01PT5ZZw1hoLmM980Fwy2kz6sbBJysY=;
        b=Xp0jq/4sN3iSmo7nwceXKHbpRUITDE2Vot4/23lFzLfeOLKgEJOzzu2kzFsPFBspBc
         WWTv4q43u1utOAF6JC7XkSTaB2THk+vDDMt2Foa3cKo7mqQwp+ia7OLrgPbeWPm76pdG
         mIP+z6FmH7GxW9mleN78e6KXuSf/qVWiQ6LOl58x5vDxVVH2j2j5kCHxqTDJbw1/fK3j
         DthfmCFLzqdlGnwwrph/MpDtPeanWdL9tUOAtWTrBtBgQ8HIY8x0WTWBwN7s8Nb1a516
         O2/LZu+Kw+7cFgtTL5s55Umzyn9J5b+pVTpqZBhcjhL0cfKidcKXtBoYswUqj7vs/REo
         +PzA==
X-Forwarded-Encrypted: i=1; AJvYcCVYMb726YwaONUc0KReVOobg5TXh3PqX5acWkJ+eg9Fg5hsWtjvgaKXNQFOy7xa8lI2EL4sXN8ks2tahaka@lists.linux.dev
X-Gm-Message-State: AOJu0YwHTxmZ8rnqJIAJxlV3G6M/dTW2eCDTGV3fRv3+22tlNyHoknyK
	nfb/fdd0YnVyKs8xSGbnS6ZmjiyO2OzY4CwV4II6ZDWsfYWVcVrc
X-Gm-Gg: ASbGncs/+aZSeNIO7J1Z0hPuiO/rYzqwol0tLO+I2UIUQ54GhvMJ/yltgI/OucRfuAD
	rYOVNqtSUzRSjzinGET91fEocGCaxr09Uc3xLKj/aSVgesa8gDP4U6HiSjaSslCT1ibgVs/3PrR
	67TIkboJ230oyW2OsxufFoKiOZpejoGH7mo3NeLXvIXSaKk/tT7BJIeXdEz+5VNRdGTjPghR1dE
	fJUsG4fLVCUNr9dQzXV09QWKAL7Ir4EWA+MZbGqEt6Xd9JJS8mSxs4Dj9a5QSORKdqFtNLJQs8o
	k+KERc5LQqZT8knoFc/TBadAtn6ev58ReynHsuuH3XACh1GcWtjGMGWPHqhio8YAbOoh
X-Google-Smtp-Source: AGHT+IFxa4QmBw7Ig6TbMkCdhDiwKrrIoEA173KNNedZZ1zvVFLBlc4GfcP9AWrjoYPa9kZijnAFSw==
X-Received: by 2002:a17:907:15d4:b0:ac1:fb27:d3b7 with SMTP id a640c23a62f3a-ac2527048a6mr603962566b.21.1741458917335;
        Sat, 08 Mar 2025 10:35:17 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:16 -0800 (PST)
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
Subject: [RFC PATCH 13/24] dt-bindings: media: i2c: max96714: add support for MAX96716A
Date: Sat,  8 Mar 2025 20:33:42 +0200
Message-ID: <20250308183410.3013996-14-demonsingur@gmail.com>
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

MAX96716A is a newer variant of the MAX9296A which supports both pixel
and tunnel mode.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 9c6c79a770ed..d4055ecf673f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -25,12 +25,14 @@ description:
 
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9296A only supports pixel mode, and has two GMSL2 links.
+  MAX96716A supports both tunnel and pixel mode, and has two GMSL2 links.
 
 properties:
   compatible:
     oneOf:
       - const: maxim,max9296a
       - const: maxim,max96714f
+      - const: maxim,max96716a
       - items:
           - enum:
               - maxim,max96714
@@ -136,12 +138,31 @@ allOf:
                     min: 0
                     max: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: maxim,max96716a
+    then:
+      properties:
+        i2c-mux:
+          $ref: /schemas/i2c/i2c-mux.yaml#
+          patternProperties:
+            '^i2c@[0-1]$':
+              $ref: /schemas/i2c/i2c-controller.yaml#
+              properties:
+                reg:
+                  items:
+                    min: 0
+                    max: 1
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - maxim,max9296a
+              - maxim,max96716a
     then:
       properties:
         port0-poc-supply:
-- 
2.48.1

