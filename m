Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECC2857FC
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462521; cv=none; b=WD+pQVO9OOF6syWEGiXA1l/SgzaH7fbbpNjUEo1nXtPV2pqfxM0KB4l9PZQzasS6QxNO2zT+mhMTJEq9mefXC0K0EgSC3Re4TB2HlCe5bE+QcL5Y8MBjbrodaqU6uBulDhIeVPBiEi9tzipPGtwgj2CNX7mt1k+zUdmSnVSJ9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462521; c=relaxed/simple;
	bh=rMxzYZ+ZhxUfDAbKl9a+wghm8sVhn8BbKeD6/4z1tTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1IUGOnCSNjixjCC6noqzGqgaavugETdsq11Rg+OODiFX1MQQhhfWP3eFsnypz1Txn+GskOzv2NXnicnwVldOmF2uuQv8Y85PdFK/Troh0xzVSADdyqs9g4mnz70GBUQsr4Rb5P+XxIVHOak3DL1+FGBtBAZGbiA8mPxI8ucOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOm//Sb/; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOm//Sb/"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad574992fcaso758204066b.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462517; x=1752067317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMG9pPiDXBBKKvDaMKGXpbOZbg8FN9YULFdxboP6NUI=;
        b=OOm//Sb/psaPzR47pooEkz91n8EdnzS7D6IzC77S65MOkGxKDAAWU+53e5bmcaCkuR
         WZ1VcYo9fRLDodcB0jwsffRgSNwGWy+xtuLV01kM+yEfwSwVRj//n+dfuZgGI//SYLny
         stPOK7putw9mPotVkQJLd+oVOfMh74wsG6v+0ZcyjqLAEPH//RLXd1MFvJ5ayhxO7dSO
         kN4oow0aVJ/NB+QyODERorWuNo6E0ynhxdKpPNFHSwcEVKyGJF+xckKwiiWpVhMjvq3q
         j5Ud95ZQSpnW/Ka/ppPVDpxIqpSofCCM0tVyqTrikc9u+0n9S+MMzQxWSRKLoIIaUhE2
         RQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462517; x=1752067317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMG9pPiDXBBKKvDaMKGXpbOZbg8FN9YULFdxboP6NUI=;
        b=ex7RbovN8PL9Wso8/W+t2qL9MfNaULoYO0BQ5qECD+g2WpUr3y3/SAfFsxxpHt6BO3
         IVAQUJOHzlAnhGCjygNYVUmj7gLPdBnRMxpPaVpWQjA+F5xAs3iLMKkmQ1AwCYTl+a2v
         2QcIUxEpV99z6qpKoPW6GS1u8vVs4D5jEIkJanlplWcA0J3b4q9w5HJ5DceBWc+MA0ia
         QxLD/O+C12powm0YvRTVbEy/gTOiDHqwcxLh/FTJyNuZbSHpxqtVj5gaQ3h0e2ZL6izq
         4iQTw9PeWh7jvZsgI0NQeQNLgSwCUXwJIxmDAWl/aE41PiPAhHbZ3gtoSa+CqkJZgDfb
         B8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5CIKLuMvO7H+/gaa7Tq+b0IyDo84jWiY1kSRq1mjR9AHVVoaTGkJa36xT37BWD9k79h69epG5XKvia0j@lists.linux.dev
X-Gm-Message-State: AOJu0Yz14MpE3MpHbTqW4WaEWjmpkFmeOh6w1GYSi2dZb3+hHWtyrqId
	IExOvyqeQVeojrgSRLGuXm8xjVutrFN5GbeKQc0sdeawkI5MbGq61q4/
X-Gm-Gg: ASbGncvkio95G2x1H8kGh+rLs0ga+ipCP1RvBrdVMauKF3L5cDv8E3IIETbVBYvcX7E
	U7DzFbpX0PsVnZkglRU8H87p6nkjGTXqKx8oJguBq1bhifsNrDlf6gPTiq/7wddou1Xe2nbYSZl
	NaBsUq0TxAxHy6wiADPJrg5RjYmAcXP4Xk5abk+ZyvuGI26S4DGVPUERmW0NdCrAAqUFYlybUY1
	gyXZvTw2e0hCJYG4qwEjn3MeXM2NIY+jVTnZZaN/1/4LPZnyMfC5e0dno6R1wtFAokM79WmYMg6
	0A9GDyMbmASTPRfh3CZ2Lff80NeXGqA0XNJPV/F5f9bQjyrqV0Y/kMgRVrH9AFhYLaqiE5s2qDk
	=
X-Google-Smtp-Source: AGHT+IFvLZMhZjDSfshoFpRc939n2lwSc6MfwBSslCP+I3o/TmLmEUPehK/4SzQi266zJ8iQw+lKjg==
X-Received: by 2002:a17:906:c358:b0:ade:470b:d5ac with SMTP id a640c23a62f3a-ae3c2c7d588mr239742866b.56.1751462517204;
        Wed, 02 Jul 2025 06:21:57 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:56 -0700 (PDT)
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
Subject: [PATCH v5 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed,  2 Jul 2025 16:20:47 +0300
Message-ID: <20250702132104.1537926-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
index 897fc686e6a9..6f4254f562da 100644
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
2.50.0

