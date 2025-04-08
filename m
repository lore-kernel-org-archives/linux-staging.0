Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD972192F5
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150849; cv=none; b=NYCiqLgtUh7U3fL77r9vXqZQD74NQ02BXZvBITI4ay/FuR3bU+eo6psqBHPFTvbmBF5kzsxQp7FTG1Hf4yUmcaU7RH8ky+EOcb5lgip8ZsRzoBy5VCPUYrgNePE9QVZJlip6qRqmQW592Q/7zdSf+hGEyfIWnu63sG3OHjp4fJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150849; c=relaxed/simple;
	bh=q/m6gZRHsznamriWOYHZIp/SmlWy0pox+sQ+sNqkijI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2frXo82FZvWDKlb3vASBWkni9zriPDDIRM4sI0HPXDUZK1ZcXGFL32wUll27/b4A5nApP8kAUypsKLhX1PFhHfP8JAxt+ZLFV8JlxbUp8U7w9L6TfCHZXjh0Yqv9uEGBmO7nwTUn+agc+Samxk5b72GrAh/iLfyCIhZ/rsGD0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fvWrKQEj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fvWrKQEj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22548a28d0cso86971855ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150847; x=1744755647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6zT4gLPellA5q5nyTFopWbDsYdsaDENjf5O1U73EvY=;
        b=fvWrKQEj+G78ERUpIz2C1sHXePPwuBFe3ObdnHsDcPvs3RWIxpbrr9dYNDJ+9Wv1tu
         tuaz3aSwEzVQKzFJFN/8C0gbAgHICBRpjBhgJ0ZTDci2Rso4Fg77ZfNlu7/p4LcEZpLe
         +muXx9w8FLu9jPOGmqDb9RvWdspYPjGV8vMzhXsPrRoJAKqNkT0ERy5xkiSXAVyfdXwG
         7ipqIvx4c/ipSYpGWC7e4jAn17VZ8Bs14os+14uMyi+CQaDjZmFvyMtdVRiy76oSI4GX
         vTMix3+2wSMghnO0iiWXSNQbhAJs/IXEi7IZm9WhYeEy+p5N7p+Uf2Km9O9oiPuoZLTZ
         wozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150847; x=1744755647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6zT4gLPellA5q5nyTFopWbDsYdsaDENjf5O1U73EvY=;
        b=NC2dQY3DfcZv0imL53JXY2DzzEOo1uO5EDrV0eK68q6Ht2POohrKex+O7amZYTzJgm
         KS2HbGkmhkdnFZP0THQjQQHyhXcw+KwNjXYM+OOXrifL+LRg/nrdDT6kx1jxgu+hsUwU
         ZWuvavOniqfLvLtgRzSMOCJAvvgBnJW3dxdRt75zmbWshI/IQ4aU0L1K0sbz4IliyYxV
         bvIKL+uxGVn68JPBHFQsn/9D+tUFUPHRAxNPNjCuNPYpAnWdH/q2DYIz5Jm7StJ5/p2L
         7jPPJaMOiUq4e9EMRSo7LNEPb1foCfo9VFGSxdjZNqAVq+OhxoG/i7r51XQNjott/zVa
         pgqg==
X-Forwarded-Encrypted: i=1; AJvYcCW9r9BMAqqTL7LCliOrIBF5nUb2S+vgIJS1ompN9DZEcBdUtJT+06guT31c9IFDdyQA5QkddahpDQjuDOYs@lists.linux.dev
X-Gm-Message-State: AOJu0YzTppQZnu+JaK7dktrL9AA09VpKQ03aiFph4gv/FyRxXn3YAHrv
	gnGlOR/1MuQI+aZdIP4f4n4wtyAim3S56G0TjkGnZnHU/2vkAYwFN+nRHDIuhCdKkEvwwW7Ch0k
	=
X-Gm-Gg: ASbGncvw4jvvSINY12LX3TKpda1qVF0ivUidTiaRIy98RxNzKg3SY4KakoScOfZBcIU
	NkiyYgwYZ7Fpi9z8AK/IKUkoq8OzQF9ECrrlHCnBYh4t0ApalRqQJJtSIv34g/4chcAh50I4SuX
	ZaAUKwDNWmXHLfu7KbXea/hS3/NGZxTHeACQgETYBBy5J7tHKDJidvN+NFIulEjHy+7vRlplcfe
	Ob8Diysh+cJ7yXttQ6xQKXXfrcrFNlnr/1vn6ROl4RuJcwu/y/qs5AaxVCwXFFzT1Pkjz9vNCx5
	aOAyFbJY/iqSEu8wYp1UgBRrFLPXPLXWtAJ46ybk/OEXCbytLnZ/pWNiyfUJyBMdUcO5z9jOJig
	qtGOh/NE/6Ed/fo2c1K+p
X-Google-Smtp-Source: AGHT+IHTrnupNNjrWEHGiG08ITTUNsoI/7cUK+piGm3EAUOr2hZ4ZCM9nE1suE7+kBQPj3LuLOkFrg==
X-Received: by 2002:a17:903:1b25:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22ac29a9883mr15086195ad.24.1744150846782;
        Tue, 08 Apr 2025 15:20:46 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe40sm106214205ad.72.2025.04.08.15.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:46 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 02/14] staging: gpib: Correct CamelCase for PPConfig
Date: Tue,  8 Apr 2025 22:20:28 +0000
Message-ID: <20250408222040.186881-3-matchstick@neverthere.org>
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

Reported by checkpatch

CHECK: Avoid CamelCase: <PPConfig>

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/tms9914/tms9914.c | 4 ++--
 drivers/staging/gpib/uapi/gpib_user.h  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index f7ad0b47ebb8..5f167c518c7b 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -736,7 +736,7 @@ irqreturn_t tms9914_interrupt_have_status(struct gpib_board *board, struct tms99
 		unsigned short command_byte = read_byte(priv, CPTR) & gpib_command_mask;
 
 		switch (command_byte) {
-		case PPConfig:
+		case PP_CONFIG:
 			priv->ppoll_configure_state = 1;
 			/* AUX_PTS generates another UNC interrupt on the next command byte
 			 * if it is in the secondary address group (such as PPE and PPD).
@@ -764,7 +764,7 @@ irqreturn_t tms9914_interrupt_have_status(struct gpib_board *board, struct tms99
 			break;
 		}
 
-		if (in_primary_command_group(command_byte) && command_byte != PPConfig)
+		if (in_primary_command_group(command_byte) && command_byte != PP_CONFIG)
 			priv->ppoll_configure_state = 0;
 	}
 
diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index b0c131196a00..ff5a257f9a01 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -130,9 +130,9 @@ enum bus_control_line {
 enum cmd_byte {
 	GTL = 0x1,	/* go to local			*/
 	SDC = 0x4,	/* selected device clear	*/
-	PPConfig = 0x5,
+	PP_CONFIG = 0x5,
 #ifndef PPC
-	PPC = PPConfig,	/* parallel poll configure	*/
+	PPC = PP_CONFIG, /* parallel poll configure	*/
 #endif
 	GET = 0x8,	/* group execute trigger	*/
 	TCT = 0x9,	/* take control			*/
-- 
2.43.0

