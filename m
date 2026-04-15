Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF121CC4F
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279331; cv=none; b=u7tOi1CfOXAMP0NOWByntAroFHvs1O9N/ssvJytBAsXZY0XVvfwHUR/nic4nFwmaKv/vvEePxcmJzKU8TrjAAH+VoaS0cddD8te9O/SMAW+DRgpQVu+s91v6b8cwTLCmOzgfds6tBDacwgWlliU5BcKTFqpwrnDGD26M3YpxxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279331; c=relaxed/simple;
	bh=CRgVnOUGI0q7Ct790HwLPHGc1VsZ9A/1dQk17MZfoXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPopAHo/7ld7qBpKi1SkbL/hbK3OwpXKMEwNLBGkOrWJT399vjhF3wn9Au486fswXqCcc2Hgqkw8iGPXPci0aR9caqrc39kaO1BrDQa7k74yDEZvafYKY+WyvWroecjpP5Msl8cnIZkGllUNGqIyPZ/Lo9rYW62yroj0qL46Yso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kE/OHmEf; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kE/OHmEf"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so2343054e0c.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279329; x=1776884129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDeo3f8CvooXNOU/9jKD56jXgK68+sHfUc7ysM/Ab5g=;
        b=kE/OHmEfgAoEgcbkilsLq7wKJ0Z0EU0hJ/6vMstXQZpzaYHKOoANAhzt57MNRt9VCd
         9ukb5OS6fgJ99w/3+8HGXprnPzNrJy6ed36MSPHEIq6om48tNgvI9+W2vjdkatFNsw4M
         w7yvPlMl6f63BTgtU9kAhgU76uFomSf512fzanE2fOfYP0uOzgOhQq3w4S2SkiSQMt2Y
         zN5VoeusdksjnBlSov5K9qZW9mk8I4VczUYfyTVNCEMtpoATxyqA7r/hiGim9NIusp37
         lYtYna9Ny0m8nI3k/1VNqtFw1ST5DlcRBSIGDoxEECtQQ8y+sTf8AFOLcJtaZ+GAAQRF
         fNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279329; x=1776884129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDeo3f8CvooXNOU/9jKD56jXgK68+sHfUc7ysM/Ab5g=;
        b=WblKsxX2u2lS86w9SZNUt+/8ogXVk+s3wU9QN+EwHpXd1lIARZgIRxwXA6UMgC6E0J
         Iv5cKClw6atRS1bNFzMe7Korvopya4w/eN61thbsJCRdfW7iKW346auXR1/qfuc2jSeE
         CbzAzhO9Ye4uPtsj7EfRjm35Z0NVQf2IpIxodjDqSmAEfYC8cDfzarCLtAitZ8IR/fbT
         RyA/XUTzCTFzQNzKDy4HWf6on869IWZ/MSwNV5voHcjJgNucFRRjxZqcnvBqK/LWlDcV
         42hSPcw24P8IhH26ZLlaVGo6p0CiE7N+gTB9YLRPA62g5IclVraYIkOhXFbUUGdPjoCG
         vC4w==
X-Forwarded-Encrypted: i=1; AFNElJ9URu2OF+mNeWsr4viS+g4bHjpW3clKBF1+rkNMJJwg+8u8DXGIne1COskpEi9KdWOzedUP4OquIbXeRbij@lists.linux.dev
X-Gm-Message-State: AOJu0YzrwLeHYF15chH8BP+ng7JLTmurw3qNE92so+bbbXiReFNujblp
	OVs/DJnrkOGlANRvhJUBOj1b153wFG6yGbskaBhNnvJ+f4MNWUUp6Fel
