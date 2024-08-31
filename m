Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4828B176AD0
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725098925; cv=none; b=hktgfjwUfl41tCL2PNDH5MNV9S7Uiu3rxTrnJJ1UVkj/9JJjveHdb2yiQZH3SIFx4o2Zgm5LyhAZy9SQmcZmVRsoUotsuuiarXxdNaLXEIhB2whDlUkKO2EbRRMvyYfzMv8IB+i8eXvjoHR8cZL67PuBsTvCe8Fvuf9INzQvBrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725098925; c=relaxed/simple;
	bh=cY2o0UYjDgyCICYRXstYHRj5B2Xr5OU1iSqLAKb1/Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwyccqkhLTeJzGMNxoVK65WPX6IADiw8pNZbLkEPxL0gMrHINXsfuO1sM1zuEIabygMznYnAiHa0tVtKSkN85FuIhkhnlRWD06P/jRWx9A0Kd4/fd0RKL9azJTNJY/Ox/nIpoGWKbdiNIQHjPLSs/MmsZ0CV0hJJfu8HRG8PFf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed2mo96b; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed2mo96b"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8682bb5e79so322820666b.2
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 03:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725098921; x=1725703721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7H9JeKDAqJKz9ZBN3dXy+SuB9Qo0RI3iNgQzrTm7+U=;
        b=ed2mo96bmrtyKwinc8eulr22a1IsG55OmSHe9XqQLKTevFw/Bgt8FRt8d/j+CF35wT
         b81xXfYO5280kj10YiVig83cdGHZNOVR9q3zoDccdonbtZFNkzDaX1tsVzhY+mqOvbGw
         eO2BdZcnj6ucUx9tKhyNRvvnqPS0YXB3kjxmOqtYqftIG+ROU/bYv3IyZ67zMqniqAUX
         /hCzWpLQMhz53amKy9zQl8zDycyew1ixnGbNMrFrkxB4DIo+isM7wbJbe1j5/qPKsN00
         r1O8hn9/uktZDjQ7g6fydIbqqOmH4SE1a/hlKSPM7GE+u3yl0n87r56vsvY84gNjW06w
         5shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725098921; x=1725703721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7H9JeKDAqJKz9ZBN3dXy+SuB9Qo0RI3iNgQzrTm7+U=;
        b=gW8oFQjQsiNWIuyQoaSHnWdvBHNAMqWdl86gXLlY+1NgGPwc5OnhNJp72e4yOlnWQB
         UwsPPc3Sghi9ZftXn7GCIndPI7QA5yKZ2h5et9J0/kkMrcYzg7hnwcmQ3DiY3PukJfvP
         OXBXTXR2MINaVHtv4Q7kNXDxTLjbr7Ec+1v67mcEaMuIQDTat8IBJVdYG0wX8SwGEWrA
         ipXoCGhyh3DVPfTX00abIZFs77N4fxolU9vWFMWNeZsIX8Yh2vNFKfSvfq6O8cO/6IBV
         AVkZNwP48kOzEzQMNfqVqOON0gPZzvscbDEpL+yl9YHOTp83QbBVUqFsBNO6IGYrgktK
         UaMg==
X-Forwarded-Encrypted: i=1; AJvYcCWRxHKmCvfRUTs7oFcykGQVqWPHks9QqoDJ45JVPJlt75UpbRSxvLxMef9lXpAPGjTWahCnfSwGgmz2hpMP@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ZpKgrVqpkIE4osK7ZDpBg2QVgv0MWxzeUZJugPIz/nSZRMS8
	A2rBD2Tl01lkSAVWSzaXPFNhAmg7enY8D43QQPyAoYN/1L6jwqAF
X-Google-Smtp-Source: AGHT+IHOrDxSup4u50Bd3VqTXPrAvwMsYNR71+rzdrczOx4Xxg0gfqvvk2UHVu3qu/A3M2ISF+d4jg==
X-Received: by 2002:a17:907:94d1:b0:a7a:b561:3575 with SMTP id a640c23a62f3a-a897fab7ddfmr639638066b.56.1725098921158;
        Sat, 31 Aug 2024 03:08:41 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aba11.dynamic.kabel-deutschland.de. [95.90.186.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989021973sm307444966b.82.2024.08.31.03.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:08:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: rtl8192e: adjust size of rx_pwr for new RF90_PATH_MAX
Date: Sat, 31 Aug 2024 12:08:06 +0200
Message-ID: <20240831100809.29173-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831100809.29173-1-straube.linux@gmail.com>
References: <20240831100809.29173-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local array rx_pwr in the function _rtl92e_query_rxphystatus() is
always accessed by indices in the range i = 0; i < RF90_PATH_MAX.
A previous patch changed the value of RF90_PATH_MAX from 4 to 2, so we can
reduce the size of rx_pwr to 2. Use RF90_PATH_MAX instead of a hard-coded
size.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 519cad9e1106..5646bd498871 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1159,7 +1159,7 @@ static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
 	struct phy_sts_cck_819xpci *pcck_buf;
 	u8 *prxpkt;
 	u8 i, max_spatial_stream, tmp_rxevm;
-	s8 rx_pwr[4], rx_pwr_all = 0;
+	s8 rx_pwr[RF90_PATH_MAX], rx_pwr_all = 0;
 	s8 rx_evmX;
 	u8 evm, pwdb_all;
 	u32 RSSI, total_rssi = 0;
-- 
2.46.0

