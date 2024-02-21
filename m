Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97023F8E2
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708509174; cv=none; b=oJ4KUCqC3uCr5SeApd581KQHFMC3c8kT3q1DMVCmeuCXSf33WcoppCzIBayhTmeg7yOEhnSVG8WL3DchYMCWm8FEAHiXKqfzCbNONXI435BoK1F1yOWwSVPum5OyHrxb3dhUP6fX9GKs63xgRHnZzpzTVo60X6tB93XTRw3Haqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708509174; c=relaxed/simple;
	bh=hpQIzkAUkfjw1oAO8oKeaMgVV1gBPRjHKKseAjgbpXs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Byfmn9EAd49qmT44fl5IinSn08supOVF+xvhqbiZgHHG0PQrLHt0To8uZBlRc9X1FyQ2iVUp9uyMyYMSGCg3VNzogyqEZDaTEv5ajwk7C9ZTrtbR/w4ZzyRY3LJJKb2wXMJqUrYRq+ASx75nohI5CqQ9jpFldP4LK/Q3qBRrPnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJ0el1Gg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJ0el1Gg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-299c11b250fso1772320a91.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 01:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708509172; x=1709113972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umbo7IOMB+N5hMU5uXuhZHNVgY+ZT3DkUOlBqWz8poY=;
        b=EJ0el1GgsXOwgLKstB5N83mdclomIPJ7cXkdc+UQyRVhsA/WWuU7Hf+rf6dHfV4RuC
         JRFm1LCKh6WRwygBHPxujSqUvpJsbzT4J2n70ML7SBDmXVssPQu5UFsqMtCGI6n4QrSP
         XC5EV5nr3m2AeoW17eYXVykpn3+BGvoqeibWrCHML8DypeNMxs3YoopxAikRTc0aFw4g
         6ltuQpbQOyRJ3ZqZbHt0YymrXP6G5JLZr5sT/I6U8vCPy4zh/tsAjo55+C2kxzZDNOvO
         LzFsJwdk9VR1O+mqKkKL4bMZK7WcnG5/qKufg2Kcngh9Ayy+OR8rQb98E84EdHMUf5mn
         WfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708509172; x=1709113972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umbo7IOMB+N5hMU5uXuhZHNVgY+ZT3DkUOlBqWz8poY=;
        b=oUc+dk9gpo6i1HGIlSdwCn/LnnASmJbulHkA51HtOn6BV6k2+Vi3u83M9d4IXSstpl
         P+KBRzoLMTkXEo0i/5udwN+J5IeTuMpkmTQUPQJKW7ud48ovGAKjZj1ZuNjsgE0fjo+R
         BwO+zwrvhtDIzt7JPrnbIvOwn3ZNXxW2TFAAUy3elnfM7mUXxebX8g+x50p7nUYb05no
         +FKrR4G+3HMF6KSNZObby6L6viMDZpf+ujbX1utjcAtSy5KJtJPBDuNnbEnfJqJ5w4VQ
         6P94OZBM21AA4wxMPDGBwnZCAvD12qiKn7JPf+TvCj22LpIaeGG0+KFmZoEEEKinSM0L
         D/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlngWqLv0CGvAegz78xhNgwALkrMjFJjloYzMC3dnvhLyBXxV8OscuogNfh6oIpgxoYsazjiJaBqBdkbi77w7Cp+pBjeJSNReL8blKRA==
X-Gm-Message-State: AOJu0YzqnhTwRKOchpizAhOJMXbOuCDmgasOVQRtrdj83dZCMxzJxPv3
	vVY7Im3HvUI+R8oop+k1l33a8+nWFhkKDZOhk88lZEu81J8xijiR
X-Google-Smtp-Source: AGHT+IHVR2SHjyVF3c5NtEANlYKund2uDElKO0tgKWeUMqRiBx6wQMP4L/8c6ILH58TxmxIy3JESng==
X-Received: by 2002:a17:90a:68cf:b0:29a:1b37:4bfd with SMTP id q15-20020a17090a68cf00b0029a1b374bfdmr666223pjj.7.1708509171837;
        Wed, 21 Feb 2024 01:52:51 -0800 (PST)
Received: from localhost.localdomain ([222.151.198.97])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a8b0300b0029942a73eaesm9124093pjn.9.2024.02.21.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:52:51 -0800 (PST)
From: sawara04.o@gmail.com
To: gregkh@linuxfoundation.org,
	sawara04.o@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: fbtft: Fix "space prohibited before that close parenthesis ')'" error reported by checkpatch
Date: Wed, 21 Feb 2024 18:54:04 +0900
Message-Id: <20240221095404.592464-1-sawara04.o@gmail.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyoji Ogasawara <sawara04.o@gmail.com>

Since whitespace is prohibited before that close parenthesis ')' in a
conditional statements, remove it and fix checkpatch.pl error "space prohibited before that
close parenthesis ')'".

Signed-off-by: Kyoji Ogasawara <sawara04.o@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..02a16671f2a1 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.39.3

