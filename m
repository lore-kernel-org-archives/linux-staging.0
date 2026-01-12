Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A4255F2C
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214851; cv=none; b=gtjDK6G/Q3T1n5DIQ6tNVGB8R7K2OMvdi3X6mAt6zWXdwJGUlzOBHccJ2oH1O460cSzFGeALd2xEsei00lsNqnzMASUr6JRIRevQl6khoQhI7v+iudiX2rjxfJRIlkdDNjLcWuXTn0ZFCR2gzY/+Wm+kKveDHCXn7QH5xjXu/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214851; c=relaxed/simple;
	bh=tQo52XGitVkqfZu+wh0TXTbBa051RptsEuGzPjdiz7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TagUl/jf+4fKAEBPbfjoQstW4CXfHdkKLIE19ieCfMA/kWFHVobiiRdRenIK26kdcJlcjMAC34zLjfAkOlDnuFWhXr/gfacULqG6G+ge0yzBHsD2Zq2/GoIuOzo1LX5slbZB3EPaMVOsomjFiP3OW10EoMf8CaLiOeXKzsKiwYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJlLlqlb; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJlLlqlb"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso2409124a12.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214849; x=1768819649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDsqlGKTH3E2tGBNnPJnaQmtdiH2iABl9ZwhWMkRvTg=;
        b=aJlLlqlbQNXVfndN6I4eubnqGejLYwTwf4jW6b9ibUG7ELLJovfmE4u5ftolraGm5l
         Hfc4LA834qcNpRB7B09jhwaeoHiib7wbAKd9+5tamciTwazoAi9YixOI2ZazJP2Dihc6
         I4GVYZ+1D8gcxFZYNf+zMn1h5ZtDe9P3Ud3b1dHuJGKqYvk0VHD1iKqQdy0MiMjE9Yvn
         98bbxo7ffopOvygqEoRZlv4kSWMIAxgqqhABwQaDbVsnSqUF9uW0wPgKJ67bXx2jpS3a
         chLY4HpZKgqitbaUyhGHOezumeAyoMbQyk1kMneBqXm9UTuv/WkufC8aoMnTvtAH5ILC
         knTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214849; x=1768819649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDsqlGKTH3E2tGBNnPJnaQmtdiH2iABl9ZwhWMkRvTg=;
        b=DYgX12NprwCoJbJMfg23R7kMdkoxomgCgWhIz6Qt6ixCaRmcJtrvfWFIRx8sGwdFIH
         H0WlRggV+0wugXMnw/uW6cASaCsInGEmFokCJcIc8DBwQTCLZDxua1A/jUC34nOb1bQ/
         ZrYpq4RmoY2oZ6jyMgBfM3hLmQOeIrh4TrPYLse7fo8nAcsz2dBNKcQMLQj2nLGmEj4W
         Xb68ekbgikQOpAOcapajeb2SHBdyOI8acg3Q3M9gMv5T5o2MVFCjICjnID520g06pwU6
         hRpMboiG0E4Igyf/GcVKm6bmhf+v1by+/4bCOHmkjutjgib9DslACR+v/dCmsZ92vW7k
         p08Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhpxgo3IZGAa0w3bD67mEPEi44Lz+YTw7V7hcRvcKKcAidZkF+t+jTicRf5+tUFX0wdkhTNCo9n7ntJk5r@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/URB55aJhpSeMDiEtMyEwQbFoa9PZ4PBGZpPk3YKXLrmb9OiQ
	Kz+0ummEFZDLfp4TVwxGW9e9QTS1HLk6CnJJ+PEc6WGJiRFVoD2yQtIi
X-Gm-Gg: AY/fxX5+WHyaWC4jVp3Dn+FUCJt5+ae9NdY84KN/5mzz7Wo9f2tgndEhT1SgqZyItgQ
	OOFC6wUf/lZM72Gk1VKVuFsCbgSIF/SloopkS54SxAK5t10fwAGO0zABzRSpsVbRvdjrHeUaJL8
	SqL/kfZ8aPGFP756eQlvKEvV+sfQdqG3EyUroeKVmw8JIfoguS3/lwT9dzTq+FfbyqfhFjwttEl
	tyAL/LqdkEevgIPeN6V3pO5+Xdj1NNHQYQQsvYsdakQ0uHbl4F0JS/qRnPley0VFNN+gEw1Rna9
	e9vlMaEw5PU/bl+zgWXFG5px+RpG9cb97IKnlmREwPgwKdLp2ycxa6AJOSjFHFOqFPUV08a0Fye
	X3tH+wE8RW9NRpwQGrrKczfB1xM3iSaEra6VQZMHLHuT3dn9rJWbCoIMXpeNKl21m/xsKlDFcn2
	7JGdpIBwRdCJbwDgSHe/nk
X-Google-Smtp-Source: AGHT+IGnF0eoHGBJqjo6nEoCm1KQ/5WFNW7Fk4eFA9gx/ruY13zVqSo4Rm3ULs/5cqEq92gEWajcKg==
X-Received: by 2002:a17:90b:5344:b0:33b:b020:5968 with SMTP id 98e67ed59e1d1-34f68cc2a4cmr15413769a91.21.1768214849334;
        Mon, 12 Jan 2026 02:47:29 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b10a44asm5686116a91.5.2026.01.12.02.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:28 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v4 0/4] staging: rtl8723bs: coding style fixes
Date: Mon, 12 Jan 2026 10:46:50 +0000
Message-ID: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of 4 small coding style fixes for rtl8723bs. Each patch is
self-contained and focuses on a single logical change, as requested.

Changes since v1:
- Split the original patch into 4 separate patches.
- Each patch now fixes one coding style issue.
- The previous patch fixing the non-kernel-doc comment has been merged
  into this v4 series; the separate patch is now retired.

Patches in this series:

1/4 staging: rtl8723bs: fix block comment style
2/4 staging: rtl8723bs: remove extra blank lines
3/4 staging: rtl8723bs: add blank lines after declarations
4/4 staging: rtl8723bs: expand multiple assignment into separate statements

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
