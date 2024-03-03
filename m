Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D3B654
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709489959; cv=none; b=K1PUw+B5bmUTyLTA/+SLrfSQ3sfy7iPmSNUbDz3HbgLT1vcEZGOPMDaNMxNyosPsF+vcfu0Rizz8sI1yHKHB9FVj60i7Msou8QiSX5l2OqLKx1DP0u+FqelNIY24hXqtPbMBrBvYYHKxFHRFbwrj3l3M/m1uXhFdbWdld14/djE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709489959; c=relaxed/simple;
	bh=sQOciL9Xtv72K7JEHQme2eD4lfx81Dvk6E7ieDdMGY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Otni+lK3ilicFPBgHSS11ww0Bjo/XAoTooDqFXlL9+i1HSKqR0Kc1YRnZ8qcBGvd2/xfJ4DKUBosrb9aLbfGLlL2vl0y7AUGewR/oyjMcKlYSMLd9Ncstn7RvaBau0trA3mEkQPSeghP8kC1zTUAFiBj4aUKb0v1AyDtOddzAx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg2JRh7Z; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg2JRh7Z"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so5213542a12.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 10:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709489956; x=1710094756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79OMR4wOxLvhi5xGG1CLKzLpJS0QwRDhHANxP2Ga6Ws=;
        b=Pg2JRh7ZQo+q/uyUEBHPimS39jmZYAicnqdpkvhjgH7rJAEaqLC8sEjHvIekoYb1Dy
         W4zBsm4+qoXrpJBXoQ5woruLMad+zPM9fKPqRCdvbp7l7/rXlyG92UjZvREjQm7zChan
         RxlD9RDvsLNechsDmgR7gPN4JPOPSiY5DMbvgEHHMbWJrIEW569CYolMbfhdsUDxn4Y9
         PNqrdRZ68tZ55BS84U0BRl0mf8c2oOnsQGDV6FDD+uaMKWAznxSG2Vu1btvMd2HeHBNr
         5jz4u/Eazg4uabKYdpN610dRbooG95ZsZ8Hmdxo4Zv9/gDo0pLNRJxKiaWrmfBTslAvl
         O2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709489956; x=1710094756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79OMR4wOxLvhi5xGG1CLKzLpJS0QwRDhHANxP2Ga6Ws=;
        b=OL7RYtbQRKgDRl/iil2vuXMmwD9pqV7ri7J8CsdUC7x6rdmBe6RqhwBUqZ0Jzsoy04
         1l0mgWhXiQX3eL5UTUMcMVxraVfhQF62Ywfw7/I1vT+azvGMAxTeXNDerP9GuUlFHO00
         wjbxlasECTytWnzUWoKLDSrrR32WMkfpN7O0csn+WWCn14JiZ8haN3zE9ArLAs6T3ACN
         CMwbDHiAscULNoxB0hPzSa2RI3KtP4RQvoyG9kz6XQfMmf1Ne+osl210ao8KwzkdG6E9
         70jeHD8aztiUOAPpcrUKe57LMxaKBcUdmWBn5NMkFdYD3AR1mErXsMex43BaXTS9esZJ
         mRkg==
X-Forwarded-Encrypted: i=1; AJvYcCWNH+YZhaJEIvqBSgEOMOa1fzoCD84szw9twRCmMlll6wSdEU09oFNTkckHAufS8V+tnZ2LyPatn+EIRbroZ0VO3abAHBWtQaBTYcgCBg==
X-Gm-Message-State: AOJu0Yz/gJriNP5g+ucPjaU66UpZ5dTTTw+7RPPzIhzP2JpOeUuC0mK/
	/rN5Yw8h4qrCmwDkFMQ7+SMkhxIRBLsYI8MLfiCGvMkvwKJlLNcQ
X-Google-Smtp-Source: AGHT+IGexRp4g78LO7+BF82YaemGhEkmYv2C+XLgPm5JBn/AgGF6N7OhOk6cM+wUNyx3XcHgZ4tRaQ==
X-Received: by 2002:a05:6402:1d21:b0:566:981d:aef5 with SMTP id dh1-20020a0564021d2100b00566981daef5mr4416832edb.24.1709489956364;
        Sun, 03 Mar 2024 10:19:16 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id d8-20020a50fe88000000b005673e29cc0fsm563826edt.54.2024.03.03.10.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 10:19:16 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: vt6655: Match parenthesis alignment
Date: Sun,  3 Mar 2024 07:46:32 +0000
Message-Id: <20240303074632.14998-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240303074002.14777-1-dorine.a.tipo@gmail.com>
References: <20240303074002.14777-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align parameters in card_get_tsf_offset()

This patch aligns the 'local_tsf' parameter with the open parenthesis.
This change improves code readability and maintains consistency with coding
standards.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 2fb2b1da9136..94784b5c0402 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -297,7 +297,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 
 	if (bss_timestamp != local_tsf) {
 		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
-						local_tsf);
+						 local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
 		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
-- 
2.25.1

