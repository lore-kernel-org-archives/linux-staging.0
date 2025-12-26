Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16C284674
	for <linux-staging@lists.linux.dev>; Fri, 26 Dec 2025 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766750682; cv=none; b=s47+Lt5NiqPxO3aeK+dGIADmzqyzEsjDVay6RuGhnnHrhyW31Q5KH+23HG2RsvqSeVyTfxbX6Lfg5QynUnpfc+Smwf7GyYwVn1thff1itrjOs+V+HfHokHOVrNR89mDFI21PhYqRTCSB+Ua31RmMcT8Rft3XMQnZHL4ZV+7k/VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766750682; c=relaxed/simple;
	bh=5WWw3Ai3nUNL+KGovcJwkDFtqP99aWr0F86Mzj5u/cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZB9elU6xKVkhhp/PZLOfCvLpmv0k8kzit5mBsJ7t3bxj5w3TKW64/2renxZYb82cJodMLJvAoEH6nlr8zGE1IC/v+rTFlwOnkIT1Zj7YmVTgdPFF24FAZRqmtuR8wCUkpDLlXcR20A0AsLKXj/ebLpgYZG5LQYfzNS3w3GmcDgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj6hDgNW; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj6hDgNW"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34ab4ac9a34so1221336a91.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Dec 2025 04:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766750680; x=1767355480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzOikjZCAZIVSqRjJRRgnV5+w+5j2FvIdULvG9czO64=;
        b=Uj6hDgNW3/Ma3PUq5k+8mQTU5RKZLLMmSn2q0dx5tboq7sm0/IazmEocEoO+wc+5Cq
         OZ3FpWNern8eBI85Vwxb2RHZAJneUCS77UzynsAg/d/1une+qhUpqggzbGfs7VoIVzlW
         jcxSLlZTCj6ho4r4p2QBRj3y3LOZGLwbmOkrOUeinLkmXg0rSHHFRukLWha3vcz/cPXe
         MOBkF8LemX7JjiZvm1twvPGLB338HJYnPCCrr3uEfZ19ICAWdJHnuba3i00Xy7wP7HGK
         ZqFawMf2r28GgR6n1FL4u65WGd02ZvWMO3HYSkLyIEmrOC3RpH77h+VL80bej0NcZHXM
         e2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766750680; x=1767355480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzOikjZCAZIVSqRjJRRgnV5+w+5j2FvIdULvG9czO64=;
        b=MkpwDn23DsQbn3wuH41okMF2LK90nMh4YLqIrWx/Ka9RBPLqNQy8Od5CV0iolKTzf8
         GF2C1GDK3upLN+RW/5RJ9ticfRer1irK0RVI10A6ONdru9VwV6R/1cLWolaGECecYwnr
         +PK2qf7wNnfzad6V3iDQ70jFIijvpwE0ltSTX7yFe+g8TAwb0wOpLkNClM+IGmXB5fbb
         K5c8lnhXLmC0RVDlzTVeU5wR5YMS8lQAReR0/jffZhkWQhRMgOK8Z0EX3ULiiYIOGHWD
         F4h5CcchZZ+jY6butz6Y7f7SlYVEj77QzhX9/9+UIx49T4tAIxpz3Q0XFoOKPViV4WL6
         6nNA==
X-Forwarded-Encrypted: i=1; AJvYcCU/qbUQx2cYKkgRmXfreYaxVAXPWQdsWRmLHzVtMvloBr3XBgbBLTETc8NWBTyUDZMzZF9xfAycntXDOzv0@lists.linux.dev
X-Gm-Message-State: AOJu0YxjyMPyyDNKgRQgllaVg4o8U4KdSjakXJkXD73V8ugkVUsDbP6A
	2yov+n1gcOcNeWzt8XmJZWbWZ/w3fuSGNFJ+Mie7MEisR2fX2CxtRuC0
X-Gm-Gg: AY/fxX50/izAHZChDw6Hm8OXvQyQ7kbdF67vVLbD1E4GTaB9bXW2jgiiIVCQAYPlIA/
	5pkukoR8dayhHFfC9qk+YgQmjpf4pUBUCjgT/9sGGd81RSOtVX7764z7iTBOLlZA8Uxpq2k4h52
	VnxTZp86S+rwrEdc9YUHHIcH1OG+TE8xBNX9Sp99rz/YzeMf2vIq68z/0T2ttHWCIfakionrsoj
	l4awL9GcB5YMngFiHts4COiy6r+2Sj920V0o5YiZAEkPHEnJ4O8jil7FHEDx9HbjF7ilyNOLHWV
	mOz5iGBTBvx1MfdhruvnGft2NDf2afrUnW/2nUNbR3h0yluSyyUTal0mXyJIejvzUT/5Lj3R3qf
	bvEiohV1RNSaevyoPwcWNk00VPVrAooICQ5Ou7PfN0BukTMxGu4KtPx6Bwf5xtoZ9fZjNJAFnDl
	oQlmRxqKK1cEfv/IYaCtqP4cA/fy2Yk4fjE6nIf7kCj4PafyIV
X-Google-Smtp-Source: AGHT+IGHbrz3Pi/17OtuTBKj/RvZlBgKGNkstEwcas0tluFEbj85RUQ4XNy2YcB56+6MmI/E1pvQ4w==
X-Received: by 2002:a17:90b:4d8e:b0:343:e480:49f1 with SMTP id 98e67ed59e1d1-34e921c4431mr15253293a91.5.1766750679676;
        Fri, 26 Dec 2025 04:04:39 -0800 (PST)
Received: from zlabs-hw-ts-ws2.csez.zohocorpin.com ([122.15.156.136])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79a17fb2sm18821244a12.12.2025.12.26.04.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 04:04:38 -0800 (PST)
From: MottiKumar <mottikumarbabu@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mottikumarbabu@gmail.com
Subject: [PATCH] staging: sm750fb: fix const array warning
Date: Fri, 26 Dec 2025 17:34:17 +0530
Message-ID: <20251226120417.2599020-1-mottikumarbabu@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing const to g_fbmode to fix a checkpatch warning:
"static const char * array should probably be static const char * const"

Signed-off-by: MottiKumar <mottikumarbabu@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d100b9e1d3d5..7afb58561a0c 100644
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

