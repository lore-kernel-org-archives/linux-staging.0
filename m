Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84AB216E2C
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786767; cv=none; b=fkUhV5c8ZdwhLt2258DKrdaZsqbNx5JMX7xjbu5c3TJcjzbRjmxWt/V8uXEF8pAUNFCdF9xygh9C0rFSg0dHB+JM1GuO1N9sUvb6BS15jNmrlharJZOpeqwxG8QtxR1oGp0hOPW4GoDKxMgqfO9IMy6TMbW+NYnptKnewL3hoTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786767; c=relaxed/simple;
	bh=XO6uPpFukGBucmrCA20btnJlN/3eEn2EL2uIuT8mRyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZ2JCVIczrOcH6ucvLdGwAA0zV2QyBG8inlTLONC/LTUhaO8OIhz8J6Z3ZRa5MHiWZNnHkHy7UWgwsx8sDMHUd/rEPRYuM0zRPQR31qNlvbL2oFxpaSgwQAqaWTi3QnM+e9XJgtvO88tcGfCbffSzmHuqwv4nQeJhrS2dNBAq7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ED77oXzG; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ED77oXzG"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-220e989edb6so77358525ad.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739786765; x=1740391565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6ix2sWH7fK+O3pMFw+ar4SRdhAMLkYoHd95tZujCUw=;
        b=ED77oXzGHftXLH9kPr2CCRNeLwO9SpOk9opdxaWa8gBD6giOCPQuo89o6l1ANc70Q7
         5m8FspUmsZcPQJCKtg3iK2K4w3zbOb4CsZy1KMlYmt4QC/ed4dIszFJrpSnMLCJiBIQG
         7Q0SOQrpcrQyH4IxrPdTrpJgwutdZfaL3tfCWn9xlC4NbsBAlEv7D9D0gwWCGhQqWy6d
         uNJEsEYX+XMP0VVExULYvhsREegoR/bTTwGzgN9UuynkXr21LHJLewmoCtCaTITQfL5z
         tqjGgeAfGcZPCviIYfcHHVxFedW0bdzoBI/u7/i32/qvO/NMasZQe2Aa5cJau/1aqVnj
         Qzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786765; x=1740391565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6ix2sWH7fK+O3pMFw+ar4SRdhAMLkYoHd95tZujCUw=;
        b=n/Cm7E3aD1vnhlRZgVf2ha/CCo2hXgoEg+MVvkigwcgFvtJ5L6zrbzkwsOxLZwUiSr
         1UI0SspGa+PGNScNWpzdD4XlQVsXK9AhSs3QQNk6Ndx+4lJFQKBBny/2kZOXuuXsczdy
         qDI71u3RQ4SHFPvmVVuBleYZuY8aOU+Lx8LGz/3lz8NU5ucTyzWfxsBkb6SE2y4oKBzX
         l6pN8BhPu5572A2r2DuIEvGMrrCTRt6yKbbrb5GbwpDj9pQOIEcB6Ka1aU/8k6/qqit5
         Kin3E3w+BI926KKl5dSvM8eITc7mG0ejuNjz3f01KebN3egmLC521SVpxaaX7vDwCIt5
         gq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9pCMjv4fTH6DOAtd/elzGZ/ZKyVItIRBeec0FCFVJYaSJjcHSyNXY/rxu2MGvujNGNtRpUPJAWEAc8XGx@lists.linux.dev
X-Gm-Message-State: AOJu0YwNpseUSiCwYwl7zwdHy44RAQ0fVo45DfT+05IuZcYR8K2qFNAj
	AKgsCXZMYmo8hV8oLTBYHurV8jBRjr6r5ZTyp7K7MIzldotlSsCp
X-Gm-Gg: ASbGncuxWaUry/962HE11KSIKvM12DoBSc8of+BprvfNlzJULNzhrJog+nhx/rw1QyO
	5o2LXqY+Gba5Vf+obJ9HQLX53C73nqRPJGZvcdLVuVRMWnteiXXN7CpynpY0eePWbE6zrWHLSzz
	+rKM0zPcOzQXEMx0P5MHyBhb1nbaVc7ixx8vOWIMxGNAZQytAfNbvlhEPFxREtzWWjq8yuaBX7s
	ZsCQvZUUv/P9TiFXuWVR/BGZhc0LJ06YXQWHPYk7PgXL3PuN3DuQcMYocBXchjiRgpLZ3dUgVQT
	uZFfE8NUENf35Jap8M51
X-Google-Smtp-Source: AGHT+IFbDOL3i6j3BURqUMS3ItFOJZ1h2qXrhvCIQnMGGh3yLOf0nB7QRnzYly5/+dLiERt90iYUoA==
X-Received: by 2002:a17:902:fc4e:b0:220:ecf7:4b5c with SMTP id d9443c01a7336-22103f16d99mr145753355ad.14.1739786765212;
        Mon, 17 Feb 2025 02:06:05 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d556f967sm67786555ad.162.2025.02.17.02.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:06:04 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 3/4] [PATCH V2 3/4] staging:gpib:agilent_82350b:Removed blank line
Date: Mon, 17 Feb 2025 15:35:14 +0530
Message-ID: <20250217100526.49495-4-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739783909.git.kumarkairiravi@gmail.com>
References: <cover.1739783909.git.kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

removed few empty lines that were causing checkpatch script warnings

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 7936c7285d..b6871eb3c8 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -176,7 +176,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 
 	event_status = read_and_clear_event_status(board);
 
-
 #ifdef EXPERIMENTAL
 	pr_info("ag_ac_wr: wait for previous BO to complete if any\n");
 	retval = wait_event_interruptible(board->wait,
@@ -193,8 +192,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 	*bytes_written += num_bytes;
 	if (retval < 0)
 		return retval;
-
-
 	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BOIE, IMR0);
 	for (i = 1; i < fifotransferlength;) {
 		clear_bit(WRITE_READY_BN, &tms_priv->state);
@@ -207,7 +204,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		}
 		writeb(ENABLE_TI_TO_SRAM, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 
-
 		if (agilent_82350b_fifo_is_halted(a_priv)) {
 			writeb(RESTART_STREAM_BIT, a_priv->gpib_base + STREAM_STATUS_REG);
 			//	pr_info("ag_ac_wr: needed restart\n");
-- 
2.48.1

