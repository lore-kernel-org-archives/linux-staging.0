Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8119BD6
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKp51Jma"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3316db2c5c0so501724f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432069; x=1701036869; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SgJuOVjQrC/WMtPUl/tqm5BE2EEMD5VGhqPFuJyEFI=;
        b=fKp51JmatWv+2KU9E2/4NrKFm1t9dFjASzXd1tgiEMk+8VNDWT0VAcTm6Wjz1dfl0W
         Tm0H6KeB7meKck5BH/Pd5Zjavt4oSou+MtlRM+bI4Iez3ZwDWc/BZwLP5WFBoxPz797B
         czEDhz+X5zoJELCJ8OcfY0O2Fgrid/TacVaysmahmIHMwIzXxMOf5Oz0dkwlmhtDStMP
         EWxElfdm0ofRZGtikiBjoMTY/WNWoAfx2oWogFbxYLCdrhsXMb4lm4yw9cFy3suwg/bb
         JR4KhUjdAZQeO5oWn7p4deoPLUt2Wiur0ynulAWDtym5X5B8VuemRaz0WQT9Y4RriEPv
         P3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432069; x=1701036869;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SgJuOVjQrC/WMtPUl/tqm5BE2EEMD5VGhqPFuJyEFI=;
        b=jH4RoxWoxI5jEoWvMyJFEgQc1eeMtKCDWSVHXpIIrsyc+2KX6ldqoXdL5LHIfwxvyn
         79HhSIGSY61qkHY4pUWunidn/5n9RqF7d+wIhdQ0Z8hYW4EdvnJeRv2PkDGhfAUsEmW6
         19d9hRTDBVb08r7W4yK6DDwmGeK7H88qq2m2tnhC61rCvAoDopZ0RPsC/dzT3G915rjm
         h0tVGhSUsX0izSl21CuQBVB8Xnf3ckpIjf72cPCcOY1DCfJv+d8wV+7Le2WjCKkOKreo
         hCRkxldKGADbwTGR2q2ScSWalwEKowMZ1y6TyjH/5yzwRHXaFZIiBKy5vvSnwpKtvhyG
         ETZQ==
X-Gm-Message-State: AOJu0Yxqj6O10IZoDGsoB0U0NzRDHt7Suf83rbKOUMg5KGPCtfK3q7CI
	qHk1Z6JJMDpzT2uVDVHhYl4=
X-Google-Smtp-Source: AGHT+IEyegCqaIrQIV6GnRAnVqg7b6ZHfV2HjHZUb4aEI8rW0ETQoTaYTyV9TW16Izy2dNLaWkJfUQ==
X-Received: by 2002:a05:600c:468f:b0:408:3a29:d7e8 with SMTP id p15-20020a05600c468f00b004083a29d7e8mr5056535wmo.3.1700432069001;
        Sun, 19 Nov 2023 14:14:29 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id f26-20020a7bcc1a000000b003fee8793911sm10923341wmh.44.2023.11.19.14.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:14:28 -0800 (PST)
Date: Sun, 19 Nov 2023 23:14:27 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] staging: rtl8192e: IS_DOT11D_ENABLE() returns always
 false
Message-ID: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

IS_DOT11D_ENABLE() returns always false. Remove dead code accordingly.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (14):
  staging: rtl8192e: Remove unexecuted rtllib_extract_country_ie()
  staging: rtl8192e: Remove unused function dot11d_update_country()
  staging: rtl8192e: Remove IS_DOT11D_ENABLE(ieee)
  staging: rtl8192e: Remove unused function dot11d_scan_complete()
  staging: rtl8192e: Remove unused function dot11d_reset()
  staging: rtl8192e: Remove unused macros IS_EQUAL_CIE_SRC and friends
  staging: rtl8192e: Remove unused function copy_mac_addr()
  staging: rtl8192e: Remove unused variable dot11d_info->state
  staging: rtl8192e: Remove unused variables from struct rt_dot11d_info
  staging: rtl8192e: Remove unused variable country_watchdog
  staging: rtl8192e: Remove unused variable global_domain
  staging: rtl8192e: Remove unused function dot11d_init()
  staging: rtl8192e: Remove unused struct chnl_txpow_triple
  staging: rtl8192e: Remove unused variable bss_start_channel

 drivers/staging/rtl8192e/dot11d.c            | 93 --------------------
 drivers/staging/rtl8192e/dot11d.h            | 56 +-----------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  1 -
 drivers/staging/rtl8192e/rtllib.h            |  3 -
 drivers/staging/rtl8192e/rtllib_rx.c         | 31 -------
 drivers/staging/rtl8192e/rtllib_softmac.c    | 20 -----
 6 files changed, 1 insertion(+), 203 deletions(-)

-- 
2.42.0

