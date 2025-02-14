Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89111C84C0
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562921; cv=none; b=TAcrLD2zFxforWidPSs7W7PyqTu7VLmAI+VKlkfkb++9S8rvoo8o9iOxH3Pa+RWW0Bh7s8AFv6UQP9jCe9x50n9zpkUA9NgOAwt1wwDr+jHrznJTlSvF/BjvsaqAngFFB7OfgYN8cjSJ8t3X2vi7UvaZeF+1z3d1JSYeFt3JyLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562921; c=relaxed/simple;
	bh=jDZUbPR3az1p6TTvnGVdNLc+wKH51rUHZj5XjVm5igU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SV6gyDV7Toz6un6ZZf10BhdmYdSLD5b1I4GZ+y/OTcUzx5tQNmNqJbOBPGAeRXeoazaIf3/DPhpvqaUA+4SVOpg2b/yXmxmScFYsIszc5NYg2UMrB540JjjSqPI3psdFGge8tCtECVQf6XsHBT3jz1GpWsgpYzjeD95RlBni7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crBBSlHD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crBBSlHD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc3035e947so209471a91.1
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739562919; x=1740167719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DXg7EqlSdEA/crnBb3uF53Gz+hB8878Qt+C1oVENMmY=;
        b=crBBSlHDESvq0O2wE3fzUooaxqzGRPwOcfea5wVBobnoStJDKdC4RVLCdNmd4KaMJH
         13huiju0++hoQdTEzDYW9qUoFwj2w7pKLJFFGjq+2GMBjjuVROkPZeIghMX72WBmlS7+
         uhsQiMdH3cmc/4u45mCAFUm/KcySoxl5eb9zAFMXNFEPvvdyVsCH58zObfhA2EP5lcgg
         UnUDw2AFJ5hk1uavvEnOAb92zwM5td7AdB/FuRj41vBRlrtW6x2ER4GF+PLhT9b0Prwg
         ErVeNcvj2suzyHdpfpGhhwEp5zjArLt9baLxWRotRSTgWlHktqmZI4TyFNz171RhtlOy
         sdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739562919; x=1740167719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXg7EqlSdEA/crnBb3uF53Gz+hB8878Qt+C1oVENMmY=;
        b=vgF0s4Uh0V2kN3O7MEew1wkN9kLCiYsi0DK/e5TSgXzn0llcw38Iy1uPPZX1b8lNTj
         lWXu7QeoL7APnrlvJI+XWDPOM6Rs77BQtmO7jkRLT38mUn0WZHAX6nO+65y0D/VjyMMX
         SMxebR647u5a3npZ0gMMXMIXHi4+Hxp80zZDjIn9WN35Q3Ytxa4oqV+OAb2fwhJtEd2p
         55CPPn3RETo7Fi2V/iQ2JqpMWdOYwIsuuCxYGAzu++JxI7Fx5sggGu9rC/U5cFYFq0Sb
         vi7mh3gSIh0YlrhtN7IoZ5H46SKvdC0lNFWh8NZJUTQnSlsqOE9VNkyTYQezDDaDwlvC
         f6GQ==
X-Gm-Message-State: AOJu0YybIuOgryfrdWUfxoJ4etp1P+SskUU/6t2aY7+qX/cVUO0c/Ann
	NTXCMbrGdFqJG+/89clmfikXwao81z6BxvMPIIAdpWD9AgwRaaGWScXwS84C
X-Gm-Gg: ASbGnctqlpr8Ex0I5s3PTtxAWH32bYRU5Gm8SfLFsAj94B0ndSkHGki61G1Mz/B8YW5
	ahdBrkvx5FCwXZ8CdtZXkheQS0EVPAX+h3ITHeVIaiMlUABk4R1p/7l93KaI2HJc5EHyK/sw+V3
	SsRbZrdln2wucLnJSJRtFzSqxrNvN4X6jQMlCbZNJHdvZcKcX8PWC51yzLIOT6x7JtFriMkqvXZ
	TTbDrlSjk/zYykL9OT/PjDoMzBs6sTjtAFo9xOeTerAkINAohWZWOB/MfAuSfSD6C+7tUYAEdOY
	FnowfWToNp9gLoIBBPusgW+SCHVRABA=
X-Google-Smtp-Source: AGHT+IEuICp6EtALJXy283hrSRQaWrcDpqt0WHRnxkzJBQJ8uYfMznB+3fZfRTwEqjsTZ2Uk0MMhdQ==
X-Received: by 2002:a05:6a00:99a:b0:725:f1f2:43eb with SMTP id d2e1a72fcca58-732619706e7mr381284b3a.6.1739562918522;
        Fri, 14 Feb 2025 11:55:18 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73249fe96b4sm2670530b3a.75.2025.02.14.11.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 11:55:17 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 0/5] staging: gpib: remove unused variables
Date: Fri, 14 Feb 2025 16:54:38 -0300
Message-ID: <20250214195456.104075-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove some unused variables found compiling with W=1.

v1 -> v2:

Address Kees Bakker review:

- Keep the post increment expression (i++) in patch 3.
- Keep the call to nec7210_update_status_nolock() in patch 4.

Gaston Gonzalez (5):
  staging: gpib: cb7210: remove unused variable
  staging: gpib: eastwood: remove unused variable
  staging: gpib: ni_usb: remove unused variable
  staging: gpib: tnt4882: remove unused variable
  staging: gpib: ines: remove unused variable

 drivers/staging/gpib/cb7210/cb7210.c        | 2 --
 drivers/staging/gpib/eastwood/fluke_gpib.c  | 2 --
 drivers/staging/gpib/ines/ines_gpib.c       | 2 --
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c   | 3 +--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 3 +--
 5 files changed, 2 insertions(+), 10 deletions(-)

-- 
2.48.1

