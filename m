Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32682D9C;
	Thu,  7 Mar 2024 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814048; cv=none; b=AI8nenv4+Mw0pz+Y8q9nYd/2X+QHgX9BNgyQVeecuw+3MCKpPL8yJ8BxnqBPHiDVZSmiiWlOPNgrB5iTAyJaMgWsmZ6Coxd97Ya1kBcj3Nwd0NB9oiJ/Co+I341E4AnqXPW0uk54tD+GuOzEzeZ+PivFYcks/PmzDIAw88OrULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814048; c=relaxed/simple;
	bh=UBOsVHG4jDkxtPgeZDNibDsr2z7b6XI+TABy+2BFr9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oJOq/hiRM97268L1Mf/rxAtqisLabcf6A55JG5GuZXQ2VD2Ed0Des/iNKqas2NTItNMhF4C5/iKlZAlVz+oVJULslYxgLdQIsZofAswVZGjutDwfIb+Tbg3B3z3i5k3tJCVjwXFG2OY/JV7nfovNSxa0vZBaWCR4rXjbJXt7HEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvkQrVbm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvkQrVbm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a45bb2a9c20so111663166b.0;
        Thu, 07 Mar 2024 04:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814045; x=1710418845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjtO8fomd6+Ree3rUKudR89g5eY76TjJNn4t/KZ9SfU=;
        b=PvkQrVbmeB3LXbOeajdcBO+oarH539kLir7Xm2wmlv/mGYAokB2/IEwuyIynjTf/T9
         pksDKmUjY3pJ/ISFSpRPnkBH9Jlm7pQ86v58ovmXxzO4zmm08eSVsQdSE/94GDoDsM1L
         aC2jRvl6KxV0gj9Ps+vOQtLDsvFniR3hGt0iQmnVfeDB3mVcLkhU7P5gWObGMSkFMTPu
         XXWp9OY5QpLzz1E8z68TaMjJFoBhrOWNhxkTee9kPEcPvrxlTgLxP9528hobodrLO13E
         vw4G94Dv2luF0BGMOJDNKPEj88Dwtb7LCyr0j335sCp9AmGwJT/hVRuvTbsrGNd3nZKz
         AThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814045; x=1710418845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjtO8fomd6+Ree3rUKudR89g5eY76TjJNn4t/KZ9SfU=;
        b=prbtU7SoY0V/KRfXc/U4Px+r/bJgkNCA4fEWB4I2Azcxbn4NxXA2bBnvKtHW3vY0sc
         ttdawrONjtAK3dZ8Z90mz19bExXo1NRAMrHuH2toXX8QTOI5rZL9fBnRoLg2CJ18udgK
         yIcvRV64amWyJ1GSo2/k9DmuN1Fb8BpzKwvvixLYQMTChBO3BsDBDlvrfwWulk6ZbXI+
         GyaUXlOheze77mf3L/2RT39Q47qvOKDCoYydoM5d0udXK1Rv1T2Lth/+OWRQ6TGTqc02
         KH/Lyt+X0ETE/U11WLCe204TK+S8aj3gqe2HO0vTgLaUpcA3F/ZakkiZRzn8uCRrXJ4i
         JblQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFDA+/naKSu2VAee1DfTgf4niKaCmL1etiLr1aLEzGgrd9WuXYN4tHKcyKHpyGkO4TgUy8Pf33EOTXtUa8piwLuWZYzRjZzW0f1Xhk4ibX9HOESFwSKmlRF9klPmwM+Zk+Y2rS5POMpg==
X-Gm-Message-State: AOJu0Yzgczy8uFVLTwQZITWSBSNNjIs0wYw8R/1kBTjiZ1qdRFvIj28q
	bSasraL9+gEt0TPT17BDyx/EPXX3w9Tl1BMWNXxF5TRpdi7HLwULFnqAp/hPdZc=
X-Google-Smtp-Source: AGHT+IGvg38UZEOX2eprvNiH9FYEUXoA8EwenTFskVP1sH0VOyOb9BytDR4BBRiBlhiaOarOaf80hg==
X-Received: by 2002:a17:906:4a95:b0:a45:c2cd:f6ac with SMTP id x21-20020a1709064a9500b00a45c2cdf6acmr2639126eju.49.1709814044956;
        Thu, 07 Mar 2024 04:20:44 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:20:44 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 1/8] Staging: sm750fb: Rename variable sii164GetDeviceID
Date: Wed,  6 Mar 2024 04:36:04 +0000
Message-Id: <20240306043611.98074-2-dorine.a.tipo@gmail.com>
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

Rename variable sii164GetDeviceID to sii164_get_device_id to silence
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added the patch to a series.
    Fixed erroers within the patch.
    Compiled the kernel

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 8b81e8642f9e..3fb14eff2de1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,7 +16,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 	{
 		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
-		.get_device_id = sii164GetDeviceID,
+		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164ResetChip,
 		.get_chip_string = sii164GetChipString,
--
2.25.1

