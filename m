Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B543C0C;
	Fri, 28 Mar 2025 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165730; cv=none; b=WqhvDpB7ooCR3FkqQb8imjKiJKBHhSLQIBdKm2LMU/Nvz4GavzYlJkayTRL5FAbXMXvVdc6vUOklp9mjvGvguDCKPDig23auxmxLiLQ4yuoElP46xVJxGA1JDpjHzjtOEKzcWhW/I98bZjCJ9FwLTjQ2QCH3A318Sk+vRWCEanQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165730; c=relaxed/simple;
	bh=tO0MmKx8+bkak/7Go/XIr7gg64RgCZgpPgb7W3zJlQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UZvMbNrS2kH0ZPMGNkqxydmYtmg6vgt4DmLyGKyALkudCm8OhWRgXxjS5gaSne/l9V2smtla70fk7GABJZbGKoG5GHc527EIeQVJ66M5MUiyxo4ptJ35CE9XY5mWr+2mxg5HZ1Oz7fRvdpeXKOIg7uasx64al5WivNANBh6Tbho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0IxszqE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0IxszqE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso15230495e9.1;
        Fri, 28 Mar 2025 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165727; x=1743770527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1NPgjPSP1hsF4rd3gHtDF8BMuGktyi5LIa0kOSCKoU=;
        b=b0IxszqEV3crjb1NEucIRtTNAUUt5QEcwRE0xgLEP9SBeBKYMOvkJ5tLpd+M0Qrmlm
         XtRkYxpecj9FStTUHlU6IspnlzoIts4svSF/+nKbRDAJIGFCqH4pWZElY8FbZQOOvDKn
         Vna8J5qOcmttdu9+WFSfOF+v04LjQiE2vEDG4v+KsIce4EULUAE4M/mOuIw8BffDEGNA
         3Jph85G30eSPKqoM5TAjidBu/i6JGb1DeuusZnrMcFRl7yb4/sJrH87s0y+1RsBNF1+5
         V0BeNA+QuOa+YsAeCelsncj5nF2ySlz0nGbcRJdI33jCL7l+o9J//qNgC4I563yU3S0m
         OCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165727; x=1743770527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1NPgjPSP1hsF4rd3gHtDF8BMuGktyi5LIa0kOSCKoU=;
        b=J5d7LE6n87mxQKh56BYP26dcmxrCVb8Ua+hOwHkql2ANNcqUqF8Mzzco9mVRs3/lc/
         UxGZhiY+M+vwzhcxnegTft/PEcuYoqkKccn/VvldgEbnzrRdTOEr0WKZI1kwlM/XNsUR
         NiJzfo53ZFR42Ic5cij66pk7RmFBMJoyHYO1egR0lilyJRskLTa9faR/XNH5pZNoWDhf
         5rtx3X8OGxe3GSd4EpxFNeT6PYRPR2rqttzYZ5CTuhX6YtgMPH6dOf5qCsHV9FCsQV7d
         U2hz0o/KWoyYtuQRl2D+LqkYdPhHM6vnbwVAU6SjUSRIuGglybRwiQm4rREKBJfDceMr
         Fl9w==
X-Forwarded-Encrypted: i=1; AJvYcCWx8in90ZR5j1hp7IGhyBD1y0xGt22o97kl0v/U/PqBu6dpduB5+mhrCIpXY29rDonN0ig54X6rMuwgpnVQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx30o0pr1BooPxkcaFv18j7hZLx2LCfEkjpfCYPgTfGmR6uSGSO
	sTFTIR5bH8SbxV2un+fxg3aklVbhaBvzELyiHsQgN5ZRAnAurLBNYU4WtiAn
X-Gm-Gg: ASbGncstg7Bnk2FPNYQFaWJm0YdJJjvOIVEys3FupEwTIypY7k8aMw7g6YMZmbhWehZ
	1Pw/xurtth6K446kGg7Uccx4HQu0kfrJT1yNS7IF+wxOexmPPd+QdUGG3iimwmuo0G4VlOX7Zmo
	kuZ2Vv818mC7X1I4TB3n5DH8Kdtu//IJqsrZ6aKzGHm+oT+3IIpABK5/sD5X34+2XPhYuHx+cp6
	lWqCWKRa3ZJzvJo2OpFAjnD27VMByMiW6zwz1YI2M9kGbias51XBl3opmX6HI7490PJ6B007mCM
	O5MA9uvYUNSKjho55DJlUgr9OqUUwDWfc0dn+kufdUGcqmpU
X-Google-Smtp-Source: AGHT+IFHTVOHCUHe3uNUBfaGKjYLW4w/fKeyCR5Sm0RKUd5SZLXdqL+lpPe/hlv5+vCMxDsLSeWGGg==
X-Received: by 2002:a05:600c:3c98:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-43d850a61a4mr69496685e9.7.1743165727059;
        Fri, 28 Mar 2025 05:42:07 -0700 (PDT)
Received: from HP-650 ([105.112.193.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589efsm2591204f8f.16.2025.03.28.05.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:42:06 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 0/5] staging: rtl8723bs: code cleanup patches
Date: Fri, 28 Mar 2025 13:39:37 +0100
Message-Id: <cover.1743163800.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is created to address different checkpatch warnings and checks
for the staging/rtl8723bs module.
The patches are to be applied in sequence.

Abraham Samuel Adekunle (5):
  staging: rtl8723bs: correct coding style by preventing lines from
    ending with '('
  staging: rtl8723bs: align function return type and name on the same
    line
  staging: rtl8723bs: add spaces around binary and ternary operators
  staging: rtl8723bs: correct placement of braces around if-else block
  staging: rtl8723bs: modify variable names to comply with kernel naming
    convention

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 232 +++++-------------
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  42 ++--
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 117 +++------
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  77 +++---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |   6 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  67 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 153 ++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  21 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  36 +--
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  18 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   8 +-
 11 files changed, 315 insertions(+), 462 deletions(-)

-- 
2.34.1

