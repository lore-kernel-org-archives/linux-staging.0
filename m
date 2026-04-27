Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF931F9A6
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311545; cv=none; b=f700FcHam/4HcXdDz+NpUtdYnHgHwBWzk/ycbB2/2XYbfCWV/vK5U8cCQX8J4L3LI3UnUTKuzykQmlDeu8FxTWBSmxXakYhBVo9hx/X+LqYsD3+NOnImwuQvR5mVbvV24pTdR7UvvmORozZ7m3wxD1thZp/lotLE2Il6Zcz+Zew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311545; c=relaxed/simple;
	bh=v4oEN8cjBma0suaIk62caFAmp/7xy5Tq85T9GkxJW1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dYwzfhYLV/t1UvQU8r4Jt/DaOWaVk6Amek7s1RrhZMxtekexdPApCaORU4+EJ65uQCBdujZn6J36pyM4AM5xYJNavl6SjWCKr3ec07dJu7AdNkoWnx4ULACTXq7u3taijMO0u6Rne59AX9cMgUMikNgnlu4dL92gbdEQgbRkv+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlf28BKK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlf28BKK"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a40502e63bso9329960e87.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311543; x=1777916343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nj79oZaCEKYOm+uGQgSmTDQkTk5Ic2Wq1YEJ5dXHewc=;
        b=hlf28BKKBpnUnp4ZVkPmXrEDVU4/7cnJGBIiArFKoCjY9mnSGxGlPVxQfecsyXhcaM
         XaU4/1AdBCDUW4t0EzVseEiX4n0hqUdbgL/ALnBRGylZ0LAHAhoMrU62EF4GvgmVcRtK
         XYBaZ+uchwB4aOEs8CWiJNWDzbcDO0XZRbXGmQCFWCirMITziWjL7hMN09OXgOP603VP
         drA8oBj3QvS2uycqzNXa789hWTf7Pna7x6PEFLTS8NwkHchurpljkSTitS2NFjC5tkVf
         iYjrLJ6sm46Mt5O9V9Fx+z5QQxO5WaXsqhfITMDko+FmERGZJJcdfQAwwNUVQUo3ctrW
         B4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311543; x=1777916343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj79oZaCEKYOm+uGQgSmTDQkTk5Ic2Wq1YEJ5dXHewc=;
        b=ZFaQrWSet+p+aXLdGWZDeVHPhIuhbMLEnuR3PIfj2S7k7m+Qovd5Sbqt1wb51UV8NJ
         gf78XmfqD1yLh+Byi1D/Erb1K2GbxrZlSpJhwJNCCcETDOpc16RPIBGZHfQ6rBLcJ90g
         ZeZappZI7u9w5Y4JGnvjXHkFbgOChwkE73j1ISxGIRjsVc/xl5MDEXz4gbLrqGu9gAmi
         508Dtr6Ibq1HQGF/Kf+9vOySyqsAZd+tAZ9KAqyQYNYkIaTCaFHLM9sYOcdDkLk2BHAr
         u9AJJB/E+xMcExEh+nFWa/7P5mx594OMpMMqIXqOiGxDa9E2zYMGum27F5TTwi5BYk7p
         6lRw==
X-Gm-Message-State: AOJu0YyETW1vtIHT9TwBPdT+kK45oyiai2+V/QN77YMoeD9QK6NaH4l/
	Sk6Ba6y/tQ5v0hxaLLboOY3AKoPvXDVQagwGGdSGffYUYPK3S8e5cL/Y
X-Gm-Gg: AeBDieuZ5IzVMem6Srsu4FAbjMwfJtAnQwa3n6g4igwOfhBkqB2A3j+p7trE3RSr6ad
	4dHfoNJaNo01nSvCSqkuNIkXqB95kpH78DUkMIOgQyc7T/FS1n1TMhoB9RlgGz7Dj5wBQglKzIU
	sMjD4r6SzXOfSHKKy5GEqpKG5rphYmef08PN0VYlz7zvKGVS3WmQOAVoETTkTvxdoTLnu7gaObn
	dYWp1T4BJUE4MrSUit4qaEnE6XeW2sC92F2pUJOXgsJkXaKo+THNs2ZwPhpVmbNXYNHHRKK1Uue
	XjL8uyGtFIZvxevpNt9ao+z4H93jutWx2+C6ss1zaXHsFVz7wLM4rZNjHNZ157rrrGuVQaFo499
	6rjH2q1mj11ClzcBB7OFDWql5tlnSJd+PAxNJR6LtcQGH69urC8ro+9uvhQU8jnZ+hHmdPfJ8ku
	umtsQNLC+M25mv31WFzN3divJBG2Thxv1tg57MFwKEMy17TjssnOn2w9xC70zBNeQ43MT7E7+A
X-Received: by 2002:a05:6512:3c85:b0:5a4:1914:bae3 with SMTP id 2adb3069b0e04-5a745f54393mr91295e87.27.1777311542430;
        Mon, 27 Apr 2026 10:39:02 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12d5sm8362722e87.41.2026.04.27.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:01 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 0/8] staging: rtl8723bs: remove warnings in rtw_btcoex.h
Date: Mon, 27 Apr 2026 19:38:49 +0200
Message-ID: <20260427173857.585742-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series eliminates all remaining checkpatch warnings in
rtw_btcoex.h. Such as CamelCase, redundant blank lines and unnamed
function definition arguments.

Linus Probert (8):
  staging: rtl8723bs: remove blank line in rtw_btcoex.h
  staging: rtl8723bs: add function definition arg names to rtw_btcoex.h
  staging: rtl8723bs: rename rtw_btcoex_MediaStatusNotify()
  staging: rtl8723bs: rename rtw_btcoex_media_status_notify definition arg
  staging: rtl8723bs: rtw_btcoex_HaltNotify() -> rtw_btcoex_halt_notify()
  staging: rtl8723bs: rename rtw_btcoex_RejectApAggregatedPacket()
  staging: rtl8723bs: rtw_btcoex_LPS_Enter() -> rtw_btcoex_lps_enter()
  staging: rtl8723bs: rename rtw_btcoex_LPS_Leave to rtw_btcoex_lps_leave

 drivers/staging/rtl8723bs/core/rtw_ap.c        |  2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c    | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_cmd.c       |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  |  2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c     | 12 ++++++------
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 11 +++++------
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c   |  2 +-
 7 files changed, 21 insertions(+), 22 deletions(-)

-- 
2.54.0

