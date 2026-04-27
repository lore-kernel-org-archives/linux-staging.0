Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5145B262FF8
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277901; cv=none; b=OM05gqDATvsh6+h0SJ9eA6FAi/sYKj2XIBOIeo1mUThVX+F6Jx8y3JOzruy8rjhqacrytBfcycVpDxeF5W2+B69eDumTJc2M0hvvEPsG1a2lv/yp4msO9xUiG+cZCkHzRX2SyksTAVOJVqD4ood9Rx3v8HvVWCDozt2yGcIZcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277901; c=relaxed/simple;
	bh=4R9u7Yqha8XvhDEogDKrtEzhTaJQUjpTqf2xnzVTRKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J148/5wJajNTaemQ85h41RgthF5K9uFfTWQSbink5zvV5RDKHoe9jWAaCCikivcZ6WjLZuJrIdeBsYzK13uzX5AVWeyDGNYbdE7pULcuSjqzg6acIePARG5WgVGIisvAt3J5oF/td61LWr1nkDXWR04/mYtKmv3LsP/UEpRj9FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k39Y74sT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k39Y74sT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ba840146so89772525e9.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277899; x=1777882699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kKfpvUNjN/nhxwoh6IXPn5Jxa7FTn9ptppkv0558HJw=;
        b=k39Y74sTSdSDdPxL3gBB4dGUMzTsNF1rPL+UkQBNCy4fgpwtk4vdXlfLnlYMBKY3LU
         Mnngzh+2pGB2y5ukvWrohB8xjfSdjOi9JwcP3IGwV1X/eIgV02PGYyXKjdniCm29Rgj5
         oGqLQlfdMx9KiUa8wbTDV20mBWgQpuqLCPqMK22oqwLBrcG/X2G5nDHBPngQy6PJQ+Ma
         wFz2xHtXqFPuLjQj+NMb34+plvbfevT1z+qN7FQhAo4J1rhtqvSbyk4OD9MJPnLYd7ci
         i8cdjAeeqqvPGc740ZvRnjLh+epjRN8YJQuei/wxJRceCgarvvuAJIIyO0LFOF3fqLVS
         m2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277899; x=1777882699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKfpvUNjN/nhxwoh6IXPn5Jxa7FTn9ptppkv0558HJw=;
        b=p/xbB3vfiVOcvqJRFQmiuErg+BvzFVW+JbahPoSfEdJHCmiMmfrcfvI7fBcRB9H17B
         HJYMs6g87Qp6wjCM1wuhkQrwMJt/80E2EZoqc9txqarPvxIl+Or5HK02GXbU88Zw71x0
         nCvu1ie1bNoZGmwY6lx+mdkZtUY/c6W8ePJdxYioUHGERcUUvHKH7uvMtubsspiUf3Ce
         0k8aNO+pfWmoy37jYc11NiJel/FQ5w+mN2vwjJLYLkd5jQ4vYI1BCaGvrKMpsvXAlW2d
         m3mMCmRvmrTLCpx5sTGWO9hLXO8r0ns36j+AseHYkXQCN0uSVHaG0rdTigU7MdIsjEjt
         4VuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+y+hsuqFhPSGeSmHdqSmv5LitWQOyVkgVl1Cm5K0Xk3GT7zP10H9i1xSGGy8arOwi8RYqMoJHymzPcoNYR@lists.linux.dev
X-Gm-Message-State: AOJu0YxOlg9406mfHT12nGhklTP6PKfjNY+mNq4urDcVEKaaL1Qb+OLi
	z91PxI16GzDC/nwZWs+4Vk8Y902KhqiLzOyxIiBNTSp4XzEu0CxMapgD
X-Gm-Gg: AeBDieturyb0YwizqxsQAFTff2Vz7aG4DbTz2hjxTSCNwmiTUg2HMzLa54nXVJ669kh
	yAConcKMJUHO8WT+S97oklG3OLF1aNiD8UWnoBvFPu24EegocMD701ZujNypNBSgMTOwitWcciB
	r6hk/8/U9XihJ/hz15OK4aMSXjR4cUrCokz6/Xf0DlHYe+PVZGViwnwL8DpL6ABPBvoHo47CaCj
	h34nQ3i1vZdsw2wTejjjihWk9OQXY9tnMAUyQ4XGUroccVlF/jeiO9W9lPhE8kV+qsf7FM4CPBP
	CSmUTqO9Wudm1RxDtb7iybfoilROSfZpy03JjOtyG+pLD4+xU6qAABPoNXu691mTdKttMApI2Wy
	/wFo3xTNsQDnq301yB+S7k7NCCvjjmHkc00DXF3X2Uw+LCsD8805pX+ekbCI+eg8Thpy9GLeyU1
	EEdIxprkLA5mKdAz1TTmvVGco23zGzwdUK1QVPrR9QllCz3BerBaawsr2C9j8R531DET5G/s8J9
	oQDTLYtpnl382LborzCW0tuZlPUv5YqGPOh15G5xumYGwxVj7t33lYd9bIlsmMryVMmMQ4=
X-Received: by 2002:a05:600c:450c:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-488fb768816mr581529925e9.14.1777277898410;
        Mon, 27 Apr 2026 01:18:18 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm712652115e9.15.2026.04.27.01.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:18:17 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v3 0/3] staging: rtl8723bs: fix OOB reads and heap overflow in IE parsing
Date: Mon, 27 Apr 2026 10:16:23 +0200
Message-ID: <20260427081626.3393697-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3, addressing Luka's review. No code changes.

 - Added Fixes: and Cc: stable@vger.kernel.org to all three patches
 - Moved Reviewed-by above Signed-off-by on all three patches

Thanks for the review, Luka.

Alexandru Hossu (3):
  staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
  staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and
    join_cmd_hdl()
  staging: rtl8723bs: fix heap buffer overflow in
    rtw_cfg80211_set_wpa_ie()

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 8 ++++++++
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 6 +++++-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.53.0

