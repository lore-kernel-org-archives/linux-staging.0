Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F81D69C
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709556054; cv=none; b=nAKQkhFF4nFbBJ0YgSikcdbthiWfyWzTrKCtkhN3ww6wSnowgFxssT1FoQIq7rT0+nccU5LIjldLeaf5Qex9pAeJwgG0rYTnKR8EdrZx8Whe4NLr/4k7g+TrM7UlneEShvrZXs3PdXAQLABWKAgFHophsfYfouNHVYJjS1g7qbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709556054; c=relaxed/simple;
	bh=oaVUiTiyAVrgaCEGgb/MJty6p7qhn3KDn+DfNszTdks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NRe9hte5hoT5pIEGDvM4XA8AwoZBNOQlMHJ2WxcUAPHJS+GJUET0ejXrZFrSQ6c2FO5D2NjwcQWaev6woLAIVnP0YEwodFXub95c5rvjwWeCu5Bbg5CIP3zYmxYHoI6myGMtjUD4SrB/CEpfTRDLAns2bIb+StEr67sl2TkWLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHScds0v; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHScds0v"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-565d1656c12so7761869a12.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 04:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709556052; x=1710160852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkvXYX+ONENv8/j+tz0gO2keTFuryyaJ4d+HnaqfB4Y=;
        b=FHScds0vjcKZyWChc9iECYEUfyiEibey7v/jdikK78cOuYDcFv8t9dJqA/QDONgmk/
         U+ZMgoKv4irB5O9ZPsgOHv18hLHHBeytk7eOOOoBIir+oK/1yElPNMGoXqm9j/dqO1tI
         Hdf9V3ydF9o3n6OJoBry3ozXRCmtWUXBXa6DakAgkEqIf54OiCFxPZEdlRHj12DnZKpA
         xJWFtyRvnXsg40Z/WZFy3GZLIB9yi3owvPePWFlEw/YdterhmNNJGQ5fz0DFli70jsNZ
         jlyj31qW5qiXgEmP4V2tTx+sjBIKLDYwMFiT8UfDtMKIS8u1hr+4Q0z809tK3VZHLg7A
         XAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709556052; x=1710160852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkvXYX+ONENv8/j+tz0gO2keTFuryyaJ4d+HnaqfB4Y=;
        b=tYq47QGESCA7fmKTzUR+dZ3712iT+vqYrH9mAZEzD+4vuFeEojAZTu0oLRyTGx2R4J
         q0g6HV4vczBR30YIBCbA7RIZPF/5siwNhxEPsM8vA8iAgiTxnggYZa6LGq4MLXKuRfix
         QIshjEn/bjMmGRjXDAYXTPZ0sQLMDmuswD9EZHe/uULL/53zLSk5t9MRplQlpwmgDDtz
         9rUgxzlfE3464tJRpibEbrWwThuibIEqV9cY+m091aRA3/4VhV4LJjkHha/sqRbGWdu8
         QYob8p3yiLrtUVdnTQcRfOKk8eSck+Wj1i9G3+1r2b96QVpCTMES3zfsRSVMwM9oCVIj
         AQmw==
X-Forwarded-Encrypted: i=1; AJvYcCXUrxTh9yOANe1mGCbws4/ckSEgG+JDEWQ1heCu/o415UNhGOEtwKXaLzo/RW0Ug7knL/Vydn4kg0EXVt6u77RAetHCr5YtXI4U2k1SWw==
X-Gm-Message-State: AOJu0Yx+q16akTGH0QLp6T3iLU7H1jEb9hZ+QZtBO9Z70dykzjoePlZ4
	JHf4EU1Q2Pdp/jjMca5g0sIBbrH0JuzX8MSn2571CmLyzfOHOTKZiZjU27xds1xw1g==
X-Google-Smtp-Source: AGHT+IHxDK3c4r2qifja9fVFO+tJX/+DSAWD4DyD7AjcZFkvtUiQAsa2A1U9770JJf1HU619ZNxYZg==
X-Received: by 2002:aa7:d68d:0:b0:566:f3d:d520 with SMTP id d13-20020aa7d68d000000b005660f3dd520mr8147327edr.15.1709556051670;
        Mon, 04 Mar 2024 04:40:51 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id dh18-20020a0564021d3200b0056760e830f0sm651747edb.81.2024.03.04.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 04:40:51 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	philipp.g.hortmann@gmail.com
Subject: [PATCH v2 2/5] staging: vt6655: Correct parameters alignment
Date: Mon,  4 Mar 2024 12:40:03 +0000
Message-Id: <20240304124006.26819-3-dorine.a.tipo@gmail.com>
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

Align parameters in static void calculate_ofdmr_parameter()

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 36183f2a64c1..77662056c52c 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -81,9 +81,9 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
-				       u8 bb_type,
-				       unsigned char *tx_rate,
-				       unsigned char *rsv_time)
+				      u8 bb_type,
+				      unsigned char *tx_rate,
+				      unsigned char *rsv_time)
 {
 	switch (rate) {
 	case RATE_6M:
--
2.25.1

