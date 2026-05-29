Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B1E3C5546
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048796; cv=none; b=myUIlyJKEtA3pMpUYwf5qdJ54yTkBTZSt7eBC/NkLde5sVfdB6xJr57atVygCkv+PmJiRgDu0b3uBT3mmce1Zsw/TJucZttson2Ghsr8pUxCs04yDOBm3YNx2kHHqaYgNLxutCsSF/zT649juJVm1oOrHdUMrvyPxz4mmIVXHNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048796; c=relaxed/simple;
	bh=r1/MP3K7d/iFqEEOrQPltaOH2U2EWiXs1dvzbnm7Kfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbGEw5bM+ft8NhRKhnTe2ampHzD0pQmnI9f2KzuLLg+LaOjz9pcenZCLl6MkGtevTwo/+TinURKzKGPa42R30Hp8SPH+CDG++BBGN1DhrY9jNLBbtx3Z9k6TWdRcmMM7JL3yyVmNEtWFmXn/8WkhEUiZYWQ5nIOOyyds8RwesV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kojVr+eT; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kojVr+eT"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-bd2087858c4so2439870766b.0
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780048792; x=1780653592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CekffxoO/L5z+BEoOPkerkZfrMQdNEFHWklO2bDont0=;
        b=kojVr+eTWm86+VHShOP1R8tM+yos4IxzWX8FGROU4x7t4lX80UJ2SkwQEfpHtes9BP
         XPSRy0DgfJDhLS7pJgffLHcv+Qwv/3yuPFVsbVgDB0lfhtHn88RLSYiTDU4ToAn+XXRU
         vTpYOOlrYlVbKcxzdFGJNfZfTsJSyk+LZPIUcn+rOtNWj6sGApJrlXpK7Te1aWgmUEVt
         qo8ADbDUVPiVM66R/2nykV9DDwsodoLiKisplSSklIYYWWP2ZhWQKmLcht6T0xYggv2i
         B6YeAuVuwFpKPiS+dTYdNly8v18KaZ4n1kThydqKLfIgMJhxXm/IPpsLrc7RpGXLDmAj
         UX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048792; x=1780653592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CekffxoO/L5z+BEoOPkerkZfrMQdNEFHWklO2bDont0=;
        b=DJbkrKtvvKzpq68SMrpiiLeBBN3zdfHev/JfhBWnhodRkvFKQqFnjlOEuB2eaMUbZk
         dGpqBjbHQW7IIdIQ+hD5jYo8jXbQaFMsXYvaaUoP2DNL5nBXRPy6dg8CsWx133L2sa9V
         3o1nPapMh3cNtWHEL+bNsczgSJUENq44NKa4hdvQJYfw1ObcjNp7LNOym2PotPJOavV7
         afdzq6s5j9kgHUbN6MaEPCOCvmJqSW4z8vaAucrtMAPlfX+IQaQZwRP9K4bGpJVonb29
         t08CKqnTSzgzXO3GY7ipJmgoirwLbHVIOc1DWP7BWYLALTwbjMrAF4ReH8jBqiDhA6aG
         EcTQ==
X-Gm-Message-State: AOJu0YwOlR3C42zGxn+msEqa8WpHyGHAd4lXBBf2arhzTt9bFpmKLJyA
	wIFMwsiPAnZtdKmN4mlD/odfShSTXo7GioGDDovQe3Jhvi4IW0mFGaCT/SorytQu+VXf
X-Gm-Gg: Acq92OHkAfq6Tg2D6L29TbVo3fZoROiU7AhDy2HKuqMEonDgoG8CrOnciMN5snRg0gT
	j1NmI7K3RvoNSan9kl9prqlQt84GdjcyJdxh1tsjTBRWoWk/XnpGySr82MvC1GtPCFJK7afZoHV
	g6NFLii6YMPt7ORdbIDnPu7ngbTuwgdYN1PKiOzhiL2TS69tXv00EHDItYgzJx9ATZrkciIYG2K
	p0tGb230Phh9IFngDH9sTuAWCv/IlTv6QaE6SF30qKuxh/sX1nUIFBqxsLo54WZ6IUvINyO6rB2
	2Mf4Ciz44RWLuD1O6JU0uBdmYBJwBN6qDNEMjK+41yqyFV8MtQdtnzvLaOflaK838zX0CokXQYY
	ul/whh/5Ik+sLSDYhLU9g9U3+MfoJFKdfIHhneg3ye8IbtS43Q+jf/ZghyCNlr6998m0yNMh6SE
	b+aR0XsVPC5rgnDxekVq23KwiG4TUr8kDNje6Llviz2W2SvJtrR20E8ZXcUCk=
X-Received: by 2002:a17:907:1c1d:b0:bd8:f919:5c0 with SMTP id a640c23a62f3a-be9cac109e0mr121031366b.27.1780048791971;
        Fri, 29 May 2026 02:59:51 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de53dasm52479366b.14.2026.05.29.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:59:51 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: fix spacing around conditional operators
Date: Fri, 29 May 2026 12:55:02 +0300
Message-ID: <20260529095503.130909-3-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529095503.130909-1-phant0m.mail2023@gmail.com>
References: <20260529095503.130909-1-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding missing spaces around the ternary operator.

Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index f0aa5bc8a..9d936b834 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -78,7 +78,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 
 	sdio_release_host(func);
 
-	return err?_FAIL:_SUCCESS;
+	return err ? _FAIL : _SUCCESS;
 }
 
 static void sdio_free_irq(struct dvobj_priv *dvobj)
-- 
2.53.0

