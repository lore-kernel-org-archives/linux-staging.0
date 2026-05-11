Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA643901F
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518671; cv=none; b=fxV7SvIgckJReCh6JOdD6K+4UY8qzUx4NlV/tg20KHE4XamoNz935/HuVZo+k7s2B1/PCmmzBlSc7f8cE9FFS4+9tzLWk0IwgR6zrWCylew1HRNFDn/X0keLom9tu9LgZoNAxQQX9EMCS9q4SAFbSW8jXsefXG/nnhjWsPTikPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518671; c=relaxed/simple;
	bh=HKYwCKFrxrTNxIuDqdTGdZEBRIKmdUAkdTkcZIem9Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzFUMTPflVhTwDARb1fGSA105BlRRl9Rg3ycU3FKN0dUDnYOrc8rsdTVICEOjFRcbiGiBz8/x5dTM435f0TctP7Sh/HFOVi0sJLWtL8MV0tnc0KyAWvGSYEO4DiRiRMW8t/Ii3K9aNcQJHkYo/8qnLRokU7ZRDykYChNE9VWKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYniZ6tL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYniZ6tL"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bb91b426e40so763404066b.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518668; x=1779123468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmJuGZ35NiKieokNGtQzmCewPJbbbcM3RBjjaKzQsfU=;
        b=UYniZ6tL447haFmPYKwRRo3F2CG7hgVPV1pIW0QTS0wgfUbRrW+JpdJfNtJQiwL5tn
         pMRNKu7S9+1pCBcC35xLljvcQev9R7D7SrbudR0oSdjuYMXrpAAvQTjsTYCDJy1BrpcG
         qdTw3KFltuGzkCZjgHLRIZEEsfrQ5sWo56PWrDWX2e2kOPIIhF2WYMWx9GqCDfh1DVr4
         V7SqL63YiY4yvnRoaVnUeR0PSqvyPu7xpAUXBYI+M0C0OhyzQx2PxdPu9RL0Q0/AdmiF
         vvuPPadklTjM/2pIImiADw3zOnZDWMnS4VkT5hE78rsZ1uv/3A/huYfAMHNd4LtmdJ+1
         QPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518668; x=1779123468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmJuGZ35NiKieokNGtQzmCewPJbbbcM3RBjjaKzQsfU=;
        b=YI3xlk58Mqmx3YCLt9VkthEhFdJ+szQQ8uWh+OX5FFhlo5fLFNyXBSSxQkJSzbfH1K
         059VYrpRLoICmevElZwlNTfij/kECmS6WhR9CUOnOK3N3WZok6oML03A304gC/K+MsoG
         fhdRqNm6xv0QtuDP8sidaU4Ee+w5km7UhjLBSHyQ/oy+MuVi9JTC2snGF6PvI0eQ+/NW
         6yJ/SX2c2C29nAyhAZcjSWRjr44Hy7n5iKWgTqRj7pIhGlGirtF1heBhEnx1RHy8Z3CX
         5xkaIiFXwOxrQzUvAFTwpmBtD1MqjutkCXaH9A1a2h6DYy9LNQs8WTA4OsVe9cBr3RuT
         OMpQ==
X-Gm-Message-State: AOJu0Yz9yf/xYVMYMBQG0aZUQRiyafwNfooi/KdKn5ZlWC6XDgZkDhmq
	w1DpPn1wV+tOa1XyOn/C+mJzg8S/L8iilWfDWTcGJnwGhgidzSlFvTawksqkJQ==
X-Gm-Gg: Acq92OHQ5R6qukEn7oo+UoWKt9oyf9TPXDAHGiiKk6CX2AnQXiSlo+9Ss0MsElBHrQ7
	R3BY3/xJaBUsxPSON+MZkFhE8eVSps00gBEVYxXPrJuj/2GTOy4JgIfogy0+MwqXWzVU/0NtWgC
	vIezl3PWEMpHDH0UtJt8KHrf9knGWBgsd/TzEIRiDCA5EoNc+5NyTfNQNCzsxEBk3w+ODHnUHks
	Z/EuwaUc9Q/a8FEMeIuo6OkOJRm5rNB8RMtYAh3WGyTlGdGP6gedPQEQ2Lrqfx9S1mo8hTIE4qC
	7YPj4YE9LAMKqf2UNDhn3OPpZPURjPaKOoqdjVrEFfkwn2OlXZ4lLiUluBcjO51PoQLEBNcdYpp
	2iRdAHpRk/WiMV9Bn11zrAvoAuEe4J/UiIbxuPEdICHD8XQZIph6EViG76IBnxvD/9K4QQCGr6V
	KaG9Yo1yD6DY9V0eFXE/UBco26l7YcHqPF0h1HWZwMLhtn0UfN2QAXPUfDph1UXL+lL7lw2ZqW9
	ImrgFDkoMeC1Im4DYKwfZjk10EMLbL0THWQyQZreftAM9XM9b0cnKr4/zZ8WPRLbA==
