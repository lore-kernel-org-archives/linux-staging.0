Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D223EA83
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572656; cv=none; b=QqxuhX5fA0phUSL3QHjY0Zz4YNP6nGWtU/bpP9Be+CB938y/EE2CueHmHiaiDLx/U5iyxzcrrvf2KLcffWM9OKGxj/t615J5eoDDwKouUU/GlKEC+K7YbGvfj3HQ8ZuiKumADRdC26oysHz2Ec5qfTkKERufu7LaZtreq6VEuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572656; c=relaxed/simple;
	bh=3vekZI0q4r7rmFgMyF610vPqkVYy5/iacS/Cz2KWA28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a19X/MxiVmExGQEJ2wM80Az3apBslViabE6Obf7eHRnX8G+XKGy3gdnK60VIkKOWZmH7oYoKZhu7OxNUZHkOLiExG9aQci5Ihgd6fizDJOG6RdbCkOmWcKU42aRb2cyCHPQOaqn5eJHkd2vs8aW8k5dIwTdF6qa4e36qlcsPAX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMGnvD18; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMGnvD18"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ee82e853cso3904676d50.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775572655; x=1776177455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcUlI4Ti0qmSX6ufH9ScMgDeTlpztMeNdxbAJFDLLeM=;
        b=iMGnvD18VrKT7k0EMXNsD7lfDP+mD3UdmVVwuEUdaGE2W+ssc94G3rAM65slX3PoTD
         nWyI/w/DWjCY37yLXgg+n4ytPV1Ui1C92m4wDXDWKrSDAvmey2B6rn+Zo9/rrUJSENoy
         W6EjnfRzdlC041xRX8dwBPjt1RrjXI1xOkd7qeYgCvLkjMxbhCVDPfCcseXMxpD20oAM
         hiw7HcigFBipTHcT64obnEbDUGLrrLvVm/eMUn4/HnMdnQjWbFVhC5btQOwxxEexwyHN
         MORidZ/cbxY+rHBSmKYNZZU0aFVKmGjRSGr78/5rMQTW8WLun2OjtBSg1sWXjjJLstWv
         vp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572655; x=1776177455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcUlI4Ti0qmSX6ufH9ScMgDeTlpztMeNdxbAJFDLLeM=;
        b=gt5w3OLADOEy9+PKsXdcrg7ZEPWW7UPsF5sewHbfGNElZwQM/5/7mBA+gsrzJCwibN
         JPcyuN5maVhyG1zkTlrkqgkXsZOu4H/8GAvYE9aA/5eZT+KA/cuYtLdy98HEKKMKrwKm
         ogjGgmzeGOC3of8xdLqGkQrjAp8FX+yzi14yqnVRazAN+GHLReABMXcQhrhvoTyAX4kg
         I1ac39lEi/KOeyyV0UpP7k+HsHdTBbNL6XBW0ntwnkxk4DPfN5vhCP4qXs6VkHUtUQIL
         9q9LD+0uMeMJMDb99Ezhi6Te84y/Zp/WKJHYbG9Wiqsiug4jtrMEu4IwSv7buo+9gbRT
         q85g==
X-Gm-Message-State: AOJu0Ywd6dR0/m12Oau4ahH/gIeBxw0LiRvwXU6gwUURt9yD28b9FhUB
	8YKZ3WqXFrHkAdGos1w5tpOH1PRnNdw3uvFJoXjaLL1NmBOKDpZvYP6a
X-Gm-Gg: AeBDiesL4ZnpOWyqKSMEtlVOkqxg1RRwXiPVGrRqCkWajZq7xa52gJzkmvE4czNcHHG
	RZQaddzz5KIx5z+xS6Z0utGxusRXh27x02czsHUD1LwSBmbX1VmJhLcMPmXYxLhDEql0vyfPYdU
	HJvbbQ9Y+8tPA3uHy5YDNcwq60TFYafDw9ZMWTe9mzT3/66F/+yFvCO9RXR2ZbFSuR7bhA2etr+
	9i0/zWaezbMg7ZRhoeVBtLyf2yxqizeHO+dYqnPYcT5zBPdMKXwySFNcbUKJcTHMEBMb/z8IgoA
	ybRXigiRi72yyge7R1v0TAsPsEg1HHQvA9nVd/avj0zWulMNEe//Hpx4rkyQwjvPzu+5ScNpPiS
	8gudxgZuZCV0xGlGP10JvrZAz2HhWLAszjRBiseAvU+TH46b0H+sAgJBduayXgNhKG0i1J/sp0+
	nziFAnproVJ5P+MpJz5th1Z1T4
X-Received: by 2002:a05:690e:4849:b0:650:3064:4d19 with SMTP id 956f58d0204a3-650486bf384mr13054470d50.6.1775572654581;
        Tue, 07 Apr 2026 07:37:34 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a828f3csm7868159d50.3.2026.04.07.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:37:33 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/6] staging: rtl8723bs: cleanup osdep_service.h
Date: Tue,  7 Apr 2026 17:33:25 +0300
Message-ID: <20260407143622.9767-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the include/osdep_service.h file from unused code
and macros.

Nikolay Kulikov (6):
  staging: rtl8723bs: remove unnecessary rtw_bug_check() function
  staging: rtl8723bs: remove unused _rtw_init_queue() function header
  staging: rtl8723bs: remove the header of non-existent _kfree()
    function
  staging: rtl8723bs: remove unused rtw_sprintf() macro
  staging: rtl8723bs: remove the rtw_warn_on() macro
  staging: rtl8723bs: remove unused BIT33..BIT36 macros

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 +---------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  3 ---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  1 -
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  6 +----
 drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
 .../staging/rtl8723bs/include/osdep_service.h | 23 -------------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 +++----
 10 files changed, 12 insertions(+), 53 deletions(-)

-- 
2.53.0

