Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB2B3EA9C
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345279; cv=none; b=n2TxLpf5iKXN0tDa1GA6IS4KdSaP0Z17ezJqk5aH6UgwQJqOU4t92yNnkKoKQYJVBzKeRsNlGNLZGEhWtQGQCVF7SJdCAdbHWDi2cGEsXgjrji58/WbxuTYGQ2qpPB//EF+wuZNbDW7+T7R9f9E3b2VOdlyvJMRHRdHTR9/sHE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345279; c=relaxed/simple;
	bh=qzbElJMC0T7qSfJtoU+IySAY//rsTZHVGCNH5N8FREg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tkczhvts49xkz3ehb1kDx2qUbFVnuEUaRiSWIzzEDQbhlEJnzWZ9UT3J/fUvFc6QTZ1b7vtaL/wPWV7AqUOOzaHOtKrqU8cFuVEYsBgm5r3/FjSouiGIdekvrI6nnjP4obIpy4QrB/FDkk6JF7w7pGWOkBiWlXVOyqq1P1/+TLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=NshyL8EN; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="NshyL8EN"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2a484f772e2so2549662a91.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345277; x=1714950077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9XfsC6ZYdi5xKMG3rHTSygcdivJultsM/ltg3vPCwc=;
        b=NshyL8ENlQBy2GX4l1Je3VkwpwEGfXp/ok748RFUMjwIJrzs/MIPhCAPQY+3C7aQCU
         mAMrBDKmNl7q5lj8Q7ji4DsaTMtxgOaK66kIZdtDSOnhikPWfAKw18seci1eGamgLpDw
         7JJ+cAi6dAD8z/XcmNSrkkz4PSAUkSuJ4oNgFFrm2Z5aWs9Zwk97cMHmmGBMBlQKvvky
         zrrBBr7Im2ILt6NbP4d9vq3kCVu8cPaI/9816VQksRAo0TNCJV9SxnIfWrio/DBI0aZi
         jHujM7pZ78ZKgux0uaM6bPepq3jtSCQe723i9ZQJ6xxHp9WWhYL/lS/yKlu4e13pgWGa
         h0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345277; x=1714950077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9XfsC6ZYdi5xKMG3rHTSygcdivJultsM/ltg3vPCwc=;
        b=udyIEYNsy+SevJM79ZTU1B4cVrRjrWGUftmtWVF0DPAja2G4RGup6ujE4D5n5aqP0T
         3S4sLRO0b63x8zocR00xOEivk3bIWoQfTo4VEDYpwyVUcXklAo7X6o+Bd7nbJb3hmAp9
         GPzh51Qb6cZ4TtB9VptoZlAKJJt16HHjNcTBz8OcWvZa9rET8w23snswW0AIsLdIklpb
         pXzuWxONYk6pnNrFMYnKCdxhfAMwzIFSrURBT0TugEDckKFS/xlERYyzNYcy0cqAwOdI
         UlcxoFOs4KGt/nvoKyldDbCXLb1kCy6f1dbO1PIKWUZwlTJNUTUj9HlI6oAelw/Gj0nz
         aWEw==
X-Gm-Message-State: AOJu0YxSGMzO6vEYZpLlPPD1jc0HAkM1FlNcoP6w9lqjeiYwmLqBkG4h
	zqD6fZlIFdEqNO1xSsk3REHMV/Xopfisz02x2TNJrbK/mxSwb3Bxe9Iybv3iWpU=
X-Google-Smtp-Source: AGHT+IEoRWnrnLuQg0hpXBxurE5BZ9IutZO0Og+Id1NsGJ8nydwsynuDtWvY1KrFlVxU5qM9dV3g/w==
X-Received: by 2002:a17:90b:4b03:b0:2b1:50:cf05 with SMTP id lx3-20020a17090b4b0300b002b10050cf05mr3350796pjb.27.1714345277371;
        Sun, 28 Apr 2024 16:01:17 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:17 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/18] Staging: rtl8192e: Rename variable RxSTBC
Date: Sun, 28 Apr 2024 16:01:00 -0700
Message-Id: <20240428230106.6548-13-tdavies@darkphysics.net>
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

Rename variable RxSTBC to rx_stbc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index bd66df620793..3f8860e91793 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -31,7 +31,7 @@ struct ht_capab_ele {
 	u8	short_gi_20mhz:1;
 	u8	short_gi_40mhz:1;
 	u8	tx_stbc:1;
-	u8	RxSTBC:2;
+	u8	rx_stbc:2;
 	u8	DelayBA:1;
 	u8	MaxAMSDUSize:1;
 	u8	DssCCk:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index d51a0daa9196..91c7415d5a2a 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -263,7 +263,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	cap_ele->short_gi_40mhz		= 1;
 
 	cap_ele->tx_stbc			= 1;
-	cap_ele->RxSTBC			= 0;
+	cap_ele->rx_stbc			= 0;
 	cap_ele->DelayBA		= 0;
 	cap_ele->MaxAMSDUSize = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
 	cap_ele->DssCCk = 1;
-- 
2.30.2

