Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA825525F
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151122; cv=none; b=e9Yyzn6TJlreujbahWaEOKf4p+RtJ2NVMTgnZNX94MY7/Qwrbfmi0wRCMxiyWHNIEWFPhxQEVkJey45No6ebk5lMdasJqAdlX/288XQjEwBfTe5L3ZbBHAbGDgD1j2iNCxf1S6jQAMJZGOZiQKSiBBG4YtuIMm6vZLSd8Thi3PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151122; c=relaxed/simple;
	bh=svD6c9dO0UVlCIVTddePdMduVpdHWbHw4LzAwR+m9OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuZkYmbsHF2r/neJfEb2LjCKTpCVGzzGQ9EX1l5LqBZTLP/lMiuWpM8EcrZxvgju8MuvSN5ZHr4qYzXv8UtO5IzgWnr4xEC8CLC9bi6SQZP3Pm54Y6T+Pnca9qcd6OIXUrtZHln+vv8Q7WO3RT89/x93+QsUkm0jqvtUVAbR7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=AO5B+6MF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="AO5B+6MF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b433so60946395ad.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151120; x=1744755920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOUuQo/ZBOK4e2pJspysWYksCtSOwA8ABZzWMkqa/TU=;
        b=AO5B+6MFEqi498W/+O4CpS/AKYQGtAdzx7C29wQdcwFH1aZS+JkICxrejkbBYWJ24o
         tmr8+aEukYxXc/aH8oP1kRlzdLbzYfP4yXJjcpOrN40HECyJsVH1ro+tbaj8rVnfz0+w
         ehnWG2pRpJ7Y6X7GQT0sFWRDJb1HPtDzcbfaKB6tV79CI2jHB3rPJhMD//CtN3gjuO4Q
         KEEEB/kpBybsDALNNy/HqvC7pRo51P0OP/3mut/FiX2ipRqer0ZzjumBjXAa5IRXXqgV
         XzRhZdw5QFQCo4ZHODVvrnmEVRwE7JCmT8kPBh7uBrAuSUv/VtPt8PEzRBzk2I/Vg98R
         eryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151120; x=1744755920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOUuQo/ZBOK4e2pJspysWYksCtSOwA8ABZzWMkqa/TU=;
        b=nrrZaKI2D0Nt8rDquBrrOrNV9ZN5bUWlXFHaJXUVjMgY0oBYlB++crYRVEwe6Al20+
         1YAK9STrkb5OQ39NQbn2aTnjgjP0XPORd1KnUdJ5E5aCrQkl4lH+Us5+bv0Y4dY1CKZo
         pfxjt98YR0mXJlHxpy48VZB8e3owhBC9fKkikPz7ADoh2i7TAk1ReguBD/VfHoL8yQW1
         dKivv4pq24zwZBk++MhjV/Z1GK7FU5u98z6GiFJ30tWNdNKSoJE3/90TS910vhJrCgx7
         TprkW8FfDNOtp7cnrDtCxJ4ikJwCBKsApxNaxzWEO8C7b870MgvPJV5cylJmDuqagCgc
         odSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjyrafFD2gaII9K6LoyN2/1uBMDCRl2s4F5ROpba2wLwBnnnNVdGstQrO0OVQKQe116aHutUKx3F/zwQOr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf/DaTKWI3xE0ZxFV4g4O/RLFhaE2KoEabmWCAvb1OYxYyCBaC
	7SoM1iPE8p21Qn0I1K38beAR8NNFOUTi+l6CryCLzNk2E8/nP+TbS13JqubcpQ==
X-Gm-Gg: ASbGnctoO7CN04yA4kZhtiNJhfH1St+sZxkOB4/xV+EL7ouJRFlw2nwXIvOBdoBidu9
	W7gB4cmKWZ1zo48rSp/ap99Ws/6/nYEmLIPbEcFIZzEvrWRj4xrNhAc2fsqiMTx723PmcX1Cok6
	Nmr+XGjY6VlZsGLAIVuspLLdWNeSO9agSMbmsOVU/wPeIXcm8vOUeDYbSTBBo254qrnlqAUkwea
	phk6rCYDDtnPtfAdlqZtaogm+NOdu+/66701K4ILO5JFRY5zxiUiWjx5TdmX8wLIjJMhF/AigEY
	scOB3hqOjMWALZzMKMpW76OMY5zMzyNKEHWtLBY+k5N6Zks4k7cq04iMsPe5YIczljRsek5t5Pm
	W//guQ28GxsLk5+9EFUdb
X-Google-Smtp-Source: AGHT+IGpQMTVAyxJa9CK2SFGohMZaktmVvVgc2/bQ92j0F5OJwvRHayzQvbnJzUIL7peYa7lBWAoEw==
X-Received: by 2002:a17:902:e943:b0:224:26f2:97d6 with SMTP id d9443c01a7336-22ac3f9beafmr6540105ad.28.1744151119965;
        Tue, 08 Apr 2025 15:25:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe9asm106872595ad.55.2025.04.08.15.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 09/18] staging: gpib: gpio: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:55 +0000
Message-ID: <20250408222504.186992-10-matchstick@neverthere.org>
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
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 86bdd381472a..7e85dd29ef93 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1306,7 +1306,7 @@ static int bb_attach(struct gpib_board *board, const gpib_board_config_t *config
 	return retval;
 }
 
-static gpib_interface_t bb_interface = {
+static struct gpib_interface bb_interface = {
 	.name =	NAME,
 	.attach = bb_attach,
 	.detach = bb_detach,
-- 
2.43.0

