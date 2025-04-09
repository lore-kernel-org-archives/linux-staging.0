Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0242279322
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222211; cv=none; b=nzcaKFN+fexpG01tg1l/61Rdd5/LBWBVAzzpIzEG5fWNAs7xwfisnhBRtiopZ5lgdh//1cN8EKA+8RX4XpEZSSR532Z8VA5IMTvgNaZQOqtN80zv6Nf6MCAGSUs0Q2lI+huFkjpfQ5rRaf/g0oXoZzAfKRsF/Ouaa+VbI6mwAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222211; c=relaxed/simple;
	bh=rObqEDHrBe/jAWMZ0h4xesD6j8eo5/oyrdSAY1bb5QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kI61dYn8V6xhOfNpXYB+LmasMzMni1GSSD4l517Cj3+1ZFKOj1t99fH0BbGukrlTUAzZ0RihXHTwgGu+mRylDIHwA8ucG57Ca894k6K2TInmISmXEEzQyFlRhVQW26RCEXpoAaxDwtYKOrJhxYMnt3gFXlOXvIj6U7U8HYRnOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ep3zaFyI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ep3zaFyI"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7376dd56f60so5198752b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222209; x=1744827009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xbx6JupUwv+LRM3RBwYRlbHNbCFfGcJo2p6nMmB6hME=;
        b=ep3zaFyIj4kbpZreI6YPIfgeOguXvqmREhVUzV4SJa9kMGiRvdZjVTSRGtAAERkCoz
         UdehBApRP3I/HNBoahYAMmxZqb3MwoWNivNcGkm5oqddkFevPUxTbpyyGgL8/8G/Nonf
         o2FP8YD24rjPaw/twW/UldQ16ifJ7DCJN++SAVUpz+wlF8TjR+cpFDpVUsLVtI0Y4Ppx
         GL/78zt1sT5uy9e9eP1qqKsf3nrDGbSyT4k38iwYvnNcE3+Y06od0VwezjuOjgOSqdLU
         hsnChEAys7EUtDzsNs+yb5KQ+/3OOyxbzJ+glgQH9hXmGIhl3kacEAgfAsAlTRV2pYwZ
         MnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222209; x=1744827009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xbx6JupUwv+LRM3RBwYRlbHNbCFfGcJo2p6nMmB6hME=;
        b=wGKADrXrA51aNtaQwMWQDMGAtjhTFIioSiUfJIAbdWI4D+nVrUi633q0qb/oz85KOC
         zn6OtWYlxumQIi+NAap/a1z2VOr62W0IWTZQg3sZzUVsPM/ntEYTDPtcKZiVnCr8tL8r
         wTmtOpHXsOXPa818Cr+Lt96JLZ53o5DyytXKLXPilGb/QmGPoODuDDdR/b4RjgdEsPNk
         EcgvmIebG8di1jhUY/rzX25wSjvSfIbDnuLzZwVGXGDR9VSC1BUrphxXCcR1d3eTqKYU
         39B8vPm41QHQ3ipVIJT8TGXw6m023Pa2nTh/ElgMdqhiaGDNbiUYyXYCc0OkW46mwTbE
         VPLg==
X-Gm-Message-State: AOJu0YyCkkQKKXbQaTXlo3uu9i8EnhvcWRjCvovgd0xGqbdaj0tEZ5W8
	w3gDissz0yeGvkXSfOQIUm4j4XdSw2ED5TbxOakkpjh/oDc/Zp+EXcj7x6XyTg==
X-Gm-Gg: ASbGncv2b1HE1WOulzgaM/4kT++859ri4sMWPvbk2PgBAqegWLOdaUU/DwZkDgdacLK
	6o9KANQU2rtkijsk6hunrNSgmXEJJg0yVraN9lPFOjOgLBgqEs6wJGziINvdPizXU6RA+/JEcc7
	nP6ZB/Hm1fmhrpDcaTmVjFLqqvZjHieEZFp5TgbtB732DrGv4Wd6+C4zGVh4nISYR0XDd/e6RVF
	ixz0tkdz/46ftVpu6UC4fGCD3mvJOcleQfjsWXwqvmvTBr+I08sx18n4CDhzYmJBo3kwVXSbKGe
	Ayr3Czhz7WA1lFW90hOfR3jszCwS6OAn6w+KRtJAEZivYzxVMiFGDPfy8kceLOusUN+Y1Qm/f3K
	CUsB/wQ==
X-Google-Smtp-Source: AGHT+IEKZasBI5vpxbu2TDwqOl54klj67UqWsbaRuqQlyNvx+nls6nMxYeJQJTpgnS3/yC95hhkG2A==
X-Received: by 2002:a05:6a00:1411:b0:736:3954:d78c with SMTP id d2e1a72fcca58-73bae4b3fc4mr4794814b3a.6.1744222208811;
        Wed, 09 Apr 2025 11:10:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69b3fsm1717479b3a.176.2025.04.09.11.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 11/23] staging: gpib: gpib_user: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:41 +0000
Message-ID: <20250409180953.398686-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 58b996a8bd7f..eaf7399a164a 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -166,24 +166,24 @@ static inline unsigned int gpib_address_restrict(unsigned int addr)
 	return addr;
 }
 
-static inline uint8_t MLA(unsigned int addr)
+static inline __u8 MLA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | LAD;
 }
 
-static inline uint8_t MTA(unsigned int addr)
+static inline __u8 MTA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | TAD;
 }
 
-static inline uint8_t MSA(unsigned int addr)
+static inline __u8 MSA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | SAD;
 }
 
-static inline uint8_t PPE_byte(unsigned int dio_line, int sense)
+static inline __u8 PPE_byte(unsigned int dio_line, int sense)
 {
-	uint8_t cmd;
+	__u8 cmd;
 
 	cmd = PPE;
 	if (sense)
@@ -192,7 +192,7 @@ static inline uint8_t PPE_byte(unsigned int dio_line, int sense)
 	return cmd;
 }
 
-static inline uint8_t CFGn(unsigned int meters)
+static inline __u8 CFGn(unsigned int meters)
 {
 	return 0x6 | (meters & 0xf);
 }
@@ -202,37 +202,37 @@ enum {
 	gpib_command_mask = 0x7f,
 };
 
-static inline int is_PPE(uint8_t command)
+static inline int is_PPE(__u8 command)
 {
 	return (command & 0x70) == 0x60;
 }
 
-static inline int is_PPD(uint8_t command)
+static inline int is_PPD(__u8 command)
 {
 	return (command & 0x70) == 0x70;
 }
 
-static inline int in_addressed_command_group(uint8_t command)
+static inline int in_addressed_command_group(__u8 command)
 {
 	return (command & 0x70) == 0x0;
 }
 
-static inline int in_universal_command_group(uint8_t command)
+static inline int in_universal_command_group(__u8 command)
 {
 	return (command & 0x70) == 0x10;
 }
 
-static inline int in_listen_address_group(uint8_t command)
+static inline int in_listen_address_group(__u8 command)
 {
 	return (command & 0x60) == 0x20;
 }
 
-static inline int in_talk_address_group(uint8_t command)
+static inline int in_talk_address_group(__u8 command)
 {
 	return (command & 0x60) == 0x40;
 }
 
-static inline int in_primary_command_group(uint8_t command)
+static inline int in_primary_command_group(__u8 command)
 {
 	return in_addressed_command_group(command) ||
 		in_universal_command_group(command) ||
-- 
2.43.0

