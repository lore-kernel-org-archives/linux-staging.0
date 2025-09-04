Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2674C1EE7B9
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949363; cv=none; b=mHkamYg9zR41G1cFG7/3NalTn/lNgLH5hgWW03zgEXl5jy7AqRIHvDcVS2QThQuYEObFS3wToNWtRYsHVXjGRG+5VBGsmBJVOcd9okyxwvwq8Kb06UFfbb4wNtDXqq37o7K2JbeuStoWkuTqokRGxyNMke73FeviflwvWznv3DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949363; c=relaxed/simple;
	bh=d/a/06MRexX8jkafOM3Tb1PqFQuAWBAEPNY/pLIaUXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WwBgr3IwW8JI3BbG2Xd0STZruIvy5D1p2flqQomCkhyRUlgPkKq9zBhiFBgU+3S+7Ks9wu7/fyGYVNy+mHJanJzijJdysw6blzljepLHtxgwcZ7wF1SGUTzuI8BemtWQ2MGC8SCl38l8u30Nmf5bfLepcThxAj+j9tO8BTRPDsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLnt4nt6; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLnt4nt6"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-80e2c52703bso45892585a.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949361; x=1757554161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVxRP/gHP4MJ/VTDLOIdadmwOEyVTedNOpSakKUHi5Q=;
        b=KLnt4nt67NC4GI6ODlqGbHofyEybeoeP+McM65QAS+5TYA+kQZ3MuZWhXUVYg3zq5w
         sTK58VOw49TMxE0YpfqYZqk7XrkOQX51QDydtZW26DVT0Uneu5fDDMy+OuhqThZcIQSD
         C6lQbs2kw4ol7fhKxKx/tYxWOJmUCCBkrFyd56V3dpkYCWLONjKxV1e7y6nidlsQZOac
         AuC7N7tST+wz4W9q7Vu072mOIP1EvdFheb/jRuyNSqIU2Jmuyj7P4D0X2Wwq0n+66BgV
         sFvPdPHSIlEnysidNYQKCbJR5WQiGX52HnrdoAA2hmx3j7YfZItVhOr8fhbOTjS+0Np4
         6noA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949361; x=1757554161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVxRP/gHP4MJ/VTDLOIdadmwOEyVTedNOpSakKUHi5Q=;
        b=oJ1MMDgZgm38fGbEJ/UjisuOzi9NJfvbLKijXeZs1n3iEJGvdAKSJ/eJtfyA/KGkrU
         16npKsn/o3XE1cthZ+UFJ2zjCUXTjdRkJQyLZoPVDNTco/OLOLNmElKxtbfd0fgTZhIZ
         6Xao35QSRPEsA7M4Rws7iQDWyOKyse8yuNkL2hnYu7HYSeYKw+jKuzUr4CKH82ml6xLo
         jv9RS6SHvRwlqSMdiKNG5V94PmV4spVej9LGZylFjPFuvh27so7KGH/LVlTFLS1nZxIO
         smyH2YYlTQDh62sRRo6b230RYRcbW2wMAwhI+zzdbemqEBAqLlnA/qMZZ3YIULnSU0VI
         0nkw==
X-Gm-Message-State: AOJu0YxYmbH2L4XbD9Ta0xWtobf935vZtW+gN/BuGdldGPpTNbcp7vgK
	bpJrEccWkV719Wu/34x2Tvo1pS3ALbm61lgdxGH0bb1Xz3g7jh+SDh/O
X-Gm-Gg: ASbGncuRzXcAJ0nNbFhgbR30W842mMKR8HgWfBixOqQd0hnXr0zL3+wyb48SAk2wknc
	z9VCiwepK0jZG9opk3qN+gqHhENWtjKkCTVURRnOVdWuhibzSIunrpfvrXe/5aYSqR2pBE/IW5F
	71xIX1ZoqYa9MdW4laIJUovtkeJ41j2rydlJ250kSYKNxbfKmjUNaIegqaVmvfgxRkaZxhM4AOm
	1MZsOybJob3af6TEGWuMWF8WXKSguv7vFfeuugESa2f2ULDTOq99kO3hq/o1VspIFJ7fAjmUVBM
	QCGul70YEwYywGXWWE8yOCp+jIK+vt3Hc1qzxXYnx6C5aHEYCfknHRmEqhfEZYT0MWzI32NEbK8
	dx6NgnjQ5quThrzktZV9MH9wWBpoL2cEb1U61/s17qDrzwtuC0YP/xj5MiYhklKi24a+426mG
X-Google-Smtp-Source: AGHT+IFak0wXCxFGIQKw/J/dmbweQ7MS7EzMJkOOKb9zRTKbr9gDeKeV1PVVkoYtxJHhZaVUvl3eQg==
X-Received: by 2002:a05:620a:40cc:b0:7fe:8292:187e with SMTP id af79cd13be357-7ff2bd544acmr1867603085a.60.1756949360869;
        Wed, 03 Sep 2025 18:29:20 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f78757fsm20378921cf.43.2025.09.03.18.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:29:20 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 14/16] staging: rtl8723bs: fix line ending with '('
Date: Thu,  4 Sep 2025 01:28:57 +0000
Message-Id: <20250904012859.215565-5-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
References: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust formatting to avoid a line ending with an opening parenthesis,
in compliance with kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 25f333bb0816..2c34b68f1d60 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1112,8 +1112,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
 	 */
 	padapter->recvpriv.rssi =
-	translate_percentage_to_dbm(
-		ptarget_wlan->network.phy_info.signal_strength);
+	translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
-- 
2.39.5

