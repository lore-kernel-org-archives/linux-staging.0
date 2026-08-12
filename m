Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F90240F729
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535074; cv=none; b=eKCtS/XUZalHZJ/Z5dwrmBncwea0nChcOgdM+BxndTc4sPeCq34aT1Jw7/GmKThIHFC62vdxfkovSyHntbpflhPTzMpQbLH2fkCYRXG6d+C5lBHqUvlz+jqmdkatLp8+3Smga7OrQNyq2dTG+UCr8ccPpYFTHm9H4lKGj+UtZSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535074; c=relaxed/simple;
	bh=6bDgppw1upMRRhV0yGcXzCvzM2E7ZuS4xeKKgk2RLKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a23izeu4GSjNwHgb+i2N4QTklkHr/oh28QeVp4JvfkjcArPGbdigaxTh7mWkn2wLpFATJQ9l/03LYf90ubIE3gKYCQXyQLOW7zcR/ISeFj+Hz8xcffczLUnwgDX0/fbmCAilwr+hATJKCbkcTesrB0NbKWGhKCA5UB8MuFwCl64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9xBzSYa; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9xBzSYa"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2aab18795so930468e87.2
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 04:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786535070; x=1787139870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHDNFQ36fyaG0ir08tDXiNr3M+QaNM3vkw/XZ55Hif0=;
        b=s9xBzSYanw4B3nvKrcuw6yqnRkYrBIJLbZvHy3fMfEo/M9wVpdN8lyo7lr561NbDPQ
         uAlZ58Tz4a8U98d6BSfC3naKEIeTr0EwWWBSZGo+isIVLH6zvEa2EAiZRdmu3c88VHSE
         Fr4Vlmoxlk/5iBnZyFIEDjZ2W2RbpAcTekQvdJ6xWkwrgWlorYdcSYvCdJh8GeJ/a22n
         1u7btBuNo2rNAS6IGIgdX6k5t6vfknB41T5rXqgJ6hqbDwOI3/Nh8JCVhnOdAMTmWvzn
         Zje5rD8QAwUoDxK3F6LnaG29PwRgKbPsQyMNe5qrK7fiqmBXBlK3MM3nGdIql7wXZLtq
         hvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535070; x=1787139870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHDNFQ36fyaG0ir08tDXiNr3M+QaNM3vkw/XZ55Hif0=;
        b=cKmZwJaiQBWhmE/2nrJMlu+UK6SJuO/idtOdw4I1o4rsh5BGDDooyhmUUI7mWwJFq6
         ODRukRI76eMqB6SfJJ4VnxmCCPIVptDXAG5CMGHUlNOWzf/PdWbxBEeVrKYILKWVjtSH
         0bVSAbIase/gUbvZ6eqTDR1MqnthTiqG31aT/fCXNy3UZm5Wp3YdFyaNgOn4iREbERBV
         4OG27jQcDbIO+J6keem20opiZnpX5X+6FFDujToBKnNVKBmKVr798sZnZgri5UeLyO+j
         P01Tg+GVvCUu6h3pPe2LbCRcDfjalfEEM0LRmLbJphjKpYvVBSKYa3PdhL5v1uCbOzbn
         3XOw==
X-Forwarded-Encrypted: i=1; AHgh+RpD83kg9FDFtJjMvuEylzZCp3c5+GoD9xhCuImuUws3J3sfmftmIuk9yPJl1jtHLoBoKACeULhkVJDfdffV@lists.linux.dev
X-Gm-Message-State: AOJu0YywEtC6O0Rd3OrtCSCqUTdQURbj2kGOPNQ9QwA4vPvnw1GrWd0q
	st2iHojCL3MdRVepjROaL9Lgx2o3yI/55IQqcBsdvC/BdyvjEvPBW3E7
X-Gm-Gg: AR+sD10NzFnsMRHyDly1k7NGVg861tC6ykAsxHdKXWxPvNJxdhFC+LzmZ6oQ1fGBPEd
	tGD6pGUwK9PuZQJ9W8qpoMr83gUX0aGD7sMa2bgSCYnQHsOWpXoUlWpjQfkvZ6mV9R1LjFeM7Fr
	LEgSHwRzDkhdkJkK/BbQWKqSxQZNJW4nL3rcsUF+huNO/bv01z3NGafo9xMa57JIfGLzcTe8t3e
	FAZGgdImRctB8p+PButebo8JJNfunprHpUMbWP+aJ0tcRqPmdbbO9xRzk/zoNlFeVwAgB7R/k+B
	8cyhvokO5cX5NHQtPevvi0HjY8WfU34pwGI6gMm/QG8amXt30RBayEwjJHSTBYZezaYPgSvbz6G
	BMaw+KvaT3vPxxSbthJDXss+JGheDCBXzCsm+POb5AUids39oafRCNk8SLAWIxfqN4W2zd3K/Vg
	DdNRFn6NNOMDjQAorJj7vgidMwSHCMPruTzU4Bhh8/3WEaQWX189CwmtcF+v3E2weFJpXz
X-Received: by 2002:a05:6512:130c:b0:5aa:8822:c945 with SMTP id 2adb3069b0e04-5b44e336717mr679286e87.47.1786535070291;
        Wed, 12 Aug 2026 04:44:30 -0700 (PDT)
Received: from gentoo.home ([2001:2042:2a39:500:8a2b:6241:6d4c:773f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfb2810sm442736e87.7.2026.08.12.04.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:44:29 -0700 (PDT)
From: Maxim Codita <maxkoditsa7c@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maxim Codita <maxkoditsa7c@gmail.com>
Subject: [PATCH v2] staging: sm750fb/sm750.c: mark g_def_fbmode as const pointer
Date: Wed, 12 Aug 2026 13:44:21 +0200
Message-ID: <20260812114421.24860-1-maxkoditsa7c@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026081233-simmering-exerciser-4ab2@gregkh>
References: <2026081233-simmering-exerciser-4ab2@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch.pl warning for g_def_fbmode by marking the pointer
as const. Ensures it is stored as read-only.

Note: g_fbmode[] is left as non-const as its elements are modified at
runtime by lynxfb_set_fbinfo() and sm750fb_setup().

Signed-off-by: Maxim Codita <maxkoditsa7c@gmail.com>
---
v2:
Fixed extra spacing between char and *
Compile tested with make drivers/staging/sm750fb/ (no hardware to check
runtime)
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..b2f5f49e447a 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -22,7 +22,7 @@ static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
 static const char *g_fbmode[] = {NULL, NULL};
-static const char *g_def_fbmode = "1024x768-32@60";
+static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
 static char *g_option;
-- 
2.53.0

