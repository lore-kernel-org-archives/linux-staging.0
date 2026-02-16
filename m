Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BE122576E
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 00:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771202394; cv=none; b=c7AV8ZpawPROb4vpckqXm1uxODTi/e8MaOTnfX3lMjZiLSIGILeWLJURvqqdt7r1AXl2H5t2gxFsILFgvcMifvnTlBu/mYQhy+Ji1bJJFXCoitTH0hcgfqvX3Pvqml+nDUw/AQK4urEBvjFIRuiQbI82Z6xgijkx7MlPlu9WMkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771202394; c=relaxed/simple;
	bh=4tm1ZqobNRN9gXqS89aMjJcqkkBC7kWiXLvsGVQ5ByM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lVh4C5apACb/m1/LGBvFFbkdzZWQ3Yo11ayqmtOsmRWUGQlD4w6aNhspVK+jJT6IFFR7R1L7IHh4unP1G68mMy7F1Z9P83pMLwRoOfvlxYwGTWsoH77+uGNxnPxfXqSbhEsS9wAvlxuaGoGamfyU1CYZX9hok9H7DV3PiNalkSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN0Fre2r; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN0Fre2r"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48068127f00so28410545e9.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 16:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771202391; x=1771807191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vig4vuedFM1p5E9RWA9Ad6X94bVgmk9hfEgfxEl4qRQ=;
        b=jN0Fre2rsa8EBqM5RKs0pFiioDs5FXL1KlczVxh1L4wrIY4qOQgJC/Wnpu8Z4OIsg2
         ms11w1u1/dEzQwoGxC3Ue4Oquv0oluq28DoH4BLJi+yyQ9xwqbmGzdg1DY1NNfRAV636
         EtoJteA/XELhuXIGJwxdDNvQuXwSVnOJ1pK2R23eYSxcLjyqJ5I0tsPQAko/s8GlB5vR
         bjkt7eZhlwxFA12mxzc52XctdJIFsbhYJkvSxFlbEvfK/f5Yk46p8KMZJumVBJDk8323
         +Nfkot680v2sxqRfZ/ABeVndBIIJE4ULS/GQ7DEKIal1srM/ZUxwdXEAYaU2jjZ+URFO
         5yBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771202391; x=1771807191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vig4vuedFM1p5E9RWA9Ad6X94bVgmk9hfEgfxEl4qRQ=;
        b=mV27EGv90cfgPC/4VTkFFge1XHJbTcr7IneWgL+Qd9BqIIGzJvYMLrTs4h87keaoks
         3mngVhTcc3ZHAWeFe6h81Rj2ZqOYLstr2R6wnIEAdTzd5Qt2h1gFnNHwKIipVW51JRQs
         8XS0FX9pbN4gjRT6ce4X7SyC82mibyx7IybGyJR/ZEUCYBoj6Q/no3/cmcmT58EgMmMN
         Mha5hVy5uXgRnQCoH4Z4RPYRd3sHKbT9s6wcfK4Hv2YrEcU0gXCH19/sZZGQ31cZgdCz
         0PENUfMN4CInGcOcSoNdbWgK60x6D0tu8bgZ82IqT27I6s9RZDgruqk6QINN8XgyZUN4
         VylQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWbMMD8Wmap4pZ8Z7NHJDidb0JbYKtZeexHN9B2NfrSyWIN9CkEBCv8YK/PGLUMkB1zLm4lIhbfT4a6K6h@lists.linux.dev
X-Gm-Message-State: AOJu0YzOE6fkIcr14vt4InoDz3Tz9/Bcl1Il00IRC2/L/KsAteHlmsa9
	ENZgPp1CKprXeiyokrG7KNGqWZYb3BfHjX1yUe9u+rB20dUOpxu9VR/l
X-Gm-Gg: AZuq6aIbZUxg8knft9omfm79kF3SIiPrJNKDcX8WLf496bwCXarOiXgyPt8nOUnYpxA
	N/SBK+OtQuYX7VsLTx0BcI80HTN/zBpBCYexCRajMjYVxhp1MNQEzsVwanP0cZZe1x2Zg2vOgbJ
	Jjf1/fx08QxZObXExgk8jdnpwTEDgdYmZFPNLQ3cd2+dna976rAO7B87X+Tha8S9dyYE9kxfsHb
	SYGHm8otCv5LqS+IlaNlmy5B3bPgEuCtDAJhzK8IbfYPU4J98zrsgKDwBrdLONzwhc0wvBoP5iY
	HJiCCluayIFE+BzZrjO0JGeq7JNvdmQ/YiVxM/C65X17YbfDd7rkMEdayfHwRBXFnzTrG20CjkK
	eYpeQweSXU9q20u9Y+Q4CqEf7UIhdyGzNAmpDHr+amDmHNehqHZbhQVEvEeLDC2/oBJDcEP8JhJ
	eI3TJZAioOM4iKcfs+KsRymtTPTxxIzfoWNw==
X-Received: by 2002:a05:600c:5299:b0:480:19ed:7efa with SMTP id 5b1f17b1804b1-48373a7a0dfmr118045645e9.36.1771202391232;
        Sun, 15 Feb 2026 16:39:51 -0800 (PST)
Received: from eyup.ktu.edu.tr ([193.140.169.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d92267bsm573656885e9.0.2026.02.15.16.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 16:39:50 -0800 (PST)
From: =?UTF-8?q?Ey=C3=BCp=20Kerem=20Ba=C5=9F?= <baseyupkerem@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ey=C3=BCp=20Kerem=20Ba=C5=9F?= <baseyupkerem@gmail.com>
Subject: [PATCH v2] staging: sm750fb: add missing const to g_fbmode array
Date: Mon, 16 Feb 2026 03:39:39 +0300
Message-ID: <20260216003939.206758-1-baseyupkerem@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checkpatch reported a warning that the static const char * array should
probably be static const char * const. This patch adds the missing const
keyword to g_fbmode array, moving it to read-only memory.

Signed-off-by: Eyüp Kerem Baş <baseyupkerem@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e615..15b5de33b8d9 100644
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
2.43.0

