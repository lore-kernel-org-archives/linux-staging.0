Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657193246F9
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779269; cv=none; b=aLgJPwV0fyoQTGsoHD2NoqEQN5oxVSadCLuQwaOdUiVjYRi/6/tHEP6prk7L7iO/E/w6DXrutp9zP2ubOb+x3VKSJ3wsKWAEQkz9rbKiRTL/8W3AhEJ/JlezvEs/fxasrD5cuELhRxfM0tkl7LzWbyOfIq5wxLzFr5zQ3wDEHkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779269; c=relaxed/simple;
	bh=AmCdA5qKO5zkAOvxSnB8hr6hDGpE/OrK/33mDHhV5f8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHAgH3e02EI2q8Z8PxchH8RrSzsoLFgHwrJxue+u4vu7RsVeBfSFBjHMrvidWR4FUOAmRbnugrbDzL+5eyXNiJEHB7yAbOSR894valRqe8wfE0NP5jdiE+we0VHX4sUD1j4lobzyRfdCMSqnzrdVlUZB5sNz/h2yojp8Bx+GD9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwGpZnrf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwGpZnrf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775895d69cso9005925e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779266; x=1768384066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvAbb+VvFp2MrQF4nn8HPRFViRBXMJRyP0Iy+4AX7QQ=;
        b=lwGpZnrfMgAtkMiZoAJJA4DYlSvTWCHPsLQtYeQSwK3Wc30PvWV1pjfKdSfwFCM2lz
         kz2VAiKbrfzgC1BdAfbNjvKlkwHN5BxI6rSLDZBqv5JDVZq5D0oQxwTSCkg4LoPH50ZD
         H1mTr1jDkB2rj47eyEZy4MJYllhIZcNIPeenMh/Ss/FaBs9mk9qSkuKXnlm9DFcxP2zv
         lNbQsMDgrpdycd7TAoIxkPChOmyfLT/O+1YB/Sq9I1K/vIVu+ENFDODHNWTCTeJLN2nM
         AA5aoF9MkR+uaiZKJ66rlYS48PPjxvTwkYjQjCTqSlLQ+NCzFF3OpjpM/i29tR/aq+rr
         EBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779266; x=1768384066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvAbb+VvFp2MrQF4nn8HPRFViRBXMJRyP0Iy+4AX7QQ=;
        b=p7Wl7mj8Jvp+z2ZSdlReu1bBUzqUTwUrSz8feuPj5y9a+dmcRJGK76zFnl4xzjqyh8
         8SaHpTF+c8DGyMRBOFpKiNl6Q5Xulqn7+zBMz2N0QQOnzhGVFSspY7uM9/ymKHcNpjl+
         yahAcnykvDf+TDBzhjoYtZ28jyCKW0O+uLLTLJ1xzl0HeWI3dEp50Amf+JOtEDWh3LwT
         kjs/Hnx8/rZqvlfIq9fZ8g99RegbTQiHdc/KvR8MzRM8UwrezHrx/7oeB4b3PtbGors3
         7U0WcN2Ih9vy3W2zTvMYab4YX1Bk+4XFvtUWARPklLqk/OszRD1z+wqsdqFTaFaFEWic
         fUWw==
X-Forwarded-Encrypted: i=1; AJvYcCWEw8XinS8l4RaJJcSas/M6NO2QKLFMIDeM1oZ/NF2/Ar6YQ8xyYuAUaraQMHPlW6759EsEfFG+5TCL0vYj@lists.linux.dev
X-Gm-Message-State: AOJu0YzN8BghYL6tUtI3FHdQaRQGET7RkDSR2EIUOKs2+SOTgYQylVgI
	nCnjyi9g/ZF/MGfhBo2PJwe67ZttYTzZWOfoyGxDRWOmQPUudef5kzQd
X-Gm-Gg: AY/fxX7Aj6Dvj8e1pKn3o9luUP8xU1+xMTHIuFR1/EhlanQIPtrYxkCxl2eJBFHrQK7
	0QDi1IRykwfKxlizoN8adVTKgtdbr+VY1PRltP/K/M5hA/XPiZcwizlrBTOOV6VHY3XQ5j5Vehi
	UkJ1PSmxXfvI99lOe0UphmXsrwC2WVTL9OExyDfSYHivIkfghjwWSQGLAfHSf+tBi8goVcIjNwJ
	pQsC07N7fyO5J8d3/zAYDS78Vo5NNemfG1KWv3fMCm7e70vsqxRtRm1OBseLqjIScKW0e2QCTc1
	4U7tK8zo6wH5LXbGgnpRaC4bfBvBm260YxoyvIpZKqUUiNHGQ/KHHdOSnYxEw+83ZbqKsZ0IcPw
	gmP2KcyJ+RIUp6yaZGFE9+hvy5rH+SMZMZNKETzykEVyzBzt5/JbFKtgjwbkd+tG+wyRTri6aSV
	AFv5zzgtLLO7U/zyxtFMWmvU1DoAfQU615e6xmRSgMvXikzD6iqsDmlkiJTufLmLdrrN42vHJ+1
	2s+JIsJMdYEKNylkhMzmQ1H9s8=
X-Google-Smtp-Source: AGHT+IHafHyyzje9Vir1gaUsz/pxBeNzb6Rda3JE4pIFWYWTzEj1tTbOoJzK7knqCUS01LEsTZYGKg==
X-Received: by 2002:a05:600c:4e0e:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-47d84b1a31fmr21723065e9.3.1767779265668;
        Wed, 07 Jan 2026 01:47:45 -0800 (PST)
Received: from fedora.homenet.telecomitalia.it (host-95-244-124-236.retail.telecomitalia.it. [95.244.124.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871a10f7sm7423715e9.18.2026.01.07.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:47:45 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH 1/3] staging: sm750fb: fix static const char array warning
Date: Wed,  7 Jan 2026 10:47:12 +0100
Message-ID: <20260107094714.300380-2-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107094714.300380-1-lorenzosimonelli02@gmail.com>
References: <20260107094714.300380-1-lorenzosimonelli02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning: "static const char * array should
probably be static const char * const" by adding the missing
const modifier.

Signed-off-by: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..15b5de33b 100644
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
2.52.0

