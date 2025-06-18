Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1F2DFF08
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240794; cv=none; b=Bz1DDu4zqQWY50A+ZDV+R6zmcQeXul9mJFKRyVVnSU+xJIEhJw3b7tYqqpjNDMttK1JykWpdbx2tNNW7RI3FQS+oJmoanorSGGe/BNmejozd7afuL2QgCfH/BxksBod5JFIU0a0X2gi+rfTjYoPWyLe0rMz1jgzmoOXqh0s9Ti0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240794; c=relaxed/simple;
	bh=+KYT79oixLVsm/5Pjglq0/OkL1hq1IwEz8hrWKZiJOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPE62vVtHh42rziMcPfmw4Jj7dX+TWSg+jsfHS06oXizPCrpLw5AIGYvqIfVvemOCkRjVRnrBzLVPd4yHxmSZys5xDWclfoe3Q5Tgc9mW5iIeAUy661feyR5996Ghbd88RVN69cPQNzLGKTNO3R4oECFw5uRMMjs6kxClrlUUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvbEPg28; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvbEPg28"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so10586820a12.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240791; x=1750845591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec22XHKjG+ejR8ND9PWg/+TxLajWfEjpKEPLdRkBrqE=;
        b=gvbEPg28q+3hQ8iUA+fXgLGp3DwF0NZV5yFvGK4naKBFVQ7B9YTgODPkke9X0arE7d
         MlXPzK6KMGt1UwFw4GIRf29OXE1++Aesz0O+9qZa2fDsEbiqdorXP5xtMtWt0uErQiW/
         9Npo5ijnU+UyKN7txJqJBNvmXcg+zb6hgaXea8ZfDPKhgv7oFrCh3MZCzP6UIucmiXfs
         Zt4Nv6ZkIP3r6R/anavpMSzwAn5i5xoTvFipDbxRH9FaLRN2/v1xGq1DN9GKaC4srOEa
         cAutYJKxgMRl4rgnvfDvP1NcMrMv57KmfBcUVMgwJNhm5CExr8r39zB8TR/Y98Hr6Qnf
         720A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240791; x=1750845591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ec22XHKjG+ejR8ND9PWg/+TxLajWfEjpKEPLdRkBrqE=;
        b=iqL/NSWCdzAnSHYZyi4a0SGQfeQAuvGyUDDCgskDNL5joPyd6/ck2dOWUw+AmEVRAp
         9or+6wWMqEkjim+G8udr/7I+s3BrLQfY0CktYiMJWW/4eV6xV+FSJWFsND9Ad+NcXGRd
         DWmaVXGMeyshrGfbsFOGqiaKRPUJVhCmSif+tfgeG+KVTgVhUb7wSkjD1Nhd4/+ZTrQ9
         qtb8JRJlQKSBSaShH2KRYQj5+megyZLpH7ic+IPazUiIQaKU17MyjliNchw23xuAw9Xp
         ahT9IDqoUszr8ISJBKVvUVa1v1+pr3GMo3cuufNo2QpErDt+CVkvI1FazMg6hPPv0bbE
         A0mg==
X-Forwarded-Encrypted: i=1; AJvYcCXfxZsZv79Hfs0ImLVZQvzj4hEDj7XBS1ayqyaH66Sv4LQh6JdF/hcoHngUeKDbMP+gO2qz6QuseJ/0rhW2@lists.linux.dev
X-Gm-Message-State: AOJu0YzK/4mntR9VR1b9LGcCB13Rq0cRE0igYBuT7RfBQEuu+uP6+604
	MKbcUhvp/r+PzofXKgup/zzjNtRLVhz7nldUbCfQHlq1aIwbtuBD7wAa
X-Gm-Gg: ASbGncsJKlaBdOloUR7LEVab4U+IHn6hUMYO30+xVyOfAmfu09zTSo9cMj5alWd8/Ib
	f6lChj37QfJ+1KgQ16mpEkHq5n0AuXOwm1JR0R4Z5Q0cEpgcU6h6ZwnCufgflr/WxGe24A8Eh1s
	mRWns0aLyN5VUC41fnvRHYtSkKt2GYGotI5t4qbztNaQiOw5FctEcjO6ot4LDQ3va4zm9GsvfnJ
	3FSvbHci1TBaIaKmKe4kFE+6Kf+6mlZSwkkrNqqPn3RFVQAhVlIwxIE3oDHUd1EeTv4dN4CgLOX
	2K2//JHSXUaexOTYU/PrOsseoqw57Zm4ACqNJQtHXFfkuZhv4P0LZ5eumKXk7wnz+2wg+WfQZGA
	=
X-Google-Smtp-Source: AGHT+IEwMDBbeSHpT0wB215NsckLc9ZFcIVd0MICCrwqb68KTljLkYsjJiAX5ubzR9DASWsy55435g==
X-Received: by 2002:a05:6402:26c5:b0:607:f513:4800 with SMTP id 4fb4d7f45d1cf-608d08b5dcfmr16192558a12.10.1750240791306;
        Wed, 18 Jun 2025 02:59:51 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:50 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 13/19] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed, 18 Jun 2025 12:58:49 +0300
Message-ID: <20250618095858.2145209-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

