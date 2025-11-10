Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118B528B415
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770320; cv=none; b=il9cXf42eHEIAY2/skIPv24e+5Z0Kyxpgjv/lT3/pLmgjsnJxKs4kUlymhqdE9GbnJ2hMtrPcRPAm2T2aPUfG2S5Jl5DlQZ/w8klaGMJIUbldqpr8gQSs9An2WaBPORaE0qHlc6k/4V+1oS8+J9u5dUn0+i6UNPjcJB6GGvDWrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770320; c=relaxed/simple;
	bh=4HeDVWKiziNfcebFIIM97Wm9k+Fo077LKVzAl79w7tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q31A/VUwDrpa7qbY+nnRjESbOkhf1SFfaX7UvHpjNtEGK0iNjwpUiGMIS3MoSj9fsbxozbbnSkhLnnzSKYU6csqHp5Etk+AdsiCNLInc+v04awyRMoG5hDMtPamhVf+OC/oM5Y/Ig8/2NZQMNdUiKnVY/3wpeVItIsVKqqDZoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zlvcrtdn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zlvcrtdn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47773cd29a4so8056975e9.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770317; x=1763375117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFon+KFipClv3lYRUS0OwrYjgGodzikFIdGmNqZNBNc=;
        b=ZlvcrtdneLAcDTNolAno7ZPnUXMwiQATJ8Z9W8gEB3H5iVHoSzjkqoB8lKMfa4fEX/
         hTkWz0HI2XXECwvtW3M0Ma94ok59oSnnxnVa6gZw+LYBBEWzhDB/frscNJyeuJmF1IT0
         PWN9gM4yoD/ujdETcebuRVTDvzXHzULUuA5x/teDG0YNgpU6fHZYGG7tiXzGFJpHlp9F
         djjvxOXd67PFBfFa6tHy3PMNBmX/2etGxQGFWPnmha/QiwqaxgLPvpKolbMXWJh4rI8P
         k6mDZGXtzORSqnmN+LBXAjHgCzRKNzdfoyAFOpyHJCUCV21QINZ7N/5uHJeU9yqXrcCk
         FRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770317; x=1763375117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vFon+KFipClv3lYRUS0OwrYjgGodzikFIdGmNqZNBNc=;
        b=g/lO9xuYbslTTE+RDpwlpDO/WiTG++yQKQBaQkspbAw/qBJqWr1s0sIbUCqUvfhfuQ
         dyOYFiqUm8t5sFvVFjT5iyf3TCItkFxAHlsCjo1THmhIA4dRnR6ObBSFvMZ9ccGOnGGm
         CNCJGACIi44zC1jJMS5RBnDe/d2q95+C/Nby/j092gwfPDHmdJlthiwTwqtFwKF6D1RI
         xOlrOhxJKID0CfG+4W4eol9fkpPpvvpd5mUD6RP+mF5hF8NYt95I9hKJ07BamRCOvBzW
         E17sI/KuSB+cq71z9ijzMtLQbQOFZFfcN/BZQvW3yqU/9hRg/AQTpkLXFZjUZeHMUcFz
         kCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7t1tZhrb9VHHyWzzpl7iofYb7UnOGv2y/bL0B7BPKJUUcLte9FakhoEyHenEprt3zWbwTgx7R0fJM777a@lists.linux.dev
X-Gm-Message-State: AOJu0YzaMK5v2rhmfAeAQZ6lqow0O85esq903zVKeOb8f6hlwguAgSSg
	/r4kOLB8OPId0eqWsNS6S3ID261Jl4Q3VRKCoGCU60nz4qZRCQ0pq+Jj
X-Gm-Gg: ASbGncsRd8aJi5VycuBwkhHJzgk0p4ObZjb8BNiJYI3wNEePqvrKpeigOSb35teFwfK
	PuY+xlAgBy4H9kSSl85Bidew2KA+6h7n6p+FgXx2fEgGW5OlTdFmJJfMmWZWURSkE6X5Iz16CLC
	fOWEqMNxxC9oJQGrDQqxuK8x/w59E+HJv6qHHQp04dSZ8BrjRzWNBNuWJIFxqAkwJeDnaFI7ma0
	OnMClp1WDhU/pC+PhpPzO2fP+KoGCUmXZbUYYtvmRyv1lEd/3E5nDg1tGphO1zIgVqHiXprXCTn
	jDVVec4dV+k5UBgjFKq+3LxctaTdKQ01Ra9z423G+BcVhYp7qbiY1G7MTPOg4wjnUT9DRdGH+aK
	faJ83Excwo1E5ysUjHrkH4rCKEP4BNpzicAJxrH8vWhp9UtO0QM3o1IlOWaOY8gsepmfQfAczrw
	CFsr1T0U9VOKwIQ5hG
X-Google-Smtp-Source: AGHT+IHSuWiJyodQKxIazZF2GKqAu1vne0DVb+QamurO00ttrLG+PGm+BNqeMF7injphB4KfCgw87Q==
X-Received: by 2002:a05:600c:1c92:b0:477:7cd2:5bf1 with SMTP id 5b1f17b1804b1-4777ce77011mr20942855e9.38.1762770317125;
        Mon, 10 Nov 2025 02:25:17 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:16 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 01/11] staging: Remove gpib Kconfig option from staging
Date: Mon, 10 Nov 2025 11:24:57 +0100
Message-ID: <20251110102507.1445-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This option is no longer needed after the gpib drivers have been
destaged.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 075e775d3868..2f92cd698bef 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -48,6 +48,4 @@ source "drivers/staging/axis-fifo/Kconfig"
 
 source "drivers/staging/vme_user/Kconfig"
 
-source "drivers/staging/gpib/Kconfig"
-
 endif # STAGING
-- 
2.51.2

