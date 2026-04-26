Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684B1233723
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777197223; cv=none; b=SMmaBALYatyRJX9rTuaWXXl++9opUB/+JlRaCqbyjOqmCF3mBEAhyhg65RM7BojhBfB49QqLMSBNgrjHzBn5WVms9vomaHQcK0UVLVK38crZxs2W3QVbxm3BOWFta3VXLn+TSHzwez0UnwZSQa699QkT/vZatdkSHQAt7hYIt0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777197223; c=relaxed/simple;
	bh=R5MIHseKu/+OYuRfex/OMqgB7JKKkkFEGpZdQbz26HY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hrmQeQzP53qIZSQ5lBzWB0KCwwwZASj6E9DtYJIjJKA0Esbeyc3hibDGkzqEneKaeeVqd7de22OVR2CCLWj1Jt6fzNzs9lCADQlkwg6NxaEOGVJOzPI08+aKf5Z0LKgEeH+i9POWRQciN37oOQaUdBtBf0L2u2q48OVpMQ1Pu6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moasxZKv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moasxZKv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba840146so83017025e9.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 02:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777197221; x=1777802021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTXZrtJ4JO243eoMaBwgE5ONGGWPp5XmLQYYpsJ+Kuw=;
        b=moasxZKvv2XUH8v7MHiI5vJ4KJZiVqzJXRElFAZb7xKwv5D1RHppPV5Gr+MFD2q0yH
         EeERy++HQNcwX17efuTtomvSgqwwOkuCgW3ZgnKA36TZY46xk/xgkCVZ6o4wz0p3FCMV
         nXM3kHcTnJF5DJKCxBnGbMkNtlZ+YCm0PeTbqsPUIQa42dPw07HxNsGOd883P85gZCxJ
         zmCg6ObKa0Wgu/CcqrOWdYbvmKf3jdfAf8TMDCtdyjyNlg7U7f/zyFl+25UsDbRDpZ3M
         E0DKiDiEBil1U2N2gEV4aZGGmrcQ379rr/3T4jmAcs2lUfHFBzYmCJEYKoL0JmbhbtE4
         /6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777197221; x=1777802021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTXZrtJ4JO243eoMaBwgE5ONGGWPp5XmLQYYpsJ+Kuw=;
        b=nipkBzkdBZvhEv10Nr2eOM4MfS0XmUpUULs8IRJ8Qa89dq3QRcWM2R1cZ4WPeuL7+H
         /5E3/4knEMKagRYIv9rorEenBUWExNwx6C5H8SCwNCqc3wVYqVgBIlytctcxpeBrbqvw
         cLR+xy9HeXGRAYdpv8CVizdzgJ+xeju36QoT8c2QVKv381Q0V3OEqR5p/DMg8PucPh0Y
         pepk3g8hox6OSleMHnV+Fz6XY02GsATmndr0NIeMISIyavDB56fyyDNel5gIv6huiIMl
         wDNkS1EZaM9D3P2C4P/Fe6Uim+jJBYrVCOxm/OCSubHSEYPviQAGATUDSSP5WymgXW1w
         5M0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Y0+X5BJ6xN0goYs0SMlrBwpoctac5+XFjyedVTnuRj4d3daFatiodwcyGt07gzQXiw9Isr4mkd2lyAW/K@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi1hExCKbj57ImYuUn/CtkkmjpiowsYRWK16S64jTw8uxm4GJD
	+cbvHXOWPA0V64ZepGkofASkIXg/zdZVvL/uFgpD1E+gPz4g78KMpJj/
X-Gm-Gg: AeBDieu50J9XO3T8kZHglPX4oM03GBt3Qpbh9tjnkfPFLUJBMERr4pA1MqhncW2eLbP
	m/Cncnml9dfr+In3UGxs4QIKP/3Y8RG9s26CwQhsYY6SbpGoOAsVHEuiRR8qcIErKf4mBj3Acin
	X8Swk20ZP0jtEp4cESZWUNLuMOOX/VqLO1UnZ71jhzm5PFLDmey5lHgslUS0T/MVqN7Br4YN8is
	MTtcFeSSOp/xcR3OMvQUXqfZRon4HXf4oFsTVxo19nE0N2P0HiJiEXa7ybwO5h1l9gzYzcBI40U
	CDA4o6UBT6ZQ/my2O5iyOD264ZcCFVbp/JbD/q2wX2KdxOgFNCI3L5oz2IQHgUnoVP9nF9o1ics
	chpz0qlTSzTgLDnkwQ/QjGxQxaFbD/QLTI4rdMUBQhkIXDmoZL0BVwmAjvvIglz6cdUVS/YX9np
	rYxe2cLZm1ZUpZ02T5ydUBWnBjtssmlPNQ5PA+Wn1lxaaxh/wwNtuu3sAQ5P9WraHTXiovFB6EB
	gXbkqrSWATAylv+PgcoKYOkJhZY2uR/qTaxC+8R4wX6pulsCmKxHpJ/9X/lZtaq4ZPE7o4=
X-Received: by 2002:a05:600c:3b97:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-488fb769dbfmr586785465e9.18.1777197220465;
        Sun, 26 Apr 2026 02:53:40 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb735d3dsm510905405e9.2.2026.04.26.02.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:53:39 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	hossu.alexandru@gmail.com
Subject: [PATCH v2 0/3] staging: rtl8723bs: fix OOB reads and heap overflow in IE parsing
Date: Sun, 26 Apr 2026 11:51:53 +0200
Message-ID: <20260426095156.3523480-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the series. The only change from v1 is in patch 1/3:
the loop increment in update_beacon_info() is now written as
sizeof(*pIE) + pIE->length instead of (pIE->length + 2), to be
consistent with the sizeof(*pIE) guards introduced by the same patch
(suggested by Dan Carpenter).

Patches 2/3 and 3/3 are unchanged from v1.

---

This series fixes three related bugs in the rtl8723bs staging driver's
802.11 IE parsing code. All three share the same root cause: IE parsing
loops and IE handler functions do not check that an IE's declared length
actually fits within the remaining buffer before reading from it.

Patches 1 and 2 fix OOB reads in three IE parsing loops
(update_beacon_info, issue_assocreq, join_cmd_hdl) that are missing
the two-guard pattern already applied to OnAssocRsp() in an earlier fix.
A malicious AP can send a beacon or association response with a truncated
final IE (for example, only the element_id byte present with no length
byte), causing the loop to read pIE->length one byte past the end of
the IE area.

Patch 3 fixes a one-byte heap buffer overflow in rtw_cfg80211_set_wpa_ie().
supplicant_ie is a 256-byte array in struct security_priv. Because
wpa_ielen is taken directly from the IE length field (u8, 0-255), the copy:

    memcpy(supplicant_ie, pwpa, wpa_ielen + 2);

can write up to 257 bytes. rtw_parse_wpa_ie()'s own length check passes
silently because it casts the arithmetic to u8: (u8)(257 - 2) == 255.
The overflow is reachable via NL80211_CMD_CONNECT with a crafted WPA IE
of length 255.

Alexandru Hossu (3):
  staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
  staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
  staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 8 ++++++++
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 6 +++++-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

--
2.53.0
