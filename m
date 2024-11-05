Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0951FE0E6
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786131; cv=none; b=Fzr24hTXJqYagKqgIbO2mqIIWXXXviKVrNj+P8SXRoXRxt48+7QqtRKidroZX2CPWzhvDWUiOq7CFNPUdF4+Xd2+Y0yFKMipZjH8b6Wc5Hn/F1RCiC7/I/yIvxwXnkk6n5CfIWD3+zZuYBGRNhfPcUQqiTdCMZRvWiSm00BrdQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786131; c=relaxed/simple;
	bh=mPq80eFRl2XtSXtNqFZH9m1jZ3/JKV2+6yqg72JG+NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rObcIZqyidD3slUcixVbCxZTAPIMtV3bsNNKDGhrQuhp1hjpS9P9mSrhOCIcoubk78W1cYFVWitm2hgJlLtyLsLpWMelXS97Y2AogecP7NW91af8U3MR+OOVE7Bov45eiMfWVtPWR8Y9tEfKLSIw83TgRkW7kRz9oAwkBam6Nu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0T3Kbze; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0T3Kbze"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9eb68e0bd1so34428066b.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786128; x=1731390928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fhNXg8PIe3GehDMcVl6Kc8dJRsqYwjSzBH96w7wiKxY=;
        b=g0T3KbzekzoRg2FwDAHv7ivn7FM1Djq1XMCIInV2I+3YoMqrCsIL6Ch+NGu0/y9wxU
         wTGPfqTW6CKAcs5Dm0tgyg/QkEv6gQUH5CMSdzVP9G1v7ya7gMIGI2ujUSHsW8GLbkg0
         rGC31wbt4okt3UZovpAi9YxgeFH0SNJ+toeuQaFUFBqRRB6yhkDt+GawJvvkqpzujGuk
         0LLDGW9I06cNanwwrbV45rWGlOKZYGGl9ux2c2njk2h4Mrja2JHgvI7DUE4J0yTowQVS
         cmNw1yN2OaQ1pcRIgjRmELTOnEewn+qcdMIHah/NuSB3Q7gYf84OuEsnTPpNWd8iBkI2
         Dptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786128; x=1731390928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhNXg8PIe3GehDMcVl6Kc8dJRsqYwjSzBH96w7wiKxY=;
        b=wWsrhPeGF+vR5EneBHlf2/bHyrBA+9+ix8FPJ0ImcEroXR791Ezlb4eycznD7hnaPH
         +lBi7BhqeWDDUVm9MaURcbs2NlMq98N0GVzWX4g8FLlv45WPyPpRjSWQKrPvHCwy4jw8
         oCMe606uNmKfMdYOgipGTQ92aysH8yTA0f6P0nv7yJJfWFwqHazkWKYDMG4axBbiNXp4
         uUUQJq0+1ood9p6G6J6kEQqGASdZ8l/l8lj83/+sl+6syb/bW7S3jrtQ1ssl7jHaOs/y
         sK/PZSgrYYCXF3NPpnD6BI1Ue1k7nmMdjy75H4eRhPdpT++GExJdTjDX8z5S3FAlZ35H
         Z/9A==
X-Forwarded-Encrypted: i=1; AJvYcCXyQPzcSlXbol2WkHqOdqRkyf/PezlZb8GyccUg2qY8+qSJwYjbEQdJ2iXJ7UBDhC24Eux1AE/tkfDhA6Fk@lists.linux.dev
X-Gm-Message-State: AOJu0YxEMi0yviLazr2TTgJjK6HbNnxGytB1YKfp5Bcf5AKRtm9+z6cA
	B3ettNEQyIr+WiSl4Amc0ezUJDoVFQghrbRsQwrifgb/kpG308+1
X-Google-Smtp-Source: AGHT+IHLC/DCZT3ID7+Joe+6g6Prw6Eaz0Kl69NWdZUlO0033lAVucKbrTt68NyUvJos4FWVCybq/g==
X-Received: by 2002:a17:907:2d27:b0:a9e:1fc7:fc11 with SMTP id a640c23a62f3a-a9e655b931cmr1558333266b.40.1730786127363;
        Mon, 04 Nov 2024 21:55:27 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:27 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 00/16] staging: rtl8723bs: Replace function pointers starting with UpdateRAMaskHandler
Date: Tue,  5 Nov 2024 06:54:47 +0100
Message-ID: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace function pointers with functions to increase readability.

Tested with rtl8723bs in ODYS Trendbook Next 14

Philipp Hortmann (16):
  staging: rtl8723bs: Remove function pointer UpdateRAMaskHandler
  staging: rtl8723bs: Remove function pointer set_channel_handler
  staging: rtl8723bs: Remove function pointer set_chnl_bw_handler
  staging: rtl8723bs: Remove function pointer set_tx_power_level_handler
  staging: rtl8723bs: Remove function pointer hal_dm_watchdog
  staging: rtl8723bs: Remove function pointer hal_dm_watchdog_in_lps
  staging: rtl8723bs: Remove function pointer
    SetBeaconRelatedRegistersHandler
  staging: rtl8723bs: Remove function pointer Add_RateATid
  staging: rtl8723bs: Remove function pointer run_thread
  staging: rtl8723bs: Remove function pointer cancel_thread
  staging: rtl8723bs: Remove function pointer read_bbreg
  staging: rtl8723bs: Remove function pointer write_bbreg
  staging: rtl8723bs: Remove function pointer read_rfreg
  staging: rtl8723bs: Remove function pointer write_rfreg
  staging: rtl8723bs: Remove function pointer EfusePowerSwitch
  staging: rtl8723bs: Remove function pointer ReadEFuse

 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 47 +++++--------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 ++-----------
 drivers/staging/rtl8723bs/include/hal_intf.h  | 28 ++---------
 drivers/staging/rtl8723bs/include/rtw_mp.h    |  4 --
 5 files changed, 24 insertions(+), 92 deletions(-)

-- 
2.43.0

