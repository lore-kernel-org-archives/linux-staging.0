Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36832550BC
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151118; cv=none; b=HB4HzTRokoESBGlGh17+ZXS6+r4ogxzrlG98LQkhsqvQia7AsgkqLLjuXAfrrS3mcWprznLG/47mkY4/V44g0e4WDBBbtzPMof8tcRPSRTfbgNKA2sXOgdjlwOBHlJwFoVOr5W8R8o3F7fFshefptJivyOvMFdAjLXUwrtbNrzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151118; c=relaxed/simple;
	bh=9JfNG0tTkd+044z4jFaJqkunmng+TdBPIb7IlEomLco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdzmJe8ECJ1xmO777MFaYiHTVXyBnCOJhM5xFFM4DiXEU8217u17UKQiU3Un9yw3YDltP858YFwhWzT9IuUQuUObHZS6L+uTOEDWTsEvKYkIuPc/ebZPl5QVH/4v7qqdV+yz/7ZfrE1w4u+/miEf6Lemk2M6MwuYDio85tiPf6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=EjbolNxs; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="EjbolNxs"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-730517040a9so7471334b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151116; x=1744755916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IorxkgKO3HdtKHUOTo23PvfS93pIvPvComCrtQir2w=;
        b=EjbolNxs+Zy1EhdZ3cMzm34ZazUeL4llZqf1iEOOqRNKb2j2E+DnN6GpFA8FT/COdh
         JvGnZraWJdGC/rGtqwtUdWVK+dBB6g0e1o2zyoAMeqkTogQhVHSEdGvIv6eA3ZT1yLp8
         RVz4XuVrppLO312jNyer+mlE6EaY8oRDGIxhpwjJHGeyJnAMQYZ+rRGbyzeNNO65BfeS
         fWFueigKaCeAxXu96/8jnYMPxQH3qIn1TreXR9GQUaCEFh49qYpE8NkD8Vlh5iJBGE3z
         52mUZPzca3N3Av8nIOYs8DOn1KiXzu68OIqoAwrSxsbFHpmFn0yBd4O8TRiloA8S/caq
         ADCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151116; x=1744755916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IorxkgKO3HdtKHUOTo23PvfS93pIvPvComCrtQir2w=;
        b=VwfIMh3GTWIho0XRIFOeikK4Q4NBKocOG6fgaaeVvO3BC1P+6JXizzkFXiONGbVG01
         vMjn32FK4TIrDiJ9mCRU98L77ypx4NKSieeS6GGKSCozmQdPbFI6V3kVWaPjcuxEIx7F
         zPgcJtZkdyhxqNe3E/lNTe/zgXkXxKqVYEi/8lIFwJtJo0gV6BUZLjZSg8ZSbd8CQESn
         TdpjhhYzXBKhAHssYFv0LmSY9su8MXj3DQnnoclhRWKfGJs9hmNk5uZOmhqdWpBTzdHG
         Qf4JCIhlTCMT4KujRH7ZT/PW16bcNarFz7DuUz7GiPc96rdPnP77IKQ03gePvd0vHxGQ
         OEYw==
X-Forwarded-Encrypted: i=1; AJvYcCW9qI0BdVHgL4KMz1PFSxSOgeuQVUFq+9Rm/bR0GssD6TKnoB+vJqaAuUPOHUOY1DKt14vr6m0NcvJfjIni@lists.linux.dev
X-Gm-Message-State: AOJu0Yy92AhDKC6yKVQDT2qkUJXGZc/geroE2U5o8KNyCCibvO1J75ky
	JdcpJtm4QL1Vf/pvDFyRA4RDBmMJCurVBMM80WJ4X1d/2cg1idsM64faIdbLyFTyqLILB4LG42o
	=
X-Gm-Gg: ASbGncssSDby52EsGlkVLYlSnS58w7mSqc4T6W2AKjBzJzvlrb37tcB2/wB13y+j3kI
	B4IPvnq95u3bk5KNzoYxDrUn1o5Z/YSVIJP0Mz4gRRkqtpFLYouqgS5pqNZnfSjaY3k/DkDfFbb
	MgokIKIDZr82DrZNs7EdAaRFsdpxNVC6QnEcnn1OE0cfZAeoYdhcwbpi/FOsKObuMlAzrBphfrj
	f/Hf8Y2NtFN0bBP02NNgZCPDf+5gZ33tMLDqFtGlYji+EiltARfc0srHR9xCv5GRZYcCdl8VTG6
	h2C2PTrGmLqbi76NQsMVBwwsSW+6RS4Lu/MT8bNG9y8O/I4U9IHqHhLArUK57umImtvrPlKBc1S
	FMY93WFQd1A==
X-Google-Smtp-Source: AGHT+IGnaxbU3fKPUw5RdhpztQ0HR7stoYxmD/se0+wQgNf+H1qiPEO5WKH1/T+a2ZSl51CROOyq0g==
X-Received: by 2002:a05:6a20:c992:b0:1fe:90c5:7ceb with SMTP id adf61e73a8af0-2015b00eff7mr182726637.40.1744151116304;
        Tue, 08 Apr 2025 15:25:16 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b3f5asm11475713b3a.131.2025.04.08.15.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:16 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 06/18] staging: gpib: common: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:52 +0000
Message-ID: <20250408222504.186992-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 711e99b1581a..940ea05ba478 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2024,7 +2024,7 @@ void init_gpib_descriptor(gpib_descriptor_t *desc)
 	atomic_set(&desc->io_in_progress, 0);
 }
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
+int gpib_register_driver(struct gpib_interface *interface, struct module *provider_module)
 {
 	struct gpib_interface_list_struct *entry;
 
@@ -2040,7 +2040,7 @@ int gpib_register_driver(gpib_interface_t *interface, struct module *provider_mo
 }
 EXPORT_SYMBOL(gpib_register_driver);
 
-void gpib_unregister_driver(gpib_interface_t *interface)
+void gpib_unregister_driver(struct gpib_interface *interface)
 {
 	int i;
 	struct list_head *list_ptr;
-- 
2.43.0

