Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAC53CA49C
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368644; cv=none; b=jFNTrgVmwXXDqHinB3kLNSntVwpCcpz4JdvcuDdaROff21SKzur4t/yvcHzJmnz1pFy502isb/vkJmoHv/OclfqU9ErXiOO4o8ig1ZMpDGt/MlwA6R8qjeKlaR8J18OMWmbLhn8mI5C6GTFtxorzDthlKCTGhAFjdFEEHeew/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368644; c=relaxed/simple;
	bh=guw/0M339lqf3q+Se3RbL4Yn7HqkvsKcNxnXScWLqUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nf4gadG8q+3d/7ZCaTqZZb+uPtalIVbwR94kVeLpeoVvsZ0fLrNckB0IUPV1dWIipI1+qLG+Ua+KAu2XCQCS8WVBkoCyTanKKc0tD1hJR0tiQF+wI/BMkFsdGD8VcDtXiNHRR3LuQ8WUQ5OZQHT6xdYMv9SgmicHSXb2ksaiT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naPetfjh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naPetfjh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so1054003166b.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368641; x=1779973441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pksxliDhN1xPi4Ml9hgRHYNl3ynUr9XDXR+rSuwcP/8=;
        b=naPetfjhw/O2RcbLFxSivVQkoD8CG8WJ1dPBxtwTGTCshG5kk8KR0a0pjZFiFlMMyP
         /TmLbL4w9vOIOg3f509XyrTXjWT8PizvGKPzWQQrun91Eu1c0MulJPK7l+iqFCoxfnoF
         +ecY200bB7I3/kjoRchLPx6HP9N8ISoF2mUJDrNDayl0S8Jpxo3Ti5bdZcFQMVIvBJBb
         Q306d3PeCTnRrPBr9e0FvxOSYU+pnCuQtPcq4tkSWiQ8jOxAn1LJp0Kfv+ceZFCI68xl
         H7jBdgrUNmV7RxusiCVKpsvvpzu0iyEAwkj2E0KHLxIlXr4apDfIay3oGpypWHbXouom
         PDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368641; x=1779973441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pksxliDhN1xPi4Ml9hgRHYNl3ynUr9XDXR+rSuwcP/8=;
        b=PhxWcYxgUUeP6sH/aFfs5M6ar/cyoDd0k0vlwTLLo1m2+J12EvkKmr1CbIeweTnsao
         ZYS9CyIAjUsadQfAad7mjbHqkY8feTubb/qpGc9SpoPuq+0jkHUempk4/VO6gYrSndwH
         1mbyFdDkK+U8MyPmdJvqXwcRkianmIZusJPBtxdxUt9W/wV8EEjZyPZ7p6dn4tmLCmmo
         +L0kTF/TqSzuMpJVI9RqNc2fh2QhyPAAbC89uZe+fC04jWli68dtYA5RVU7qh1/V6eS5
         anu2CoS35leA7CqaGy5jSW38BmQrJ1yqXnUIjdnIXLaHXla4+yHUQgVzmbrE+zOgW0Px
         zJ3w==
X-Gm-Message-State: AOJu0YwfF4FQ3NobR14AQ2f16muGLa3jynnq7m6/aLeM2zpDhTKigIJQ
	qdzcDA1WKYzArQRVVO4iu6KyRLzLRx8kKlySsM2U4gJwhJKM6B6E7nfy
X-Gm-Gg: Acq92OHrJELBc+LHpyKZLNfiMHRC6EshZgs4spjSmHZ7YIlso6mVbjp00QEOOhkV0RF
	quAsXP2xZFbNlWwMbMP05UpBy+9+Vw3mqFPJ8/n6B8gbEnxhLgfOfBnFVD1JNR52cDBYNOSf9DF
	ziC/HwQB48R5EkcKBjejcHH1JiQdMEafmyynOicLkUQ6BIrOg8rqKV3UEQC75+En7gw6V48MomF
	lBMlyuyNN/6SussibcvYxypXdQ+z8OMAhQVrVSRvhE9FN7xEEKOiI2GmFyAvoO+SbkD2yZ/DDHb
	JEGMdVvJSFWpTPeg/ZYrHH8ortNW9Kv9avMHDHuT4RoUbd1rb+YSpZqPBWOKdiuTXOnln8vwQv0
	CdgwNoGyWcILfl0wMXUGJcPJIXFcWLO697vcJSpfC8+ZgBInAdIK9heFsIBsWrRCi2CFM0rt4Na
	R3MxzYO4wXKOKhklz/uf4aHa1zacXXDOf6tlwAIM6Tc8XKDHToI3a5jM25guHPzjr4ETIg3s1Hq
	JgqYxp1zM56YX6AvodU3DKkTjxDi5HOk9DI5RKoacuTUDHss8sAiXS3mrfiMERnMXT7PPdi35oa
	hLdnDkmbeltxIPunFODYxASSqZ4JvV4cFaKJmtA=
X-Received: by 2002:a17:906:f58e:b0:bda:d08:35ea with SMTP id a640c23a62f3a-bdc15a3910emr145283666b.48.1779368641190;
        Thu, 21 May 2026 06:04:01 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a505905sm43766266b.37.2026.05.21.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:04:00 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v6 0/7] staging: rtl8723bs: fix OOB reads and writes in IE/attribute parsing
Date: Thu, 21 May 2026 15:03:23 +0200
Message-ID: <20260521130330.754181-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix out-of-bounds memory accesses in several IE and attribute parsing
paths of the rtl8723bs driver.  All affected functions iterate over
attacker-controlled IE data from over-the-air frames without validating
header or payload bounds before dereferencing.

v6: add two patches addressing issues found during v5 review.
    Patch 6 adds IE header bounds checks and payload length guards to
    is_ap_in_tkip().  Patch 7 adds header and payload bounds checks to
    rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr().

Alexandru Hossu (7):
  staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
  staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and
    join_cmd_hdl()
  staging: rtl8723bs: fix heap buffer overflow in
    rtw_cfg80211_set_wpa_ie()
  staging: rtl8723bs: fix OOB write in HT_caps_handler()
  staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
  staging: rtl8723bs: fix OOB reads in is_ap_in_tkip() IE loop
  staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(),
    rtw_get_wapi_ie(), and rtw_get_wps_attr()

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 15 ++++++++++++
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 12 ++++++++++
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 23 +++++++++++++++----
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 +++++++
 4 files changed, 53 insertions(+), 5 deletions(-)

-- 
2.54.0

