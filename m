Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8E02E174B
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852338; cv=none; b=FcimmBqmTbF4OQ4ycelHsF9YbFdWlUsUzEisE5AKoT15tx1UUV5XGOg+36NGrC/IgmLDBIsoNTrs+FmxwcCOFGg42bT6E6xUHtghJleiH3hikvtUr93nX25ssKetNksJOKRNAcup/wyt2qfSHrltah44CSD6l4JNUf/3wdfspic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852338; c=relaxed/simple;
	bh=Tya7H69uCHv1F64bK9DJxRVSTo9tF9vvkubVhW3RXZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dG6im8GhE6vz9VGStITWY8KRTRTj+hWIEDLpnrS880q0KZikWdWeRoF36926+baqPilmPQz83KfUUc9SIFNU2N4qxpxxKN4MUconXnxgWfRV1VvmvovIMucW1Wt6TnMpm6umyoTswIJz/F8XUcKOgzckE8Luvc1KZJ7oCK62NKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVwaK/un; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVwaK/un"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so2038148f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852335; x=1753457135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=AVwaK/unwsI8Va7R3mADSqRPY3JFSEy6fygRV5ja/4paesMT/skcHyooUEvFdXpAnU
         Z8LOOqaP1q2HMSOkZfSAO6PPuqVhks26DlHCphvGJhSpdbIcYMdB7433Qks0t1SI83rh
         cnDvtyIwZVAwQig2dwuyAzNkmZaAkTD9UNEMmSAZaFpsr4wjy9VPXm/oWIJB9gf4yUAu
         Fztuep17l24kjEWQX8bo5qiDh0TRKXwD6uKjkz6dSi05Hj1vY87CT04e9CbvpbReYSXh
         J7jD2lMNnRhfVGNmLd0jIH+s+8uS3uccgtTjU8ichniMz3/EHWsv+/IGvLVZQyyKFSrF
         Ffiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852335; x=1753457135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=srsH4oCZuuyutOB2lT9Y3MncDfQ21vGuO+2I/1hQeKbzXznVTC2TEqaAnMb0zt290t
         ok4pjFiCg82Kaka7DLG53Z5L2vIUtlcY7MaVBEGsWL3ncWwFRNWhiajBy5r2tTkPFob7
         LSesEyzW28J4Y+mScBFQ0AawtSO0p2/PHYIMq69J+EC7i3Rhmu+cnUvI8MWGAsS0/dFJ
         9kwEfpgKthY9xsWIjR0TP2T3tDXQavVqTAECYSI3hOSzZv62lt8UruKo3njwhSoSN9wa
         lQ+Aen3JODSwbgIhJEtHIUpujVe631BN8MuRoNFOeJbpHRzoMaeeut9Uf/xNtxfWTgKr
         MmVg==
X-Forwarded-Encrypted: i=1; AJvYcCUm80haUpUJHtzUNqakqq42FdmQOimLKeABAyXHjk7UfLgOULTua9eLL5AP2NiTvzQlc65yabXGcIs02bqz@lists.linux.dev
X-Gm-Message-State: AOJu0YzvCqqOEWYKDsb8JjYkrCalPpSO83iP64gJnDg+pyeqpBVIs13r
	r2Ct45Jk1kIQsnrwxIAF9kZf/yN6WgLl2NvHsp/K7YUpxfu55X304AVy
X-Gm-Gg: ASbGncsJxYqt2ssTH9zng1XMRs1L2+cOT7FSZScUrMi8z1et+yKbui4GN1+kuBXEtdu
	Q0QWy9vEb+Uvjner22CIqXki8hFz7gQ/IJCWYvT4tQ1hi9MmCuZRCWPWGBUhBI2eHfY5H12ceZM
	4DNWbxx+SNL/G0gQ5qQMx82xLm2BScmkGsRhnkiYwCYYIZ5no02vKB/4uKKc6h8c9W6cuomKuMa
	IsHWztyk6sOtx97pTLolWFGFKskkM2N4USbQ14ZdHON67z+7HHYgy9LkAlmZDL2MEFl9jINPjTF
	fpeaVc8HsHs2ijNVhhLX3cOxWN9/O28fjvUUWR0Ow/LLlkdtIUv7+nege7wLJv1WEhprQ9ukF6d
	GGqptQ9QaiINzBh0cg3TRorllWJuKduNDbSE=
X-Google-Smtp-Source: AGHT+IHM9QE6OZP4eSrOZOx7KZfil3FjClDdGdknIIjf7C8wzDU4qPEPgS8586sPDWWAfqGicyvjew==
X-Received: by 2002:a05:6000:4b04:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3b613abf34emr7129638f8f.14.1752852334929;
        Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
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
Subject: [PATCH v7 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Fri, 18 Jul 2025 18:24:46 +0300
Message-ID: <20250718152500.2656391-11-demonsingur@gmail.com>
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d4..b345305acc4c3 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.50.1

