Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15213A1DA
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345278; cv=none; b=W2JqaaDBamKYvUc9mAE9SHUhl6/S48z5GRdHt4JzuRpjB/Cxdx8PherXOqb17m9jAhyQCeO9RwDCjAjz7GTosRAGOT6dmVoD5MFUmZ+f2Zt5G2BYndM0UR47GhXR1hiAt5IE7xNer7z62Q5EbBaiuRsgDJGL7AP+7/OsGIkKdCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345278; c=relaxed/simple;
	bh=tcWH6jcBnjgZvaH/IZAF8fYQa8PC+uCdhWLW0V2u5ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sbSYvE9aYC7PQaoNq6UPsu+/05oWv7Bec3v64qu1SAC2UoSzMCmBFopKBl0fkeGgHXh8vnwi11bOGcD/c6w8n1d4B2DGvQsYaypbDPcRvIB+NsO4OLnywl5nckNcuxfIC2xF6IAp3qKnUj8GdS3JajZXopeUTkB81WCrTWkBiLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=f/DsecBq; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="f/DsecBq"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so2876406a12.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345276; x=1714950076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jukopXyGW/if/AOTjqH7jgQ+2Z4ukOtvPxegytlzAL8=;
        b=f/DsecBqicOWComFhpo2QyQAT4fD2aXdvCqFnwpl1UVKAKYuBdGsWASQyixGSxJy8c
         TzkN/9kBdeN5m9O8vmPZCdAwDLPhkiuMgi991jFCRNk8LdYfDUpnbtJwpqdI3HdDeKEr
         r2WL1/rSGWF6cSd9yLOc3k0aRSXVhGipK7sRyYoxvFShFclLGCOAEMBtUOUxBWK35cyE
         I1kbR1HmZdmI9cRo+enogmusvauX5d9x565SczRjmLgeZYMkuqQL73LztlIR+rDXVJjs
         6PlRNG0iO2ZdbGYqcZdKz0pqNS7elvtMEqpB6xHw6I1spiB6aO97yM9WCuysNXbFFNfj
         OpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345276; x=1714950076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jukopXyGW/if/AOTjqH7jgQ+2Z4ukOtvPxegytlzAL8=;
        b=KDzKdjmBeCJBxlP5Bv+MKuayo7GNpErxraeFPU3BN7kbgzyc7WIR/SIVDFrD7uCQV2
         9ZzR6SLEnRC3StebglQl5T3qyw4laS7S4CUUEXKEujOw5LnQt1VnowB7LfBKGgDX0NCI
         kkXK+mJTnIXInZabE8JfX1Zyuxy2uSjPN1f3vCq7a5iTCpBDL7dS8Lhfs8kmXrbz2Fx9
         /9JREHl/I4kZgZIhFNnKXPvCVst1PlQOHpEIaVMr08Ru+Kot1zK6Yqe6ANzhICICNBPM
         FgmsiCspiDk+0fZ3WKEzcjqsQ3cIObQ5OyEPUhHmt6EVJ2voQGy/Z/4N6GB4rkT2oTLb
         FWOg==
X-Gm-Message-State: AOJu0Yy39n54Q6yKIx5s+b2SgcxgnnhmablwR7hl0zhRn0pEcqhFLBzg
	12dLlQeRE109GGQX4mnnxBQItI6CgvRKcgHuiDzd/Jj9S4n2P8wcMeZdrreywzg=
X-Google-Smtp-Source: AGHT+IEbTAty5/F2PdbfAuuV59ubpH2+K4coOOGsHs+g0waYq9P8FsjAmzHWY2FoAwaDpaPhCJTP8A==
X-Received: by 2002:a17:90a:bb86:b0:2a5:8ff:9d1 with SMTP id v6-20020a17090abb8600b002a508ff09d1mr8902393pjr.14.1714345276149;
        Sun, 28 Apr 2024 16:01:16 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:15 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/18] Staging: rtl8192e: Rename variable GreenField
Date: Sun, 28 Apr 2024 16:00:58 -0700
Message-Id: <20240428230106.6548-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable GreenField to green_field
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 008611e3aace..b9f50d195b13 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -27,7 +27,7 @@ struct ht_capab_ele {
 	u8	adv_coding:1;
 	u8	chl_width:1;
 	u8	mimo_pwr_save:2;
-	u8	GreenField:1;
+	u8	green_field:1;
 	u8	short_gi_20mhz:1;
 	u8	short_gi_40mhz:1;
 	u8	TxSTBC:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 3b1c6e24103e..cf3536fdefbd 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -258,7 +258,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 		cap_ele->chl_width = 1;
 
 	cap_ele->mimo_pwr_save		= 3;
-	cap_ele->GreenField		= 0;
+	cap_ele->green_field		= 0;
 	cap_ele->short_gi_20mhz		= 1;
 	cap_ele->short_gi_40mhz		= 1;
 
-- 
2.30.2

