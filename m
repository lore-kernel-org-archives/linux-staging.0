Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913392;
	b=aFVwhIxjE9rF7vDw9/7DCjfaBMG93NUYqQzz5iDwSRVn8hEGqIsSQ6v65GGYUbqsRh+7
	 EGVAo1pCMUw+zG/r7Ezax1AGSpBbw8YLMpZALgTgI3TTZ18qMH0ayPz6RVqvdGpRanQ2j
	 u+kTwhdEI9bGw2RicJdMpzPWbJI2kjE4DgwAPzgsBwM7JMlfkPol52zlN4mKvN6h+jKfT
	 Y8UI7OjetpYPxxG6VqBnQsDoqMcNd9sz66Id7jRrFB6SnAbLyYxPnQGKrttRwImvm2hCA
	 NNz+ZAmvlmF4IwsKWpYzqpUeFr094Iub6AN/WR+q4v6aUMA52ThWipdAncPR354LJMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xRj+1WgN1BrmQW8Cu7h3hEln/8iUG3pzDfaG3KwvBw4=;
	b=30ejzJXi+u/ZomyMaKAJ+diKl0zUnvhuW2MagjCDUYunNfapXzxdiaCDlE89M+a7NyPS
	 1SRMBxnXqXYlDAJ2zFITBbGgI//vE7fB2HkmCXERIpQh5eZLUIvTsVZ40MofomgL+SDdS
	 gCdMiiuex/3raJqszCPMyw8Fw6jFmeXkzkr7nsnD4POs9zWYnf8cRFpDeLN+EOE5/3cGe
	 9FUpT9RK7OZLzn3nrmYaa15G6fK2wa8/dDVKfn7oud9qOtdhTvxMWM5MH+lYbQ1kivoZQ
	 2AtjZsDWKOwVFH3ur7lIysoPzzeLZlcfWMBdI2rBgPYTrU/zP7sN3S/oOT4qSETBwbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lk0aQ5pQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356A606A31B
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 21:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D356A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lk0aQ5pQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so22731615e9.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 13:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913390; x=1794518190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRj+1WgN1BrmQW8Cu7h3hEln/8iUG3pzDfaG3KwvBw4=;
        b=lk0aQ5pQYZ9ne8tHxDaCaXRqTqj7dRc2dkX8ywi3G51RQ0FuWhqEaqZYVFEpqJ591p
         Xdld6O9/FU4kEPUjcMAXXumwsDs6pRqi/8SqTn+C6pXzhr7+jvL3RclmuGqluwguILPv
         0hONYbojd0Sg3A28ElqeSjmulhLobGcn3ajv5WZ+Cqt1gPntiCe65lKbU5z6I5VFSOlJ
         YxVhGDcWQ7Ha7ZgfNMp+SAF6JQCce8bYdCWoWE8zF4tg8pxZfwLIo2qSRASHE7meBXx5
         TgLnaRKioR2290/BcxIqIN1LhoWfk9vTBfFLEvU1FbtB0D5wij1VUs6CU1ii2Ld0AM1S
         ze6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913390; x=1794518190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRj+1WgN1BrmQW8Cu7h3hEln/8iUG3pzDfaG3KwvBw4=;
        b=nv9P2GT2/aZRW+/E7DHmxY/Dp5ilLk8wKuYi5Zj4QKPfwI3uF1Ghbt6ZahVnwKsY2X
         AtS9TLhXAkFPoMvxwMBBu2HJb3oBGh2Q5wymjFrlYp23FLwhnJW2PF/4b6HyLNXf5vJS
         62wLwOGyWRecIW5PFbzeyv2QxFL4qGRe9+Ezm7Oui4cZlxeNqQLk47DieYjTpA6PVohQ
         5NXymSEzHaeswkhEKZBxE1REvn6WvE8D79yP0JkpvucLQOwgRhLEn+vOjeyQkmt9YgBQ
         09NnXK65lzBbB+lKiaGWUxCuVE5gcGXov38FmpwjtGTJaA/4rPAShxd0QuR052/Zg79o
         eN7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwK5S+jICPrGlu2QVxa3SF10VLhOibOjn62CB5GDJdi8dG/3W23Jx3mTjFCvfKRaZurUi0rdhOhBiJiv5Mq@lists.linux.dev
X-Gm-Message-State: APuU4Z8PSe4rABh35z16ibOHQNcI5LKtE9+hDFmophXo4DGVm4q6F1Kt
	uZLEBvm2yfz1EsooLyHS3AEgB+qSLddKGVKH0W7ygf2qRR6MddVwWk0+
X-Gm-Gg: AYBFou3GnZxFZsY7kaTBinSd3i9fDiPASWWRPDRfQkpaKeveD1RCIVwISR3nkPdyL8G
	VoN1OVJwPKpsQPgXhlPKQUYurNa/xvSygvz9LXh3EPmo+BvkjccjMPS6saxp+H7aiy9mp4CLz5N
	EtCfxnxTgrpUCqc8aIzNyXf7oF799aQ5mNTGqrWrlzNBgwCxV2Uh2yW6qaRw0jSsQ2B7D7+Sv70
	2Tcy+kogzZDnxJ30mCF5mJIxfWny5+xAx+KMAPTCcqBDfsQgxuVHLGJ/4FZs9x1epoZwB0pVmIR
	13Qb/PSQwz7D4VKtRJfXnXLEQgp2VdwTh4Dd9hh9O5M0BsYuOw+ya6JxRGYzILPhZQAJT9FgpP3
	Nu9/+Zozx67SSLbvfYc60kQRpjTjP7YD0Zos0M9pot/egRqlXSyYdKWFqWXRHvyr0Vr6B+Qgv4B
	9r04Ya8zOPFgUKuDtt08OapVT8vHo/gg6swUDmdByRZ3DM50t46GWa1DmaaBQbkD7mWZprOoypY
	+x2K3f/8OWR65gbED4eA9Xz2esm8V9VKDtAKRHkz3gHwsPNN/JZjB2YDDFlx081WRBMt5PC/Kur
	jmlLOUoDX0mEdg9LoK2GH77qXHRRpmeQjqa5I8Ka0T2pS1V6V1FpFTedDgho2OSpfy8QdE0mO1s
	=
X-Received: by 2002:a05:600c:8b05:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4b6e0172847mr5899255e9.32.1793913389982;
        Thu, 05 Nov 2026 13:16:29 -0800 (PST)
Received: from localhost.localdomain ([87.13.215.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fedc09675sm11703458f8f.55.2026.11.05.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:16:29 -0800 (PST)
From: Francesco Giandinoto <testata.nucleare13@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Francesco Giandinoto <testata.nucleare13@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org (open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: sm750fb: make g_fbmode constant array
Date: Thu,  5 Nov 2026 22:13:16 +0100
Message-ID: <20261105211344.17532-1-testata.nucleare13@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The g_fbmode variable is used as an array of constant string pointers. Add the missing const qualifier to clean up the source code and adhere to kernel coding standards

Signed-off-by: Francesco Giandinoto <testata.nucleare13@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274..47d2917cc 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

