Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499002F6585
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854343; cv=none; b=ThMhVNQnxmfi2Rkf68XpsCITIOXbaPoGsdHWTO1X4kuejC6h+bdcnNws3zt3XEsIvlMBoh3Bp9Iu71k2G4BlmADDVRP3KY2sNYV8heIkd4twl8+KmuP+MlyYVJ6j+KXuSgjfiDq+ouSI0ZQWmKsjk2RGfv6p5xYc9dGGx0bSeP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854343; c=relaxed/simple;
	bh=vRX38p3hYqtNV4pJ+f0GWWM+lW+DqOjy2jgWrpXr9uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpMBKPJJM5BpJSOE6OFMXdIM+0cD8TGHdleMe6kobW5A+puqVGBduPFWLh1APqlP2UfshNI1aEkJfvYE5QnfPg3VQObGWjmeIYuH2qyNx2GzWW7oCcYBwraJ4lZPy6Q9mxFsWG6nxV2QhZA8Pt+YHWk6Dg5rPQJRPLeMEjCgG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRa4Oes3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRa4Oes3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477632cc932so15918105e9.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854341; x=1763459141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx1nuYFauxNJDsTEMWfhjWhH20Bz5VGt7mVFYSFOM1U=;
        b=fRa4Oes3qBW5D6aMvf/OE0OI6L1kpR7R3TMI4u+lcPT0XAIir9HvdVhlxghJ1LPF18
         CHXVJwlzLQzCUYsrw7zjXHK4A0L+1esUqa/FZcjXfDEFldFT/9v9nZM5VahDLIiSVoD5
         Ikw/eORqd00zus54xLmTSWt5/uLRDORjIfP5fxQz05DoL0TnmBa/Dy82E/GD91AedrCI
         s8mA1H7tsMT1N8Sb2FluTPW8Gi6a6pFY73g93cGaEK8FzSZktmNFJtJVF9LqsCkP+B6F
         1z3dPsGVabxa9qMs8vCj8ohkGnAMmCxsz7WjLVMtO21WlYkxfRqMNxl3jTwAXIjAiJD6
         9MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854341; x=1763459141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sx1nuYFauxNJDsTEMWfhjWhH20Bz5VGt7mVFYSFOM1U=;
        b=XwyGc16d+XS2z1TrAmc2TeXo2VRIeSAR6KGFv7klhDup0xg4KAgjoB5zUcEbOfp2Kx
         rZwQm1s/TE9M0yc8LM8VowcWwjIfR0hmKFe3FwgTBs4kgQzeTGgVE/iwVGqMHVd2yisB
         e5a4FUUurrk1hMQra4noP1/v+fbAhMeGtKWHOMdYsSwVgY9YnG+VeH5EZ5I8oEvZe4Sq
         alRRNEGbiHT2VspeIokth8lmH7mFutDbdbJ788JYvphqz28mUPi30gKLyb6ROpN550Qn
         T3UXy5xqmxSJaM5XiqaW16LvvDjRI6HGH66OPwO/EJHABxhoIv19NB6ne3h8/FAuCCZS
         AWfA==
X-Forwarded-Encrypted: i=1; AJvYcCUhwDUOa8uLJAJ0i2e6MijNKt2eVk3CqbkMvQdXoUKmgXOuZqIiJsZLnnF2GIlxGSH4wmhuULwni281ThG/@lists.linux.dev
X-Gm-Message-State: AOJu0YxjcFjtaRsPldPSW/eqNyxErmgpgtjl3hVgD6bkZm68ABY5YfIj
	GddbOtYCJ8p2cZO9TMC7NIlhztr8v5jhO7GTZ8SVbPTyUd4km878v989
X-Gm-Gg: ASbGncuvymKVB8PRa0A0m3qOchecJU6FRrxyPyZGDmCDUlytmHKPIuG1hwk5m02BNR7
	SpZRYbKtnYWsFFoANTf+SSQOMbPRyeS9FjYwpMewjYe2Qw1X/yXRtKBcS4EVI1tKasZ8NRvChoJ
	Qt84o+2YjQGKWmC1oxNU6hrf82aq3IRRjORx3sQ1jJKchhAY66BRkJkqW+c4ZYtpwDev8aoPvKE
	8SZjR5KrGSVXRtfJSfMPROnw0W0bTKZBvS54CKlsJr8tvY1cKjU+7ZzrIEfk6yy+Fm3fL2nYofK
	uqgFVp/ERcv9uCnLJGVdFpww+FUJf4Rgu/CrGfXGSmp0mK5MQMx5jiRBXuYIqp4M+ACfK05THO/
	7hy8XEUzI/5Ea8BqDcs5shsEJ5b9oiwl5qDNmkwGuHAZ1e4Q/QiQeadOkHm84khjT6uHq3SR6OW
	O3N5ayFLiZrD+/1RvlJRRS4Yc/71UScP8TlW7o2g==
X-Google-Smtp-Source: AGHT+IHw/mhtNaYuO2ro73JGIgSaJJWHXp7QydcgCGHaCB1mKRIecZ+3XliOUUrt9oKL0TNNycWQ+Q==
X-Received: by 2002:a05:600c:1c86:b0:477:7523:da8c with SMTP id 5b1f17b1804b1-4777523de07mr103912355e9.15.1762854340403;
        Tue, 11 Nov 2025 01:45:40 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:40 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 10/10] MAINTAINERS: Update for gpib destage
Date: Tue, 11 Nov 2025 10:45:12 +0100
Message-ID: <20251111094512.6411-11-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111094512.6411-1-dpenkler@gmail.com>
References: <20251111094512.6411-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the gpib directory
Add the uapu include files

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index df07d1a3c28d..4cb0de3777b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10628,7 +10628,9 @@ F:	drivers/platform/x86/gpd-pocket-fan.c
 GPIB DRIVERS
 M:	Dave Penkler <dpenkler@gmail.com>
 S:	Maintained
-F:	drivers/staging/gpib/
+F:	drivers/gpib/
+F:      include/uapi/linux/gpib.h
+F:      include/uapi/linux/gpib_ioctl.h
 
 GPIO ACPI SUPPORT
 M:	Mika Westerberg <westeri@kernel.org>
-- 
2.51.2

