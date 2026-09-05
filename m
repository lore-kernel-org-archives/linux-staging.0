Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D08732B112
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 05:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788585999; cv=none; b=RN4rRaQflfzslw/u/Pjcshifn0My8qaY13511Nn490vAwdpGpFyENNbd9xjYCaacny7pPO5lAuJ/31NP8X3uYFKOl4RsfqcSF7OEln/nnBol8PmV79QKx5kO7d7uPd+807r2S2SHtSzy0OhErk2SsJji6fYv6nHEFi6lKskL0YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788585999; c=relaxed/simple;
	bh=jjflGscwYtudxdZnHYIMwnz2V64NNA/6DVxhk1ezhhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yexbwrl5mZMylP006dc0FwYgJWQwvXfSS3VG38DV9Bm3S1LH7selpfBaqKWqunqmf16++0XzGKfFuui1OxfAljkh+1Z3NgVlu6xrz4GRedihTjD0jUrplJlYno2jHLut1FoPf0UEISqmBeDfwX8OKTkmrPcZ7txhr6rDU6pUtHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCVPjNQA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCVPjNQA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so13884015e9.1
        for <linux-staging@lists.linux.dev>; Fri, 04 Sep 2026 22:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788585995; x=1789190795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHKqV3GoiDC8ykENHF+0la0g7JB/SkIgxNqVg7j65gQ=;
        b=nCVPjNQA1mGRUggOJcQnOJfGtd09wd0/CANbXeJU1Q3churHX6aMts4F9V9UAqtsDl
         8hxUFb62c1DLRGqqDakGIoe9WlKXtRSGh0v3ZzBonDKHcjL57o49zXqGZZ17WFxTXXQG
         S+8099wxsMCNKnZmnYte6Wwp6JBDd8R96wrqPoUiGFwAvflobE0ytB3Ocg1eC5Zu4JVh
         DXb2Ltq1YRmlo9g9yf/exK46Q4L7I5x2I1yICHm6Uc395UCipMAgrFHOUpDQWvH/iCHf
         FVoQueXPX1uWPPeAotquQLByE3oU+TC/gfaDYPXYajC4MzOpCbFdbr9cxtuYSDdRZ8jj
         eEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585995; x=1789190795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHKqV3GoiDC8ykENHF+0la0g7JB/SkIgxNqVg7j65gQ=;
        b=Is0YCsNdNBYIqi+y3C5InEgAYNqPMG7Lz+xwCVWflzA014mTgxl/xM5vLMTEwmvVl0
         A2svoXbQko5j86IOFuIEfgaHS+VsC01NVV6Bjmsm9kxz3e2UVMzoh9W9Z72MmeBC6qAA
         hQQM6nrUfOFlONHOT0jYPtN3OAY/cXJ+uncCcCiPRWDBeC5Rqc9sI/UnTWZnDqKOlVd4
         qwPokzGra4Cf6s8G3GvL3ujLWIinned4AljDQW+sohzw4wr4a08VNwyVa8kmnd/iv8WF
         ER5iI4kkGvaSLO9yZhiJLvMgOULLTVymYLv6ksJmRSW9A3MxjHotJelpW50kh5kTZGw1
         93pw==
X-Gm-Message-State: AFuF++nhyaoStCen/eQdlQGV88jcs53I6ZPnuWYNc7OsEaQb1hzEiryu
	5pXsMORg/ZupIpr8e6Sug8hkya62hya/v3J8jPAOdsMnsWImK5E2Skw8XXWgQ7i+uew=
X-Gm-Gg: AYBFou0S0eWcaINDhWOiTtL6LdGGXAJJDEkfp1fGRcydiNKI6qRO6ES+ssLdNQtz0tX
	Z5KBCYJi9f2xg6LpFOO08KVy01M2AaEaBK+VICwRVEl9mof2Fk/f3eq0TP4R2vpx1jU5nHM9kWH
	Cpf/EZtHOHtW0SmTrCrJbmuqfwtNoUCaelPOFfyiwBZNE8IZbc7y/GK/d8My2gFjLgyGl6d9p0Q
	K/iU72jlILjiu9kUE0P7Xg6F4ZGSYjMNeN2k8k+XTjRAAzLvCN5xksTN+vh8UwYv2CsHd5G0OxI
	LDP77WfVA0Ph2Lz8vOXH/ZpVusVEZQrqWg8iOiZlExS6lPBDckAftQcZzzwheWgIFxBbOEsXQ0F
	rSIrlYjSFBDZb2OlYsrYYrtrZ6OyKOh+tV9pm83aolam4/BNeQibMaPTGbQX39FDCh19WN5d2Ba
	2jqev69ivei8IrAPqAQCJBTcW9Ax9OEufJrJJGZ8+maSWkOd+3ZFSytF8=
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr95872415e9.16.1788585994655;
        Fri, 04 Sep 2026 22:26:34 -0700 (PDT)
Received: from zeph.. ([154.192.250.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm66073735e9.4.2026.09.04.22.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:26:32 -0700 (PDT)
From: Muhammad Israr <7israr.work@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Israr <7israr.work@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_pwrctrl.c
Date: Sat,  5 Sep 2026 10:26:13 +0500
Message-ID: <20260905052614.8201-1-7israr.work@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch tool flags msleep() calls for durations less than 20ms
because they can sleep for much longer due to timer granularity. Use
usleep_range() for the 1ms delay to provide a flexible sleep window
and avoid inaccurate task scheduling.

Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8..5ef44a3ae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -410,7 +410,7 @@ int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
 			return -ETIMEDOUT;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
@@ -561,7 +561,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
-- 
2.43.0