X-Gm-Gg: AeBDiespRZ0SK/ZQUPBg+jPPu+sFhsNSQ1sd+17/1Vnb+Pbl1KU1l3sLRyNKiov5Uy0
	wyo35iNZKgOMNIjg0Ju0B8Ekj/qKJjeB/xyF0Qd6mEW+w028bDMx09PuuCadmC19KQ2ZdwCKWOl
	Bnc4sw4x95XnS6i9Awb1cg/9yYS+FkMSOa4USzazXd9zGnybHvW8gOOpEZNeB1YGZPENUgwQkgT
	aEn4GGVD2zNrJmFKUP91DZKm+fFLFwM5z2B5Skoli4NE2IoHw/rEZpfGfM0ZGcoSCz3h6HkUgwj
	vKdWN9KDHvGXbjfxMBSUZxXwixqWDBi4MWIt2fwW1P4b7NlJjG8KAtDElDWyu1MzsWZp2bpM2fV
	hbo+Y+2Yz+Zg6WmXeh9cAx04wk5LXGbLJ+VW16fm24hzCfv2NnjVyPoeKkTxzP492RCCEM7SXsQ
	d99t5CHf6qsOWi/seFWUdl9l4JHy3w7VMtWIOj7EpR3HjNBY2oMa1p
X-Received: by 2002:a05:6122:1796:b0:56f:31e3:9445 with SMTP id 71dfb90a1353d-56f3b9e4996mr10565205e0c.0.1776279329111;
        Wed, 15 Apr 2026 11:55:29 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89feb56esm1647484e0c.15.2026.04.15.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:55:28 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v4 0/5] staging: rtl8723bs: fix multiple security vulnerabilities
Date: Wed, 15 Apr 2026 19:54:56 +0100
Message-ID: <20260415185501.440492-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes five remotely-triggerable memory safety issues in
the rtl8723bs driver. All of them are reachable from the air by an
attacker within WiFi radio range, without authentication, via
crafted management or data frames:

  1. Heap buffer overflow in recvframe_defrag() when reassembling
     fragmented frames whose total payload exceeds the receive
     buffer capacity.
  2. Integer underflow in TKIP MIC verification when a frame is
     shorter than the sum of header, IV, ICV and MIC sizes.
  3. Out-of-bounds read in portctrl() when a non-EAPOL frame is
     shorter than the 802.11 header + IV + LLC + ether_type.
  4. Out-of-bounds reads in three IE walkers (rtw_get_wapi_ie(),
     rtw_get_sec_ie(), rtw_get_wps_ie()) due to missing validation
     of the TLV length byte.
  5. Integer underflow in rtw_wep_decrypt() when a WEP frame is
     shorter than the header + IV.

Each patch was found by code review and is not tested on hardware.

Changes since v3:
 - Patch 1/5 (recvframe_defrag): check the return values of
   recvframe_pull() and recvframe_pull_tail(); on failure those
   helpers revert their pointer updates and return NULL, so the
   subsequent rx_end - rx_tail bounds check must not run on stale
   pointers (Dan Carpenter).
 - Patch 1/5: drop the unnecessary (uint) cast in the bounds
   check (Dan Carpenter).
 - All patches: add Fixes: tag pointing at the driver import and
   add the stable backport tag, per Dan Carpenter's request.
 - Patches 2-5: carry Reviewed-by: Luka Gejak. Patch 1/5 lost
   Luka's tag because the code changed.

Changes since v2:
 - Sent as numbered series with cover letter.
 - Cc list regenerated from scripts/get_maintainer.pl.

Changes since v1:
 - Rebased on staging-next (v1 was based on v7.0-rc6 and did not
   apply).

Delene Tchio Romuald (5):
  staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
  staging: rtl8723bs: fix integer underflow in TKIP MIC verification
  staging: rtl8723bs: fix out-of-bounds read in portctrl()
  staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
  staging: rtl8723bs: fix negative length in WEP decryption

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 15 ++++-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 55 ++++++++++++++-----
 drivers/staging/rtl8723bs/core/rtw_security.c |  6 ++
 3 files changed, 60 insertions(+), 16 deletions(-)


base-commit: bf9c95f3eeefb7fc4b4a6380cc23f1dca744e379
--
2.43.0

