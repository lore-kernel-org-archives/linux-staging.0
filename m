Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6576A402444
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 16:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518698; cv=none; b=U17L+qgx4gaID0on8w6XWHuudOTdiqlLd00RXle8Jslg1MZERPYoQ9aWMSlwO4u0qghAcR9LhE1rTwBxIuYH5BekLoT2DD2PbwB4/qvequraarJbEojc+ZoKwRq3Q1XX+bdGPbKgqaftJSdsbzBVSAQ/4kgQMXGMH7hdy8oxw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518698; c=relaxed/simple;
	bh=HKYwCKFrxrTNxIuDqdTGdZEBRIKmdUAkdTkcZIem9Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZCSN2gVfQ9kDMwco9ziQKDxSIwWtjDCL2A/UjMNo6x0owJMQpU9hQUH09y/fYMDQYRHPecn1O/iDUGfEWXeh+BNRXMRtYAzs2XD7fch9mfc2rRA8zWjA8kRM0xBRztuVoXvlgOyglTfCdNWjMe6fQ9QM+bMVjBWaDBEXO4NW/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2Po/498; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2Po/498"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba545100a13so777264166b.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518695; x=1779123495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmJuGZ35NiKieokNGtQzmCewPJbbbcM3RBjjaKzQsfU=;
        b=e2Po/498k15jgxHE/TgOOyjljSUHf448Js6gj9Axainr8yUjnHlzUs52fRNkzwY33D
         Q7jJJL+yIuMUaP8KzCoS+URUXMKrLVrHe3waWrRi6c225Rfm9vUifhTIi62s2XyJzB5Z
         oYzWqbJKEosypmA6jtiiP44qzR9aMLUqG5S45RxFWGqTu8HAyBuMgw01qGIJ5Ppkosae
         Lp7QDG+1ngcUGIelZqktxt9Pr0+VXmOEYC9ZiFlIR9M0UIYdhLY/s6qd6ErSW6+cQaa4
         Ze66H9OpCnaRIiow//TEN/En4siZuTVRLeLvuN14qG42uFNwZnCdUIJsW0MVAPkhNTeL
         wgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518695; x=1779123495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmJuGZ35NiKieokNGtQzmCewPJbbbcM3RBjjaKzQsfU=;
        b=hMHvSuFZZKssERBSGGNQkDtMEB+mqNKgRral+i9LGQqf5vLstcvPKBJlR4H28tf/Nu
         CKKLQNmVGekYbP5c5+awQuVOSdmdl3zTEqTr1YVYPu3p+mWXAOJpNZyXPQ2gpqmLHuxW
         V8bFeZF3YJyVFI0Tw8+afNVGK1N+KlkXyZVUdw+Hfddr+URC+nZABBtc7tU0Rs/ybbNV
         46P3WOwYSlY035yxTUSBBTIvULU6682lCTH4oq8xhCRRJMLvOevljnp+3r+StWfNt5Wr
         dwI1oyS4p3zerDrnQ+VAG+LhViaUi0+h4nXuICeDWAg9Hqs/U8L0/O2o4TC3Rw3GJreY
         CoNg==
X-Gm-Message-State: AOJu0YyAA/2/6ilaJOjLbUeSnhNPmgi4Ez7Zow69wyph/iZ2iShBFFPc
	BmI+TIw+RfuforPT9Zj+mlZ/Oi+xlNWLr7BlbCueK80C2lwklpGD4LP/
X-Gm-Gg: Acq92OGpoSZWF5CzA6TJ16STQIHMUPcZJYKPEeEAbNKhGvLaTJUSvloqpIVNXbCsqBz
	uCMc1F+JR0LW8ZwAnnX4vladvr6rvbnm5AwkgJmqkNyCHPHM+anG3+TcV+R1t1CiZYBvbdeKgjI
	J2YFSKUQTpPrAiYmtS+U03pSLV7qOuiYPOn+vrFHetJ7UqYcc95AClCoRdR8q9znYXTS4UMteNp
	u80UareZ81L1tpI1LgvlI69oMTPaiHLgnY/wNXTGLxMo86JgAkCRlvxYoOR/kvZ9J7gwR214Bfa
	OW7JlMq56I046DFi3EMQSGg32gq08yr2eRl8qfI2y15jxPZwg6dq0o/E+QqtjkOf1yf7OcRCFcK
	ZqBUyaPmtP/UUOjWKb172btUKgrdpdYLI+MmKYRRSfOwwrgW739tj6OpOPGeT7hAvHINLj1YNE+
	2Uy16YW/KOUTTY951ea5Gpji2nnCBs0apjA5UTmF7sVTKAxsrgM7oW5wS3ZZZM7PCE/ixQI2P9X
	OLN/R8AaJxm5wcrcoggDdhddCnF3FSsMySiLTEwxXIh6WMPF65HyvZIDhaJBVlcbi5prRGiLmnP
	BM8RpNZEPkg=
X-Received: by 2002:a17:907:c81b:b0:bcc:d84b:5663 with SMTP id a640c23a62f3a-bccd84b5bc9mr502548666b.33.1778518694531;
        Mon, 11 May 2026 09:58:14 -0700 (PDT)
Received: from ahossu.localdomain ([2a02:a420:2368:9048:c0cb:8552:96ce:1210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bccffbac588sm325319366b.6.2026.05.11.09.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:58:14 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: greg@kroah.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 0/3] staging: rtl8723bs: fix OOB reads and heap overflow in IE parsing
Date: Mon, 11 May 2026 18:57:40 +0200
Message-ID: <20260511165743.1588637-1-hossu.alexandru@gmail.com>
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

