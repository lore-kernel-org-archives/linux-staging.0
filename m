Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114537E2E7
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314457; cv=none; b=PTfDPsKQf+RaNKV4ybFnCkmUYw2MOslmB7ZbIY5Sk1OSiXeMzf4seKqTT7DFM6MDy7neq390cWgHoESWGNQ2bNeVQcXkY7wP7EFnz+KO5ZQrMBR7ecp+MAyY79hdzMnzERur44tZNU+vYtXWx3BM8OomHf/D/bO80p82dJEX874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314457; c=relaxed/simple;
	bh=6oI4DFk9mf5H+nUurTOjdLDbZ43pkzH24VzbJeVX8kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAomEKElTfc31IElLealVyiPEQh3vm2p5u2OasxFS6tgOoPH4hPWGoVFMd7lmdp3MaDnRPdjrVv1DPP9t6UZf5lvEo8cksjQfEjGwZ5Zd5EQi6r8w6j5j48jIyskj48IsHlzrkWoL2yc+89UV/t02jEdR/2v9mfuxX/8XMb6TVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojmSJ5Nl; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojmSJ5Nl"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69a50189d25so14675166a12.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314455; x=1784919255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOXij0Px8HRitRRzP55IKqERaox+7WT605UpubMT8yg=;
        b=ojmSJ5Nl/XAca6xQTTPZqp7YgtjemUgOHsgau0qbS1riuuq97cvMVATBGxC14t+0ml
         mYFgi+Rtu6iVspQtaTMTszXWxI066Eqb6NQEceqLGnmf7DqWkZbfwn5zQksGwijwHFww
         TpWIFEIhefPKLv5W9qrSBQncBw7odI1Y1I/O1Q+DYQGKcfzRrzpeaOUg91eQKzDXtemP
         ogUcjlPd8gSXw+vj0xaTw6ZfidV2CHE0Was0yEJrzqhCf57iqclXOTGrnQnQecQu5ROY
         6KIh4ECD85SVloeW/UHmphPewwCjf59LkFAMrupfbiIs8W7R7ZiQmZ5Tdz62WUuQSDGr
         gN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314455; x=1784919255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOXij0Px8HRitRRzP55IKqERaox+7WT605UpubMT8yg=;
        b=LsQTsh/5kGXh8mA9GJH6+QZjNcvWEcbX+bABOo/9E5wrttOE63gNzox0JmjhYyGDC2
         1xTXD3WdupbrGABfmQjofd+LI+EUNMfUEWAozSVKa5atP0x7/u2TYJQI0yIvBAMOLvOP
         m2CpBWLnAbX1OrrbX6psEzxWq2M1n4ou3qrVl08fKiKKD1dGVrhzW0hKJsf0w1eBMxpg
         kBnJr9XUP3xHO0/5kHxt+bYn745BTCZy3MmykPdtbTYvzucpIUF3xEUjIsorEFmHdoof
         JqL+AYY1K5TloQfhroNeN7ull5elmzv9iJqLRjr/9HD3bScK6ZwMs52u0QC/ixJj2ORq
         HHPA==
X-Gm-Message-State: AOJu0YzVxPZUxq0zLSxUN8ke6SZxEFqHW/G3KMeB9Y0udWnzR9s86x4o
	r7EwcF7E584D8us8PfwSBCTldPgfv1Ux0Z8HQRnynpvh7/BGn+mof8Ec
X-Gm-Gg: AfdE7clcnOmYwkYXQuCLujaXwjVS0gTAZNcQ7S6YcWrmEqNImTV2AyqEKfqk8kVgxaF
	2LFgbm2nm0cYpyqk3AqsbIvxgCZoD+ih6sqHQBZ44ZGzRyk29ek4yJmbjJFbBqPaegMz1mGSn1q
	KAvTQiITuhpOkBczSBN/O8BixKjm5TtPPpPqnoaxQOteZf5xU91PmHYxPnS3yNpXSWX28wjhBnv
	cVLRlEoSYGXD4w1odfmwuzD57grBKuGygMqviMRr8J2FGEcXkE4QbFintBnjSVj+hip5xfmhFux
	wgIPA/bbdsc+5vkUjVGr93DEZN3tD6kfH1wFkx6XYbK9Wb25Akt5y3ZJNyyFMrleCs0s+bECyNL
	5WIuAMvv2LGDHSZ1AOfPPu00k4C6iXjbDm74uOWyActi0SzWE4lwo+TGz02W3YsiyBkx6xPgD46
	IQ
X-Received: by 2002:a17:907:f497:b0:c16:5b06:4d67 with SMTP id a640c23a62f3a-c16b4865908mr180693566b.55.1784314454362;
        Fri, 17 Jul 2026 11:54:14 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:14 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/9] staging: rtl8723bs: continued cleanup of struct
Date: Fri, 17 Jul 2026 21:51:59 +0300
Message-ID: <20260717185407.56513-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removal of some fields that are primarily written to but not read.

Nikolay Kulikov (9):
  staging: rtl8723bs: remove unused 'CCK_24G_Diff' from hal_com_data
  staging: rtl8723bs: remove unused array MCSTxPowerLevelOriginalOffset
  staging: rtl8723bs: remove unused 'bIQKInitialized ' from hal_com_data
  staging: rtl8723bs: remove unused 'bNeedIQK' from struct hal_com_data
  staging: rtl8723bs: hal: remove unused readings from the chip
  staging: rtl8723bs: remove unused 'UsbRxHighSpeedMode' from
    hal_com_data
  staging: rtl8723bs: remove unused spinlock 'SdioTxFIFOFreePageLock'
  staging: rtl8723bs: remove 'rf_chip' from struct hal_com_data
  staging: rtl8723bs: remove debug fields from hal_com_data

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 --
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  3 ---
 drivers/staging/rtl8723bs/hal/hal_com.c       |  6 -----
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 13 -----------
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |  4 ----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 ---------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  2 --
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  1 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 23 -------------------
 drivers/staging/rtl8723bs/include/hal_data.h  | 18 ---------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 11 files changed, 84 deletions(-)


base-commit: cb08dcd0a896c3ac8073a57296f2377b106c35b4
-- 
2.55.0

