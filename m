Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D21D53F
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709556076; cv=none; b=a8AhUkTZozojbwhQFViboYcLIvKr6zqhJbXdcOLZRoixMZMgrKab/b90NtpDcrQitErnhDk+BDCQaudxHkfUzgdLP0BGffBLumM1+cCbmIOasFGBnn87QwSqVQKiZpVA00r7F8GiSZUvyB6g4nCd6AUgyfu4rMN9wZt6r51qErA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709556076; c=relaxed/simple;
	bh=VrKuTysybcruVJb4EEyi6CWbxnJKaGCRmLX0DNFiZwE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rNwVp6IdA4iInlXUXi0oB21LhEOvqjMK+htdYrlTZ/4SUF6N4dIZYYFHCYjPqlcUNmS1F91N6vPZpw0bF9S9YmKAb0V1E2SwPvmnM+4f0G89Rq6GDvSi+my4rZqvMwjWXiCwGWW2x6P5MJegxNcb71wdVTyk9U5g9SUinmDkUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDv+TefK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDv+TefK"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so7308516a12.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 04:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709556073; x=1710160873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1x+uTXo4QMROthjOCJVMdHiLvB44PpdFmG04isAqrQ=;
        b=gDv+TefK2CBvmVkHfQoasJ+GwKGhX8LUA1dEMjNrZdPfOWO9yTaOXuyoVixEBpOEGK
         IyBD2UcH3QOa4S8ykih1FrfdxObRAW05qJmEwBp1sq9rSBntOYcRij458cEusURjiPHO
         mysveRucV2xb24VS0b/LGLm+YgBFzBWTDrg2kHpSqA36YSzgdym2TsYkdjtt9o/Spe6I
         w6wa3EC6MBGC0LORJuxDmeuxSYdRA3IjMtQ4rSY19XU8uDVKZ8wMx1l5SF+WMkqe1RoM
         H9NtSLJNIpYxvaEJEbHJbTI+rh2OW6xiKxbdOZi3tS1tVq5QSxGVxooWqpRg8sgcvHg8
         uzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709556073; x=1710160873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1x+uTXo4QMROthjOCJVMdHiLvB44PpdFmG04isAqrQ=;
        b=nLkCjgQHpFBq5kFWwq4qfvHvbpxVTKCs3KyrnRuZSZ2JxNdt1LzAB4j0Nw1M5ElPWS
         QcqTFU94wgy5AiIhyXvR8oCnLzqimjwfnXhBxbkaDPlWw5TzRY2BOU++AHzcEq/mmwgX
         Qftv3XJVKeou9wCcFYCaeFXCICPZ/RNo2Ts3cia2flvIf2242HubUvGRzFHaGA0AxXto
         J2GzuWVrjQaiApculRAg9LQIS9fTnVTraMfLKQUerIA/dIY3lXTBye4usOI2PSFexk1/
         r9jnIUIk+o8+xFJXjIIBduxyZQrFX5vNdLxNZtVi7EZyKqOGylfA2eOpc7rO+rW4pkgn
         P0iA==
X-Forwarded-Encrypted: i=1; AJvYcCVY9xU5Cs0fpa071IUUgl0QnWyOIA5VPuJYuJ+xqtY4I3r9s/4BEBA5EthNvsAGpVzHNfwEpigpBIjm1YfMDgtBGsyR6IaUa1IN6cF+AQ==
X-Gm-Message-State: AOJu0YxCJiOsj6JEayHbUskVsGg2MHTWRb1v/+bdpfDPgFNVy8Ux5hXA
	72GHEu4OM1W3mqedIOVXPPVLs5QwGtPxo2JGdFmf2h+lTaLBShQh
X-Google-Smtp-Source: AGHT+IFF9pOTYgrMzrAzZOVign7+3cNPuTuRZSuF2jqe40F8E/SMI072cOwezGnSaCJAvU19cW+9xQ==
X-Received: by 2002:a05:6402:2267:b0:565:4b37:4578 with SMTP id du7-20020a056402226700b005654b374578mr8079566edb.14.1709556072793;
        Mon, 04 Mar 2024 04:41:12 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id dh18-20020a0564021d3200b0056760e830f0sm651747edb.81.2024.03.04.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 04:41:12 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	philipp.g.hortmann@gmail.com
Subject: [PATCH v2 5/5] staging: vt6655: Fix open parenthesis alignment
Date: Mon,  4 Mar 2024 12:40:06 +0000
Message-Id: <20240304124006.26819-6-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304124006.26819-1-dorine.a.tipo@gmail.com>
References: <2024030317-multitude-pelvis-bcb2@gregkh>
 <20240304124006.26819-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in bool card_set_beacon_period().

This patch aligns the beacon_interval parameter with the opening
parenthesis.
This change improves code readability and adheres to coding style
guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 94784b5c0402..3f807d898607 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -321,7 +321,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  * Return Value: true if succeed; otherwise false
  */
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short beacon_interval)
+			    unsigned short beacon_interval)
 {
 	u64 next_tbtt;

--
2.25.1

