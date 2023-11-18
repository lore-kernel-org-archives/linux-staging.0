Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098EEFBF1
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nneFarvT"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9e3eaf098f1so76675666b.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297461; x=1700902261; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWS1RvxUn5tYPW8mqpxnbvJ8eJ8bpoU4JWTAG3BuVrI=;
        b=nneFarvT5tb53Q0LpiotdC5+gdw2L+1RXsv+rgr9ci6mA0yO20AkotSJs7mq43R1NT
         +x9QPnR1o00CaeANrRC1fzVLYzkwv3UL1MHWHK0Sux7F6F/uRG1eXmKLRlzT5trzZMqR
         NAQG9MAX9TzCcK2oVzTbR7CY99eLDzsgCAqTelEsUd/CyWM2d4N/Bh4pRF6rai+c8aIh
         naf16502RkrYdUmRRH7UMqZVHFjxdkvVQ++TQQzGaVARMwzJ8AKUs0q6yIJfc7nls9Xl
         P0L8OECOsW0NAHqRPYxCDDK7Sf5UZAbUtXtB+UGTz7JDb+sAPtoPiYO+yCJvPKTHQaKr
         RWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297461; x=1700902261;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWS1RvxUn5tYPW8mqpxnbvJ8eJ8bpoU4JWTAG3BuVrI=;
        b=vQ3K/D24lxE8Ocu6/s9unEgpNZSJYddOskexH0W64MEdSoNqhgj9AwLU5pR6BiqIlQ
         Qu2tIubIhaIZSjCp4w1AkTEx1qXJ0pGP6GHaawCi2eZFJS0WkVOIGTYdFxG92NA+Jjdj
         Y82JAZ8Tr/vF8gD50LSsUaSDvSkkVxJFcaGK9BndFFCUOkWQpH+nbpCc2w4RyWS44Zrp
         zgKLho70nfIuIfC0Bulk1d6lsC0ucZA2zPgu2rYBBdXeNa8Ys9nKHP9AkFkRSJKcxlB9
         vEXKo3KCivfvsHXYIHit5WRc2krw3WUu8x5z+yENLWafTg5so8zJv3hhU6/E5T5udgAv
         h5eg==
X-Gm-Message-State: AOJu0YwHBAQcWDpiq2ZchqxCsRueij34BqcezEXXBcywaLMMysw9aERQ
	cKQL+brj71b1vKlpRfS4jEI=
X-Google-Smtp-Source: AGHT+IFD77xr148bXJVASVtA1veAHUwQiL16mjKcS5L3LcQS2YLCrMT+iH1DxkuzOk4GTEgXUJPX5g==
X-Received: by 2002:a17:906:1da:b0:9cf:7d6e:2c3e with SMTP id 26-20020a17090601da00b009cf7d6e2c3emr1132824ejj.7.1700297460900;
        Sat, 18 Nov 2023 00:51:00 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id qk7-20020a170906d9c700b009e6e82939f9sm1659979ejb.26.2023.11.18.00.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:51:00 -0800 (PST)
Date: Sat, 18 Nov 2023 09:50:58 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Remove constant variable
 channel_plan
Message-ID: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove constant variable channel_plan to increase readability of the code.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.
Tested on Channels: 1, 2, 10, 13

Philipp Hortmann (10):
  staging: rtl8192e: Remove unused return value of rtl92e_set_channel()
  staging: rtl8192e: Change parameter "ch" of set_chan() to u8
  staging: rtl8192e: Unwind pointer to pointer to rtl92e_set_channel()
  staging: rtl8192e: Remove equation that results in constant for
    chnl_plan
  staging: rtl8192e: Remove constant variable chnl_plan
  staging: rtl8192e: Remove unused variable eeprom_chnl_plan
  staging: rtl8192e: Remove equation to check limits of channel
  staging: rtl8192e: Remove check if channel_array[channel_plan].len !=
    0
  staging: rtl8192e: Remove switch for a constant in
    dot11d_channel_map()
  staging: rtl8192e: Remove constant index from channel_array[]

 drivers/staging/rtl8192e/dot11d.c             | 63 +++----------------
 drivers/staging/rtl8192e/dot11d.h             |  2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 12 ----
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 12 ++--
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 20 +-----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  4 --
 drivers/staging/rtl8192e/rtllib.h             |  2 +-
 8 files changed, 21 insertions(+), 96 deletions(-)

-- 
2.42.0

