Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60686285CB4
	for <linux-staging@lists.linux.dev>; Thu, 11 Dec 2025 05:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430827; cv=none; b=lDXHJsjBlqjX5ZGQR4fMsIPNdvqbk9ASSKlrPCo//1JMG5zM3VsFhkJlTjBY035EHA7etkaYUngSbiewONYXUr+ArqpPj9r4o1haeBM/pOlKwXr9v100QacimxZxWIKchULoQK+XeUVCM4Jo6phtQb5GDSo3Tn/saeyBxDmcUoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430827; c=relaxed/simple;
	bh=kwwU4P8Lw5MZyU9jOpxUXjd3N0RZwzFufYNIL83H7d0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDq2BBRFaD5w+dAQS0P35h/rd4eGpPDTxReqN2hLPIHLn+i3IsBk4PQ7NZWVqWETwDLX96p/7gw88X/bohM3roGfhNhVvEpCApNsM7argAXMSC86ngiMhRtVHYDrXMl38Bd6Fs1/MERr1xR1HWP3nDN8sft0LAUwYbZ5rfVsDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM0ix/15; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM0ix/15"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso641420a91.2
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 21:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765430823; x=1766035623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4B1VSMVPR1C6GZoVVS5E6qY+3U167GtCSzdGbajzq7M=;
        b=EM0ix/15qAgEoSw3e4jScwIwlq6EoTd6f4ED6fvCWVafw0sdjKK0MnL1twlfdiwhwG
         lw+C8IMbqqAvtsuG2H0EVrLw1/KgWLdtweNFPggqmFKvYjFH507do3nyr+oUJ+TuW6Da
         pdNPXK9vyNXEILRQHGCJMGo2QztTOuqZmu3sCgXBpfGIyvXYjBdDLFvtwI2gAZG0fyjP
         /eUcQ1m5+M2rMyWd17h9NJuWseSmXMpIGW5SQjzF+fqOWyt7G8V1pA7mYJewTAz9Fnsf
         jsWnarn4jsCbpR3m0R1zs+T8m6KigjL8MMUqMmtiRsjg1udqKeiw6s4jPWjn7QOC7nwY
         HNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765430823; x=1766035623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B1VSMVPR1C6GZoVVS5E6qY+3U167GtCSzdGbajzq7M=;
        b=OJFO3EYPutp5qgrCt3t0Mu8ilG3PQF7lmHuWXMKgUiTzBnLmtOGU/u3LJ+3Fnjn9oP
         PG19EKpe8qW5u+0mCvGy6Tzhyh0b2bfBqiIPsyYwu5jwy+KQEncFievSHnNSWOj86IfY
         95qZOSduiA3vMhrso6VLz3kTBdRfcH+tWsyL+82G+5JdLF2ZTRXEv9aybq4QyKLfqkgu
         foETkv+vt4+EklyejLLJ9govK4hUvo/M92RWM6XN0zwg8ShN2KNw05xk2qfz6wkD8RS/
         Ggmui6oIk4ZMHUJKVZzlwF9Cm0ovljxu17fHKr/+6hyttX6qZfeZ9fi8gj4M5tD3t62F
         +wWA==
X-Forwarded-Encrypted: i=1; AJvYcCVFyKgmcnkKeDbH3XiC3ZyY/eAWSZkMjAGSE98sb0j12Eg+J5TmRNYbPEOASFwgGX9KmRlXb+hMwPIu8d1X@lists.linux.dev
X-Gm-Message-State: AOJu0YzvM9LHQSQJRGESt/YMu4F7ilda8KVLHjM1rbObVStLI5TuZLO6
	a25e79OblmoIIqNLb/L0CycPBlaZ1CyeG+rMfm7AtkFoDMN1RRf1r7f7
X-Gm-Gg: AY/fxX5dbWc3UEPUKPwz3rbX0+Mf6Jw7p5ChguHW3P0QCwQb+3N2hMupqUKUQyg07dY
	Mk3C7DlY9hhrQsIWA9H5sjD9QyRmpA9nBXoZ91dk1YnIDKQjn3u4kNTsRWgJjAV90fYPB/KvWm7
	DWb7x126XIBb6qWnJhPw0R6kJ/Oa6WuYf2HGWuqFV3rfR5F53whrHkNNtLUsW3mFuSraYc685g0
	Uo3jAfbYzahKjuGeUKyFL6JeH+nxOc4TSDbsArG18ILjikDlrotHQ7GlKbxgmisU/Y4AS4rQqgf
	7o3HOh1hYQS1T32y1uYEQyLjTTRCWNUrAPjwBgSBNxjSs6qilLzPa8+UhRO9UJEtTrzLu+y8qM0
	LLGCO4ZU0khjSt8IJwaQC/aYMZeU9Q5LLzhRUnDa5wadEaYhMfdSt7UE3wrzrZ6sV3sk4wu25vg
	P1L0c95499je4yOGseEFB0RCpizWh4
X-Google-Smtp-Source: AGHT+IEgiV35Oco2tiCD6K79ILkKFXONEvzhj4i2bB5192dudF0Egw4s72j/Nd0K0uccWEnscaKwBw==
X-Received: by 2002:a17:90b:4a88:b0:341:8ac7:24d3 with SMTP id 98e67ed59e1d1-34a72895d23mr4367080a91.34.1765430822964;
        Wed, 10 Dec 2025 21:27:02 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a92733507sm640351a91.10.2025.12.10.21.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:27:02 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix trailing statement
Date: Thu, 11 Dec 2025 05:26:51 +0000
Message-ID: <20251211052652.3589-1-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "trailing statements should be on next line"
by moving the return statement to a new line.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 .../atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
index 6a10d3545278..e422cca55022 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
@@ -35,7 +35,8 @@ ia_css_formats_dump(
     const struct sh_css_isp_formats_params *formats,
     unsigned int level)
 {
-	if (!formats) return;
+	if (!formats)
+		return;
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "video_full_range_flag", formats->video_full_range_flag);
 }
-- 
2.43.0

