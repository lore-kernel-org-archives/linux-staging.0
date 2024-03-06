Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5548527D;
	Thu,  7 Mar 2024 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814080; cv=none; b=A6nYEZ4gpxc2N2YD3P2YM+q9yCZ0LUViR6Z6NFoScWXuyNKALtuw+sc2hf04u04PoIQ5WT8TmZrZY+QCe4ai1mFs6kF+n+RjIkmakTlHfb5IWegUGA8nyZScKaeBjEW7ST7EPDMxsUwhIS0LFbrNu9bHJDwvQKYRGB4K2yT0/kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814080; c=relaxed/simple;
	bh=FlFAHsADanSRw1oNyFYKbs0vTvjvGqpRoRaPIW+Wm8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=abDv9Rdw4RDBExGxe09c3AB/bvC3wiPm6PZTX++mpX4cacKpNrByRAVGiQhUVWPUGzahPcx9myFfC2id6T/TQr4H1ZOHvsqmnNLiT7Tz9sEIYJ4wju0GUDofnZEx2dK7FigY2/JGmfLcTWrDUf9Yw+Jz5ehZ+kkUN+bpahrsWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIAg9NXV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIAg9NXV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33e2268ed96so657637f8f.3;
        Thu, 07 Mar 2024 04:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814077; x=1710418877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1fRnY9cGUWI1aZLVXO4PegxvqHwfJz4P0kCTgQAmhU=;
        b=XIAg9NXV7tu07QI3IBpZnzDxSx1aJCVEygiU5V6vNdDlL3DUqlIY4inYhMCj3PWgkh
         8RBdsThHAZoEsNrHP8YA0MYPrZteuLUosRiv8YQCOtKNnBq+yFBwZyj8BpJN7X4qnPZG
         aT6UMeHK7iK7tMeskXpScrBnDOxEw7ADzfjf3B6rrkcDFXSL1Lo+BBEL/nPCVAWWoURs
         0xR6QrSpD5ldOXAUcU9KCk0wEQPktzcgb4JNIg2WHv/S0nG2N2QY+LjSiLY3drYjsK1h
         theJwDaSvuW+QTa3tHXKcuMVdZ4DqeUVNZxhq3Ff0dphROVY8Ot/t8OmYK5by/4YbrfY
         WmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814077; x=1710418877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1fRnY9cGUWI1aZLVXO4PegxvqHwfJz4P0kCTgQAmhU=;
        b=NhLzQ7wNBNl7eiVJK9xVj+npcpWGSBpKICXvB95E3m5wYAAYRaGM7FxVamN2+YpAfl
         e2XKm5B9/NGbt6PcXbTFGpkATO1mnCdQ3eXbUSgE4K/N4foU1/ZtMOrcO67JC5/Q1Arb
         qY2KfJK0kEvsVPKYXh5kEAcAx0aKjKydgf1LNwqL0Uk7drJVfH0u2vxoMJMMHvpA6Mry
         chaUdvUOCRFZ3W+TbJmzQjzWYP2TrqSUSo1jTxBASdFBsfBz6TSv1sO1xMU9Z+jeU4MY
         4iz+pL8Ol5LMLVECvezsGtkiwD9Pk32zmhVMILR/vd8gmp5TswyEhFxv6ds7p6KCUS7A
         zLRw==
X-Forwarded-Encrypted: i=1; AJvYcCVMHfSdmp23LW0iEHE73KsOAbJuWBgMOQLGp8ANe+oiMt+bJeFg0ytlV81c6vCooQ4T8lUtOh4h/OyfPMFR4fmEsme/AU6ACsvt4N8l73ydiqjR1EO1dsTkNWiq19+NBoqsEfJoTRu/3Q==
X-Gm-Message-State: AOJu0YwUppQP6JBIoD9Mk7w1RyWJ9YkWDg0SpDYnl0CXWjAtpeSLok0m
	nV5cHv/KjLWfExcXWbAJKfdbBt38SErD74PtYIJk7uZLB32edhyL+DfC08Whxx4=
X-Google-Smtp-Source: AGHT+IFuqo/MHNe32j1Dr7Wro8RZlweC9aqpozYiCszPAurdhm5phxweJWd0+RuVCVwSheLezDrFVA==
X-Received: by 2002:a05:6512:234f:b0:512:eeac:2463 with SMTP id p15-20020a056512234f00b00512eeac2463mr1684508lfu.14.1709814057105;
        Thu, 07 Mar 2024 04:20:57 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:20:56 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 6/8] Staging: sm750fb: Rename variable sii164IsConnected
Date: Wed,  6 Mar 2024 04:36:09 +0000
Message-Id: <20240306043611.98074-7-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
References: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164IsConnected to sii164_is_connected to silence the
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added patch to series
    compiled the kernel

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 1ce44c50617a..ac1aab77da28 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -22,7 +22,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
-		.is_connected = sii164IsConnected,
+		.is_connected = sii164_is_connected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
 #endif
--
2.25.1

