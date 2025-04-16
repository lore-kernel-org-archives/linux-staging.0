Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BDF22AE68
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835584; cv=none; b=NIL4k3ORXhjzjfUTZFwZlrsjXzOCA5aEJElRcu0drvMUtd8NWolZyi55QwArcd49wubWgAM8zXEkLFLBEwE3pu2KC0IDHam4i/z3D0nV7sIDuAwLR5tLz/Pb9U6J7B/fbTPnwM8y1hHhdNPJYdmeu700Ddnq1hrf1ETSax2tj5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835584; c=relaxed/simple;
	bh=cw1A6jtt80+KbkkY9ijIicjSa7d11WKaGvNKS0omn0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AAV/VlWyKWAwgtuVilpfiH92Oqefvs2G2XFPaP6Hg3FSkTHD6m8Az3yRHk705beQvHpqbP+3kqJOKyuxOUrPbunGtQViqUcD8Peq0oomtCVGKzSiwPv9Q1Mt46EwhPtYed1ppvTmQkolylPfcHuAT5kUqsS9S9hL+f3uLHt7y/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=J4Q1FB/x; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="J4Q1FB/x"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso16309b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744835582; x=1745440382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwX2GbOz6orBrrrw7U3jbq8G5nZrTXmOs7TQ+cC4VuQ=;
        b=J4Q1FB/xD3327rLYu7XtUit3zKN6K+9qlR8jqD2ub8z3Xc6r4gpnf9fY5GWNTjYzfF
         2XeHS9xhxO/w2MnV3MFib4Uazi+nNWf7B5vaWbQXMOIk5wWvqLrUIWjEgp6yVmXuBDCT
         Csrjr0gaUrUOLEYfEaCBEguMusH4i4alJ0hymJfBwd0n57he/JzdkA0Hmhkt1vtezASS
         x4t5zvWQ+ByGa9tpCyvka+FrpRbWu4FBXJAd4CKayY55wmxPGrs83BvUG1iIL8iiMh2u
         iWcFLm00HSlZpoJbUXaZgWdLgLTpeoj2BozvJHafxoMLKy4f121+/ODIO0alUecgKsFV
         CHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835582; x=1745440382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwX2GbOz6orBrrrw7U3jbq8G5nZrTXmOs7TQ+cC4VuQ=;
        b=uOzyavWKKxM1nxkPmn70rAWeBwmqZfzubM6Y/EvLT4sg676pJKHSQ2ohyhvP1rEL0a
         QVWCi1t4xNlMS5izwJYOQwCMvjjSEd88lhVlOb00II5U5nRBMwXYch2V692eojnqikcJ
         bdar03sy9ccGhg9LwVCJz3tu/nTqDUg/EPv/xiy/Lp/VietvI0Uqc/bziMLfEfZZ79Yq
         4xuCpi5Q3IRiJbDH+D1P0BacST5yxjUMEDtjpaKR3oPdtNMnG2EqoTvjM2DAtMwJ74cy
         3WoZwy9UxGar8JnALz2ZVSt5nxTYg40+DFjlyfxnWazoz6zxxDIPmAKP73yJgapsWmxl
         spxw==
X-Gm-Message-State: AOJu0Yx9i3wGv/EcyfSq7z7DYvAPVywHkl7qxan9HeR+b0DoP2UcbDzL
	J8mkyssJgZZ5kkLEfbjxDKV00SZcODwCuh68nok2bXtlEVc+wuFQNMu3mtfTiA==
X-Gm-Gg: ASbGncv/naV0qYtAne9j/bt4gCDyjyD1FXbWZRozKZd7pXhHWEf+M0gsBoAyJkBIcVb
	FIKYtslbVlfOraSsnI2zVrj54BzVXq9c9sAaPhgoqQ4Xg/9rF5J9VhwfEKTZX6VWI2KkSKdsJK4
	BLooCOKdjPaZEce0ruBzY0yDdP5U2uB3bXnVqj7oJKhDdrmuht3UdbccuWO53nbt2guekGiylUU
	5moPKR6oHUMAYdv98xXEsgrifvjLCdiFnHLQkJb0YhuDFAuE7pzJgIYixajK0WYMlu0v5dz4DXj
	NkA6+8DrlMj3TLebVix9GG5sAaoSMyBsqI8QHISNFu8Tr9IFL8ViqfWfS3tS7voT5hgtybZwDOr
	eSJGR/w==
X-Google-Smtp-Source: AGHT+IGFQ8nMvumHosewIBACUgnMNIgsrPuU6yTSeH34D5zMWZDqWn1T2p7/BJZwudwDulRwOIDkeQ==
X-Received: by 2002:a05:6a00:4501:b0:736:3be3:3d76 with SMTP id d2e1a72fcca58-73c267d3a27mr4635945b3a.17.1744835581982;
        Wed, 16 Apr 2025 13:33:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e520sm11202487b3a.132.2025.04.16.13.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:33:01 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 00/14] staging: gpib: Adhering to Linux Code standards
Date: Wed, 16 Apr 2025 20:32:58 +0000
Message-ID: <20250416203259.7862-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a remaining patch from a series of 14 to clean up the gpib driver to
adhere to Linux code style. The other 13 have been added to the tree but
this one requires a v2.

* Patch 1 - Fixing CamelCase for constants

Michael Rubin (1):
  staging: gpib: uapi: Fix CamelCase and IBA Dup

 drivers/staging/gpib/uapi/gpib_user.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

