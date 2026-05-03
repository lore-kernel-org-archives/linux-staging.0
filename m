Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EBB220F49
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 00:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769871; cv=none; b=exP4sC6B3jULoANTGzuJmuJd5S3N8SYIiQVV793I3wm1p006AoLoCBHfIoT2DjzWMNbVCWHK8jA2VeYczjK1waxyQovb7SlyoY1I3kqxDVqY1OcU0ID9VTkcM7Y3ecjfJO7qyaAT7ErajpkUcSkor3MFSXY8DWpZsI+kUQKogQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769871; c=relaxed/simple;
	bh=oepVN3zzq6064BKTaXpgnxq4JLHdTznAxFO05g1KGXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRc45nbUDZR2WP+/RshsugEdAT2vYo+Ssc3BlYgLsue5DhVOH/OnqmqdL/hE6pyENhqkxUvkrEaUiaHnRJ5kD2OGcP9tFQcPku9HFQpmHtHZi7+bCfd44ci/7T0usqtED10YzhcyV6T2jlViqFYSIma2kSgLwFF4hlBjhgWAUVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=bEbmEhpu; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="bEbmEhpu"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95cc96eac66so1791730241.1
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 17:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1777769869; x=1778374669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABDR/q/xwxYuiRgUF7t5Dck8wiIS5ZmruvsZbkbl+Po=;
        b=bEbmEhpuyit5RD/fbuyQWQYWzdj7f/5kYq65JAE6M9cPG4pI2UHeZM/YhDoGx5HqL0
         k668mQwMV5oy/jV1fmC8pskYoK7+tbA4SmvRhuT2586yEZtQ3vhDo8YJSftOhGAXz8GI
         NFQJ5NKlGkcxkiU3orodi3X51I3nbAvotW/xEI5MoBQRS/boSUJBq34Zmpm6zMoAAmLH
         IOOEIT/DVgLQsTbpHPx0fzzeytXBtF4/3NrKhBY0LActUwnO3ecYAi7s8TFZJ0kv0rBs
         8feil74T2kpxu/you7+Pymzp6qraFfkBgbArbe4FW4dQwJX68cl7/M6xUcwdQBecuEUw
         kZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777769869; x=1778374669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABDR/q/xwxYuiRgUF7t5Dck8wiIS5ZmruvsZbkbl+Po=;
        b=EKtacVDGv69kvfpcJs7XPIwQUjRcH71qS6kWO+V8qrevViz4itLXkAOgLI6+LJsr0N
         gDM94tuK67xmXYJqqrPZKvQOPyrh74WM4W3SrC+lsVCCKtJz3AwLxdsu7QJuH7SWJKVG
         OfO7aZTmZPR01f+UEmFSmFUyXqOGcxN7SonBwuQbgR4XpJjziOg/zBhV39IJouizWrEx
         9yLdlFcZedFo9Rm1pfRIPn32q48NHazwAN658FgL1P87ClPI2QfhFH4djFTa0jqj6Lsz
         Y7WwysC0IcsZ5qWCLGQ6E/2RY/oOj+o8BCUtrDdfJjdUiddWl25y+nYxmpidi/hbrVqV
         B1UA==
X-Forwarded-Encrypted: i=1; AFNElJ+9kY8qcC2EKgKx5p5X93hv19QzM+pBAqry+zOsAGo1kcHhwpC8aEiQ5kR4zeP5F9WUoA6MdbtHwZNWG/CS@lists.linux.dev
X-Gm-Message-State: AOJu0YxA7Sk1fiMY3vdmgPiT8Vc1npjpE7d+hOljWEc2HOKVmHHP5IQB
	071r6kRpL473kHiCbA948Ngb4pVAR/vM2ElIYrVGklbJOvRAHjP0LbdVXbsT+P0zKT0=
X-Gm-Gg: AeBDieuZHe7ZPwT7LLaeYb8k9BSEgtglLiOqfeWJ0e+ajgu8myvxSeAJSU7HDa6UGtr
	jvGPAlKHdPnHGuViGgIyopLkvZHR9triMSregJhQTt6qdnvveoXFnUg2znJe6oGvl4GAoaQAF1L
	KnM4Hy8d4o3MPY5RMoX7hy8pHxBx407Gc8dxipof4d69hMa0F61RS5K8KcNNeLpYe9TpE3rTzys
	eBrwhFsOSrFtmJ4ePmNE/r6Rp2DgQ9rZaOdZ9XXbdU4j+85Jcg89ZgOTGnIcwTmWI3OJgPkgRck
	MXnjTI5ZzVWuZUOw9JChC7tkohoSv3gMFFjXhUZ4BNtegibDLFWpZ878LpvS00Guje+Z89PWfr6
	JF+XckncO7Fwj9r63qYjsyH4rvnO4qIdoGcOjTkvk17nOsF3xmB6DuqjQQPr2TKujT+gF0eMmY2
	BR/pldi7l/xHGhoxuhyJMTAZDXvlrAkQl6RcG2kAqZdxQZFavtiT7R5++Cmil165A8DY5APikww
	pFSa0pOWdUawQU4vlp7sgDhbZ2jEnh7AFupM5f1q9fdlH8R
X-Received: by 2002:a05:6102:3353:b0:5ff:b8d8:b40d with SMTP id ada2fe7eead31-62d8725a5abmr2002245137.21.1777769868994;
        Sat, 02 May 2026 17:57:48 -0700 (PDT)
Received: from localhost.localdomain ([95.214.114.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62ef2b9720asm452862137.6.2026.05.02.17.57.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 02 May 2026 17:57:48 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH v2] staging: sm750fb: add const qualifier to string pointer arrays
Date: Sat,  2 May 2026 19:57:44 -0500
Message-ID: <20260503005744.68974-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 'const' qualifier to 'g_fbmode' and 'g_def_fbmode' pointer
declarations to make them 'static const char * const', as the
pointers themselves are not modified after initialization.

This fixes the following checkpatch.pl warning:
  WARNING: static const char * array should probably be
  static const char * const

Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
v2: Resend as individual patch, not part of an unrelated series.
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 62f6e0cdff4d..dc9653ed2108 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,8 +33,8 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
-static const char *g_def_fbmode = "1024x768-32@60";
+static const char * const g_fbmode[] = {NULL, NULL};
+static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
 static char *g_option;
-- 
2.50.1 (Apple Git-155)

