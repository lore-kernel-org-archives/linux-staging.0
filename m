Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8771CBA02
	for <linux-staging@lists.linux.dev>; Fri,  2 May 2025 07:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170517; cv=none; b=Cr3vBcxyiMCP5IC+aSud4AkTsgEfEZeVbOM6BgTpz9iTa0LzD/B+aCso7p2APed7Ut/T7ndBZPg4XXkuPXYvo8J4Ewj+1U35ndWhm3Q2NkI2cF16RV/Oz36DprxOws3OnnQQdx9VjG5FUX8uscGEwQmY9orqzynzZV0ScrW5T8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170517; c=relaxed/simple;
	bh=3K7oSqaXuvyTA2yowqiZmKdrO5bd52q2Gb1kS8oNDUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+hQtEEbhN+w89cK9hEt89hikIddtxpYsQy7lOqFLPIDCwNYa5ZSpl3IDMWePeppzkl9zgf4QCj6wipydttN6Vj9Co7tOktPPlcxqNILhCyb70V38MRDiWOHnl2kTbvwcPfuh/5Jfzfo1uKWMKJjAy8nMUzIoMcyuZE16GgF/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LExBmSLD; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LExBmSLD"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so5149142a12.0
        for <linux-staging@lists.linux.dev>; Fri, 02 May 2025 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746170514; x=1746775314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZokquM6szUgmie/bqDbWMtr1zduLgqL6RmxwvXM1bHk=;
        b=LExBmSLDEJJywVTh3lgP1qSIsNIC4nM5UlcWW39Ib3syQcdbipRAOP4RNmgx2UWBgj
         +x3gn3xLWjApgi4q5LN7cqsjYOMKI6+tnDCNwhcU6NsDAPfUSmn8RISsGc4+ji4WbDz6
         HYQQK6TLX/HUJiZUmM6J/ERpPWvMzJ+DQnrtYIrqWONwXgz34IIUGDChHL+hwjKwUcZ5
         uAIRYdP5QujhbEH3d2/D7xC+9vWka8ZdBPKj2/JrvneE3D29rzuDxA9bfHh33ViuB+Sm
         TCKfkPv2cUbPNfEtnpGlMBKkPYH5HAFfmD2hKZAkREsL5NV9dQaM8JqbinwaeY+3GWuw
         2FkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170514; x=1746775314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZokquM6szUgmie/bqDbWMtr1zduLgqL6RmxwvXM1bHk=;
        b=QXbKwylagKp3F4xT/AeD/cjccbQFB5Vx2UEqz0mJRr7AQDNjxnkaZStkjYP9NXLBTZ
         ht5WyjrayqW9Usr05zkk8o//dJDlauRzTTlErfh+xUnSQzfUAgPvz6EikY0Sr1pWr2dr
         tQJ/hU2eF4xxADdFjDjJ9Bo5RX9QQMrTglx/aMAJJ3CESg+UywJqsnHdL5e+Rf9a+AZ7
         ipJj9yLqbusJIEcQcYYFo7cOrPeNA5eih0UzdaKA8lWl4AIcOAg9zr+teJy3+VFZNHVh
         TbHumBWZqZbqSrFyDSVX9X+38Fa92KA9ngbDuxk+C2Tq9+l8Bv7/ts/1WmbsI94dhkPq
         eczg==
X-Forwarded-Encrypted: i=1; AJvYcCUAIPG1HzE6fDINQxb/zJD0Isq2SQe0OrgeKhoQwZeFwFkBNn+DvUkjK7vKw8d32wCbg2wTUL4df8A3PO2n@lists.linux.dev
X-Gm-Message-State: AOJu0YySH4DQHOtsDD6Oi+1kurRC9i+/36cBhsv9bl0uDGGOORkFL/Ss
	mCKlYDfRTeU/JiKpfLEWq1aBDBauUx4Eo8LpANETJLByY2gXJD7m
X-Gm-Gg: ASbGncuBxc01q0PfBQuGqtY01wkQs7m4hxfSSEupwb88pVqMtk8Z3UCO63v+4cjP6sa
	50RShaaY7PHcaYfqqQYNscu5731u/HNJm3xt2GlShcta4RWeCUxzQUGAR7DFdGrkW+owDNJGbMj
	TaFL7AcWP1s2j4g5cF+oOJUwQ9EHy9uMm/9X4AONYE+PAQUGS7MMlUvuS/txv3Vg2qWJ7cOOIDR
	W4EstI08//Qw6QvvbrlObF2hCs1QC/atW+Z0ZGQgD+zHKmtBXuds+S6ay/lGnXcR7XW5suWjc4O
	ackLKB8s1PSEFDY6pKmSlqj6FQWZZd6wGWDOlHLeHsfkuEtI55U=
X-Google-Smtp-Source: AGHT+IE9MAWXEMZMpEl4Rg7v0cakakCngPqaYCfrzUhTRD7ZohLrmT/FUFCrVSPmO0ixvT23uAzxyw==
X-Received: by 2002:a17:907:7d8c:b0:acb:1165:9a93 with SMTP id a640c23a62f3a-acefed30b3fmr462768466b.3.1746170514026;
        Fri, 02 May 2025 00:21:54 -0700 (PDT)
Received: from localhost.localdomain ([178.25.124.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f3c6bsm5691966b.82.2025.05.02.00.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:21:53 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/3 V2] staging: gpib: ines driver fix and cleanup
Date: Fri,  2 May 2025 09:21:47 +0200
Message-ID: <20250502072150.32714-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address some outstanding issues with the ines driver.

The issue addressed by patch 1 was exposed after the entry points
were declared static  (patch 2).

Patch 1: Fixes an invalid ifdef config identifier
Patch 2: Changes the driver entry points as static
Patch 3: Corrects an unused variable warning

Dave Penkler (3):
  staging: gpib: Fix PCMCIA config identifier
  staging: gpib: Declare driver entry points static
  staging: gpib: Avoid unused variable warning

 drivers/staging/gpib/ines/ines.h      | 44 -------------
 drivers/staging/gpib/ines/ines_gpib.c | 95 ++++++++++++++-------------
 2 files changed, 48 insertions(+), 91 deletions(-)

--
Changes V1 => V2
  Patch 3 did not remove the initialization of the unused variable.
  Remove the asignmenst and say so in the commit message.
2.49.0

