Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F661158D87
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621695; cv=none; b=lPAnxFJ6HdgO0Km+OBC8otHgoPF9WqsC5IsZAYIVbX7AO2nXJFuxe7rALeLMO90Ec9tLjeNgxTXh9zhZLJiQvplBuAgCQPCHgALdiseZmxZtWDOYpsGuX1vRJOYwlXYIu9iZ3rTQ9RWUaPVsvSRUGlyFNNWAb0NhhtcTn1jtHlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621695; c=relaxed/simple;
	bh=tGyWjiAJbZxq/gN0M7wjwAgXTCkZu7rn9lglOUWEvDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUQS5JW4mSeYAg9E4M+EjClC6d8dtEuuGVX8ZHP+gZT4wWQZUzPk3Z3+QENXhuOScuawarau+BWuJnWppzayuQHh/oPw8gKhaL1kavcPfVR36BXyJLywrfWwufV6fKgYMzKv/zRTr1T12EqObGJ0S0tVd4okblh21XQhbAXfskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGmDEmoN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGmDEmoN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cec93719ccso1313973a12.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621692; x=1731226492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6htMrnylFQ5DMO55G9HZDuKW8oHvcVuvmDwZaXk8jY=;
        b=FGmDEmoNbaqHijiDbCYZ7/dF2FFQgMUnlKg0pBvA77B4OD8sbnFmQEalFoI5XcbqZ0
         cI06PTTZ979Ot4KWlL4poVvy9FLF5z99OOpCKZ5kf1hsaJt/38REfYZNIGCVakUGiBHq
         MD93J2TonfLzf6p+kkNPPX0oZaaztzmCxyLU2IcNeD9ifqyyaeTisR8vQPLwHs2eq5dT
         PBePQmsNayryzscH6n1kLlf6NInJzZzV2MzOAjcKNprerWWhfDmB4lX3TyCaNZqhvIPk
         hG/VDPZ8BvcShyUqGB8LkysyPlWvWjy4+o8pXnB8vMTeTA/FOiQi/ZcwzSRjfFe4YRAg
         cUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621692; x=1731226492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6htMrnylFQ5DMO55G9HZDuKW8oHvcVuvmDwZaXk8jY=;
        b=OSJlRzS5GVe/DKHDeuYfcqyoidNyiT1vcDKvXVrQDDehD6B4OvmiqWTg4isq0k3Qtr
         7WSbQVu0VErXenHX2iazQDm3YQJKc5098Cspn9dw4I9Trwcy2ls55G/nRMlxFaloHrHr
         roLbW1dhSFnJcZgtBSVhV7qOpX03A6pd1OwyP3Q+xcQv3OSL0llM32b0Q/qjt4vsH02v
         pfaUp8EQIrg+L2IHfBPm8ThZq8y3+09Osz8fZzbkrbqTqYnl+/iYgR0kpbWO3Sx0RxWr
         Fs0tLUtZ/VL7N39hCZ4zlORBKdg0WVut9qyZnwVq01lmneoUXVzZOsmwenmAOK06gkRH
         lLng==
X-Forwarded-Encrypted: i=1; AJvYcCWoWUAcej1h4sIQzfPhIJBUFE+VpfbSgIt497XmPoGsaQZSfKwNI5E7b5ptaM8DC+rH7aRu6B5j1NCRfZG5@lists.linux.dev
X-Gm-Message-State: AOJu0YwRgJh58f29+LrZlZg24H29rwkkA2AFwQknhl/YMqX5a6NuX+1P
	yuCc5+7i340+ie4nvB4upVm0uUZsaKvg46tROwmKM9Vd4ffks6Di
X-Google-Smtp-Source: AGHT+IHtGFMxr/aiUCl4Ra72qgRMg0tYZtDJrt/wjc8HKWPsenfaF9Vcb1xKm8oQkVne20M6McdNCA==
X-Received: by 2002:a17:907:7292:b0:a8a:6c5d:63b2 with SMTP id a640c23a62f3a-a9e3a5a049emr1654792266b.18.1730621691688;
        Sun, 03 Nov 2024 01:14:51 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:51 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 00/13] staging: rtl8723bs: Replace function pointers and #if 1
Date: Sun,  3 Nov 2024 09:14:21 +0100
Message-ID: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace function pointers with functions to increase readability.
Remove dead code resulting from #if 1.
Replace one function that just contains one line to increase readability.

Tested with rtl8723bs in ODYS Trendbook Next 14

Philipp Hortmann (13):
  staging: rtl8723bs: Replace function thread_enter
  staging: rtl8723bs: Remove #if 1 in function
    hal_EfusePartialWriteCheck
  staging: rtl8723bs: Remove #if 1 in function
    hal_EfuseGetCurrentSize_BT
  staging: rtl8723bs: Remove #if 1 in function ReadChipVersion8723B
  staging: rtl8723bs: Remove function pointer check_ips_status
  staging: rtl8723bs: Remove function pointer SetHwRegHandler
  staging: rtl8723bs: Remove function pointer GetHwRegHandler
  staging: rtl8723bs: Remove function pointer SetHwRegHandlerWithBuf
  staging: rtl8723bs: Remove function pointer GetHalDefVarHandler
  staging: rtl8723bs: Remove function pointer SetHalDefVarHandler
  staging: rtl8723bs: Remove function pointer hal_xmit
  staging: rtl8723bs: Remove function pointer mgnt_xmit
  staging: rtl8723bs: Remove function pointer hal_xmitframe_enqueue

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  2 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 40 ++-------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 85 +------------------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  4 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 21 ++---
 drivers/staging/rtl8723bs/include/hal_intf.h  | 22 ++---
 .../staging/rtl8723bs/include/osdep_service.h |  5 --
 10 files changed, 27 insertions(+), 160 deletions(-)

-- 
2.43.0

