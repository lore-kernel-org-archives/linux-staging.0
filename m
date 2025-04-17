Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60DE13AD3F
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849972; cv=none; b=p8+vkGeUgs9DSyq/uhRLs1cPQ0TIl2YI8DIXBpFwtr89Vi91Qd98mrL5xzIUWMcVVTMBB+HLhiVNVaGsCkaGV+sO6Rg/0nEEZ7zmwLF0Q8UGh2w4h1Mf/xqoxKO4MRhjz4OxJtGy90BcipeD/xpaFqeB7PpM2HptAXNEvaGFoQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849972; c=relaxed/simple;
	bh=uEoHmC4tV4NU9qt0IQ4+gbKy6BRGh5IjnM1E3Q6wo9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyL7GmCBH+pPADpar6/ivr+8VUJc2buCkhV9ohb3QPZwfQUpznB3UoNYDhQ+pdu3cwTQjPhiAsoEPZzaH8cMkDjU7CcYGWD4O4jwMyPrCTgiwQ7xSbVYsAABB+DVH+9IxEp3fQBpJHR6EsDUYSWVgOqsxugR6J7B+lvLf5LlIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=luGYML+9; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="luGYML+9"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so122656a12.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849970; x=1745454770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n8F0kDNjcDIJbaag40zmW3Ovg/wUOWV+XY1ifN82lo=;
        b=luGYML+98yGl+ALhufSVl/LYkGuLUSVl/NzoiKYfEM0Bi7UISyhQJIJPVCNdaKKib1
         0a5KqZ9t3w2NCMRE+5JG5mk6O2xWNUU+iN7Q1WHjE181qyz/gZKZKfus3AFrqRzhzXmH
         xMjS5AGsq6v+Eoggqqzg/Sv8sBG7sTcmZgX7CzzqudNzOp+cZHC79eFMfl0piKpgHMvw
         hf9oSZgp3Ne7U3iyNZUlqbLCXdMWrOmTyNt0FNAipQbpiUuDrgcfYbo/bkMOStKTHdPp
         dBuCEYCaGRX/TGlBmXGQoz8MIg6A+DBXytdUz1JHcJScHTNSK8m/jcrMDukjmIZA4EAt
         cl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849970; x=1745454770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2n8F0kDNjcDIJbaag40zmW3Ovg/wUOWV+XY1ifN82lo=;
        b=l7D0rJGC2E5SXZWSKxOHbRs98YJrUeW5aUHrJ+D4uUbRkXPFYPuRnvX6ro4rf48ry9
         so95S5c92Vh8WVqkrB5z0ZddfomOJKOWYNVPX66C9NyDNnaJjI3zR1SxRn1Dlyo0lL+M
         zV4QdoUt5TSfjn+W84que6sdVkLhkbpRZINNXCMIobw/pW7XCQq6CIvLpaaKI+Y+uaya
         m0qqkcnVb9nMISsYvLbDeQdc2j73QLbxUsqJ8fd1D2s4It4Ls5pFLp0pQoiaN0H5xAAT
         2z3KrrdvCihS8ewSBuEPEMHv/sdGO9k3cmFD4GxOkR+ZUlDmF5Ho407JJUpZ9osbTfM/
         5a4Q==
X-Gm-Message-State: AOJu0YxiyvdBcwd54AJlJOU/Igic8NI2gZSziveiQYdmnZUsHGhQB9Ot
	kDPbJMjFPPmSjsl/fUYWOO28uXrVWTKXI9s0cjTjtTt6ZErRbDyVCC2Hepk5oA==
X-Gm-Gg: ASbGncujx/QTUTlo97Pdkfy5o0lhL4fdW6lO5id4x/P8YvYJC54Axw7uMBiG9c2Lz9u
	YyJVZ3fpg8ML3s4XV/EPVnbxA+eotSxEfnKmfjitGquQsA5h5FLuke/KikCm0CDVEGJRcxcnpZy
	wU7LEbnVdlWskBV06T1LuqVMrDQEAxMyy/CK/aW43wL7rTQS9v2FMK22lg23xNZOri9SpAmMZCk
	okaQFIukjS8MknQgsLxQ7kymaxi9iJ0rG0h25SlOd3mn/U1J/JkFDUTKAEepTlmmT4KQT8c632v
	W5Zh9OrosqUtHNhSsc9IAAbtzxHgslc7Q0+gsX8zcuFpkVhW0+/+/FScTGORNBc7OHHNDZV0abl
	W5TtYWg==
X-Google-Smtp-Source: AGHT+IHQX2aEg8gBZ1hKj7ZpuoyTuAr8dI4SZEWszwz0A4CFXYXv6Te0FytWNllT9h8Uj82vv40iOw==
X-Received: by 2002:a17:90b:1f8b:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-30863d1fdbamr5387736a91.5.1744849969912;
        Wed, 16 Apr 2025 17:32:49 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220cb76fsm1564801a12.30.2025.04.16.17.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:49 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 01/18] staging: gpib: struct typing for gpib_interface
Date: Thu, 17 Apr 2025 00:32:29 +0000
Message-ID: <20250417003246.84445-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Having the word "_struct" in the name of the struct doesn't add any
information so rename "struct gpib_interface_struct" to
"struct gpib_interface".

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d8c05d1fd4a..712987ca139f 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -22,7 +22,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface_struct gpib_interface_t;
+typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -51,7 +51,7 @@ struct gpib_board_config {
 	char *serial_number;
 };
 
-struct gpib_interface_struct {
+struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-- 
2.43.0

