Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FDB446842
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458262; cv=none; b=L0zdS2w4PzG9TjPfssXp9URWytWKahgrYXQj/eJHblusiHy/wsXxOr4eSxXaFtk1h8Jrk7ssrD3MNKnmAIjzLw9aBrpt3muj/UtX1Nx4vCsnWD4Urrz1tv2cvWi/vCas1YzDFCD6wJuWUmYqyEup3Y+KAEwv09DXsu/h0VjmYr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458262; c=relaxed/simple;
	bh=8cl1yq6Zf93uHWi0ppVuJDAHZKi//F7GPFlDl8O9u8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7PDAIg7j32Zx1Ecib+BtqPMLdm7xXHONMNKW6nViXDtYgpC70uBCFbgWQC23LyOUP2+9Dg+7mowVrmaE9Vsxet3aw/vVP7kV0jt4imTp57rsbSFfCBBlDO1y53qyjGXNbMFIqcqGbfYWC/dIy2K2LOoX6KaQLJgHqQq6mP/j38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwqQMb73; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwqQMb73"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacb8416a1so32770225ad.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458261; x=1787063061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHGRiMR9TdT4MEt2y/o2QZpFPEBw2yGNFSQbJ3D976c=;
        b=gwqQMb73fbfMFuECGmGrPj55FrS40PyNfDyXf2Xi77Gn7tXYMZzsodAcxXxmOb3+V6
         ztZgKeUNRa0rLH6o9hW2qLAL7XgefBhaRYiFPekNlco4Mn7dEf+bwUKeMPeOgdyqjOSI
         nTH4C8fwB0IMO1foaIbwknhOO5yRCYMokmzy/360lvaq9eey7a8wzhfcgYsstE46dJOT
         CW/Ai3GqUt6GRw5WRkqEb8lvbz9xH3K6E2U5sfvPru8z8gyfNq9vubo6I2ZLfuyhdQwW
         3Rh8kSpTDekv5yLv7J19H5AQXp3qw6BRo29ygsyX0zY2TkBkBNJm5i0ss6XgRX3eYtPS
         m0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458261; x=1787063061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHGRiMR9TdT4MEt2y/o2QZpFPEBw2yGNFSQbJ3D976c=;
        b=kUqi9Ja3OPysYdQXMSWS/NRVJjP3fN1CdwXPQ11uJGFCO8HxoNPzsUq6uvZ09BZx0O
         9EawT2kc3K5rIFd8xWompoZGTXwPkXWsYduJd1gFspJn3s+6bV6/5ztsQFFhO2ZBu47h
         35/l02+LUvRiX6d2dG2CJu8DFLgam6FdfnuKWMoF9WlIYFmxIDyYXeoBDb4x3uUOg4/u
         MP72DLmsXGmXfMF4vr7krGSiFhfRw0ocN5w9wGYCZ/JUutj2KN9wbJgtlhwQaXAGkNFE
         FMFRDN93jCheMATJQyBGu8smzgs7DHJGf1xGnXtfPOxDAD1Ffx5vmJcTgJnSXo+JX+my
         WE6Q==
X-Gm-Message-State: AOJu0YyVa+NyqPZZC1E/O1G3ZoeHj11ftGPquhiRna5JOJS/HBa+ZzjM
	wp0XwceHv45PXhdSQamjAhEAW+BB1/obE+5zRoAy0Mth2lPUa2npcJE33ktnzTKC
X-Gm-Gg: AR+sD10MeK1eVxUyEcnSndzqbootc9FKLbQ5IKw0uVUJYbdd5rfs/zhR+cyFz+XvPNM
	gAF9W86KfNSRvPNhPSqI4oH09nuB66+w70+A/lTEbnABQrqEXLkJP0AoxJGFT8VJ/7yX+f+hf2O
	Lx1j0YmQIG6W5Al6S9zzCNkfrQiw5WvHa/Eh6pQco99myf4ww2qp4a1FePDwUaVcRisKThNrQ0+
	ud5SzHuuzHQBlf3eNEou/QCTm4347S07Mu2yQKBdVWFKIgvPjLR4clnyPicaEeBa5TC9DiwYbLC
	7zIrYP30Y1w3MnKj8GzC+Ph8LdGmXKagRtEJJO6zYNtY8I3Z+vwuMrb+j/wKHM4T4KHXXgO7ODf
	Tr8u4zCZTR/uZgj2/Z/K7WmXGLiXcUJC8EHp9EX3S5B5SVqWSlgcwbG34yrTpXZxXf7IqnE5qGA
	WPshGmUs5HtZIPZ9CfqNWrI0HUlydg9TnMUTCQ4YfGfg2g4mJ1PmB9vBqpcpxTL4DSX1muVySyl
	fw82i41rIVPvTfj9k5cfBQxcRc61fMwSvguX19SEpQ=
X-Received: by 2002:a17:902:d58d:b0:2c9:f44e:9942 with SMTP id d9443c01a7336-2d3178c549cmr51906785ad.13.1786458260525;
        Tue, 11 Aug 2026 07:24:20 -0700 (PDT)
Received: from DESKTOP-M1337NB.localdomain ([211.241.115.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef0e37sm9531395ad.7.2026.08.11.07.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:24:19 -0700 (PDT)
From: Jonggeun Park <ndamin221@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonggeun Park <ndamin221@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: small cleanup of RTL8192C leftovers
Date: Tue, 11 Aug 2026 23:23:53 +0900
Message-ID: <20260811142355.60533-1-ndamin221@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is my first patch series to the kernel, and I am glad to
contribute.

The series is a step toward the TODO item "find and remove any code
for other chips that is left over" in drivers/staging/rtl8723bs/TODO:

  - Patch 1 corrects two comments whose referenced file names no
    longer match the files present in the driver.
  - Patch 2 removes two RTL8192C function declarations that have no
    definition or caller anywhere in the kernel tree.

Neither patch introduces a functional change. The driver builds
cleanly with W=1 for CONFIG_RTL8723BS=m.

Thanks,
Jonggeun

Jonggeun Park (2):
  staging: rtl8723bs: fix stale file name references in comments
  staging: rtl8723bs: remove dead RTL8192C function declarations

 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.43.0

