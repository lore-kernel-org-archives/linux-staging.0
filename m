Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D432F12B3
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737296; cv=none; b=HzwbeeJ4ubMRZES80gUUQHhwE0qe8dKZdy4LWXoRh7YQG30nXRDXpfno9LI9mLZbcpRTNoDsTGcOa1BW7DJ+3qyS/b/bTwsq/uFSs+HU8x5Hv/ruEoTkQQNUJ4gt6JJL5ZE9i5vV/BD8B9rocLtQQBtBSu031uVQZ4UbV0lDiGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737296; c=relaxed/simple;
	bh=sU25cQy7XTnbmHtrk/z815qpaWUdmYcJnn9qEEvbQnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceJJDBVcnUk9gmcQJNUw//NdTilm4gmGYNpyKaDe+gV0L1bVZEcocT0Yxvpsl5FnOWfTDiyYgiqvzE0yjLXYvKo4LtflrDCD8pYfeDkMSxgfu+YUt6AoKxxw56dhUkTWqiVRfU+4Jb82JyiOGxjcW9MXOk5FxK+nezZO8EGXGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8UgAJ2H; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8UgAJ2H"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fbc305914so2861127f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 03:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768737293; x=1769342093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md4zqsrhPtC4Pn78MMJhfjmDzauSiLfeoWDEpx6MXzo=;
        b=W8UgAJ2HdeaaNUQrPsdgxBVagpqfpIEd/EK4vSWZv/p+D+OSD1lseJXu8vysMAoVTe
         Cs8/LgenDx6ReoebXFLdNqY6GUIZmU5qcNE25UGCajQhXccEf6XpQcZUMczKtTqtR/Lq
         GTzbhiTitppqoaAyzcHG8Cko9WggqtBGP0bbTu15YBUk2ZW/h8k95sb88ADcxT82ZlO1
         yXutHIG9lJ+q6GxUs0N9Zi3iomaz4dvdJRZpn5BR+ZIjlNJochmzWTc/TCKEDus/W5v4
         SBMQ+YfhK2WY8PpSrAkaUYj72sx8Lh/Y+h6/8DNZAMAj5BvTnoLUO73zxtOlWVVT/6cu
         1+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737293; x=1769342093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=md4zqsrhPtC4Pn78MMJhfjmDzauSiLfeoWDEpx6MXzo=;
        b=FvCs0Cby2M2OAMOxt9G0tIEZ2bFA3M2qeIc5DkMgJiEhYmYH5eb//sYXg95OSKnU3h
         NdHsCcrHKxKsXk7gBj8H0PhzKXxoQ8qAyIpYj465sEAyqR98oXrUNi2pFU+E4Q/q32EM
         923EUevepcgEYM8Uo5sBBb4lKUJ8bC0aXyliEorhSWEVO3CWpn3//DwlR59oYHjcF0X6
         LqV7IpaV3V82CpUp+4Gx8K1Sheem6gZuUhNPcjHc0/QDgJoyTxECfEk59d9Qh5JVJJK0
         aiK8uci7EqVs+oIRMBsPambzvgnWl3ZN1HlrCg1QXNDd4QhRdUZE+UoYbvnt1oVSrtwM
         Q4ag==
X-Gm-Message-State: AOJu0YzyTgm7VfPYKqZjkGDTMHCZIrGH9gjwRH1RZgUc2B//SCHat/+n
	WFl4c/qLUM4DlVyxUkQEgH6dT8SaJtmW6qcjRU/o+RaHdcHKP4frz9kUfiRBsX/2
X-Gm-Gg: AY/fxX5o9A354GZg2aKi53uJnflZYkPZoqO/K75oG8lt6Q3tWWCSsJdkx0O6Byic7vV
	Y5rlKWKYLox2mp0e44YsurJCRbJ9TWzX+6E++e86K04/BjeZVjGzF4Vs2mRcV0VdiySbv3w6fJp
	rf3ZC236TuVbu3aEj2M55aONxbTMwd9ggnkAkraH76qS1Vb6z3VfYKUXe/8p+b09cVWb/OPh8k2
	z2uTwegGEI6CFmUCd0fUSdByzHm/ezJbnmKLQqSP0MPxrG36bPeUsFrNWNgei7DMiTd4UmmrgWg
	MqUEM6iu8mDBWQcNP3kDUJOd9nOB8znlpUhJ3WOlFbwrbJNpdhj/4y31TZaXW10TY/HqjcA7YKj
	04vgxgufsdTYhlU4S4jmtFXKROCbkvq6TIs+bq0fejV8Iy5E33UYNugbvxFEW8fNND9n9p5Xuuu
	KTxrzKRRxZVkGKG/dLfq7FB4CoJXgHuUQ/AWVeuKs=
X-Received: by 2002:a05:6000:26ce:b0:432:8651:4070 with SMTP id ffacd0b85a97d-4356996f7ffmr10539265f8f.10.1768737292870;
        Sun, 18 Jan 2026 03:54:52 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm16368686f8f.27.2026.01.18.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:54:52 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: fix multiple blank line check
Date: Sun, 18 Jan 2026 16:54:43 +0500
Message-ID: <6421646e774d5a2d705fa5d80d82425d2210dbee.1768736361.git.mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
References: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl check regarding:
- Please don't use multiple blank lines

Remove multiple blank lines to adhere to kernel coding standards.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 1 -
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index ab5af96c335f..988636a16112 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
@@ -31,7 +31,6 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		pDM_Odm->TypeALNA << 16 |
 		pDM_Odm->TypeAPA << 24;
 
-
 	/*  Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index ac5e3d52b3bc..1fbb71149cc7 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -31,7 +31,6 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		pDM_Odm->TypeALNA << 16 |
 		pDM_Odm->TypeAPA  << 24;
 
-
 	/*  Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
-- 
2.47.3

