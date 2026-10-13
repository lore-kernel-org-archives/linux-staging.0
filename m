Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1952954856D
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922544; cv=none; b=psqUGX6iLs31f+7a1jGDkk3DTtQu3jmHDAtf4Yd/sgUj9K8hw/BfgNnjmUKiecfc/HaJUrueT0fIV4Hfud4paVQERK7Kyvq6DmwI5m7FvgTqMTTlZls15kK+6w9qkMcKyxuf7i1DT5FOluAybPJ2Wnl0d6bA8fn6ocntxjz7OGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922544; c=relaxed/simple;
	bh=sHpCU+9yAPTLoySTgFTRF4pweK+WQunMTURy5a3w1dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWQCJyoqetw2L8p9FeMNu5Lpedi0DVr+N/HrlwN+i+35cA8ePmkIK591l6E2gdUEC0n5pPYxRIYpxjfiAPCn+VDkHuSpkofv4ttG8T2BOr2hOuGeNk0Pu46+zh6Y7Ywyc2KOJQPKas646oYlpjZwIVhCtrNjkzKqCw3XjJfzUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxFM930K; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxFM930K"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-828f4eeba13so2508785a34.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922541; x=1792527341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VBBwqMR1fjyPGEzDUsocZhc9LoOhNGKbGIC+3VowAZY=;
        b=gxFM930K/2GARpyeyoxFJtwCWz+x2WK6eQ2VKydxFiRyFEpNEiRJBZVzyqjO+vIMd2
         2s0BH60TRU/6hM5n/uUmP7fKwK42sPQ0l59RozuNPvxFqH6grsiIUJxlUyobfq1Dx9eq
         lnLgAmZWBP21CxIaAR7UFL3KeK6ZEN2vNE5U/KsHAIY4oHLp3a/lm/t7GKZ6+NKvSmNm
         B59HTuuaw+5enC9J1Z5Q6EAFNti/FZBkt8RTMYrFZFLIZqQbC4PNK4wdO+THzana8NSB
         EDTQwN0UtWWp7Hs9/GMY3OYxHRdcASi21ntCx5FrOWgRyJHVtoYnyED5+uRrGJESZZM4
         LQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922541; x=1792527341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBBwqMR1fjyPGEzDUsocZhc9LoOhNGKbGIC+3VowAZY=;
        b=skPk8B4F6c6ak+zdtoy2cEc/bjauwW9Y0LUbM1oi2C8rq6GmmVTNyJeS5c6PVQrhst
         oOG+ym6RCcoNEVD3hOSFIiyRH2cZ+Om2Ly/jSWIsmKyApH+I6svmGbDR5A0yZOroKcL0
         2WIRr+qxbrhPsYLA4Yh6k7oNR4iZ1UvLHnRI/Ik9zjd9GzPdvFIIA5ezCno2KVliiBfu
         PhlladNGdj3jccQTEgcfM0LSy32i873PBWcwIMNs2XsYA2Zz3I4cfhJ8oCY2/ZUAs80d
         AxQ/6g0BanR8maUP3oy02U7xr9zZzNAF4iFz+jxjcV+vJNPfWcZe0Cxhuiau1PEDjwiX
         nTyw==
X-Gm-Message-State: AFq9FYIYV/EGqUjEHvxEr7q7Fj8uaXejBFgWS7CeLq8l7l+AVeOOpNlx
	WfBDy2fCckcIP3MCuzugZ34+pwqV4UK8Eswa3Uv83PiPTe1i4XqdOxTwo3nhh4AR9Xc=
