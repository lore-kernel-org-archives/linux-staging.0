Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6435730D07
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIX7vK+9"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a1f8313c781so156502866b.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486289; x=1703091089; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/V4SViSQX7vA1insSL2knptZhi5hxD300GNJth/+14=;
        b=cIX7vK+9QFkkEv6ZiW9/45Nm4t2ktJIAnMvpwIQTHIuUqNkgZ7KG4ofrpNkepGMoXX
         0zpvRuuPSTgH6DHVrxx19PkYxpqwWWjOh4Jtux5x7sqlWIg8FexWJf7MkujXTUNUxiaf
         3+Z9kEy2a+HggdFnZhbW3QTvDBPUN/i97dV2sVRxLwkIJwjAlk5iM77LW2kdPsSeajhe
         0YgYbikDY7axwIK5Sl+UAhlo38fZi5o5FjYzmMoYyp9puAgK2c2AEA8HQ04m45MnQzuz
         LdJWSQtdanjhfKpi7XZH8oz8TAr0gusbvzS6D/vzpykjj8k0WGHnEL1JVFMWF+0zeTul
         tgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486289; x=1703091089;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a/V4SViSQX7vA1insSL2knptZhi5hxD300GNJth/+14=;
        b=r9FRo5BAq87q1+xr52rkRhUJ5I4kuFKNiJhWnrp/iGOgR+Y6/pdEj2GBEbtLX6claB
         eeZL3Ib0wjJDiamfTRpiywp1iwcTk2/jLIElXt+SxdmG/G4In+lIMN8Shphz+ZAWsNzW
         LmruG8K7vl5UPrqgJ+LX7St58tquc0phCX9nTJRwDeGhotF25yEUFjj6JPO/peViGzE4
         Fu2oQPMRNfpkyllb1u50R6QN08R5eWzmueehDpLZfaOkN7K5aGOOYyAejwOT19MrXwHn
         VCQ+NvAm1ePe33q1k8/ePDEs5eimcKTZxAfrWLi5bHCHnWxsqL/h1ezzMVv/Zu75NmA8
         Rh2A==
X-Gm-Message-State: AOJu0YzMNajl7E6D9cQFDxIRAlmikIrjZKexqVf2IXNKZ8YxvA5nUfbj
	YoTr8rH3CMTYJQl5z0KvQm4=
X-Google-Smtp-Source: AGHT+IE9njAwIJUhmwH7QLB+W/LK10H+t1DdunnMzWH8iljEb1D85yxLQf1A/fBndBdwWCYqkoZ2hw==
X-Received: by 2002:a17:907:c317:b0:a1d:5c72:3be2 with SMTP id tl23-20020a170907c31700b00a1d5c723be2mr8744283ejc.7.1702486289471;
        Wed, 13 Dec 2023 08:51:29 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id uv8-20020a170907cf4800b00a1d232b39b9sm8000778ejc.184.2023.12.13.08.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:51:29 -0800 (PST)
Date: Wed, 13 Dec 2023 17:51:27 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Remove variable nMaxAMSDUSize and
 further
Message-ID: <cover.1702406712.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused or unchanged variables.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.
Tested in b,g,n mode and n mode in channels 2, 9, 13

Philipp Hortmann (10):
  staging: rtl8192e: Remove variable bCurrent_AMSDU_Support
  staging: rtl8192e: Remove unused variable nMaxAMSDUSize
  staging: rtl8192e: Remove constant variable self_mimo_ps
  staging: rtl8192e: Remove constant variable peer_mimo_ps
  staging: rtl8192e: Remove constant variable forced_short_gi
  staging: rtl8192e: Remove unused variable ht_info->amsdu_support
  staging: rtl8192e: Remove variable ht_info->mpdu_density
  staging: rtl8192e: Remove variable ht_info->RT2RT_HT_Mode
  staging: rtl8192e: Remove constant variable reg_rt2rt_aggregation
  staging: rtl8192e: Remove constant variable reg_rx_reorder_enable

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  5 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  1 -
 drivers/staging/rtl8192e/rtl819x_HT.h         | 11 ---
 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 77 ++++---------------
 drivers/staging/rtl8192e/rtllib_tx.c          |  5 --
 5 files changed, 17 insertions(+), 82 deletions(-)

-- 
2.43.0

