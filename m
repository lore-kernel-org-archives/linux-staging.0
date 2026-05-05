Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96305480947
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001745; cv=none; b=nd4xcHJUpHNYwYGOJDhPBGRF+d1kHGHMZaRn76Hjh76BjNQ5pWTj5ISfe3Ip7Ea4j6mbfVOdrp+5mRY8EdzQMTR7X1Ze2SBkPcJzTQ0hs6MMYyJW3wPK4xCtAcZCP+UvPUmTwOX4E9O08mlNnl1nvl9vTPaPDex0+P/ntovkSJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001745; c=relaxed/simple;
	bh=KJTkgvv/SJNjuSQIuIfvbMJw3S0+LfY8/xHH/7J7BD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0Ol6TksVt/qxQRs/Xp1vjD9twxSP0WCPQ7LCi5w7WHNslvo91HKzx0i3ctp9wXMP64qHt10Z4S8wA+6YLCKPmK+WtyfyUhBPPwz1qUM8QOqng+33xkZpVCYyTSO4ov98w2U2vaqioolpuSRJidFHYIs7bWCLHX4GlF7+PMUYWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKptiAtS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKptiAtS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso39444835e9.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778001743; x=1778606543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2DVA509Tz2RLR/PrPqbXJHTRanKYIEGVqimJbKfaro=;
        b=VKptiAtSo1242OgPC7M7mSQGlbrn0TlBrAiJ5Jp1om5Pv09Xwj5BEhUa+ytFEhuLzq
         Xj+TDUn2IUOFlfW2EAke+drht2DJ+WL7MHfFpVfEecmzO5NhLa04v4MvlN9c2p0mOFbW
         PfK2o1MNcP/26koMFG5CYGKBmw9GvYAal/6ey60d5lJkEFtGhUs8nBD1D79Y+4jJsHyq
         DJ64rs7cExVGblrozif/TEzswsg8fQ4Z0o3NHFtlUxnqUa07QiyKK8QN2fZaRHExUmUg
         pfoZsQdUgbQG7egFW8vRP8m1xaFsGVIK7tqOrWUwyKJt4f58lQc8ewf9yYU+RjxJw0MZ
         pheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001743; x=1778606543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2DVA509Tz2RLR/PrPqbXJHTRanKYIEGVqimJbKfaro=;
        b=LnXUXhYfSRFptv5TywgSI7Uvm1pVT1aBywMTqTTnO+1ux2xv/9M+deZbfsqPbwz55c
         /K/AYqApYZCWHgsftFuMP/em76cpScKutIcnznT0H5WXBk+OqnoguyBSMWvZVwzGta0W
         lIf4sDfdHZe7aGWEurmLEVCkixk9arPkDGVK3HYWGBLpZzzs5Muo3iNiFhny2aKLPnt6
         pT1Iu/X5DltPeFZCPpLi+OgpnfIdDmd80tdzSpygquaC6Aoxlhh4E0rAarhK0sq7spHL
         GtUMjQJuFZpphLP+z6zx78spOpYh7HhHjE5jmn8VUuv9SFxn2bUACfStaea3VbKPvC8A
         i7lA==
X-Gm-Message-State: AOJu0YzuuoveXtf4elolDdZZAxJ4Jj+b585UNKthTb3rtAzi13dZVJrr
	Oom0rpmCf131N0Ahdi9FlO5Z5aDpWFOIaIpH9Vv27akg4XwvlELeiKtw
X-Gm-Gg: AeBDievCHWv5Dlfv5F7fmcHR0QIU7OtZkWmpHcN9gF4fayLZyjO0O8koA9rng8k0ldY
	ptnGkqOaIC/7i8gOvDLiuZSRuXsAwKCF6ZCMBOLNFeSRqnkyI5tCTpY7lEL0elNhJ5DrE0j88td
	viUePDqzHlBK6pFPoxNrxhDoV/nQ1cwWZLbmAEqHIIXG+aokoSn8RxBB5PPDzw/8rq7IILc+QrJ
	0CWoAZISTfcSxI8pLWxVi3R14TQZGco6SG7/DeAUjY+WO+CPkuai78kjfOjn/O8gnOtI9mbjduk
	iKJJ6u0t/wugig+SIGHneu/iRQn4LBoj5rzLHknGiwhZKjgQh6tGYPvLXsx60k9oAZd6zCj3DMH
	kyt+opQpW2gq3X6fJjD8D7zFMzbTm31dk6wWVJFgY6/aUcZTNJLmuCppN3q3RyKm9R2NkRLwkZZ
	SgK1z7sxJYvM/MAtvAZqNvs9ePDZ1Jqj7eDC9yMrdGmzXJLlidN0WjF2XQNZTjRdKjwkoLyXFhb
	YFy+eqT1YxN0EvCt/y+tEmop0pXkDSgWrSFOHaG0Ift/OER1hq+MhenD2zxgYbzlK4baFQ=
X-Received: by 2002:a05:600c:4f53:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48e51f4456cmr2315795e9.20.1778001742511;
        Tue, 05 May 2026 10:22:22 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm6640747f8f.28.2026.05.05.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:22:21 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v4 0/2] staging: rtl8723bs: fix OOB write and read in HT_caps_handler and OnAssocRsp
Date: Tue,  5 May 2026 19:22:12 +0200
Message-ID: <20260505172214.3650398-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428091621.739680-1-hossu.alexandru@gmail.com>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4, addressing the sashiko review comments on v3.

Regarding your questions:

The two patches to drop from your tree are the ones applied from v2:

  41a866092f09 ("staging: rtl8723bs: fix OOB write in HT_caps_handler()")
  e36c54247447 ("staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop")

v4 supersedes both.

Regarding hardware: I do not have rtl8723bs hardware available.  The
patches are derived from reading the code, cross-checking against the
802.11 spec, and comparing against the existing HT_info_handler() guard
pattern in the same file.

What changed in v4:

Patch 1 (HT_caps_handler):
  The v3 umin() loop bounded the write side correctly, but three macros
  that run after the loop access pIE->data[0] and pIE->data[1]
  unconditionally.  If pIE->length is 0 or 1 those reads go out of
  bounds.  Added if (pIE->length < 2) return; placed after
  HT_caps_enable = 1 so that HT negotiation is not regressed.

Patch 2 (OnAssocRsp):
  Two additional issues found by sashiko:
  - The fixed-field reads (capability, status, AID) at
    pframe + WLAN_HDR_A3_LEN + {0,2,4} run without any minimum frame
    length check.  Added if (pkt_len < WLAN_HDR_A3_LEN + 6) return _FAIL.
  - The WMM OUI comparison (memcmp of 6 bytes) ran without checking
    pIE->length >= 6.  An IE with length < 6 at the end of the packet
    caused the memcmp to read into adjacent frame data.  Added
    pIE->length >= 6 guard.

Alexandru Hossu (2):
  staging: rtl8723bs: fix OOB write and read in HT_caps_handler()
  staging: rtl8723bs: fix OOB reads in OnAssocRsp() IE parsing

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 10 +++++++++-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  6 +++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.53.0
