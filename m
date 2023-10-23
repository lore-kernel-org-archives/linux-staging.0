Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B7F186B
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERWGOIXi"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-523029050d0so645636a12.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043168; x=1698647968; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NLNqrKtJDrK51kIqp/XQ0Y2ua1a9pB6M3Ch5oQgDH+Q=;
        b=ERWGOIXiKAQzVb7NXMHHvaUEApiKD1pimdy6LbpUc52D4TY8EYLLLcXwy1CNo7/i9S
         2Fwi6G4nmX0syum6/0wkfORpklQDNUtFmaA9zIDqqAXQFDQy1BEAzqWnLieH9+c9YmGM
         RVU5QNUyiPmMS2y3iwxmYV85sxXAp+EgwBQdr7Wz75P4PDGeTlgY3RQctz5SyQhgsH4n
         pnJLpVd8Pd2vpbJY6l9fpNwIFLEUjXHYpiMCpiNylhcZWI1YItK5clpp+ta3iC5mdvFp
         cQO++tu9vuANwtETGAhkFMWPXx3g1aVWj3h+n2BkrxYjrOzCffjWye9KMukfBnC7dWF6
         VuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043168; x=1698647968;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NLNqrKtJDrK51kIqp/XQ0Y2ua1a9pB6M3Ch5oQgDH+Q=;
        b=O1Pi5ieYWI3bU03c1ZyGPxlkuYFuaTB2lk/klHNY6tZOLMFDjQKv5CXaXHPKqMrp7j
         NJ4ZSE7S7J/1HBurCaavTXkPDr+MCuDYWvPwDJl/MUDb36ppjM8ThG0/kxnGJWO6+kHt
         4Vb+7G4hC5PZtOxxvYgQ6Q87F2bRmunGB578sMdAmkblXCTAWSt/D1NGlR9RmvOyefgj
         eBqOwYjezjmINGaOrFnlLJYeIQOrQRRXoor53cuwxKj/eTwRRliZ79y/Pfhyni56gvPy
         5s2vM0pbfT4lm/YQLV8Uz+a3tsdzjvAimh0tovnJfhDm00txZxRqr4ENx1ESbcxDgOEm
         FXZQ==
X-Gm-Message-State: AOJu0YwXVeoFb/7OuShAKMl8ynaBC4TJ7maC2FGLz4GqaEY6Le6/0H/4
	DLeDGGJP7AB5j44PFB0btXKeV/yhluE=
X-Google-Smtp-Source: AGHT+IEhSRMVcivh84QSeua9eaIxD4t3Gfc9MyrHlWyIZYTE2K/8jDV+okC86mlqmyn9e6Bp1xtxMA==
X-Received: by 2002:a17:906:8e:b0:9be:8de2:a56c with SMTP id 14-20020a170906008e00b009be8de2a56cmr5909448ejc.0.1698043168017;
        Sun, 22 Oct 2023 23:39:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id hv6-20020a17090760c600b00992f2befcbcsm6135452ejc.180.2023.10.22.23.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:39:27 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:39:25 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: rtl8192e: Remove unused variable ucReserved
 and further
Message-ID: <cover.1698042685.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace custom macros with standard kernel macros.
Remove unused variables.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (11):
  staging: rtl8192e: Replace BIT0 to BIT9 with BIT(0) to BIT(9)
  staging: rtl8192e: Replace BIT10 to BIT31 with BIT(10) to BIT(31)
  staging: rtl8192e: Remove unused variables ucReserved and friends
  staging: rtl8192e: Remove written but unevaluated variable ucUP
  staging: rtl8192e: Remove unused variables from union tspec_body
  staging: rtl8192e: Replace union tspec_body including embedded struct
  staging: rtl8192e: Replace union qos_tsinfo with embedded struct
  staging: rtl8192e: Remove unused struct acm
  staging: rtl8192e: Remove last three parameters of MakeTSEntry()
  staging: rtl8192e: Remove unused union qos_tclas
  staging: rtl8192e: Remove unused variables TClasProc and TClasNum

 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 104 +++++++-------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |   4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c   |   8 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  22 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c   |   2 +-
 drivers/staging/rtl8192e/rtl819x_BAProc.c     |   2 +-
 drivers/staging/rtl8192e/rtl819x_Qos.h        | 129 +-----------------
 drivers/staging/rtl8192e/rtl819x_TS.h         |   5 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |  42 ++----
 drivers/staging/rtl8192e/rtllib.h             |  12 +-
 10 files changed, 92 insertions(+), 238 deletions(-)

-- 
2.42.0

