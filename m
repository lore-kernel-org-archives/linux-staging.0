Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F6C2E1C7A
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852340; cv=none; b=J41dNfJ2XuaoRv672iGAnaXZVdw2hREIhdbFKSxYYM1diYSjkw3Nr/H09uUz064bBA27f8ZZOF/nUbIgzeWwbG2B4ZgOJP8mE7Yup+LijMYfiz/T1jxvYv7wfJtC84ECy+/uIjllxl8l6FdqH7ffR6OaZw5RO9jn/kpoJGB8sAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852340; c=relaxed/simple;
	bh=P//8vOwQWbcKu1kVR/H3otGF8zqkQSkNHGIA2UNKsxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYv9+pzrzd13Jd55I1MORMmohV6baExm93jp0Bd9Kgs76qGf3HdzbHlDgVQINU8MG3kymnIkgjYlnXMTKtdaLsDEzt1uOtKjg9Sn2miRMigNy7O+8iCHw/V2xx7EWawQRQ411HtBb2fZ7Y2XeTRe1bCkuHVRDuOeaq/fhthBmWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJFMkCPY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJFMkCPY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a51481a598so1159995f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852338; x=1753457138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=hJFMkCPY448pyn1E+BMb6MXN1K7JoOeVrhP6drYQNvLU1TYnitaxJv4OWzkM9Avk2K
         zI/xju+1Sts0PEXYLNu2Qkhg8kDmaH1XeqTu4tRBLF5X2DkSSa1knojri5NW1sGGZ5NI
         4cHMrUMQbonZ4pvspx0prKSj6U/q2tzkmVFLvWu+flnM7TwVdOYr7rVpcTQU7HCQnRF1
         3ENEfbtpk8FLQY6I4i+TwfjMnkSUq8c0MJv37lMQ3YzGgy46cupUndhZl/+NDMDAXXsq
         PkGK2PaBXA25MaHmTYHOoEJUXULjkjufC3Ynx5j7+ATIQBzuIy6gxfIZxLDgjNFgu0jH
         PXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852338; x=1753457138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=Q1cflCMKpAUW3tr6aHA0PDjGyU7AF118+Ght6Cx02/PyDkDSE5busuT2hdXLl7gUud
         3gDV3y21xY9N7OPNN2MC1/NKSNXGuVuFrLe5TDaIe7VigS3TD+yN1xVGrgQFTmmhNO+s
         LCP2L4iGH4Tcz5YFNcP1Qtow/KCDHWg2kNURstXY+wqwIqWdhuMJkgZomFLBu1bPfUKm
         Z7HlDiXEpsbscQFkG8vxeXCpJAyXmfPzChEnoyvbcNeHeTdT6YPOfvUkalky2YIFZKB/
         Z1EbT3baWOtEJ9O00a7KSyWhhTgbEJGqIeR9UWRZwEd4OAcVcysRLk7cuL3vMg+PxvgS
         5how==
X-Forwarded-Encrypted: i=1; AJvYcCUEQte9wF4Ctc9Lp7QC2vs5y6jTbKBk3Nepb6zj321gaZWVOcz4svtTueEOB1po3jONAV+In/9F3Pce3W6i@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ+JLIiDALXr2+iqTAVa+nFvOD/GdTsg/MfkQ+tf1S8Nay5RUI
	DhN7lxsU7o1okwQeKrQsiQCnOLM+DP1HFKj0x8JDqQ0ShIaJyw+uLJ+F
X-Gm-Gg: ASbGncuIfJfOwZD90TM8f5CnO0zd701ABNwQ6w8uBS5SzmClYroP1YWYdYccsMnM03v
	71fHNdeCas3VIHcWdh/iLK3GSnnbggh6XdJ59SJHPvK0LSTuuMjX5xITiLSOsvTSqdT2edu8C9z
	i/TkzJjzaYFxl+x+go0BIdGRUOVR34mah1M8mIgIf2dJBXcqXev6XnfZeKV97hgXvlENvcNEzyV
	CR2a0jKbVoRYzoaXIdSUv5G1EpeOwA78ANMfcOlKoU56Dq4iYsTq1ftSoQ9kAturb10b66rH5l+
	3askRg2JttZUXCU2zn/fMA9xviNSkycYHk6Ndl7BR+XVkT7UJzyy/nPfEvMHAO5UB9KVlFaugPg
	lZLP3/iZLumQVESnt3IS+1HzqoDvz30D4WuU=
X-Google-Smtp-Source: AGHT+IE5lNwdStL5/SrBlIf6tWKMBMLK5frkUlrfnmTrecW3oIUA3xfQTspp+f9g5Mw9xcEH4CSpJg==
X-Received: by 2002:a05:6000:230b:b0:3b6:cf8:64b3 with SMTP id ffacd0b85a97d-3b60e523d6bmr9233370f8f.34.1752852337475;
        Fri, 18 Jul 2025 08:25:37 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:37 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Fri, 18 Jul 2025 18:24:47 +0300
Message-ID: <20250718152500.2656391-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c3..5dcafd46344cc 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.50.1

