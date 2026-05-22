Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946441A9B58
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410768; cv=none; b=h3jlh8xJhG9Ine8Wk5gp7GSkv6NvAboPGgk1YOOXwsPt76TwmYQ0GDVuqDHlPpsS2eBci4F0TJ/voiTSbteTDxmxWhNrW54bh7uh6sf2f7Yo4RwHdh2c9Al/x53Vu/V8bq8AgGjQ5bEEzwOnI/UrNR3pj69R7Y1YHMgTauSp8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410768; c=relaxed/simple;
	bh=y7ZOX7KbDf6HOdR0kb7JYmBrG2w/gJcTSuxehfCtglg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlvhAC7ZCe2twQKYbX/VosO2rfE1obonavwI1LXwUBN5RWY0Md0dIA3Arc0na5sf8XXokGnDy0DjYruFjLYH8LwHctDyNahO04QizhZ4vqPVc+DmAV+2WNS696GqaLECBHOQyhc0JofNRcP3ddD++oWSyTZC4NjH1c9lE4EfUTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSGePQo9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSGePQo9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso3240046a12.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410765; x=1780015565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lznDCz6+SJ5L5a9aRw8sUYEfUtxYnJJNulZGVY4zaxQ=;
        b=GSGePQo9I+QqlYtWS7BOKS7HRRCsY73xYtTWjPTXzxvRsLBPkBd4QFFtrQX7vtk1pu
         VCH2sNu33H6QwfwYEPojAuwQrV+Cx1K43gO9p85wrlCbyPzD5ddUtcJwK+qnQF5yU4fV
         jNnpSBOFeIdZDB4vuq55ng8GG6lWC81uIP2SFBgCjGL0nr0wQ8onhM7ID1ITjhL1B45O
         4BiHMucpb0NGJmcQ7kjhSeTP6WvzgiziSIfQPOGnTZAk5DarV4M/V0ZrOXwztJzYMB6F
         t9m1+azMP0ErePVQY0+l7oYjxqxYmS68hwhXnAXeNfof892i7Xog4edOty1UKlvM62hF
         Jmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410765; x=1780015565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lznDCz6+SJ5L5a9aRw8sUYEfUtxYnJJNulZGVY4zaxQ=;
        b=pE4dkHwo4fdKw8AxHdVv+djlw5hInGADlq3Qo5FKrOMl4F5toiZqen36fYiNwDSOkP
         MdQ64ImB+gMwsKtcr+A6PTV7d+bFPPwkj/sK4cS0Jl/YeaMWEONQtFOGLXIpCKtIeoBm
         BpXZoLFr9VVbuM9PCfjZBYnLgYJ/kHQbZyT+oBhIOG7/Xm7MwHRNwIxg0sz/h71OPK6c
         n0NlTj6+xdbsSnUt2mRk39Zv/5LjbdWD92jHgn1Rywv0SlxfelRPPyXuDOb7kJuNoEu1
         xlOAd0XMQyptgmW9ufSztQoN0Mskl0YmoL1IF1biEpg9BYdF/BRIGwuN+DT+SKPFQlOR
         008w==
X-Gm-Message-State: AOJu0YwSjpEm/oRgz931FGXnfGGeLUZCM7kn5UotowzGR5PkFyF8/ZoU
	/4FvJSS3Nx9OOZjZSuxBZ2af7P3x1ReulEA/aDENLCbtfeDMl1omF+ty
X-Gm-Gg: Acq92OHlT6sycSslxwqTmkWBU1StYEfgNOQme00BRl+DXBP6Ss8CQiRZlFKwRCl196I
	z6az3XwbSOHI1XrbExX1jfR6YSSK8Y47r6HTyL8Vai66wP1wUaaWfjs11tTVuU21eBTLmnuAM2p
	q3z7uMlSWeSUR57uDEKfAq9vGSmvtgq2jrUka3GZa9F4BCqET+sq9nBb6r7LRW4URw0Zo8V0uGS
	Nfyk7YhBsPP58wVFkWZYdZTfGLYOPPTZIdpVxg3fEhTYOZHqEbfMcHVwSjuFm1eDIMOWV66/oJJ
	fxE6LJeOpIG3SAIO4VaMD9DGoiEfxG5eXbgcyiqM30KrgmhBfTLy+lowUoHBOwcTvoIPEvVlABC
	N1IyyBS4UB1m1rhgfSO4OQEmSGeLIXVbcp9AmCSEnr9fS/xaEEDK/Gndc76x5v3SCvMFEKZNqtm
	XFbkMqX/BhT7pq2SdgQlwNMYTEI4ek868dx3rqpgckSCX0HrWqdnZECFuZxPTQDGD15+1rzewEe
	jEJhLl0gacJlOmU+c+j/v4ySmDihuGC8rtqvKOClDvpZ/MFDHpfwDcK3f8FgBFYssk9btfA/kcW
	ZFfzdmyyRrVhIdzZVBbu0Khatd9d
X-Received: by 2002:a05:6402:538b:b0:688:2793:f4ee with SMTP id 4fb4d7f45d1cf-6889c43e9bamr511134a12.7.1779410764856;
        Thu, 21 May 2026 17:46:04 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3535a12.0.2026.05.21.17.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:04 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v7 0/7] staging: rtl8723bs: fix OOB reads and writes in IE/attribute parsing
Date: Fri, 22 May 2026 02:45:24 +0200
Message-ID: <20260522004531.1038924-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521130330.754181-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
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

---
v7: no code changes; add full version history to cover letter (omitted
    from v6)
v6: add two patches addressing issues found during v5 review.
    Patch 6 adds IE header bounds checks and payload length guards to
    is_ap_in_tkip().  Patch 7 adds header and payload bounds checks to
    rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr().
v5: patch 2: fix WPS truncation path reading past IE payload when
    pIE->length < 14; strengthen WMM guard in join_cmd_hdl() from
    pIE->length >= 4 to >= WLAN_WMM_LEN
v4: patch 1: add pkt_len underflow guard; fix WLAN_EID_VENDOR_SPECIFIC
    condition ordering; fix bwmode_update_check() IE length check from
    > to !=.  Patch 2: add pIE->length >= 4 OUI guards; add HT_caps and
    HT_info minimum length checks.  Patch 3: add bounds checks in
    rtw_get_wps_ie(); add WPS OUI length guard.
v3: add Fixes: 554c0a3abf21 and Cc: stable@vger.kernel.org to all
    patches; move Reviewed-by above Signed-off-by
v2: patch 1: rewrite loop increment as sizeof(*pIE) + pIE->length for
    consistency with the sizeof(*pIE) guards (Dan Carpenter)
v1: initial submission

v6: https://lore.kernel.org/r/20260521130330.754181-1-hossu.alexandru@gmail.com
v5: https://lore.kernel.org/r/20260511165743.1588637-1-hossu.alexandru@gmail.com
v4: https://lore.kernel.org/r/20260505173818.3674164-1-hossu.alexandru@gmail.com
v3: https://lore.kernel.org/r/20260427081626.3393697-1-hossu.alexandru@gmail.com
v2: https://lore.kernel.org/r/20260426095156.3523480-1-hossu.alexandru@gmail.com
v1: https://lore.kernel.org/r/20260424151932.3734611-1-hossu.alexandru@gmail.com
--
2.54.0

