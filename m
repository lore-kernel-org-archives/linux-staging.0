Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209A848C3FE
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778002708; cv=none; b=Gx+oio9qSr9lECSy5mNxWKUrRCqnogJbwm4R7iQ0yPxDke71W1+aMVU/h6AeuD0DZGYSpQ5DtB0C7xU+4qzhNWzdF/AlVeKqfCbtOqbzuMEDu1pC2Y8c1y5vbZrwRtNji0hjJqFrZiTG2t0ApvUH/BbJZJO1JDZMxGh5W9+Rf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778002708; c=relaxed/simple;
	bh=INBOCCEs/oacPKzfuDtT4wyL09tCY+XD1saY/b1Qxm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVbEqqQXe+NEpqaFl0Leca7Edlkfp42aEjJZedZ1eBEEucA9RHbY3wc2Gq/oIWb/ujdyJCulKENRpkbXyCUSSVGYHcvDnrwpjj1REQaVmEgf0can65CaJXBjJmpF3bS4s1wFY2Uk06UMTJzY5MaS6YywILPpt1fwC1RqOS0JAf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPB4INYF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPB4INYF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48909558b3aso60445685e9.0
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 10:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778002706; x=1778607506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2pGThJvtdEZffGBgV5Up5wNelL6nr81TpmNS4CpWqE=;
        b=MPB4INYFs2zGrpeCU65jg1GRAWBpC4W3wR7qcEEkOyaf/zu6e++CT4ljVHbM5liQ/a
         IHwufDRtk+B7NzKbGHu9EtDC8o8nbr3Sgng3m9GsmaG66wgB+tdyBSaJJTSIn1KzsWGX
         p3X0KPDK+Izk6QqtVC3CDX3IgwtDi1HDSulTpjtLLi8BPhopPqLI+FhmHdnNyYJi+3I6
         AOieyIRnXIO8QDHBf/SKgwR0c8CFp62JCYr0FfK2z7y7L31NbM0nMCJFy4bZlgFXLp8l
         Gqq5WElvoKUmCRQ6ZaoWkgjdcJwOG2F6cqwRax/6kS24yeurbGy3eMtpQHyrRegAcPSN
         j6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002706; x=1778607506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t2pGThJvtdEZffGBgV5Up5wNelL6nr81TpmNS4CpWqE=;
        b=A/OosiFJgW4LKy3n441tDeSmQFvYIHj2Hlxb8kM1RMe0AQHqhzpgHDqa4Jd/aiNjPT
         owxJ/MLRxNofmyZ2e+b4cdpub9EKO2cM1Nu1mkIYxC3wDJhmrpb0+8vDQXbSQ/zLo0yH
         +LjH5x2jRtw25JmIvj/ZfhgMCwG6YTb9hR8U1zfVzHLuqjHeVV40bOrBKJvFP1CJS+sP
         HC75Rl+BJEoD8k9zTqUD4l+7YbNoxy5ScNjKOG3bQ7D5mMsDl+272aRFHax0ax8oA67R
         ZzTYYOnoMqjzw477IEgbxWbY9JB7VMvhnRqkfgpw5eolygFfh91IU/q/UYNsJVG3UYa2
         13xA==
X-Gm-Message-State: AOJu0Ywq5Wr/qcfMZ0QFc/HU1nz014kOVLxgxkRGADJf6Rs/EPPnjcTH
	/2GDcNDVVeoXPnhegR3nNA3dJ7ft88hFH6AmweWiLf7w30w6doVVxINL
