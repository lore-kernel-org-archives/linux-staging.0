Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471555C1DE
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885587; cv=none; b=O996gZ7DYPKagYLpvtyy08cCtKU3f5xdAMVTOJ3LoBYvCYndw+RuqfUuS5fe/1vQGVOTpycAreh4gDt8PIrA7xGivVliegqwMHLvUdAGb2SQDrjaroWgr/w7CyjOPJLG20LV7k7MQsXcVcgNR8S7Oy4f55ntB4AXcAMDST9oER4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885587; c=relaxed/simple;
	bh=xDT6PoebuVpGyS35jPyWOudKZDZhPkRHwsmHIh3KHaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s0dvEiHHmpIW1CjfmMIbjbWFTraeDGe7PrZCmFM525Aj34RzeqwcWKKabr+CFVmafgIK/0s9hwb1B6dwcdcbQmLXVm2+AhIzg4HqxKEyD6FghVhyX7Q7C6cbeTyZPMoObvBYYPZGDu71aRRervuoxR9SgyfgALeUKfnPeHe3RoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+D/kuKV; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+D/kuKV"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3936527a12.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885586; x=1789490386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oj6zG2m30S/Xd9xP+debY+X/WqSJ01mb1KyCz4EJ4HQ=;
        b=F+D/kuKVvzXtrJxmm9DUH6t93EamHbo/HHeKVoD2NrOZUXMk9NcmV0alyGUCEEByQJ
         8FZPVsGCtwvJtwjrPSt+PD2CAvmgcS0tCDKIVf74djpxzLhOF69Obv3rPqLDi0cOLPyb
         yWgqbwZDYSPgaPemTvCk/B8wZd7027CjRNwFI69Z/St9DX77Xmq0yM5Aol8sxiEHQ8qc
         /0A2QzvkVT9B7PRhMeXfGMLE9Emj5RQdbLWvHPxKOe9Ck6T6Ww9rq2ljSM6AGXgV7Pb8
         1tqSID+it7IS/DxBvI8SgQGAW/5ocW9ksajsu2ew6HUmtEZoNpoFAM4hRBE5mV0EBUno
         1njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885586; x=1789490386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oj6zG2m30S/Xd9xP+debY+X/WqSJ01mb1KyCz4EJ4HQ=;
        b=kpccvtXD25d1sAd/afS+osZ44WKM9qSQ0ZpNpqMMnGgv48IiEFleri0LWBZEieL9YI
         9ofw70xtEqfpi54kZovqMiMbZ5A66oLUfZwyH0LVjAw9t3Tw08ix5/txHmbNXheQt6tW
         46vqV3NZ1jLWhlYoodz45tlKOHaZWe9eZM1505TfpcX0X5lGov5ijvcNg4aXKPZ35BY/
         7mGZ9WIcIYjb+HjN6i7e+LLcT1lBJ1jjwOQv6al2nNJWXGB4HQLlhkw5wOfrWVIaf+qW
         //hFsL86mgRxVcDuNNuI1r8qhn7vfU6GpD2/A/SexocI+4FsDoF7BRjiKaNi0khtL5j9
         /PVA==
X-Gm-Message-State: AFuF++lBvLWXjavaiIEiLRBc1GSFHBSwjBBehFYvkLMy/4cROEuA2faa
	nBb/KkNDoHbk7BbrLnoERxJ4J4YliuBrW3XWKnpUXDKvlSIB9Jy11qwNvTZWGw==
X-Gm-Gg: AYBFou1l7M554MW1o+ybF0gMX+cWZcYmZP11KgdgNvpDrNO4GRJJED1ucGNLefNmqdR
	td4LEvxESWLjXzjdYlYFF5zEzSDeySxYbzpLNRW6OMascvRAgnNI4xtgvJ3biNi8AqhuO4UDVET
	G+IzPpFseI5x7umHbJkmGSbCPLhxDYqELUtO7YWNUUY+GunSyZIzGPPu7eXN/3mOjBTJSZfmCT7
	lCmndqJPUvGZyoB9uk988HSrnJvdwG4ERLbk+G8H/5D92EwCj2rShFPqmOJwyro5sy15A7lJheF
	AliS3y6zBQkbxJlD365j543ihkJftXaw1bXmW6/kzQoG6jqpuidulv/BTfJAV3r+rUWcjgbKfDQ
	Xjxmj3bJ498kal+d/yUJoA1meE9YO8eHDRCH99snFCTIwr2yxmPzG7KPVq4ifML4//DFNnOI/Bm
	CisCLZm0jufVrj/RVy1b5DBMb0N/yCsYOTKsroFfViyi5cOU8U8j04X+K83hy8N54K2B7VnevnS
	/m4JiQzug==
X-Received: by 2002:a17:90b:4c4e:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39b07fe9dd8mr39531349a91.8.1788885585652;
        Tue, 08 Sep 2026 09:39:45 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm5672357eec.29.2026.09.08.09.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:39:45 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 0/3] staging: rtl8723bs: Cleanup of commented out code
Date: Tue,  8 Sep 2026 09:39:16 -0700
Message-Id: <20260908163919.72100-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes commented-out code from a bunch of source files in
the rtl8723bs driver.

Jennifer Guo (3):
  staging: rtl8723bs: remove commented out code in rtw_recv.c
  staging: rtl8723bs: remove commented out code in os_dep/ files
  staging: rtl8723bs: remove commented out code in hal/ files

 drivers/staging/rtl8723bs/core/rtw_recv.c     | 69 -------------------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 39 -----------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 -
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 10 ---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 44 +-----------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  2 -
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  8 +--
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  6 --
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  6 --
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  5 --
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  1 -
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 19 -----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 29 +-------
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  1 -
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  1 -
 15 files changed, 9 insertions(+), 233 deletions(-)

-- 
2.34.1

