Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE911A01BE
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106699; cv=none; b=GfFkELRTt4sUuGBbiOYz3FEDwRpG+JUHWpcMfsHj2w3U3kqaOkU7hfR5qFjT/CTKjIpJJrzA2LL1lyHSrS55RVZtN1oBKz1Yqc2lMhydAmNGO2X59/0R0il4h2d510vdDEmqLZe4NPoK1Li3gycfxcdrXUTeZV0Y3/sWAR5iedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106699; c=relaxed/simple;
	bh=TN1Mi9bzpmrZmEcUFREvScqyMugI3BPLN6taax+5TCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUVIjllEpOSBc92ONE/f6bJgW+LxxBDK+/VYOIOrwXa4cjlIjZtxMYgl5xh7hgC8doIrwbl5FPk3j0up9E8ICW+sVde25RrzFD+hLSwmAd1QkzL8Mr2MHtvK/iSbSQ+Rpoc3EDebwD1DX777Gne6GmpuAAxjO538a5TRRD/k1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kp3NgU75; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kp3NgU75"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2469e5117so2241505ad.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106698; x=1775711498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Si7lJja3/soJ+Jd1KnXzL4PE+2kViiucWrKezlO17A=;
        b=kp3NgU75XGVyzOpfCrgdgMAfd8q8lsGmXHAfbu9ihduWpml3aGQuyg3jy4Qa9z7lTg
         ee8p8/89XwYfDxvnYATke9bKvnjHZdrLR37mnIUoVsV+2wDtPYB7ifyksUAXyH0UMKbv
         LLJRNnXhnVZDWaDr8B4S+LSVkUYRntHJyoRzlkRauSDwJ0itbYxExeo5KUXi7pz/Rsxh
         4FtW/Y/m/jvtDQeyvofw01yS8q7o/RQl/mXyGoqKQHn/7BiPluqHS72yXrmnqFrx4yIs
         GLZYBQ6G2KtZo36pI8Ym17rEqfPrq9sRIrmtk8rm62PXehuGWUMLQJnCy8SSVf7TJ5Q9
         wSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106698; x=1775711498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Si7lJja3/soJ+Jd1KnXzL4PE+2kViiucWrKezlO17A=;
        b=MZAHxaVCzASCKuaowM8643icG1d0yOUQ1c2mqkoC9CzTwyGlVbu7R1DjlKKiJ7BQRI
         /CMIhFC1rz3vs5iOtvGfkoqjXaNqPTxHYLrhcFnHvreOaSG1l6EnJAKl0H25owYBZpry
         jGvq795NQkC+Y+hwfPNr0uRJAVIU1bB+0Ljt+s+dvHm5/vYlVeIpVwT96ugsaJ2aTf6F
         6NSzexltj8ExCSAvHM9DWgsLzEonP2OD7KYUMrf3FZ3c2acJu230vga/fay9FGEF83C3
         FkKAZ4Bg5wbYqHrNzcKp3R+T6Xj2A41CIwkchOs1jgHsoegBWCVqtCAb0yUPmocgB5tn
         tthA==
X-Forwarded-Encrypted: i=1; AJvYcCVT/Rard1MXe0RnfiPG7EtyLbx2F3y4YKtAQte1RXI4WGELp6Dry+W6Y8LnwyUVK5D14fCXbQkxHYdfqYdP@lists.linux.dev
X-Gm-Message-State: AOJu0YxTGjylHdoFWQ6ePyNGu1eE38ogZWaA7rBeSNvfshXCQfTg0i1Z
	LY7Miyd4K7mFbZoVXkSh8/G69hkU4q2TuEIoguyBPLTBXIbTevr/jn+bQTGrWOFPs4o=
X-Gm-Gg: AeBDiettH4B16DdrHSiLV+jgizvlhrkugw5/zA7qAkdpxxgJgrGgk3cGoUdr/z7rzIZ
	yZ+26aihYTflLht2PL7M5cX+GpxRATxF0JF1YSi60nfNT/7evGwQ+DKY+hLjxlrMDSrqQgmx/lw
	BStyLqVZopgRc7mT31x/3gxCu9pCAT+cL0k0gaOGQuWlqyL/T47GhXQ/qndiyMVSD1S8K7CtZZD
	4OicFOEroDVlgdkBAOk+2+vZrf7Nj3ZgXvq9QH6puFGRunzPc5TaLupi1qE9h4x9qmvqk1NWOSE
	lXvZpklGCJfTpkCSOnrJMJl0N6rVYoKvQOa0lZ7gqjPebmJW6LqXck9jATxYcTcqsCrcqJXj8i9
	ycdmmJidGNLT4560R+PHKztdXCcGZ7Vb3rP8nsHXBgtv7DWoaJ2uaMnFNN04nL6atdpbHy97p65
	Cv9JE3JIK52MB5AECJ9Rs/TXS418YgtXmVX0JADMTyfpjM5XXRlucC70VTgYVw7f2I
X-Received: by 2002:a17:903:22c2:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b277da7f8fmr11329975ad.10.1775106698113;
        Wed, 01 Apr 2026 22:11:38 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:a459:5c89:eaa2:f305])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d54bsm14652405ad.1.2026.04.01.22.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:11:37 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	k.souta0926@gmail.com
Subject: [PATCH v2 0/2] staging: greybus: fix checkpatch style issues
Date: Thu,  2 Apr 2026 14:11:22 +0900
Message-ID: <20260402051124.101197-1-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026033032-rethink-jogging-f3b0@gregkh>
References: <2026033032-rethink-jogging-f3b0@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series splits the previous single patch into two separate patches
to address style issues in authenticate.c, as requested by Greg KH.

Changes in v2:
- Split the single patch into two separate commits: one for type
  warnings and one for alignment checks.

Kosugi (2):
  staging: greybus: fix unsigned long long type warning
  staging: greybus: fix alignment to match open parenthesis

 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

