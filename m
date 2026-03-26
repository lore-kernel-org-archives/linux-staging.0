Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96A34C140
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513000; cv=none; b=Ss7W4BEvFX2OByFLn9tyZAP/FAjkUXSsr0qG+5tiQkup5OgbZDh12g08x6ObuNYK/nuSuN0CxFssN9pWDu4Qp5mwpXG/In2QJL4dvuncDfFTx9YOqCvhOnJvxGwf4vRf+DSsf2iV+eNWiKlaf+bvt4H7kNf7v0NslLiKEhoX8IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513000; c=relaxed/simple;
	bh=3O5qDrcM9E2HCWCJh7fs30ts4Wm6JW1vROqC5tPBSjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKgTXvIuVYuH0HIYViHQHfYC0WI+Q81aLOjOn36MEG4DLuvrnVo93/2js7zB/2Q2qYJkj5/EPGnG2ftZ0peX1s1ru9E9CmtFTIrwphy6AgHd5IKW++rmnstVUZZhp8/5ceV6GjJJ874juUtnq46+Wdkeai3cVEDUNp/7kctAVJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRR97NxV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRR97NxV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so8639245e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512997; x=1775117797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toCvMQKoaOmXn8yp4qHoKgNI8N1PvbaxGtL98+Y+9Go=;
        b=iRR97NxVtyrlYzMz1WrJ8+w/mj5V61i2a4+76FyVPkBUXXZTmr0htp6RY+K38g02XB
         9ecJdILcnI1odTLeDu7stK5KUMaYFVMMlsEHjrqnPRi1yaMs7a3TumGXqh0xCTUVRmwh
         bkyR9N4FBzyMA4Ucf3UjNgYltwEDyAWSDKEc/gjxIFtYyq8ajZg6ilfaPFGvKj7AXPGd
         CJe9ui/UNebU8KzRLFQJs9AUlo3Pt+6iyLEUUk2VuqOsGI1ltFtJeHrG/FssPsUNdIdT
         BRk3oGIA/1Jw9apVrSSqQDR/SFXYllA7pQp2y3tqgwz6+E5wACChRTpkouuN54Jd4c7k
         Gebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512997; x=1775117797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=toCvMQKoaOmXn8yp4qHoKgNI8N1PvbaxGtL98+Y+9Go=;
        b=WvtB4M5EBFf+Q+zcep+jc4P8wYtNIMNO7u8CMAG/CoKUMhHkFFCv6g8bHJiw+0yQaD
         PIjHpvG/vRTwrlmda/OrdHodetP+7Q2f/L5BQUbgmrnT5NdGemB5zHtRC8z0brw1FP43
         V+4yinkVssixGjK1YL2YhlTn6lMz+2e5mE+REonUGNDBZNKs0Ge3OAR7NSpvoNHyE5Qt
         ei6GK+RNFmwv4ppl/fhOOYBPxnabpFEylgbW+8yLqoRCOi2V7kPXkcqKlciTaAkmWPIT
         jm771mr4Mi960M5HG7zeEZ0bGECaxT8//W/ysvS4D5O2AOse/rxz0LPVEXK2rdOpYTZx
         86WA==
X-Gm-Message-State: AOJu0YwK0I8i9KB+jYs8uIPZdV5BVqH2jIjynzvMkUUs/vczZCpodhnk
	MFutMttNZdZpguAI9u9G7oilv+EEHggfEdQ6n85WHHRW7KU1PuLgVba1
X-Gm-Gg: ATEYQzxm/Itwb1oUfeXtsIc2MJJc5pv4nFWylq/jSV+WLdwSo0mKpdDfOpjfaahLWa2
	mrglHynkpwoMR9UgZV5B/ybkLxQD0beYIIE1/ENWshTrx1P0362sgWyX8DiWUT8TCQebEpE573N
	kUFkxuiAoP0Dgpze/TtRExkCSzqBlsekYaSujSbsG3HIyHI+kRleKvAXgmXj3OOWBxJWhLCbYsG
	ELmFvzYcTDVEFf/m9eTspvfvvjko5m7ir6gSW4X4Z4vryuqNeHEL2DZkVUISSaeNOz5mJ0q+iyr
	pflAv0s5h/5MRhycg73/EiYHbiiqeXkeDEpF0nq87Sy4TcJrPuTGOUwtqhT9ixrTdw2ExGz3KYN
	7NnH1XUh+wJd1TBeQQVlAZ8S158OItPJBgWco2sytMnpqoe0zifXf82qSV9n8oXq2ggs7SqfVdw
	Av515O1REZ8deqUPY6CK2ZyrQgZ9zg+ss8lA==
X-Received: by 2002:a05:600c:45d4:b0:487:1114:d42f with SMTP id 5b1f17b1804b1-48715fd4aa6mr90496705e9.1.1774512996325;
        Thu, 26 Mar 2026 01:16:36 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm32886045e9.2.2026.03.26.01.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:16:35 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	Omer El Idrissi <omer.e.idriss@gmail.com>
Subject: [PATCH v3 0/4] clean up error handling
Date: Thu, 26 Mar 2026 09:16:22 +0100
Message-ID: <20260326081627.5841-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series lets sdio_init() propagate standard kernel error codes 
instead of returning _SUCCESS/_FAIL.  There are two callers for this
function.  rtw_resume_process_normal() already returns negative values 
but the caller doesn't check for errors so changing this doesn't
affect anything.  sdio_dvobj_init() returns NULL on
error so leave that as-is.

Signed-off-by: Omer El Idrissi <omer.e.idriss@gmail.com>
---
v3:
- Add one commit that lets sdio_dvobj_init() use more readable error
  handling
- Add v3 and v2 tags

v2:
- Add one commit that lets rtw_resume_process_normal cleanly check
  errors and return errno instead of using vendor-defined slop

v1:
- Use direct returns in sdio_dvobj_init()
- Cleanup return in sdio_init()

Omer El Idrissi (4):
  staging: rtl8723bs: use direct returns in sdio_dvobj_init()
  staging: rtl8723bs: cleanup return in sdio_init()
  staging: rtl8723bs: clean up callees for sdio_init function
  staging: rtl8723bs: Choose slightly more readable error check

 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  8 +++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 25 ++++++++------------
 2 files changed, 14 insertions(+), 19 deletions(-)

-- 
2.51.0

