Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220943B48C
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700525; cv=none; b=EtO+X4K8+J5DVBy01UKxjg9JKwZSLO8uPT5wSbnpiqSg9c0/nopdcl43kipINJk6FktQ6JwAyDVEpddp3r+mteJLziO6tlwfII0ygik1PuEBamQB4FYgAIJH3hxiO+ICreQNkYDKbzjEg0OksqwzydBEZph600xpjy8FSQ03W4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700525; c=relaxed/simple;
	bh=EosGRXbySf/vpf26SJrFwlnwdBJc8GQu8054RmUoHIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWpAQhfqfkKmY1uij6I1+eIg86zjMOP5QhSzvR/ogjooIsy9sNM23qfiv0C7Z4SL3gmReTPEvRW1vWaRRgIRozDe07kAfcbScOa9ZZaNQU4Ysn41JMwqOvLb2m5k1f4Ll5J6v7fRcITRZ+Tgo6R1u0vlTl1ysMtlcnU4fILei00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTEk445n; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTEk445n"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47d70879764so755434f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783700520; x=1784305320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTvFuzOZe1C+wNIf4sQ6ZRSEWEvzksANKUKwKpf9zNw=;
        b=NTEk445nC+jnEQtanXUYRlk+TFNsnltacYByD4OIQ7JbsKeR/pwDM9mxNJx/uR5gPm
         dWrBaqUt7eiNp0B9U8FRjMvmSXsrH4zCm+I3m4PviKd7LW0WpoyyJ5DOtJJlGTjdQEMx
         WcyL9aAiZpRva4iIb1NK6GSx/fcoKZwW3X4WW3y7DnDX8UcXrwHwCYouxEXduVN9BClB
         2Y/1wur3ZwXfclh8kee0trKcmCVifZTlDwO2HvZpIFGNkVWeR66wm8K8El8x+seZLw88
         EmMlDN+0hDp/qOlVzxaDNLlUIogFINNov55cLIm4TYrA0yvIa7S/SDlqizBT30LlbFB3
         xD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700520; x=1784305320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTvFuzOZe1C+wNIf4sQ6ZRSEWEvzksANKUKwKpf9zNw=;
        b=sqQC8iunW+FCaf6C2gWIxyBwjx/uVercYBHKKzbLzwmNKSvAuKSyBwM12f5zXOqe8S
         vyBPeDwuotJi5d9iY9c9E4UWk3u5umkwOghMHXTKAPpOhh76vyos4ta0VW6Sh2oQyBj6
         qxuwpMKhLveCsUAREsNOqi/FZ6ji/Mx/MWF2uNR9m5HJaCtmMscEM8zkHK2hXmiofMTc
         N5SslKi4qkzRjvr9A6p5D07sCLE+D+FbgnRpQlIiwsuG1cF9KwAyJx1cRmj2mQlZJgRf
         QUX4Jg0XcJoRx5VbzazDhosODwrRiySPaMS7mdh5AG1txpg7mplMj28hJzC005uK6DLz
         OFzw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3oqJjuDNuTJdF+yY0PavUZqxAJOJ58Ql1hFv5HkulQDBcqm6WAKLKIOPZz0e7L8TYocXpuf9chb6WRpe8@lists.linux.dev
X-Gm-Message-State: AOJu0YxT4QuDa/uIFIv5ZY0sU1t6FsqrdbIaHXuXwS1CIJmkSDpwpqY5
	Tk36K6dbEFqfCrQyG8p79zty9/27/+kFR0vmtMspwf13kpK5ha97M1Ce
X-Gm-Gg: AfdE7cnbPUzZwInLodnixoyjpSuEg2pKgdwTcQwxYYg9Wo0HO7l2l68HmCYNQkkoo+l
	LN11yLJ0txzO6vaeL5cfubr9EMKLBCGxFWD/FEjUqy076S0PM5CJ6/TqzaMsV1FXk7ZVCUURepM
	6Cs+kPUy8RPQ6vOYMcSxS9zfThO3giMUTT8WFYPbFn36nR7cpWz0as16GEclIrM/w7ZQfjT4jz7
	lE/3QbZ7GR0EZQNWLud0nl29y/vnbgsU6MwkyoIr799SZWkMWXccMsHO7xUFsGIXepRiQKO9OaB
	jz9hxdrQl7nt1h3CoF5anpxrfPbT4jH09+2p3FLrkJqhRgklHW9qmcWuW/bbNyjknYFq74MD8B1
	xospBLjYM5XM7TeHMVslt/0qIH8YpsKRFz5Dpm2B0nALs0gxyfYQ2S+s0brPEhnqGgPm6duYjFB
	1lMPk9x5LAKUCENnLlbLDFdGJMi7r3kD8MPsJGPbw03NAv17XYxABIkR2wUFnTq6+AiZeg4smP2
	2WC9Q==
X-Received: by 2002:a05:6000:1a8d:b0:473:1089:154f with SMTP id ffacd0b85a97d-47df0722b7bmr14189955f8f.0.1783700520124;
        Fri, 10 Jul 2026 09:22:00 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm69436063f8f.17.2026.07.10.09.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:21:59 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 0/5] staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_
Date: Fri, 10 Jul 2026 16:20:12 +0000
Message-ID: <20260710162017.5660-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780343502.git.fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

This patch series resolves the camelcase checkpatch issue for several
values within an enum.

Changes in v4:
- Rebased against staging-testing

Dalvin-Ehinoma Noah Aiguobas (5):
  staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_8021X
  staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Open
  staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Auto
  staging: rtl8723bs: Rename camelcase enum value
    dot11AuthAlgrthm_Shared
  staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_WAPI
    and dot11AuthAlgrthm_MaxNum

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  8 ++---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 ++---
 drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 12 +++----
 .../staging/rtl8723bs/include/rtw_security.h  | 10 +++---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 11 files changed, 53 insertions(+), 53 deletions(-)

-- 
2.54.0

