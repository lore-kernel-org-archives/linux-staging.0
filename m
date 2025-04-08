Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65346256C83
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150856; cv=none; b=WH6whGhX1n7lsIm9ZgF52ouuLFzaQ0Y5NXMVNYQqg7aHcS9k16gGTECWycgb39UUNPwuMqHEoFz6gSaaF32euA/+0uFLoWcxoFziS7bfhnxieMTUHfwBnVkNR3UNmKJbbaZIVZQpX8QU6OM4NzHSlEflYjKH27mz2itawLJDRgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150856; c=relaxed/simple;
	bh=nMQ0gL+pfZcJTXfmdPBzajAsaQ27XDi8DNrX0tZby54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0xI63/8MMxAFk8OAGbnhL2GuHV+lYeA2JVZyKlOQcnoXndbssd+RVvuCzyFsDnGq8Jv81D2HZlOAIg8S6YzEEy2WD2kqpl0z2k1C1wCWOOYRawHE5WW2CGchJqVGFN37Ic0M/Fdy2/37HkxAbpmd2w+a46yMpKBLQt8nAMDVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=KQImCU5R; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="KQImCU5R"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-aee79a0f192so3880373a12.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150853; x=1744755653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR83DMJzZmQDIMqImv69PpmO+f5bPv5OTfDUc03DUXs=;
        b=KQImCU5RzqXX7Mx8KNwScIK19psZZ6aKPmtwxdZVlEhqiScnk67vTW3aKKbBL5aq+x
         opfyLQcpABnVqLuG9NsQrQUKRzZlPJA3v/kfdYfSvGBP0eYklpNye2GBxWviyJdHrB3t
         89x7vD5gje70ehNQNJm6QTr++PL7NAPApbN+H8jDZ67/fTe6zBN5xRtEkVUJIj744xwG
         eIiFusk1RWhsPullk8oMi1aL2I+CGoDF8K0Fj7oSOLUCb1TnT4qXgc1RXDEw4oeFnlUY
         R0exkHwys27DW7QWbQWnhsGPtFxitJw3br+yVAAdQ0GkIuRJATkkatZhtZY0bSf3tggA
         XhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150853; x=1744755653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fR83DMJzZmQDIMqImv69PpmO+f5bPv5OTfDUc03DUXs=;
        b=DczYXDaLIskqiTXU1UaHDZV8tMiAC0RW0zvoIXvPCF9njFbsAEwo6YlVuLRh/U1NbX
         YNAk5fDwRvVxeYi0ZVFDE+mITmkP2WamAymyqS4EA17p7aTT+Bo0a+KC2HSce1AtBfxN
         vg1R5J+bkndCflCMMlgQq8e0ibB3OK+rLrErzT3Z4D4IvuDaqPrPJdj4JroLJo8zHo1z
         ycRIF3pr0fEgwHlCMdCCiA2ntnMNBaS4IobsUJtF35bYSotmTDbfsAw8CqS+8PIcUXT3
         M+7OgHQ+7ThXxBX8J+XSSJAg8DzVNwuomFcxG72D1MyfUWQ+Att8qY/BKJInJmqsF4fe
         qsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUQbChft0/rH9CXfGGpBY6oYrqVEkUZv6mC7dsVuHQD1e+9w8KCflTdQS1MT+ap18iEDUv2ny2VW3YdIqv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5WkMdcAvGby5mp6enRE2DH2tRCZS6xLIMNoLRT5JwGpkK3Jq1
	cuH683SDViS71S6yjANt80RJL8WO+PiJvw1OPJIRf1iGmJln1ihJOquiEGhXug==
X-Gm-Gg: ASbGncte20wklCQGXr+z8amDEZFGSeAQXKpuARhueiRMAmPhV8r6qyH2/LwhZ7c2qvo
	FmoPM+lcFvUTyQbw+6oarRFrPHcjkVyugjoZ8mTFXxDEIsfk84SVizPa3S6ZR3jxo48KyKeOVTK
	sZHV2oXh5lQjufcDgInekip79+mxvguPvGKp7DGfwdaAHE+Hb6nlLPRbaclr7t3cuJU3W3F0y4D
	q5fEfAJLhdqIS4rQ2h77wz5O0PvdkG46wn62SWSkxaKj84gm2gRe1BsgjUFIJQvLteHehGrtJ59
	xYi2UUgRxMQWkJ9Qv+LbH7+bIGZIJSQHWhoK6kkC3mZnhgxXza0avS5hbcrwMTjHorDh6u5SZWG
	Y2nA6S4UW2Q==
X-Google-Smtp-Source: AGHT+IFqDZZi2POlRYiT62mmJQAXBnyP84mVZ47BSch9E8EQIt4iM2sF0RWhjCdOu+HZX3ahvh4HCg==
X-Received: by 2002:a17:903:2ac4:b0:223:50f0:b97 with SMTP id d9443c01a7336-22ac2c2c972mr9779245ad.52.1744150852720;
        Tue, 08 Apr 2025 15:20:52 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e41esm105496405ad.128.2025.04.08.15.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:52 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 07/14] staging: gpib: ines: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:33 +0000
Message-ID: <20250408222040.186881-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ines/ines.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index ff27f055a0ff..abe977f8f961 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -36,7 +36,8 @@ struct ines_priv {
 };
 
 // interface functions
-int ines_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read);
+int ines_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+	      int *end, size_t *bytes_read);
 int ines_write(struct gpib_board *board, uint8_t *buffer, size_t length,
 	       int send_eoi, size_t *bytes_written);
 int ines_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length,
-- 
2.43.0