X-Gm-Gg: AYBFou0PbGsGvH7LaQILqDzU/3dBt210lvLDZHxSEumf+/cpwYNKNq+MU9uDAuBQsPK
	BC4Jbt4VfX8Zwd0Y7c8sUua2vyGesxCgKQlaq1q0E4bTNdh9Ij8sH0DwIsdRFxpoItj/DObBHY6
	zYIONQtgY19vNq2CPJFYThEIP6BTmi2Y4khPV8/Dclqvcop/y9o7/KctDlhdC+hJZFK+ppP/R2K
	Qg4xYv22IftUaf/0zf/yPJaJjW0emJR11iFwBKGFfFagib5EIO8dOctoKL/UcEdyWktZFtDk539
	MzX3A0a9B0CdSXP0P7DC5gnCE5nTf/bQRJ+3/DbnPXezckiagbECN5mxxRw+u99gPIkhGgliaGR
	BemMYptRLNgtIS2wXGvWpovMezKYZV8d0DcR4GWLnU3nZUGxj2KZoCN3VAMH2L9PgvzNjmUaaEC
	oVQq2C2vn/xMb4pTCuGlkqc1eC5Fvk50BQmpMuPmOkGptugH9psv2wWn1X2fhKvOXJiubN1kPow
	3Y=
X-Received: by 2002:a05:6830:3494:b0:805:cd51:568a with SMTP id 46e09a7af769-83090c23e37mr12339060a34.2.1791922540631;
        Tue, 13 Oct 2026 13:15:40 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:40 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 00/10] staging: rtl8723bs: replace private 802.11 header macros with generic helpers
Date: Tue, 13 Oct 2026 15:15:28 -0500
Message-ID: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8723bs driver has its own set of macros and inline functions in
wifi.h for working with 802.11 frame headers. They access the header
through hardcoded byte offsets and pointer casts, and they duplicate
struct ieee80211_hdr and the helpers in <linux/ieee80211.h> that
mac80211, cfg80211 and other wireless drivers already use.

This series switches the driver over to the generic versions and
deletes the private ones from wifi.h. Each patch converts one group of
macros and removes their definitions once nothing uses them anymore,
so the driver builds after every patch.

  Patches 1 to 3 convert header address access and the Frame Control
  flag checks and updates.

  Patches 4 and 5 convert the frame type and subtype checks. Single
  comparisons use the ieee80211_is_*() helpers, and switch statements
  mask frame_control with IEEE80211_FCTL_* and use IEEE80211_STYPE_*
  case labels, the same way mac80211 does.

  Patch 6 removes an unused struct member. Its initialisers were the
  last users of a few private subtype constants that have no generic
  equivalent.

  Patch 7 converts the frame subtype setter and removes the private
  WIFI_* frame type enum.

  Patches 8 and 9 convert the Sequence Control, Duration/ID and QoS
  Control fields.

  Patch 10 replaces the driver's destination and source address
  helpers with ieee80211_get_DA() and ieee80211_get_SA().

None of this should change behaviour. In the few places where a
generic helper checks more than the code it replaces, or where the old
macro kept bits that a plain assignment would overwrite, the commit
message explains why the result is the same.

Compile tested with W=1 after each patch, and checked with checkpatch
and smatch. I don't have a device with this chip, so it has not been
tested on hardware.

Rishik Yechuri (10):
  staging: rtl8723bs: use struct ieee80211_hdr for header addresses
  staging: rtl8723bs: use ieee80211_has_*() to test frame control flags
  staging: rtl8723bs: set frame control flags with IEEE80211_FCTL_*
    masks
  staging: rtl8723bs: use ieee80211_is_*() for frame type tests
  staging: rtl8723bs: use IEEE80211_FCTL_* masks for frame type dispatch
  staging: rtl8723bs: remove unused num member from struct mlme_handler
  staging: rtl8723bs: use IEEE80211_FTYPE_* and IEEE80211_STYPE_* values
  staging: rtl8723bs: use struct ieee80211_hdr for seq_ctrl and
    duration_id
  staging: rtl8723bs: use IEEE80211_QOS_CTL_* masks for QoS control
  staging: rtl8723bs: use ieee80211_get_DA() and ieee80211_get_SA()

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 254 ++++++++---------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 134 ++++-----
 drivers/staging/rtl8723bs/core/rtw_security.c |  41 +--
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |   7 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  75 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  42 +--
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   9 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   3 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   1 -
 drivers/staging/rtl8723bs/include/wifi.h      | 255 +-----------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  19 +-
 11 files changed, 319 insertions(+), 521 deletions(-)

-- 
2.43.0

