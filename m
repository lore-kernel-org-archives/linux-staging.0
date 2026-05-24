Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828E13911D5
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 23:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779664543; cv=none; b=AsxkJSLJluKcCjdhBsKxuIIlL0/Lpu8fkDr+190V7l2w2vzdeSQgXG1MypSag0fKNVitfdC7s59A2tsdfpXOgM7dmLZ6kHFNFLQ6iZ3jHJf2uuLq6V9KQBA/xzObFlrcAy4X6YFvlilI1P0SNGKwThvFtfjZo2xvFc7jiZyIf+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779664543; c=relaxed/simple;
	bh=zRsIIkYWxUAHXaqjGccQjZnRNvo5X6ZRqEJRag/CxMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UaDngoVa504aLVpC0C9o7FpkAeQQXj+E3/2raGd/nywiRfk1OD4tskJ0/DQETTccDLMM1f2PXju0CGT4lkgQEfqhZuAyp1Kac4ks2Yn/CJJiXIC8JXP40hrykd3mZ5xYvE2zra2gBbaSSSXmw0CD+qYlW2Glj08F2+K1SeW3kIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXLogmUG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXLogmUG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso13767305e9.2
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 16:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779664541; x=1780269341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N06fKJaRN8beCU0hQMVMkOCfMbF5Qshtu1L4HKr1oT0=;
        b=AXLogmUGaOq1Q5jDtKZsPw+W24VQz+3l1a64XIZUN/tWDtyGNkIxBddGa+OMuGDtIY
         yhsxkq+BJzN28aAwNWMXVfT41v6qMf87N2IWsqSgKG8PJu9z2KoQN18pt7RaXHTFMpb/
         NXKCriSw/nDXLYg2QlpdKPUztd/Mdni7/SXlfGRWgDl+pPzryxPRqBJNa0jikLLUdB6s
         cZbDJvRb13ZOwRFv/7Wie0BwpmqzKHprPlLIwil7ZEaFH8d4nuHKX98bZJc+jBphIrfQ
         EDBwMxz9kZdeEGLiTP07EhlIrkWZs4R90GmPj8i4bGD2r583UDmcUBnJhufCPBTZsvgr
         wamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779664541; x=1780269341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N06fKJaRN8beCU0hQMVMkOCfMbF5Qshtu1L4HKr1oT0=;
        b=oLKvLlEVvwkJmPERXt8Qbo0cEiUuF2Hnny4X3PmeB6EIykSWkqGBDlGrwcPXx3pQkE
         a8SHwKuRD0xzIT4vLOW4UzicNfIFzL0HytTETyERZy1vX/LeVN1xc5FpzwvMPnI8GL94
         kpit1ppBPs21iPLAPZABCyrehhTGqK+IEegodsl36SUiGAtX6me5ItXeBnFsqD5TcVBu
         RZn7nQmiOzSt2QzfuRAiyQiRK7HU26dt27g38Lo9bbCoKoJtbPVEj5TiWKSxGtfQPkBN
         xHhBU5r7fzbFOxBG6aCPhNCb4MFxhO0iZLadzg4Q/HVmxLXlhFHOArWWE22h5C4QzaXk
         IDMA==
X-Forwarded-Encrypted: i=1; AFNElJ+FmuxkMV4DCa7MERdiDQrAcqyl9GDQwMRav4EjTLzqdDntiKxXPl9XmcSO4ODoFla6A0Fa9tb2TIXq9YA3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4PuvnCpWu+V/xixGN3yuSwb57VeA/EIXSUHZ1b779gvR961gH
	CaX04UsJfUvxr0nrhO+dljSwO+UfQtF95WdNSxSGV28tlZwG3bBcHfIl
X-Gm-Gg: Acq92OGffO6LzYq92TNerOBJ8XQtygKcINTcodu8/hNVItt71XFsvSyxQt4eWdXdiDx
	QVp1+kAgaD1jPym/MqrUpjN/dBhGQr/Aey14bGT1JcVHp7TWuaAQ41uph9ViY5nuAJ7I8ptDFfm
	WdJOAyOawHumljf5lAtD0LV7nCudTwpUELdl31rrBhkyHYHjoEMNPEmZoO15z8Ar9ho3OpbESk+
	u5VpTE6RhbN1KnudAspLdqjJpjdB3B2hrW9IZfp31CkMshIf9velSCc2HikB6hlO6YS9AsbzYuX
	jS+6w1aqbMpJrTZsWpXdSUKOKMsgcE6RI9E6Ncen82IMtqAjjqiysJKrjiuiVAE3g7YnEFOwLwq
	p+M1QJ3NBaGYV7T1BXzegMET7tYkRHrSKh7DY5xQw7/sNJ98FK9LVNSFAq+IBOngtw6ugMU6ojG
	k+MkrKF73Q1etZAGrucH39LEEDTuN+2oh5B25i4NPmN4Uf9+tcMmXWWwYFZ5c=
X-Received: by 2002:a05:600c:a011:b0:490:50ff:7943 with SMTP id 5b1f17b1804b1-49050ff7b15mr124483445e9.5.1779664540796;
        Sun, 24 May 2026 16:15:40 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042d081f5sm93600515e9.5.2026.05.24.16.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 16:15:40 -0700 (PDT)
From: Michail Tatas <michail.tatas@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michail Tatas <michail.tatas@gmail.com>
Subject: [PATCH v2 0/2] Staging: sm750fb: Change camelCase to snake_case
Date: Mon, 25 May 2026 02:15:36 +0300
Message-ID: <cover.1779661132.git.michail.tatas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change variable names from camelCase to snake_case
as per the Linux Kernel standards.

Michail Tatas (2):
  staging: sm750fb: rename setAllEngOff to set_all_eng_off
  staging: sm750fb: rename pvReg to pv_reg

 drivers/staging/sm750fb/sm750.c    |  6 +++---
 drivers/staging/sm750fb/sm750.h    |  4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

--
 
2.43.0

