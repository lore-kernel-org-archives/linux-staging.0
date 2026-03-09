Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6011E1C11
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 00:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773016094; cv=none; b=R27lmjZrVPDaMaac3P905teFipttS9fgZRRDlbuWTdYkScnN5wgSkSJk/1cDWZpR0U3kyoTfBN45Rp6M3FYULumzkSU63Fgz4z/1JZxQtSjIkEJHlsTB+bxzi4cwuESDHAOIB0DFK2qHTk/14L9mnRCmZfCB3WmsMpYKxXfeSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773016094; c=relaxed/simple;
	bh=mBr01td4BCvpqI5GZ0lfJ69/mbIPnGmmAZ6z106k/NI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uO2IlbNMoccyZVtGxgxHi/WKSIFxkeQZBLc4tZb6hzAbvSx7eUP+52GoG2a3LpP2/hPKJTt5aqeGG29k0bab+s+UAKZL9t6Mrnz9Up2scC8ciFeAoLgmDICjY9zjZD1e6b4p9asQ7yNlkuyAYn4YPp7yZ8LE5qaS5I8vRGCLIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLf87YAe; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLf87YAe"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffe9a5b052so1412389137.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 17:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773016092; x=1773620892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTPcH67gBIMYWJG75czRVYMRcOaSA8FrrCACoKPG3Vw=;
        b=OLf87YAeDI+GA25QuVMuQPMMQ3TjRcNT9OEf/oZX7Dbx9du1+N0Les1mS3XfKW8Vdo
         Jyi4gEHZHCYlgbNmH6xy3bH+b1RqkvLKa3jsrnZbvjDUNq9st5XOW2iD6sOEvdeFHhGQ
         Ylvzf30eJmdog3AaAoPbfsEUYsLY8FjcSICkCx3eyrR7aJs0Hrl51oMTNAuOl+55fa7d
         qHTv4UffZM+pfrqvESr2XwZh9qELo0+6LLqOk1dScwD6OC+mvb4FEgYN38C02jmZnwcR
         LOdTrJAAB5Eg7JL59U9VWlGKueiCSv/3IzFlIi3btiwZ6YnvUcbIIe5OoEBArgronlcY
         bAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773016092; x=1773620892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTPcH67gBIMYWJG75czRVYMRcOaSA8FrrCACoKPG3Vw=;
        b=gi1BtkASY5W9I+E85FtN53ewKL6jlKOoMJX01GYEDDFvyC7r/qDNnS1IIsq7H/ikNV
         EhMJJXjP6iXBR/X/tvtDGYm3v26zw5XGvRt/sSHHxrtS+yFfrEuyZ8rqd+DAqe9k1DOz
         JMZKhbfvy6YNCLlkcvAJ5GTO+/2jkbdLgHPNv3JkhRRn2aVP4ePCUlSMaVTnskhTxvUp
         7Qb9bVGT3qMupGN0P0F3sS/Sl2/lg2uXWrw31ZqwhMU1cKDmsWvS9yIMTRnBJzdtMsU8
         msILfdBhbYG4oLxttRvzs0v29U/s5R4EoUYNzNFXEinmAMfv/W+wspGlpjqu8FhJHD/9
         v5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCURLoNEFM4Knl+RjGi0s0wfuHOimm2KjHq3RlCEGi2I3li4o0S4hNMNMcYbPAhLUxrsIRUVi6rD5Vt3/Kf5@lists.linux.dev
X-Gm-Message-State: AOJu0YyKjSkib/UNt6+9yj8seFLog8tUFHOoAQGpUnKVbmeGnkNEbii4
	QPar+Kbn6uxcEegkfdMIvIkX5rkL+NJd5jV4lwcYZifNaQuqq656y4As
X-Gm-Gg: ATEYQzwf72FI0Ejw67Tew2zdnUpXfTRWjU3QSlDrKixqaJC8FNFHFDG9UZeXYUqJn0h
	fyGdOpl6vM74kfxlk1PZk+VvI4wUq+dpWdwO+UHm6zUWyDRsmekJ+DPqwX1AFiRx1cfkWEUXg0S
	VeRXnT85wV6KrVtVvjo8Lm3OKCMr+hRDbFb3Uvuyxp/zJeFXrCK5ld2/P5+EB4PX5BtDtSLd3qX
	DYk4VUJWaq7b2HcmA6hZ9dhRR5RdFZ/Ds7PQ+Rxl3pArFbkV89mm2bwZadghN5OViyznPTR2y1y
	mPcW1nccKkm9BNzIIFMa9tpbfNcMRNx3olrpcvT1Uqr6S7zC3H/JgSrz/LXhYoZZXPivWLILdOj
	qPMO+teaYcaqrzpg2Sfge3yOeiKusK0sjAwmKTEoejVU4xVT891yn+6LJ36QIsrNf0yZi76vQNw
	yEnWSNj92PEa6+Ow==
X-Received: by 2002:a05:6102:50a6:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-5ffe6124a7bmr4227595137.23.1773016092039;
        Sun, 08 Mar 2026 17:28:12 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b38e378sm7523203241.7.2026.03.08.17.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:28:11 -0700 (PDT)
From: sluisr <luistermc789@gmail.com>
X-Google-Original-From: sluisr <contact@sluisr.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sluisr <contact@sluisr.com>
Subject: [PATCH] staging: sm750fb: fix static const char * warning
Date: Sun,  8 Mar 2026 18:28:09 -0600
Message-ID: <20260309002809.15746-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a checkpatch.pl warning:
WARNING: static const char * array should probably be static const char * const
by adding the missing const keyword to the g_fbmode array declaration.

Signed-off-by: sluisr <contact@sluisr.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dec1f6b88..08d4979c6 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.53.0

