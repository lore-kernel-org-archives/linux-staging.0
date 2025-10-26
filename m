Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F312E54A3
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 23:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761521700; cv=none; b=h1PtHMoRvd8jUqN0tKP/CgP1XGjMtJVfZZr1Xo7gn77P/8HjOeTz6Dv+0LH6UfOFxHK5rN82wDm56Y5CPOdUO44aXXKB6XxSdvHw40RSkayUqBpPFs/CMeoK/f6DrbwsC03sdK/tGpG4lyAFseY95bv3PuyrJhPJP8+yCC/mtdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761521700; c=relaxed/simple;
	bh=at/67SzS/p3gsLpJ5YF0J/wwgPW9IOdgdRXKzYCWyc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pn2LdIoeGkvl1QMM0lxGhmNqM2eGW30hM/KZ+4md8dzRYGKflQqTW6Pq9JCpMA7/5arWPierJs/434J9Cj66m657yg/mGw+1niIBUNaFMzaQhsFYm11M8VSbLeDsqSroNNLYej4djFAvzr41HZv6E40bCdnecrhDWwnvqH3ffk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICO8cIV9; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICO8cIV9"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c3e2221217so1981995a34.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 16:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761521698; x=1762126498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjXmcOnCPMZhVr3FarSjpJslIfc1BLVEl3PoT/jHhcQ=;
        b=ICO8cIV9mLwM0wh23xcD3gQDg3hS/K/EYla9RIr0vYnnP2FajyPbyhnT8mCP+MXfQl
         16VTA7X3d0YGwZYutxMymhEWXWP7yyiZK5UPJNBA3hvanWv/YAp63hhQbwDXhmBVUhVZ
         plO3grPd/G73V5RtO9iWj8/oqU5WDdOBRfoZCYeFznpahW2C8jUZkQiVRoVV6+Uhegq9
         K+xf7Skzi18SzAi2gsMZe6Q7ZjnYKZWlMZkUXEJMkchtYazRcGJIOGphCSW8QwPMy417
         WgR2H6bLiUh2ASNh8Xpd9o9eYiejnaV2pz48IKKmPUnHkwoOC8tBC8FYMtn7wrWkdiCh
         Dlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761521698; x=1762126498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjXmcOnCPMZhVr3FarSjpJslIfc1BLVEl3PoT/jHhcQ=;
        b=iOh/5pRn4dIw/lq9SPodGy8n5gsJAvkkc3bsjaMQfB9jYt8kadzZ8OkttV/VvWR6Ck
         WpE45P0pHOEXoKKVzvESS1CEeEBCXUT+28ZndYlTwYwyFbyI1F9eHWgWEa5s99LXmGeY
         zgdS1fedifinZF6MySYrH8qTAnkg6bWGXiRTlnpCEgk6zbKBTKwAKMZGLeNLZLTEx07M
         /WiCyu+uI+bhflmzIbSrUNCyQzVVmBAwzg7RKxj7abroJNjGKHEUdQZEhE7Lvq28gxtz
         j+7tEx7l1L2TD7dVrU82CHTdjV6D+sEH3UpRgUf1InaHmgcIdLZou6dAMZijGzUoah+I
         NNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7envYJvC/8957J5sv1MS+wzUfBOYu07mUNtvxWJjrf/JxS6FQYmt8hrg0SvTM5RfF+oCj/GleEcJ4IOxj@lists.linux.dev
X-Gm-Message-State: AOJu0YyElYkr0aYNYRtHnKQVqRnqFA8djXZv6YsqdfgnV1eW2nl0VpDa
	VFPEGTlIjR1e1OWwiEBzsZ316f7i/2harB37xxdpu3wc5FIMi7yeIKq5
X-Gm-Gg: ASbGncvdONfyIumZpr2kfpYsNmHEOX6T5W6zTZZq1doUBQABGzxdCe3TyvH04F30kAS
	yybC8gaII+5LbThanTjlWltdXBJKS2HHrnxhUOWjHH/7OEQxK4b9i3uaqqXPEe8AhaNuuqxfYUZ
	e/psuK8h3hvdzmww6vX/gHzJPFKW907EjDEoB4HnCg9gw2ogMiRb/6vdo15BDKF9L3x2KoSK7kK
	vMRmoX6YDZSr6AbZww8tDyaoO/hLyBab8BlP44uy8jlOOZl8NSN9AblJzX//c2IdoOXD4Smd7Ko
	YRP1ma66mthqY75gfh91mRfBljd4hNz1f31penSPXsTVWx/HBTww+fSYwpOE4j64lfE3ViFJKT9
	WeRp7QMbHQAVQFzwgWHzRf6LTTudWRNuxlY3b+VnKbtEBhQnQk677d2GkP6xXQLUXRBWtrm5es9
	Dn+urarEmEn5kAaawDzD5JnM63C8CxKRv2
X-Google-Smtp-Source: AGHT+IFRoVxA8JDxaqFZaD1Z5ybzyAsPgQl8ptpUfUhfppOKQNfzWK4qTEYWo1gQA8fuuCYqe0XEzQ==
X-Received: by 2002:a05:6830:83ab:b0:7c5:3aa3:4927 with SMTP id 46e09a7af769-7c53aa3554emr1369347a34.25.1761521698127;
        Sun, 26 Oct 2025 16:34:58 -0700 (PDT)
Received: from localhost.localdomain ([104.247.98.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c530134ddbsm1691602a34.8.2025.10.26.16.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 16:34:56 -0700 (PDT)
From: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
To: sudip.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode0 an array of const pointers
Date: Mon, 27 Oct 2025 00:34:32 +0100
Message-Id: <20251026233432.1707-1-cristiandelgobbo87@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change g_fbmode0 from 'static const char *' to 'static const char * const'
so that both the array and its elements are const. This addresses a
checkpatch warning and matches intended usage.

No functional change intended.

Signed-off-by: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 3659af7e519d..ceb89ee99ce0 100644
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
2.34.1

