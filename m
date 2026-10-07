Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207653CF1E7
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374049; cv=none; b=YuJ101p668YGlMQ98YUVWwcz0Vunos9wcPUVqFhTXZ9qfsporS03UVOOl86TzXQ+ioi2AumWI7V5f4H3KElLYQUS4Lti5z8y9rs4vXHFWgO7PqeAjU2lgMdcCYCTeCPFKlaC68ciCeYLtk4M1Y63bcLABXS0SEfyTuIVGE+lBBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374049; c=relaxed/simple;
	bh=L730BvsnUN7X2H9iAeghApsz2LI/6U4Th3EHl8jAshY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2DBm6FSSQ+qwpoGLHSSoDEp+VTLDFIb2v/qrzROY4zy1AdRb1aeFTnOLhb3DHz6bxcpzWtFkZtaN1xVrcyozIk+XhMJ0xtnuR+MBA+gjTo5OfT172pAodp6VZZSrcEHVF3AbR15MwHGyibf2ng0AKGFv7q5QaR4SIw73ETPI4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4xdhYxm; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4xdhYxm"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so847374a91.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374039; x=1791978839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJbpfBkccqJoniFuHsFOxhzsQjjxrm9zX2bl47R+6yY=;
        b=m4xdhYxmlRl2S9jB0iH5aDp5PE1bDPurlo+k+5Qe6MFL4MtMQQb2rVgHhyQA855tOA
         899qRzsai+qS2slSlZ5nqfWOaJfJIIZJlE8AgqMXpTJnqWA5wB/4G4P1hqsGjznmPORQ
         rIhycpL9zl5hDLG5ej2mla6qysb0cQ7Uq5N+iPdBjN/PPswo+K1keP4gTpHU3v0el3aK
         9hu/5QuCRjUsNQ7lfZBP7gYOFvEqfwfhzsM8aS/qPLgWEXrQG9TMJf7OKDWr/Wu6KlhG
         YkJ+yXVUd7Zx0EOOaNdwunUUhHKy0w4A/Qr8z/pm/w3fjUsZSzzmACacneAU8X2Msw7H
         wXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374039; x=1791978839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJbpfBkccqJoniFuHsFOxhzsQjjxrm9zX2bl47R+6yY=;
        b=EHBvvrq7Ycw9LbHVtkVVXQ8BXucfNfZTvGhUYCqLoTV4dYwOBmjZn8rHrb4Uinjlqw
         iloxph8p/FZ/7bgSe4h6fvsfXdgbGbMqVCAomop51vLJYNANvOvqE0hNuJPVl8YmQ995
         WqGOoMXl33OZeuMw0aohDcoUh8bMJAxKx4GHCUf2Ru9zF4lfp8xS+XAXdxv7Nr6nDVan
         65TwKidE2Yhzhqr9UbV2g5cFhqCB0Qn0j70/2HIsfiAUWkirTof+zlNU4dcBFSL2z4Lt
         Xfs66VVvaM9lXC2VSTAubsCGx34hSA0M0eLJ7TI0hYYx1m80eYGykbUZPuZDR+sUOC6s
         Yhog==
X-Gm-Message-State: AFq9FYL7RgbpWhRnZDsVVcklM4hyN8lgvjc3iaXzAX3a6s1CGTUWgen8
	CajpTt78P0SAGG5Z9xCMrR4WamLrFoeV/+9fbWmPxQK9umPLAyYF7Sqllid9NQ==
X-Gm-Gg: AYBFou1ZOAnxfAWG/bxlFlx7JVEDSfFBeAxiwaiuxOAe0eaXM019utPVkdrrP70O3Sd
	h7bvEirq7sWffGSs0F0dg6KDE2qSyRZi9cU8jbgzAsQZZcvwl9ACwCCvU/ad2rqy3UPiuARS+Or
	yfSXpuaW+SOLIaPwZoR/3iS8d5YTGJp7ncwPUsTY+gyLUTTeYZj25IxD2/3nZTJQUoPE7aePsKS
	ATaKzPasmrB4Wu21x/9+G8RDvKUZC0UJ9k2zA0qUj6iVHbZDX/1LgxtvmY+vdG/w52wwvpDzi/I
	82QsfV7NgHaMkMcZBZt4NPOx4RZ+faWAL6uDszy53Ag13iSd7x1B1tW15YJ0mPWLAcLL4Qj4uIG
	N+JudjaRjtXy7erB32eBKlY++u5aD6YAotQb9DGktAO/cd+57qvI8QxFm3bzgsZwYvyoJkEgtWt
	1GtATg/Xc++mOWNp4oQGipogarWO6sTpkAv9VGyNBxSDm22IiBCAixNWThoY9ZqYSdw9nJ9JOmk
	A==
X-Received: by 2002:a17:90a:d646:b0:3a7:9afb:78c5 with SMTP id 98e67ed59e1d1-3a8a0ba243amr1222490a91.30.1791374039155;
        Wed, 07 Oct 2026 04:53:59 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:53:58 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 0/6] staging: rtl8723bs: explicitly type variables in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:36 +0530
Message-ID: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v3 series focuses exclusively on explicitly typing the non-standard
'uint' variables in rtw_security.c.

Per Greg's feedback on v2, I have split the explicit sizing of variables
into 6 granular, logical commits to ensure rigorous bisectability and
ease of review:

- Patch 1: Matches packet lengths to struct definitions.
- Patch 2: Converts integer flags to standard booleans and updates 1/0 assignments.
- Patch 3: Explicitly sizes frame types to u8 based on bitmasks.
- Patches 4-6: Explicitly types computed variables, iterators, and helper
  lengths to safely handle math operations.

Changes in v3:
- Split rtw_security.c changes into 6 logical patches (one concept per patch).
- Replaced 1/0 assignments with true/false for boolean flags.
- Dropped hal_intf.c from this series entirely (will address separately).

Link: https://lore.kernel.org/linux-staging/20261006200751.819332-1-contact.pranavdesai@gmail.com/ 

Pranav Desai (6):
  staging: rtl8723bs: use explicit types for lengths in rtw_security.c
  staging: rtl8723bs: use bool for flags in rtw_security.c
  staging: rtl8723bs: use u8 for frame types in rtw_security.c
  staging: rtl8723bs: use explicit types for math variables and
    iterators
  staging: rtl8723bs: use u32 for payload_length in rtw_security.c
  staging: rtl8723bs: use u32 for length variables in rtw_BIP_verify()

 drivers/staging/rtl8723bs/core/rtw_security.c | 68 ++++++++++---------
 1 file changed, 37 insertions(+), 31 deletions(-)

-- 
2.55.0

