Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB23D994
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782058583; cv=none; b=s7kNMLlurUcRa8qugrRgVRePGR/qmw3XJgFX8P515qmW4SBuHltS4fhESGt8QQmQyq1SnY8gGEAXp22JL9CFuzJxX7apV1trg7p0ZYewFiLd2GIA5nWecquMBokZhV/eHB3I3mCTaKiDI9lNFiPPIzY0ZHR2oLoS+bl/5EQMMXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782058583; c=relaxed/simple;
	bh=p6FrMROUJpCw/Xdt/DscqbCi1wzYIPqHOIFiPZgTRHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4OrsqEuB4u+pyzZUS/Gs+y+bNSy+Piyobo05/4/EZ8y8U8EgTxAyMVTi80vPqjcGaRoqgQy3/nhpnnsV9J70HUzCzKOassJaKdV8kqKeYwdMK8SEz+tkq3LtFALZ5ZPxgIVT65qIPy/2AoSAHC+3yvLVlVSq4l9AD0zQAoarUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7lZwXaH; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7lZwXaH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6978f80deb3so790172a12.1
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 09:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782058581; x=1782663381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAm/C4oST2QNc8+Zf1yQEx9eQThF23Vtfg5+7qs/c+M=;
        b=r7lZwXaH4btK4U8BXEYiZOHz3ujPwIpEPJMn+H7DAJHPlOAT68k0hhYhynVBjR+w/F
         IdSl55IXdpE0dV3c4ExAceVj/YaxvzBIQLF02wDzbDG/dvnWJi+v72OrPQ6cW43Yn4DL
         Xau4CFURZqgJHiREBSuWn/FOM0JtunXzK4YAkAbDD4QYZCNj7nT0BWaWid1+bWFsnueA
         ucO3VB/PtrkR0yIekaLfKL80LoHFSk0OVWhe6Rn/ieHUTYIokO5zSwJ+kmmCK15m2fHR
         Ehh0oKKF1BGVQkO2jIy+Os6+wp69W2BqgO6F6kfy9k6JrUfyE80YsPQ/rvikNtgBMP5z
         evdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782058581; x=1782663381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAm/C4oST2QNc8+Zf1yQEx9eQThF23Vtfg5+7qs/c+M=;
        b=jGe9pHR9N+/8skPQERUYyDpkWhtKgcM3n+PaV9Sntx3oOefL+VOfTNN88kE9+Bf1Z2
         gG2+QHNmI5YLf9ocFKDC2xj8qySfH3du4ncKqBK95CYVO8SD6CkGpDIPUeMkkKeVowed
         hwg774vAqnyV+eT737ocp+qaTVL1aqCqkOSEgiBooIrqg6NbPBEfp6AVAl9wVTGWQka6
         IuTn4gLLl3o23rOdAfWPrs99iQRebgcM0oMZjojgHXKS6cK1SMUdMZP49He3+IizweoD
         xgD5XTS6rnJoe3ExKHzuTPGS5cu69LKmYi8/DWqLGahiEsu9aol12x2nQOGPGI4FvdVL
         99cg==
X-Gm-Message-State: AOJu0Yze8BtU67bIdlFgvR8rVhHY0aurUa3bmBtP0G22Jyfj2o0/gnys
	1NrkUlgzO4ovjGbUcP6BfwKTb3yozvaKvL36jq6NA8i3QgJYhFtlrmxQ
X-Gm-Gg: AfdE7cno7GkxQDSs5AmuxeObZB61K0nj3uTAUcV/aZ+pinaeZJbUVuTh51oVxzhiEtb
	f2D827rys/moPAxBGwH0xyFO7A4eCsnWs0uOJfjQ1mgBcC5Pw3PQjLqhBfxDtUDzHTl+VxBIm+K
	Xpmm2HLrHsmPSc5Bwh0J3heQ7socxbZ8eoWfSJ8rl92SsLa+gDKhiGOsdVXKiSBLZduJSfed4IV
	IvLxsWmLtEGRxtzeTBuhPvxEkKEykAJgcPHZqdBsfpUwTsThU4JcP20Tn16H4WzSHvhORa7dkmX
	+CsQ0qOqg7VF7eXgR3Q7YdoblqU8OGKuFu6MHv+LxNCsJn6l3q/0EiwCCZRYu6FajIbztLnGDoC
	+9mgC0RmxnQxAEwJ+A0TQsob3Yp9+LZW916y9GMcRqgaBq0+gat13xsyAd0TbH6COCeB6gjjEZI
	YdB6GxKpbl
X-Received: by 2002:a17:907:9811:b0:bfe:ed16:283e with SMTP id a640c23a62f3a-c09903ed213mr608256366b.50.1782058580427;
        Sun, 21 Jun 2026 09:16:20 -0700 (PDT)
Received: from archlinux ([93.186.96.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac92d1sm212968666b.32.2026.06.21.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 09:16:20 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: simplify the phy_RF6052_Config_ParaFile() function
Date: Sun, 21 Jun 2026 19:12:27 +0300
Message-ID: <20260621161611.111461-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Siplify the function by removing the loop and unreachable switch-case
statements.

Nikolay Kulikov (2):
  staging: rtl8723bs: remove 'NumTotalRFPath' from 'struct hal_com_data'
  staging: rtl8723bs: remove local variable 'eRFPath'

 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   | 83 ++++++-------------
 drivers/staging/rtl8723bs/include/hal_data.h  |  2 -
 2 files changed, 26 insertions(+), 59 deletions(-)


base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
-- 
2.54.0

