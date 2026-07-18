Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DADC1ADC83
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 18:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400914; cv=none; b=WlXY0mkgiYcEwgHSj1Y/5n/aB/8BOSbk/vk8DJwJml2/OZaCnMuqgIPOIaoxn40l0iSCbacYbG9b5Eq3KRpr9jzzaijCuPRFuG36gFmodBblhbT1nkB5XKkGd8W2i+1wo3bM4ooNsS9NBQEaDb9Of2CAD8Hv9M+5YA/X3lFAfmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400914; c=relaxed/simple;
	bh=RLvJyyzbDkW2Bin4M8qjdgs0Tl2RzHC+PCd/ZUhXgUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXZvE3R5r4l1yohk5+HFtY1hUTDTLyfgRC+kDKvzLARY2g2W/QtpUsWcrG4iO1kWE/Y8z+0O9FvZdyaZZhYj8s7BFwtFBTx3akh+AljhxEoEuBaBUGDxNr/4nFJHmQPzWFO0DLteGjU1mHUBpQ6HE2/XVKXKc+brSnpNvpyqbEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ja2lwWtO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ja2lwWtO"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c167bda216fso658744666b.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784400911; x=1785005711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQeflTmYd4L1dkaVapCLSilHj8J3mnfUi8LPwpSpNOc=;
        b=ja2lwWtOWLwHeKVWLkpL+YQPN+RYcqGCPB+8uglPmZW2UXltGiJ4MqvjwiuU9XiDCJ
         GxYLjE2RjYrGnI+yMYdMG605WQAJC5e3N9YSkNeMSMPRd9TnrqsswlWirCtGipsg5jic
         SyZi83Ae+sjuQIfijWcEG4H0bItRfdpXjX1CwKQjdYHQ8naU9AxtBVrrvBnbC9VA3Gdt
         xNiZ0EH2/FZT76UKn0iITbszqdIDUbyLR++WKltSFZ+MLtE4ulmD6i0ymofvnhlftAKt
         nenMY++FeuC4x0prgpc0WCCGje9SeufRYH7rHQV6Pbxa5J9pnjL1C6KxtSlEg0RhoNQj
         9v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784400911; x=1785005711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQeflTmYd4L1dkaVapCLSilHj8J3mnfUi8LPwpSpNOc=;
        b=RZVnTBg2M6L4yWkMLyXpW+thI3VNtNnmJ6X5Yn1dtTQ5/PW/nlA87yMbxKfhFm0uzu
         8EeMeQoIo3JEnWpp+Zj/EpbwKLLEsW90TIZMP0n3iNv6M/mtuSWBJis3R+he/+0BmEbD
         RYClO66Qk8FZcZ+z/8MlbrjJd5Lz6YhqPIBXJlSL31PDPa7rZX+aILO5suHsLDcALKU1
         OCwPHE6aoYur9yKRpWERpRXtdX2ZN3WLP+RrYvh7JQ28vVPauKC5vCCZWBevkmGoj6Wv
         P9FGdKV/u8SiVj18un4Ubk3jTXqfIjjDOsnyf+6Iy4PB9jGpCNFwUqQ71Xsyu0lPchGJ
         /KQg==
X-Gm-Message-State: AOJu0Yz1jlge+YnWQWCeU/7oBCQYcbwztzCuTNJi+EJAi0yYJdDPEA9E
	J5HIwN98n7vTFcwdjBqG29kn3rqxRSex+dxseCsWeYSELtHKg24I8l3/
X-Gm-Gg: AfdE7cn7kkA9yIVeYnoX77vFL+/SyFqmX8RAwLtlj+9BjS/dRopaGYzrIcDRVE3P/lo
	Fy3du/a9DwQAhgl2uOfrcWedwzn/d6C+kAId0jJprqvsBq4yYJWdP5T+cf5CMSjhGhGXYUxmsEQ
	OB2BqM1CDhnRm03LGpsMwE5PjmsP+BuoH6oythaF9wNQ4HdIyNFPrSkw9Rm5Z0zFH/zmeb/h49U
	YZw9ocMTKWuK3B8YIvCGCZt63qVoRflR2lIKFi08HvvQFwTYFMImgoXWULiOWwldiiUK10W+5FX
	U7Pd3Rs4aWbXMc0jy32YNH2TDHUUFpqSDmXeCMmvUoh8xxDqrxkvHrq2jz5dbszM+LxgCT6Jav+
	m13FV/kR8oH8gxkPHtmPk537/qtsUQEj68zrvJnJLF+9H25BuLmhmp93wGBHSI8/V9u08gbsAeY
	73HJo29Gkqi0W42ji/W9q+Jo8KKX54vKyrLccWEPE8aDaE8IbPpGlAhu0=
X-Received: by 2002:a17:907:3f86:b0:c16:12c:9aa7 with SMTP id a640c23a62f3a-c16b4886e8dmr351971766b.40.1784400911266;
        Sat, 18 Jul 2026 11:55:11 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm249151866b.32.2026.07.18.11.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:55:10 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 0/5] staging: rtl8723bs: fix multiple OOB reads in IE and frame parsing
Date: Sat, 18 Jul 2026 23:54:40 +0500
Message-ID: <20260718185445.63070-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes five out-of-bounds read and buffer overflow bugs
in the rtl8723bs staging driver where length or offset fields from
untrusted wireless frames are used without validating that enough
bytes remain in the buffer.

Patches 1-4 are reachable remotely through crafted management frames
(beacons, probe responses, scan results). Patch 5 is reachable
locally via raw frame injection on a monitor-mode interface.

Impact:

  1/5  OOB read of IE length byte and OUI data in rtw_get_wps_ie()
  2/5  OOB read plus stack buffer overflow via attacker-controlled
       memcpy length in rtw_get_wps_attr()
  3/5  OOB read of action frame category and action bytes
  4/5  OOB read of next-IE length in the non-matching fallthrough path
  5/5  skb->len underflow after unchecked skb_pull in monitor TX path

All fixes are single-hunk bounds checks following the same pattern
already used in the sibling functions in these files.

Tested: CONFIG_RTL8723BS=m with CONFIG_KASAN=y, checkpatch clean.

Muhammad Bilal (5):
  staging: rtl8723bs: fix OOB read in rtw_get_wps_ie()
  staging: rtl8723bs: fix OOB read / stack overflow in
    rtw_get_wps_attr()
  staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
  staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
  staging: rtl8723bs: fix skb->len underflow in monitor TX path

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c    | 15 ++++++++++++++-
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  3 +++
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 13 ++++++++++++-
 3 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.55.0

