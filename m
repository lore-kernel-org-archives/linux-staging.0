Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575E3254B1
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678594; cv=none; b=a6Up2m1zDarupq+A9z50lyJMajsJZyOL8DXm8nRxnrN0kBiQ2JPh7qLtMVv+TnlkM2oe8x5eZHgLUlhr/ftmzCIr3YMmZLlWNPBFW/GabK4GJiaFITSaexuOEsS+H8D78BxHCgnTNckf/olAAZi7eUvXwY5R4OfYZnAY2tR04HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678594; c=relaxed/simple;
	bh=IawBvYzYYEK12bl4C7tEa2JXWsZN0dCuuD/sYeDhRDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EhC49S6xnMq4Z3X+SKFOOQ0lHnaPtPU24WJ042ohC90REs96xcqUA1Y6+qOUC85cd7bxbUvQQrbh2cJG8cWKWOzcIdI2edWKEFTHx9a85zf50VV0G3NIcAx4YfZMYr96yOQ5FlfXAEczlesF5HtIoGApp6DXL066HQuVa4Qr9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/MUKavT; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/MUKavT"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7963b25e0ffso17824277b3.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678592; x=1771283392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sq/mu+vjONIlS2x0y2wzDFHofAczSfdui9By0MjdMqs=;
        b=X/MUKavTSGS6616c1hIa+iEnvMBDUAcx8kA71oULry8K/U8EfzIx+98Y906I/z2Crd
         dH65r5Qs+5s3Lm9M4awzcq1F//CAjAUHd5BcCmC3AFG+NwANaALl2A3I3lkMdR79qgjr
         j1CfmqbcS9HBcT5nEqTpD4MzK2CpAMb0ZJLwKtRYXyR+WExLLN2KCim/sBXteLHhOTc5
         ZH/ZjrzlUp6u929ItNUIs72ojxpAhhLAe+BWCbbGxihL+HCC3LTdyqZHHQtAItZ6DNkF
         RZST6JB99/1ej4uvIq3xia2b2N4SOjUU2hzluYK6oPcjRwhfx4yngghAQykg27tDAc2u
         tM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678592; x=1771283392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sq/mu+vjONIlS2x0y2wzDFHofAczSfdui9By0MjdMqs=;
        b=P9RUtDbTYiCkQdNbJdudJ2VJ5zDMPcwoWRWiMtFaVWbJyc/6yr/rLZzPvsOQkivQj3
         zkq54GXC4/yIXkE9ecbDeUlIbfOst4xUK1kyL4WlYVTloPbX+LsDalPsIMJZiQ0/cGiU
         +6S9PXOfjRMcPrMFnesBUyDkndLicOD0TTjNNmeJ6oVg8p+0e3hSfx+AdvOqOczmh+/9
         1aKbryWiCP1FlEJ5NZ82xV58dGa/o9zn00rbynBbbkgbDPhwzmR/DnHCoEHcjADvs5W6
         anHPOygsCNnvQzOhD5qh6mT4wgipNMCTSrnDG7GUzO1lbozchNJ9ssGllrYoxLE3bcEi
         pwkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpD8wDbsPQdAiNby9qiDOaOLRz0O0RhD9o0OeIea1dvOWPteUOl8AMoWvbp6uovwZGGb7kWypzz43fb8me@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5IMrYY93d16oViIWp9e0iv53xI1KA20MJCgKr+ouBaaBONp1g
	uXtiqkoYy7CE0fjnpVJs7zRHqN8wzLdM2WGlnuUh1rLWccC5N2tjj1Hj
X-Gm-Gg: AZuq6aKB2vSxQCKkyqaetpnzfRippHkmpdOyZRCc4WSS5DChFKJtygc+S748TTJShC0
	jNSLxrvpDkH1G870lEJvr6JYPpM3N4WsvS9IKBLuLhkgEG24KLHOCFa3r1nrtURSMtifWUK3zoP
	dOFQACWFvIDn73Bi3l+/6eR3A9368bwp8zQZC7LwgCBeLkVX9TVgGV53t3MnQWQ5TPOo0LGaoIW
	TRSvSHM9fVNExHFUws0PGnW4eDG8Cj3BFu4n+j/+Oe5CGKLJW8q6koM6c4T8G3edt+jaABI4/Ud
	NdQFDbTgc/JDLzQInGlCb0zvK0Q6tALj0ltkcp7jzsDH0MPpJEALCQm1r/eWAoaHob2GzcFt4YA
	N5DL9HBtxBo8/Ao44l058fGefxHtJE9b2t0RGHsEExrpiEp8pWiVG8m+mvtOOqpBerMFNETahBg
	Naxg0FktQtRNC5fGamcGPBirmLkKlBMZ0AizL8XXjJkhR4jD6l65FC2dyHnUC7PI0Q5c8EJNWX5
	CR/xDC6qJED
X-Received: by 2002:a05:690c:d90:b0:794:9c07:de16 with SMTP id 00721157ae682-7965ef36abemr1975627b3.6.1770678592635;
        Mon, 09 Feb 2026 15:09:52 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7964a783a03sm34544197b3.49.2026.02.09.15.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:09:52 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 0/2] Remove unused structs and members
Date: Mon,  9 Feb 2026 17:09:34 -0600
Message-ID: <20260209230936.37385-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes multiple structs and members in rtw_wdev_priv as 
they are never used anywhere in the driver and are just dead code.

Ethan Tidmore (2):
  staging: rtl8723bs: Remove unused structs and helper functions
  staging: rtl8723bs: Remove unused members in struct rtw_wdev_priv

 .../rtl8723bs/include/ioctl_cfg80211.h        | 60 -------------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  7 ---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  1 -
 3 files changed, 68 deletions(-)

-- 
2.53.0

