Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2FB12E1D1
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165409; cv=none; b=EwkPgdu+iSwBx3AEHayhe3qHmRqV7F1Jkf7DGD5NuXPlhV3FQXk+iyi8IpqJ5TTjDNLhzPk5YKiMYpr8k0ZeorGq0VYHbBCuwzjIKX9vlMRa32h0Le4ft8g2CLrgBOAyE5Ue7BUdlEk2r68VJ0MlsOLncZBuBlSObk8rwtZy75Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165409; c=relaxed/simple;
	bh=NEQg9KRmaj4GejKWuVZdgxcCeAn9W3kFUEPyebIC/Ds=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJqnWT2h7lpBvGwXJBGez0t6LVzMQqjmckFwBn6NqKSf/Yd4FiE5YSmRul8vEW2g3DCUgHh31QknFP05NMgXojHNBKcoX8mEw8lx9c0asWYUiOdvg3InFf2gYoM+QkIo/x9sYALk9zPXSIQbLjwWuYbsa2NDluGVZfN7Nj0kw8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGGC0yW9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGGC0yW9"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57d0f84b379so559915a12.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165405; x=1719770205; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xaVixSxnpxz/zXU0Xcv1P6HLSmHwk5egXTqsZJWQOvU=;
        b=FGGC0yW9CY2Uvn4/Z2vGF8wvSKmlHfR+Gptpm2ql1dkuJAArN1ePZ7S9nYTLwZfNVq
         65KVj1D6n/umJfQCvT2/G6egA2BVmjsUdr6Z6AjkN9dmxoGLaccpql44A/8uZ6s3JS4x
         FUpoaR3erYcmbBmQ1e8C0xcNT05h4ronsHw203C8a5SBy4adD5TskSEbYfDLlBG1cTLh
         keb5U9GGpD96TBW07HVq0Wke7ITjymC+vjQwB2Kawjz1OOL+efUGkcs5L/oJNApR2n8m
         7X/x78R0cL6D6HfncdcknrIUAayl+5LhYVDSf3fV3SvVgJ4pWvRXlHHqaSSO27vO89cw
         kOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165405; x=1719770205;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xaVixSxnpxz/zXU0Xcv1P6HLSmHwk5egXTqsZJWQOvU=;
        b=O3cOROc/a/aYtYS/bPjU7llGgIcwntatYg6SV7Us1+s7JKt0xqsXKiMLFt/Rwmvg/C
         Pjtwq5NRt8hON5DyWc61HCLI3K+G/7dgiKSsAMoX3aLi99pQSCAknlz8ZVyASbX691jF
         It/0zzsbU43wFfShdKVFpeUxjE6ul4uvXKiqduGmw308F+Ej/BohBeRX/ZBhJ6sTrv6g
         JVxCfI/q3Ub12kt0kX/yJoA6hiWnlYH6YGF7/eUgkAc3Eee9JDTiQcbcP/5xnywXlmxa
         py37P3ai1m772PrPFsg7d/C1Z58d4v2NkFdGnvwrXLIk6pMnHb30a2Nqq/n8l8VxcP/s
         b+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXmCo6nNVALR+Q/CzaJdbw2I0A1bbwDvevfXV4QPZSec10OSC7FvqkPzpbQ+CA7iGj/Jr13kmuBGwwMGR+4DNNwwELcaoqJIKg/aYWtdA==
X-Gm-Message-State: AOJu0YwlCy3rRkZqqQzpklxE80aQRcTkiBpxYJ/vjzdptlDPYmtwubRf
	7KPB7b1aWKQpbwWWUPzQL/l9pfKRjHExXnIVJThKusqpjc/029MB
X-Google-Smtp-Source: AGHT+IGPfFkaWRZ0vgLS+A/4aPe0Y/gdQxHN1r0qn7N9nwEXQgKaNd0Yw3z8U28XxClPdrv+eMixpg==
X-Received: by 2002:a17:906:2a14:b0:a6f:bbfd:39d1 with SMTP id a640c23a62f3a-a6fe087be90mr271133066b.2.1719165404319;
        Sun, 23 Jun 2024 10:56:44 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fe5e27995sm201392366b.0.2024.06.23.10.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:56:44 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:56:42 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] staging: rtl8723bs: Remove unused macros in wifi.h
Message-ID: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused macros, structs and function declarations.  

Tested with rtl8723bs in ODYS Trenbook Next 14

Philipp Hortmann (14):
  staging: rtl8723bs: Remove unused structs starting with profile_info
  staging: rtl8723bs: Remove switch(type) as type is constant
  staging: rtl8723bs: Remove unused declarations start with
    sd_hal_bus_init
  staging: rtl8723bs: Remove empty file sdio_osintf.h
  staging: rtl8723bs: Remove unused macros in wifi.h
  staging: rtl8723bs: Remove unused macros in sta_info.h
  staging: rtl8723bs: Remove unused macros in rtw_xmit.h
  staging: rtl8723bs: Remove unused macros in rtw_security.h
  staging: rtl8723bs: Remove unused macros in rtw_recv.h
  staging: rtl8723bs: Remove unused macros in rtw_pwrctrl.h
  staging: rtl8723bs: Remove unused macros in rtw_mp.h
  staging: rtl8723bs: Remove unused macros in rtw_mlme.h
  staging: rtl8723bs: Remove unused macros in rtw_io.h
  staging: rtl8723bs: Remove unused macro in ioctl_cfg80211.c

 drivers/staging/rtl8723bs/include/drv_types.h |   1 -
 drivers/staging/rtl8723bs/include/rtw_io.h    |  57 ----
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 156 ---------
 drivers/staging/rtl8723bs/include/rtw_mp.h    |  29 --
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  38 ---
 drivers/staging/rtl8723bs/include/rtw_recv.h  |  16 -
 .../staging/rtl8723bs/include/rtw_security.h  |   5 -
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |  10 -
 drivers/staging/rtl8723bs/include/sdio_hal.h  |   4 -
 .../staging/rtl8723bs/include/sdio_osintf.h   |  16 -
 drivers/staging/rtl8723bs/include/sta_info.h  |  44 ---
 drivers/staging/rtl8723bs/include/wifi.h      | 299 ------------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  15 -
 13 files changed, 690 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/sdio_osintf.h

-- 
2.45.2

