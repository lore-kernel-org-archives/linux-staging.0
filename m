Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9DD2550B0
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151114; cv=none; b=Ds3jq73H+A73F7wJomNHMWYHAXPGLYVgL/CqkXdGsT8x9gOipSUC0dP3AB0hwmUGUKh3xBA7ygTkJwwLhxm3Bgvydc2fFsnmogzR2R1d1AaNu3tPm+zJmyJ+sp0O6vSaq5woOT2tsYbntuOUzQ3RYjWdXJuhGJVjBZIfYN5/gW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151114; c=relaxed/simple;
	bh=XpQnO5Ofq3tGrrrR9Kobf5JUhGGWsse+RF8ttHkWB7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ApYr1VOPGxYT1fJnKKAaHDHVYISdEprZ4jsDMBNwf/5rmFSgLKl3tyDqzhPbiIcivUHXmKcUDRgw94UTKPiVrv4XmFfomoMGeo5WYFhyU0BaVswBvAYlq9O1/d03OLgbE/rucgSVHJVrwPMOeNCRk4zsg63biU99/9mo4cdE8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mg9PA6Fr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mg9PA6Fr"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736c062b1f5so5161193b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151112; x=1744755912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyqM9XA3qJ7OWA2S+2KUpQ5OJtWynztvm40wi9YyoYI=;
        b=mg9PA6FrtW6fENfiJAjS7/KyObDzibmfbhE9hxt6lUHEwbmWMWFAGlzBBbvi1X4q/J
         htYI3Zf9s3Qu/pOJqnkJFg+a9J8eV0pCVPlaYKoUBKoVlbUqICA/fF2SmalKzD/mHSE3
         yMMZ9wpHImbwYtwBfJ0lMtUcbww5o4uZ/XdYoNJHwbSVLG2MwW5rIA4mHn1CCdPUnVEH
         y+yrpnWOKRZttHdEneLZ6tYspNqszuVjmvSatKeqk0mjeH6BKCnUOOwSXz5BrQzfVygX
         4gYEAruakTqTwMNRHQNWJjOO5oKxpriQU/2DQSlgi54QpXNUEKo0npcT/zh91pkUrmj6
         3AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151112; x=1744755912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyqM9XA3qJ7OWA2S+2KUpQ5OJtWynztvm40wi9YyoYI=;
        b=q9W3dhdi+VvCDvgRW7a7KuLX3MxqAT0sAyUWB+kcJiYHhbT1wkcJxKaml0aYKWC3o6
         W8RTOYvkQuhSn7tfM7QoY63KCUIPSNDyae8whiZBjsfsJHJ83PZ530atsG7f8yTOifDH
         dbuhkpJEYh0RGSj2WWgRwLfyTV7abO/ydHOPXD42hftI8RprCaS6zOzMyQ10HHQ2MVng
         VMlpHy/aX9hwiI3HtwqBcgGfg8F8BGE3VJaDGw22OLZOiv2D/7oN+FipW5tiMBZGFnEj
         C+8mL7IqnxurcHo7I5mvRNt1e768QooGmse50bY/hT2a8dhkOBFzwIoUUa526gX0Vg2v
         Pcow==
X-Forwarded-Encrypted: i=1; AJvYcCUHCDRekVUGKN1aGiePoIBktUaIAi2qVe12AzfgZS5U/Th9EiwmDWJjaywSRxP2zzLLXk63rhypBAkF6IaV@lists.linux.dev
X-Gm-Message-State: AOJu0YyPFd3AEa2A7qih6gC1Zosi40EppBMfTDlEoAd9svFWOvcZZicC
	b59X6diCwoidnDxFk3oGgMGJm2dTLnr05I8Bz0C1QDM1L60egKBFm14qzOPPhA==
X-Gm-Gg: ASbGncvwaTh7qohf1bSkRhc3K1iGwEnQaOHeou+gbHShG11R0OgMKgv+saAYSOcuC/F
	UcGJ5/APbwtO3/cSjjKjzyZ+tLKcacClXppMy9l9s+WVBoVyL8ZrPXbi8Wrbxn9+EaVW1pd/sEm
	TEyV2sirZHKYqm/PvnWz7yHPyK2IwB38es06ECoJ+2QanMi0CDYS4A+SKYnGZJik5DW/mUQAaXb
	+R78CPPNpXLLRHQXsEu7Urq/HBt/kYu54qdPS8Vma6kI9wwHwcnoXI/yFL0ZshHNSZoFrGKlcSV
	kj2EUXb+e5W7mJCGjoCk0Ps30y90OQIt3AW1qe3P6U7C6vabCiCdJYKBxJ5qnKT1LxWoC7OK2ss
	OmC4/LxAHLor1/ziSDho1
X-Google-Smtp-Source: AGHT+IFo5C/bNlvwWLyFe/tTHf2NO6zN6WDrzML5vLTbWDntGXERUV1aoOEuI3e6EbBITuA5yljX8A==
X-Received: by 2002:a05:6a21:174d:b0:1f5:5a0b:4768 with SMTP id adf61e73a8af0-201591ca8a0mr889636637.21.1744151112694;
        Tue, 08 Apr 2025 15:25:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cfbc9sm9615323a12.9.2025.04.08.15.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 03/18] staging: gpib: agilent_82357a: gpib_interface
Date: Tue,  8 Apr 2025 22:24:49 +0000
Message-ID: <20250408222504.186992-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 16cc5333beba..29c390b4f4e4 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1432,7 +1432,7 @@ static void agilent_82357a_detach(struct gpib_board *board)
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
 
-static gpib_interface_t agilent_82357a_gpib_interface = {
+static struct gpib_interface agilent_82357a_gpib_interface = {
 	.name = "agilent_82357a",
 	.attach = agilent_82357a_attach,
 	.detach = agilent_82357a_detach,
-- 
2.43.0