X-Received: by 2002:a17:907:6d16:b0:bd1:4da0:b0d5 with SMTP id a640c23a62f3a-bd14da0c8f7mr201249366b.17.1778518668108;
        Mon, 11 May 2026 09:57:48 -0700 (PDT)
Received: from ahossu.localdomain ([2a02:a420:2368:9048:c0cb:8552:96ce:1210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0a6fb24sm3928280a12.0.2026.05.11.09.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:57:47 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: greg@kroah.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 0/3] staging: rtl8723bs: fix OOB reads and heap overflow in IE parsing
Date: Mon, 11 May 2026 18:57:30 +0200
Message-ID: <20260511165730.1588543-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v5, addressing the sashiko review comments on v4.

This series builds on the fixes already applied to your tree:

  83255a78cc46 ("staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()")
  96bcf0a58df3 ("staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop")
  92f3954ca9e9 ("staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()")

Patch 1/3 adds the remaining three fixes for update_beacon_info() and
bwmode_update_check():
  - An unsigned underflow guard for the pkt_len subtraction.
  - The WMM condition is reordered so pIE->length == WLAN_WMM_LEN is
    checked before memcmp(pIE->data, WMM_PARA_OUI, 6) to prevent the
    6-byte read on a short IE payload.
  - bwmode_update_check() now rejects IEs that are not exactly
    sizeof(struct HT_info_element) bytes, preventing an OOB read of
    infos[0] on a zero-length IE.

Patch 2/3 adds the remaining fixes for issue_assocreq() and
join_cmd_hdl():
  - A pIE->length >= 4 guard before the 4-byte OUI memcmps in
    issue_assocreq()'s vendor-specific case.
  - In the WPS truncation path of issue_assocreq(), if pIE->length < 14,
    the IE is skipped rather than passing vs_ie_length = 14 to rtw_set_ie()
    with a shorter payload, which would cause an OOB read.
  - A minimum length check and sizeof() fix for the HT Capability IE in
    issue_assocreq().
  - The WMM guard in join_cmd_hdl() is strengthened from pIE->length >= 4
    to pIE->length >= WLAN_WMM_LEN (24): WMM_param_handler() reads
    pIE->data + 6 and copies sizeof(struct WMM_para_element) = 18 bytes,
    so a minimum of 24 bytes is required, not 4.
  - A minimum length check before casting pIE->data to
    struct HT_info_element * in join_cmd_hdl().
  - i += changed to sizeof(*pIE) + pIE->length in both loops for
    consistency with the header bounds guards.

Patch 3/3 adds the remaining fixes for rtw_get_wps_ie():
  - Header bounds check: break if fewer than 2 bytes remain for the
    element_id + length fields.
  - Payload bounds check: break if the declared IE payload extends past
    in_len.
  - OUI length guard: in_ie[cnt + 1] >= 4 before the 4-byte WPS OUI
    memcmp.

What changed in v5:

Patch 2 (issue_assocreq, join_cmd_hdl):
  - In the WPS truncation path, v4 set vs_ie_length = 14 and called
    rtw_set_ie() with pIE->data even when pIE->length < 14, reading up
    to (14 - pIE->length) bytes past the IE payload.  Fixed by breaking
    out of the switch when pIE->length < 14 (sashiko review of v4).
  - The WMM guard in join_cmd_hdl() was pIE->length >= 4, sufficient
    for the OUI check but not for WMM_param_handler(), which reads
    pIE->data + 6 and copies 18 bytes (total 24).  Strengthened to
    pIE->length >= WLAN_WMM_LEN (sashiko review of v4).

Alexandru Hossu (3):
  staging: rtl8723bs: fix OOB reads in update_beacon_info() and
    bwmode_update_check()
  staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and
    join_cmd_hdl()
  staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie()

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c |  9 ++++++++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 26 ++++++++++++++++++--------
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  8 ++++++--
 3 files changed, 32 insertions(+), 11 deletions(-)
--
2.53.0

