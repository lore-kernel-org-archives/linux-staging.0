Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA322257AFE
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151123; cv=none; b=Xz5jQLUXB+SVbSzHDfb2jiZKRd+WKx/0CHk8YwXXuCWB58AiNtDDz6jMH72YN9Z+hGAZMoPorE6dR0JzAdgqY4U0acXFW2l1VRtjMioDGCxZKizyMZA3olK+EgkG9L3PbDVG8k+XSfN2ZAw4e7STqFqm1y/mAoXOONkBJIKWsbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151123; c=relaxed/simple;
	bh=se3YZvKLgPAHLR+BdipUhIdfwA1QSNs3G/9/cqRGo60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqmA+WdZlgb3ddAOH63xYxCtskLb4ldYnoOaEPnfF+bko1l+7A0jsKg/hTZwfrQ1YgPf6DxVmTDaIUNFQNSX+E+dgoJztC1ibOoB1StfG+Tb3tZ17+JrSVQ4r3c+ptbBQnp5eND2CCFX3sgbQ8uh/GC/WUfnuVwdRoGdtCEMBjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fmAHpsmK; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fmAHpsmK"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af589091049so4094852a12.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151121; x=1744755921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4C+lWNdknUJZlypfGnCZDNz6KdZ6zmn7ch4eG88+8lE=;
        b=fmAHpsmKYKw63vwksOx27cRLQlAstFCIOaN61h8DBWy1nYfsu/RmjraDwOXvCzZaBA
         4pcbwl4UaeZPs04jPNhSKjW6e1txheJMjrSEwRIZ7DTb902w2puNUDQ3TFTFZQHxAzUB
         6ZsvbM54s8lHdUx/O/Bh5yaLdwxkcJaPEiz7fJociOQ2oBhEtA2MY1Osj5cpaSNNlA/F
         9YSjFhw2/pR1xgO8mBZQS3mrYAReuDchy63zDL8OPf/Sq/OgKjfdfgd5ag3HyQ9/Es33
         8dpzPXzYYXv9BlQSzQI+dr5bdr2R1MROkBXbVwI0hc0k6kp3zKX+DREmU63eGMbabL/H
         oWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151121; x=1744755921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C+lWNdknUJZlypfGnCZDNz6KdZ6zmn7ch4eG88+8lE=;
        b=Owd64/ppGQEGfM1Ux5MwP+yGe+Mi1pEOXt0RXKjWKCA+cSwdOho6dqe1QfqgnFqg+j
         +On0NlQXyNm7tvc+CHzNDre3VxlRQ7YfuEykbK4BPmiHx4ftv1Dw/NDHmJnuTY90U7Qe
         2EfoeuhdC5hsgUHEwnCsBimWWH3r3l3X+XqUlb4tDrqyZChlIkQrLsDswi+uta9RCDsB
         lUGh2rczMPQWKt8RlvAirTIEu1SPv/TZF7gp8QoUN1SYUOiKVz5oW9uA3FGHCwsjaldR
         3l63TmzyYJdv8wdfCUsjTR9t6QhVM/wb2nVvZLJPbEIWI5fvWSEZ6XA9fnsUag5PpiNr
         IV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeeGiyuQc1EuImienXWcF9zojNjnwaQ+K/A6uqD9Z2Yt63agSTJWif0VqrVQMhY0NVTUaLLmlGYKT9TXAp@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+dDvzAvIu+H3GZ2IzRqR7Bw10sEr/Ye8MK7NbCdxVg9ZDSTGJ
	fUEUH7iB+L2hD5jgubKRnYQwSWAxbNgIMO3BgQhCaNu84po7zPTziHFDAKDXOA==
X-Gm-Gg: ASbGncsmH/CMW6a0UZHcJUH+aOQOX4HV0+VuVLqUKPUjU928of4ijr1hNuV6Nn/WXD8
	j0W/dv03v7jVjjjGoOEBa0+MQpnfLqSAz2K9cVjmezb/QqMhOF4HQNOnXclP4vL8OPsBaJLlz1J
	xRkKBZJtLddz7BNYMPxovNftwfJ7eHnyJoN8eCHWAEKtg6sD/eoJL/xDYnPAylaPbxlo0hefmGi
	UjF5iw6FnALEG5MHonYax1CVRuYDf0z/QuaoAhF1TzukH2SswRhbhaaYVelxoEU6q82Ypuv/rnO
	vY4oqDMR2wVYWcvaH+Pkz6sIWK6RuiffxtJS7nrUGwedxb8WZE1+H7LRMB1bajOHCUH5K2R0CsI
	5UHlP2FHF6Q==
X-Google-Smtp-Source: AGHT+IGyeoiqqphPpKL5Sn7eKU4nhD0G7aTXKtNfs0fA6Ybtm7sOFRaFnTq6ISHfRriprZbTNWKv+w==
X-Received: by 2002:a17:902:d546:b0:221:7eae:163b with SMTP id d9443c01a7336-22ac2a2e867mr11925265ad.46.1744151121190;
        Tue, 08 Apr 2025 15:25:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e6a9sm105819055ad.202.2025.04.08.15.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:20 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/18] staging: gpib: hp_82335: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:56 +0000
Message-ID: <20250408222504.186992-11-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index fd23b1cb80f9..1a93a456f7bd 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -179,7 +179,7 @@ static void hp82335_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp82335_interface = {
+static struct gpib_interface hp82335_interface = {
 	.name = "hp82335",
 	.attach = hp82335_attach,
 	.detach = hp82335_detach,
-- 
2.43.0

