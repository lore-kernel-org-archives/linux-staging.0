Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8E1D69C
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709556037; cv=none; b=AIMoEEw9j9GR17+LCTnxnew/eJ0VD5IagJ5FPpVTGvig1w8idJogLM3uy5ZeKj4MQe3svlX/rmjbrEg4rLhPQ+GSqOW5IK6x9EIQch753egiuUwgRKJCM+JaTVSB6MpT0OY5q69RvgHehwGx0Dt24rspJEOudIQTxJCUX9J++a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709556037; c=relaxed/simple;
	bh=+18OyIhYeFYYHVlAIA5hMaHL/7NNBthoYRT5g9fZsIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VLWZb1/t4Q55YaQveifPbweeOpseXLoOEqAuTFCoOX2ENDpjyhKFoYiWMN3+qc5Y/1bAl9dt3FlfiaWJv5vS0YwjNyFeHE+SaXj5wAmLbo11aZwCUJVvu7q5Wp1s4s+xkRaxiN6K+9h7v5Rf4qsm2VZn/1pERLIFkMPyq712RcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHKuhVT5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHKuhVT5"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d269b2ff48so50238341fa.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 04:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709556034; x=1710160834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOaDkA6NTt8YwSnjNjt1hLeIhlfweyyrkr0heJVVduk=;
        b=NHKuhVT5k89oMobp20ahZkkJn4pvtq0wH1KEKbXRVRx26WxpU0KqdHbdiYEyFWODMT
         1goOO8GXWqb/B56nEqcbVd9KuXI6rj2OxkKVSnZl+HT0Kcitp7lVTULWc401MuJ2MenH
         kYvcEPvjA2ErqF6tNYaMvi8U4bxil/SHxbBMC6KMRwZSwSJOUAj5GCmyT5MH2pAlUNmb
         j7MMWFpJpeQfxjYrRQjcCsOv2fbU4TrxJSx0ObKOaUyWzusiZNhGUg5KbmzIlBYThMhT
         sgpFjjMuz2HCU2ALWbsKilxn+EBsWbIrFSlGjkeK2I7YH+fso8f7Ji3mfSUhLTiaL5OB
         SEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709556034; x=1710160834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOaDkA6NTt8YwSnjNjt1hLeIhlfweyyrkr0heJVVduk=;
        b=w5oLBWfX/S1EUE28qx1iCQjaDlfvGFl/VLhgIcfTTk4RytYdujpW3d+29g0h4cYwuE
         sbIPbeWnvaWEUzC6gkd56vYlM+WX8YV1WswamDn48DMuL1ZMy/mU1zeUehFCP14M7YjG
         Sd2EuD/fFFZmJok1fdE5s/SkyR8DCpA/pxbmpuxnRerIGFb2Gw30m6g7lka/YphtfPLz
         6qISX4z4ldDG+IRZFlNxO9kJqmVBTPw3j0QBMRMk9ytMUd/PxptqbOgL/vU0wVA6sqZd
         hz2kQxzCwp1W5OzOXCGDbzuGZN6jLioJO05sTJW4wUgmjyP/gTMWhwDOmV2j3FMKyykD
         cwbg==
X-Forwarded-Encrypted: i=1; AJvYcCWV0qSkFxCm/xNIExoa0jZdprdUCIi4K7D+abUszJdux9ZTrTqrM6Ez+xLPP9ZFWF08ROAZGTYvXEqaLHQkrgQPAvJNRUa2MTx/iEHLYg==
X-Gm-Message-State: AOJu0YwCcb87XI/6WEtE9mcFC5zClHt3j1LEmnXeJPloRWw6FdlJ4bAU
	7ahHbDZLVdTVd+xPyF1z8puixJ2PxMlZrc1KsRhHw1jr6CWiN9lw
X-Google-Smtp-Source: AGHT+IHGka0WYx73hyjaUZ9W/GCAeFT5fDLNh0yJCfJIhOYBj8kE9wA3vag0NcelFMaeEdo+4+PQ1g==
X-Received: by 2002:ac2:46f8:0:b0:512:e8eb:f978 with SMTP id q24-20020ac246f8000000b00512e8ebf978mr5154377lfo.4.1709556033856;
        Mon, 04 Mar 2024 04:40:33 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id dh18-20020a0564021d3200b0056760e830f0sm651747edb.81.2024.03.04.04.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 04:40:33 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	philipp.g.hortmann@gmail.com
Subject: [PATCH v2 0/5] staging: Fix parameters alignment
Date: Mon,  4 Mar 2024 12:40:01 +0000
Message-Id: <20240304124006.26819-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2024030317-multitude-pelvis-bcb2@gregkh>
References: <2024030317-multitude-pelvis-bcb2@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello!

This V2 patch series addresses inconsistencies in parameter alignment with
open parantheses, enhancing readability and maintainability of the code.
The patch series includes updates to multiple files in the staging
directory. Each patch focuses on specific functions or sections of code to
ensure comprehensive coverage of the alignment improvements.

Patch 1 fixes the parameter alignment in cvmx_spi_restart_interface() in
octeon-stubs.h in the octeon driver
Patches 2-6 fix the alignment of parameters in various functions inside
card.c in the vt6655 driver

Changelog:
- V2: Modified subjects to be unique for each patch, as requested by
  greg k-h
- Fixed the warnings in the patches as suggested by Philipp


Dorine Tipo (5):
  Staging: octeon: Match parenthesis alignment
  staging: vt6655: Correct parameters alignment
  staging: vt6655: Align parameters with parenthesis
  staging: vt6655: Match open parenthesis alignment
  staging: vt6655: Fix open parenthesis alignment

 drivers/staging/octeon/octeon-stubs.h |  2 +-
 drivers/staging/vt6655/card.c         | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1

