Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894DF9E8
	for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756029520; cv=none; b=a7oMz6gJvdhD0/RzksxROUqdeJ7/TckzgRB9GBepj/guwwBuivDOaYNmxPpt1LbGHL40Ah7ulT4WONCYuEySibGZtMthJy1YpG+VhkA7bHIo6hVpXKEGVelKjrBtqGNj67XL9qeZ+Bk/epfvutnHcQm1FoZNrh+QEWhfRikeSxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756029520; c=relaxed/simple;
	bh=cgAKorw0Fde8Au04wZTQVG5bPNHjh/gcSXzESWxQi+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QjUOiG92FS7y0lcMeBXxvq2XawafZ3C0tvvZzP2ZyYCt736LOc79JVBzIzsFskbV3LX+aSk5cZTPf4DcoBobTeDVFslcOEisC4aFoX+9F1So2YurBgXclRSxe+OeTz0aAK/+xrvzc+jDOtZoQXYn0h3DO7oHeLVCOWPD3yKdUiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDIOrn6B; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDIOrn6B"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb78da8a7so533142666b.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 02:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756029517; x=1756634317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJyJ6n0uJyKoJ3QoYGdekyUCMuS5RT+LDiwNukUwI68=;
        b=FDIOrn6B0m75ryfCCRUQPgtkPQURrFMazxZTrVlWOLIeGZ+SZxlC4404jGLD/YWP5Q
         jDj9KyspfwZf0LTt6k7LCnc0X1T5VYDvdszyyQDPQ9A6yudKHpCMlNR85lfBUi7IeuXc
         9AdPbDT3FdIjVp6ULgiXUhcNfjz+3L8Q+ZwuNfKATWgAH/aYlJO3Iui79AGLmKnGZKyP
         b+M0WQLH5enyjzW1VnDQ9c+50IHuhCx3qc5hcVxqdaTm2Gcc3dCHoYTtC17lergADCIR
         KnTTBLHiTPuV883YtUMcWO2a7+aSLjBvVKihwQrV4mY9kLLkaNqOHFh9klSofniVsadL
         KxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756029517; x=1756634317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJyJ6n0uJyKoJ3QoYGdekyUCMuS5RT+LDiwNukUwI68=;
        b=i80cjFUfQ+Pl8Zu1YgdZhTTob813q5o47rT/VNWg0Wg6bGyquLT/xgXMOzUQcVlz2p
         q3NXZqp1do5/68pxbrzBX5IjEczJs4BidHSwqR2bGEgVsoL6xvgl/o4qlwPJJGhMA6v/
         lc9jzn4B91YYa7bSw8ju5+e+7ToF9nBZnVoVT5xeKN7qBPko3zBuuXO+1xmfHqG6RQIz
         sao4wvcW8Pm+TLwDyohUANq9M8dyaYztcHDKAm6CYdXQZpdtw/a2uwdB6cqvo5sSJQrt
         YdR+Wp6WODQ7oRFnZsoumhWqWHne3Oe69LMrAyT7i54XOR1l5frwf6n+2mllVeJSglbp
         3v2g==
X-Forwarded-Encrypted: i=1; AJvYcCUpjW6rI9imA0my0TiLJGPw8ltBUJxHWdLrhVP4tC3hl/zFIK+3VDQspkdxDINIOUp96me+E70E8o/xVmnp@lists.linux.dev
X-Gm-Message-State: AOJu0YzcfDH+MWMeh116LfFK771dsNyN7vGp2gbRLF5MBQER+cHPkPHu
	bGEymYWtymoDw6TpJgnm86Lfs+zp1oz8e+NIJsFGttfF3Ub5fYa06amP
X-Gm-Gg: ASbGnctRAsLlhGdSi7seitNhJ6ezxMyJPdvPavnjdu5GufJYvQOOiTJOt9cxtnS1Dfv
	h2cTNVhSqqhgB9h0BPJ239dianIKRPqoCzR5Dh7WWqNgb0fnjHNtjYS1C8L/2j+rzCGcoflti6F
	Pj2wTym+Jb5cVyw3BlXOtho8eus/7duCZ6gfcVPhnE9iM8g1Gjs1Q+ovLjMtGM6VSH95CzrLth4
	kZ5aTvB8ldqRq2hSVFFqeXjAfDoki4tw2vMoYEWB942oTI7nowEYnUeatIZUIR9YRptAoS6fpZs
	SRevC7CI3xNdvWAB4QPW4M6A/jmIAz/NtG5iq5+c2i/BqCxwKIYfOJy5ddEN0I0WprBBZbjLCIu
	8IBhj5XSFrzqNKV47HXCWfhcwujl3JDXYIKZh
X-Google-Smtp-Source: AGHT+IF3GTMJFxn33lICmYTNqS9u3TuML0h4Q12qPs6CV2JkSeinyxOO3rAAGORE8FzWm8zoSUhkHw==
X-Received: by 2002:a17:907:96a7:b0:af2:5229:bd74 with SMTP id a640c23a62f3a-afe2904c55amr785478166b.26.1756029517186;
        Sun, 24 Aug 2025 02:58:37 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe79fba62dsm41314766b.100.2025.08.24.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 02:58:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: more efuse cleanups
Date: Sun, 24 Aug 2025 11:58:26 +0200
Message-ID: <20250824095830.79233-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some more efuse related dead code on top of
[PATCH 00/14] staging: rtl8723bs: clean up efuse related code

Patch 4/4 removes an empty function I stumbled upon while working
on the other patches.

All patches have been compile-tested only due to lack of hardware.

Michael Straube (4):
  staging: rtl8723bs: remove wrapper Efuse_PowerSwitch
  staging: rtl8723bs: remove bWrite from Hal_EfusePowerSwitch
  staging: rtl8723bs: remove REG_EFUSE_ACCESS_8723 and
    EFUSE_ACCESS_ON_8723
  staging: rtl8723bs: Hal_EfuseParseAntennaDiversity_8723B is empty

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 31 +-------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 42 ++-----------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  1 -
 drivers/staging/rtl8723bs/include/hal_intf.h  |  2 +-
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  2 -
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  2 -
 6 files changed, 7 insertions(+), 73 deletions(-)

-- 
2.51.0

