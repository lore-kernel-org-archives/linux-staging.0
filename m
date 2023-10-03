Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D338DE6
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:33:02 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ae65c0e46fso53935866b.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361581; x=1696966381; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTn6J1jkDkGPJuOyaFZiPoWiCLl873wqp1f1gByRkbY=;
        b=Cl2owEH+U2YsdlsHoDF5sHcpHJ61oIQ0aUcA1BTaQagds3CMUuUouzcIRtN50Fz4YJ
         ySvU7rfvh/QHsUcaB3ev8ZtKVHl1u04BRGeboBPJj8PlOVuIUdkaxI8gggXxQJdpSNQ/
         lf1b5vqZAVNE1c0Gv7jFQ/++1HeoHiyi+Ilieaile1Um7CDO/dKwxDCGoY+zEuC0Eb9+
         bqGGOrWR7fqS5ptbkRzNqolAKSVfkNQ2aoXiT87iAASor2Lr0Q18bFh9GM1dnNJ1PkWS
         s/aK75rPjonaaSApEVy7itHZ067em2A0PQHPnHwwJlOs87f8WiMPy/cm0ldxT2swOtU6
         KcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361581; x=1696966381;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTn6J1jkDkGPJuOyaFZiPoWiCLl873wqp1f1gByRkbY=;
        b=ZgMJ2DqEzda5TYpVMmimsCYZgj1IY6w+3CVsG94xNI+1vXa7VBZ4NpyjD5cN8jgkXL
         JO1/9UUK9QK1Tp5Ek/qXl3uFlAtej6u8vPTFjc2lbr8AAthOrCYXJ9T9BXT/QEVen7w3
         /lAZ2DvP5+vmR7mLRlBTlk2g7mOg4k7x4Hv6OwztzsITR6gveG4z/8HuGeUIb6M1yw67
         xqCrVmhEeHxSbglFBxywuQ+Bj5eFgUQkvW2qOqJqxA9xEZ/rd1aqazTynOyPnWF+aAMk
         5n3PfttU3j/S8RVAyv1yvgwEWOeM6ryy2GQj5kuB/1ZscpSu/gEBDdcC1Fl+YE2UDi2P
         axdA==
X-Gm-Message-State: AOJu0YzkiMXIox/CvcrX4V56GzuCv2HNKbOuyT4+P2BaPTClyax1yd8b
	OwvbfLvgEjnulnF4mJw6Dko1YzcZO5Q=
X-Google-Smtp-Source: AGHT+IFt1x8zPA9cFLiJgAdBDaNjnJqrerrvSGn7e48IZfzP41wCL4Db+tCT9LVP4IhdZvpkOmoBaA==
X-Received: by 2002:a17:906:7389:b0:9b2:71f2:bd11 with SMTP id f9-20020a170906738900b009b271f2bd11mr96402ejl.4.1696361580483;
        Tue, 03 Oct 2023 12:33:00 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090614c900b009a1a5a7ebacsm1492247ejc.201.2023.10.03.12.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:33:00 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:32:58 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: rtl8192e: Remove functions rawtx and promisc
Message-ID: <cover.1696360403.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The Linux kernel authors consider "wireless tools" package deprecated. The
"wireless extension" is also deprecated. Start to remove private functions
of "wireless extensions" that can only be accessed by "wireless tools"
from driver.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (11):
  staging: rtl8192e: Remove function _rtl92e_wx_set_rawtx()
  staging: rtl8192e: Remove equation in function rtllib_xmit_inter()
  staging: rtl8192e: Remove function rtllib_start_monitor_mode()
  staging: rtl8192e: Remove unused variable raw_tx
  staging: rtl8192e: Remove unused parameter mesh_flag
  staging: rtl8192e: Remove function _rtl92e_wx_set_promisc_mode()
  staging: rtl8192e: Remove function _rtl92e_wx_get_promisc_mode()
  staging: rtl8192e: Remove constant variable fltr_src_sta_frame
  staging: rtl8192e: Remove constant variable promiscuous_on
  staging: rtl8192e: Remove constant variable net_promiscuous_md
  staging: rtl8192e: Remove constant variable bToOtherSTA

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   5 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  13 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    | 107 +---
 drivers/staging/rtl8192e/rtllib.h             |  18 +-
 drivers/staging/rtl8192e/rtllib_module.c      |   1 -
 drivers/staging/rtl8192e/rtllib_rx.c          |  72 +--
 drivers/staging/rtl8192e/rtllib_softmac.c     |  55 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  32 --
 drivers/staging/rtl8192e/rtllib_tx.c          | 476 +++++++++---------
 9 files changed, 262 insertions(+), 517 deletions(-)

-- 
2.42.0