X-Gm-Gg: AeBDieuIc5rMRVsR8fkuEJo36pNAIhqlDIfxgU6nQmRlh+W5CMfXHRomfRwO79aIBeu
	7anrNiT769hBdJ0DiuTzWGDUuXhpGMOsi/lRLk5gZjFNEjqK0JIrCqhZnoOsR5+CQDkZk76+4d/
	Ttx/VVFDDxDHMhV7HB/6iIyRW0DSHxRTgmcpYD9Wn9rcHyoWK6ipFcKDrp14D9tbsoaBkVBvUBq
	jnxqcfvHg/lNLAeDMMz6MhF8v6grff9uFwX802RbM07LFNroY2AcuD1CRzGvhPAmh7o/w9Rb4Ue
	6Fnm6M02QN5V8l3xU19g75iLXo2kFyr9a/EA4qfYZoviwQ+H78wofP3tWhG+OMbeyb+FDtlN6Tp
	CFgtbKaK5EXie3v+OKnH6XIib06tjVUhGpMInWYdT2jU09Ma7nOHy/5o9RjLo0Mb8MANUb5ju9b
	ZQG1q4G3EftIoJyhOmRGfTa9T5UxI2KYXBn60ndD/59W3eCNxugTzg5U5NzKO8Cg9qfEjPVI0JJ
	jLmy+iujevMxYLnYSoF5lE947fZXPNU+LAZvRLNtpOyVlgz4+bLn1trIghy4gVTGfF6+OQ=
X-Received: by 2002:a05:600c:8b08:b0:48a:5501:7995 with SMTP id 5b1f17b1804b1-48e51f32ca9mr3729715e9.18.1778002705492;
        Tue, 05 May 2026 10:38:25 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm655473875e9.9.2026.05.05.10.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:38:25 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v4 0/3] staging: rtl8723bs: fix OOB reads and heap overflow in IE parsing
Date: Tue,  5 May 2026 19:38:15 +0200
Message-ID: <20260505173818.3674164-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026050436-italics-clumsy-e83c@gregkh>
References: <2026050436-italics-clumsy-e83c@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4, addressing the sashiko review comments on v3.

Regarding hardware: I do not have rtl8723bs hardware available.  The
patches in this series are derived from static analysis of the code,
cross-checking against the 802.11 spec, and reviewing the patterns
already in use elsewhere in the same driver.

What changed in v4:

Patch 1 (update_beacon_info, bwmode_update_check):
  - Added unsigned underflow guard: if pkt_len < _BEACON_IE_OFFSET_ +
    WLAN_HDR_A3_LEN the subtraction that computes len would wrap to a
    very large value.  Return early.
  - Swapped the WLAN_EID_VENDOR_SPECIFIC condition so pIE->length ==
    WLAN_WMM_LEN is checked before memcmp(pIE->data, WMM_PARA_OUI, 6)
    to prevent the 6-byte read on a short IE.
  - Fixed bwmode_update_check(): changed pIE->length >
    sizeof(struct HT_info_element) to != to also reject IEs shorter
    than the struct, preventing the read of infos[0] on a zero-length IE.

Patch 2 (issue_assocreq, join_cmd_hdl):
  - Added pIE->length >= 4 guard before the 4-byte OUI memcmps in both
    WLAN_EID_VENDOR_SPECIFIC cases.
  - In issue_assocreq() WLAN_EID_HT_CAPABILITY: added minimum length
    check and replaced pIE->length with sizeof(struct HT_caps_element)
    in rtw_set_ie() to prevent reads past the HT_caps struct.
  - In join_cmd_hdl() WLAN_EID_HT_OPERATION: added minimum length check
    before casting pIE->data to struct HT_info_element * and reading
    infos[0].

Patch 3 (rtw_get_wps_ie, rtw_cfg80211_set_wpa_ie):
  - Added two bounds checks in rtw_get_wps_ie(): break if fewer than
    two header bytes remain; break if the declared payload extends past
    in_len.  Added in_ie[cnt + 1] >= 4 guard before the 4-byte WPS OUI
    memcmp.

Alexandru Hossu (3):
  staging: rtl8723bs: fix OOB reads in update_beacon_info() and
    bwmode_update_check()
  staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and
    join_cmd_hdl()
  staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie() and
    rtw_cfg80211_set_wpa_ie()

 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  9 +++++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 30 ++++++++++++++-----
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 14 +++++++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 +++++
 4 files changed, 50 insertions(+), 11 deletions(-)

-- 
2.53.0

