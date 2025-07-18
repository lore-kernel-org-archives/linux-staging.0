Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11822E5B20
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852366; cv=none; b=jhKzA/3ssPSpK1jL7jC3dYw7S81pcPlgu8ECJlGThnDjzSBrwNPGKZ7SJL4j/l58xKj/HGN0EzD3YTFDSDBP8Lj6TMla1l9twpRRyn5j8bd4dWuU/0OtNBzN8A/I2mGKuX6h0+J+Pa5giLk+aGqh9KNnyVPlQ6SId2zvCAWJyRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852366; c=relaxed/simple;
	bh=aqzu2YQ5BXADTBRxOe8uZl+nl0L57XcXnUxXYVOmaf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hR3/YiXV79ZJIaIqY5hEDtpynUzdjxCkffb9nxXB6CJ7MttsLSzh7pZUmUmzUFe5gbYxqXYcLCKRiw+fmULMwTBCnTO6+XNKpu24yR5Htk2mu/V/rvu4xThbVvhE8195B07HoEa7lFYx+uNllVVfHH6ZZt7AEA7dParSuMhYFTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo+R4lY7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bo+R4lY7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso1753941f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852362; x=1753457162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=bo+R4lY7oze+AIQh58hcdBNMSPd6OV3qbq28DD+zebMRXrymY2UwsvWfwXG7CqtEHu
         WjaWLFzgz4bgDWL1G7Hw10kxJ4/c3p0HhUhPfQNviIVycD0I/IqouoOXkfAGNmO3GPVm
         Q3o8xpOGx15Snx45gA5ONs9RWi7yJRtVN05BvvAPEbF6AKuv95w/0q52v+McERtrPo+N
         c50DVgkuSmJ30lUYVmI1iFqH1U4ALpGSuNJFm5csKqAxV0xQbLXr6n6utPHSMC0qz4E0
         nkxobrjvAmVBqaNpeKFluMjPgWmC1IyjGZKhkW0CgxPmnEUwAuUxzW0h9/aMGOKez60k
         +51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852362; x=1753457162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=j148GwOJeuiFSKmny7lMIWOeyjjZWcoPfN+JlBx47PKhdwt8gUzvOnCdJ5IXlEqhxh
         IR/4Qn/OicaV7DeaNT87chqoiqsNSO1/CCpLON3YJqqozwgWgbcy1vhhHIFUWKNDhXOX
         54sUeO1BDZjBAjP4ThWeKgvJDLIFKo1C4L+otmi/ckw9AnmWGPWoo9TNvvgiB33rtkcT
         T7j5Xkl3Hlqe7TL7kcDMmYqbsLYfSl0aA/bELHga4L2rECURT6kUKFplSppFj7hZS4Sf
         YL7eFrVZi9nDC3Pc57OcY03tdMI+9vGE0rwIYOB3bbxRWfUAiKop610cXttRM8Be5yg0
         bxfg==
X-Forwarded-Encrypted: i=1; AJvYcCV5OHirC5O0LD4onJSgA3AkAqkIeauKt3Bd565KuW/LiMISYMbSpMUewtr60kbB61McfxGRFYe/Bug2nMx/@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ9J1psyd4snux6pa2Zt6UpQ6zm25rUYu9dzj6MnbIQqc3vZiP
	4ky3KdfKMJ7ET4DNtMasKkRO2BG7Kg8yiiE/qn/f1dRvUF/RwLcuS/Ybsg6dJA==
X-Gm-Gg: ASbGncvdS//yxlExZHzzrKdAda1pfUG93U5YxXewYT0BAorETPXMNBd+Gs91sEMEehe
	dtyiLGY80YASta4JmG70Ue3Q1Nllb99xJr0nAwkTTHbJQqNULAfPR7skazoa6UsYUMU1mhQyRfa
	lbf8JQxI0UGPawi37+kxyftDCcKX56zEBzfHEM2BAHm2kFVqX3lCJOBh3lGVlbjxjEWb6kPmPHT
	L6/kvsTUjq9PxBnRpWF1GKJJsw4G1REs3oeLTy/uuIykPmwYGRKs9HQdFpvFLKzMQLziAuYSN/d
	0YGYLS95JYJvfjrhQw6CUt4lcrPQy8uAII02c9bh7i2grofp893reX7M6ylMKUHqE6G076rrtLd
	kPd4cIg7+qHoqLBqVohE7y6WYutxcU2wrWFCbciUyArdENA==
X-Google-Smtp-Source: AGHT+IG0koCSub14mOqUfW6e8Tvqyn6CFRoCyGdB+mJuGBdWbBt+uqo8D0kUkKp6accmL+/IMAlZzg==
X-Received: by 2002:a5d:64e3:0:b0:3b4:9721:2b2d with SMTP id ffacd0b85a97d-3b60e4b8289mr10630245f8f.9.1752852361783;
        Fri, 18 Jul 2025 08:26:01 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:26:01 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Fri, 18 Jul 2025 18:24:57 +0300
Message-ID: <20250718152500.2656391-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
index 897fc686e6a91..6f4254f562da3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.50.1

