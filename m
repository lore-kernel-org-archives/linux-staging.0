Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9214A3126DA
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114123; cv=none; b=Oa6Crk/q1ef/tEu/Yas5Ql6zQ8RBHiUCvncqyiDbVeBP9NR5/FeJAr5h6X0/0r6oh0Dw3I+MH4u6tArzl3MBQzG9egoNo0/E/ujlvOOdUcpEv4mwDYYqwaTUJMpxXmma52vOMCVz6HsC8LX8mGwS9P8WNsp/j3b8SVBoPr8Tpt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114123; c=relaxed/simple;
	bh=HlfywDW+mCWSibGCEv9lVFLkUmenqzREQzTvtdUH1Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jS9+qQkoBVYymng+kufSZpkvYKFoWfreR19KUoxbFydfqopvg7lx64yvlzVm2OcmipBtmRmEHgOMMILCRi51IITrRg2z5mP6lBJ/jZ6FgaRFGKI83YWWyrajhV9KHccSsZ0VRHELI/nFxgcgUXOuBIGtSKsUNMcPCty93r5CfDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4eC71Ps; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4eC71Ps"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806b88d8c9so4022085e9.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 02:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770114120; x=1770718920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YiDWVqOEiYzelZqgNgZ1K79gP87FkbX4TBwD4ZVU9V4=;
        b=I4eC71Ps0f2Uyt5qSdlEuauvuxpMbS9KTqpXQFPKQazt/FQSBPiPAqIxs6Z9Bk0NcD
         ndjz7/1B281TLe4aC431IgXi7WmUb5+GPSzyaokYBq1DADMLgM19+LDWAl4GxFqlliT4
         B6oMyVA9Tja0mofIRte4iS1rygf87svLD2CyQ93dBpqYvFkuCbFmCHWdsCxZjCNeBarL
         QhH7HV8LhCqZnUbHbYTEydg7nY7bk9Le12ghl2k70MiJ/07/b30ihUaS2THvcuH8sd+z
         6UN6Qd/ByoVAeBEQvEgsaGe3n9sH5K6lbDstASZTEieP0ptq+YTX9gnGTGD3wStyVe8k
         POHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114120; x=1770718920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiDWVqOEiYzelZqgNgZ1K79gP87FkbX4TBwD4ZVU9V4=;
        b=tNHsurpASIe7x0SHE6aUKwikQRvYiQm30VQtyt2YvMo0l803Nc31Ug525FH5HFhQfr
         ekoQFX6q/hs+CfZEDoTgYuNuquL4n9Eaw0n4ppXyyxJDwFmdnWLcSur0VZF/TieVjNBF
         GIFez/itA+sjvYuTtvklLsGm2ULBOxHYJi2ooIm1fkdjh+hFdJ+yKMo0rOvWpNAG+7ts
         LLsYDDK65Mv9dLptghkzwOK37IxPn6nvDVdfUbNICjgnSEyujwAEGirUoRTsaYt/JHB7
         QXYM6GHNHQ0e8ZHEYLxOt+1t1qZ8qMqNID2A1+q3VU395AOF9M+LmQ6oioMToovbcIND
         t6GA==
X-Forwarded-Encrypted: i=1; AJvYcCUVR68jpZfKHG35yAxbJDJp6rvlWV84o78l/4+mlKsxZGMjfeKNCUIB3auQ5/VJ1/vpIvSoG2tDCLGls6ix@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx88no9TIjP4QbHaYO4PU32lwkXJOYyY6Hz0WNCCH8A48Z0E5o
	xl2I8itFwn7SJMPmyp5XVcvJUurJCb8vzpsMsLlfi2bmwbZ4wCtXFOU2
X-Gm-Gg: AZuq6aJLKsj/AXc0QCJBO/ef5wXHVWnPs2mDWUwMseUlzDoiNEkNNqPF5jZn36O6eUL
	41mqoI4TxkW7hdVv3lNEDnLBXUkIw6WXODyYmN2VEe+GiRH0RPuNX92TiaPGr390pKbilbBPdnW
	dVlGNKZEKHoIanBvbaihAirVWKK9Nsap+XqZ+tU29c0UvMod0mIHOipYX5SAIZEtuCCDZkKk9N7
	mje5ENLxCkQt84PGDaeXzLPwB1wD4UjvFp2jTix18WHa/sPxQ4LHtecLDqTq2SRhl3RxVJcb6WJ
	DtiTq86TKf9CjkGBVLiriSJF8BQMdRSsAiWlxyIYJ4h7Uo3ajiZsYHZZUedCzxkuYjkTFTqoja3
	drn5Ha6kXeBEC4fgSxVOyx+xZNKId9w+am0NGzR/bkHHiA1oZR1NuRVM6G6p5RuGwno3vr1cDqA
	QRWXonDwQF9FQ8xFVKA5sCX/ru1Gsg/ZENFapWc1aqUynoPD0HQCw=
X-Received: by 2002:a05:600c:3e83:b0:477:7bd8:8f2d with SMTP id 5b1f17b1804b1-482db4b8fefmr118756275e9.8.1770114119612;
        Tue, 03 Feb 2026 02:21:59 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48305161a78sm57501395e9.14.2026.02.03.02.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:21:59 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace in rtw_mlme.c
Date: Tue,  3 Feb 2026 14:21:28 +0400
Message-ID: <20260203102127.55665-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a trailing whitespace in rtw_mlme.c

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..ff4e668f199c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.52.0

