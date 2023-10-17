Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E42DF60
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfVDy0PF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b26a3163acso3657353b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 12:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697569443; x=1698174243; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUHrf1UL//1JW1GXjaKvUOuCKudYsT4wljTi8OSOB7M=;
        b=TfVDy0PFSrASefYRjohokVX/n9q98dtGAZ+jvPdkRmuui1ChtubGDOL8cwLG5sIjV3
         geH3TMKp9+PzRQrGXUvCCBQ3MDzdr594mv0AaRclifHGN1dyL5zVhWntzDsWUxUXE+FT
         oa5pfmU/KUVJx/2NH0oAl8iiRZYZ1cgIyw4KQ/1bIx0CaVIc6UMZILCpjWGuI9jZ9QcD
         6o98veKG1FnBVJchOhHk6Lkd7cgt/gF+Q6kTkIRqMgcPPG//dYNx7PbiOqDa8amIdcaD
         qsOfpBek9z8N2V1xLWTkqzzk9p+v8FwEcyz+Q8B1IEabs4ld6FTpA2evD+5gBVBXbwuj
         iOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569443; x=1698174243;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUHrf1UL//1JW1GXjaKvUOuCKudYsT4wljTi8OSOB7M=;
        b=pB0kX1C9xdVf4V7DcQii3iRk96PmUTFkfKMW3f3M4W2Sm3iMKBmy7kSsHOtbXcouH3
         IGVrTf0kOTl8XoawwptirqrPy0P1AVi2iXFi60zh3ogBNsDSftAS5+GJEpvyBD4nD/RM
         2P3ML2SGlGtxGfecCFztRm4Qa2/SDjcsHh0TuMjwQLtU5OFu0aBsFONqcdLd0cYFUjdX
         3GlWzezj+ArazaSxB5/Ul8YO9ScGBdybM/zm9iOPFv3ZVSLRUP1QANczYQJJXaBURtUF
         IQw9S97+YwsXu83t/PVl208oCNfpzW/3hrc+LmV7Z5IuOVjSyD7d0b0Pcv9XEfevEld7
         nNdw==
X-Gm-Message-State: AOJu0YyUeagmMGvhRffKJ7ylBOFQFrNfsDfigYeAm6G8VJGIDcA2ITvj
	QdHWpIiBiqxUXqt1UAumoqw=
X-Google-Smtp-Source: AGHT+IHJj9uxiwitttFWiLEz7SKPRHB71eQQs74hj0fuSmPuyu87R//exZODV5l3/2nH1nDNQB9ZRA==
X-Received: by 2002:a05:6a00:15d6:b0:6bb:def8:b09c with SMTP id o22-20020a056a0015d600b006bbdef8b09cmr2932955pfu.1.1697569443433;
        Tue, 17 Oct 2023 12:04:03 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id f28-20020aa7969c000000b00692cac7a065sm1809279pfk.151.2023.10.17.12.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:04:02 -0700 (PDT)
Date: Tue, 17 Oct 2023 12:03:57 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH 0/2] staging: qlge: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <cover.1697568757.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset performs code cleanup in qlge driver as per
linux coding style and may be applied in any sequence.

Nandha Kumar Singaram (2):
  staging: qlge: Replace the occurrences of (1<<x) by BIT(x)
  staging: qlge: Replace the occurrences of (1<<x) by BIT(x)

 drivers/staging/qlge/qlge.h      | 388 +++++++++++++++----------------
 drivers/staging/qlge/qlge_main.c |   8 +-
 drivers/staging/qlge/qlge_mpi.c  |   2 +-
 3 files changed, 199 insertions(+), 199 deletions(-)

-- 
2.25.1

