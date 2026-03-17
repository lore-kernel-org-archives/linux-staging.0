Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCEB3A4F5B
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742051; cv=none; b=XHXIk1O8ArH+pfjGJtWSnBgUX+EJKN1eA81GV1uIPSl6tBXldAOnMmxL1HMZ4jHA9xGdnI7oZ3UHIIoL5w2hySKrZnPUlakO1nkAN8e6Jwa/7xooEbC4t47XnCFPS/vPJGLt86jLosQ6cfbX8x2FBX62ijskT4K2u9Soo8F4NBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742051; c=relaxed/simple;
	bh=WMiWXbMe6y7CcdPrayT4JV/OXeaPxAcyiLDlIFYqAYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BByJuKBLKBAyqK9B+u/Csto30Raro++dcMbOMPnJMys2vvTDK/9QAknFQ9EQnK1S/xKrJcqYgIjewwst1UkcK42oQkLTM8fYPnOsApCfMvPb63GUQ9J8kvPGf181fv66eDXCJecb043RUKdCsFEaJ5ocwa7pbl1MeXJlZmc4vJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rr8gB3O/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rr8gB3O/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48534237460so60230745e9.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 03:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742047; x=1774346847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viQfJkQSSLH0QD73bfAv4HhDItmYfvb5CBN88urU9aI=;
        b=Rr8gB3O/Q3/LPP2XIbHSR9Aff3RTuWjusrpDgi25WJZUPjO3pWiUSEPBlmTWVnaF3L
         NC6nX+mCiMZJFOZEtfexnRMYvmdBepmFD8wvW7sXnkZmBihLjOwoUqWi8gC1gOKC8W4P
         5XsTphmuiyqNTWCEwKaXGMzO64KRJdMPkSYx8dYwKP9iLvyiDah4lgu+KVLLs9ZFdi0Y
         pC3Ut8MPsxIXFvJYI1+e6QHOxOTxV5vq1aNrVcLsKwAhxaUTF6bSq3lkdXg0F2thk3pK
         zxcQ2VjgEwJEhqVN42hexrm1TOdM9FiFkdU4VCUIubg2fspEJnZ2oMMeF9qGDsPjqqjs
         6vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742047; x=1774346847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viQfJkQSSLH0QD73bfAv4HhDItmYfvb5CBN88urU9aI=;
        b=NaIFcKLPPWnr/Yxc8PSmm/vKxMCTscJ/czXZKJLbFLghd8r1zYy0YXoBGgkJFHkYEZ
         uL+MZgPfrXr2IGbSJAaokh+dKXyS9YHv2aQYz6pOA5HoLx2ruckA6GXeAJ2Vdf1T4/mI
         0G8lVsP2yqdPxREflcZvjqK+1VkqmJFMCB9k3gw14B0YHrU8tYkSxImRig5QbrjmBxyK
         BBQR+YSxKujjYwNUmcMEzIcOungzZGk1JATr5uFrnw5n+XKzF9GRflNhu6gCiedGaLgd
         GVPB6IkUJ5t+ztNe4KiEKEM6F/ovRLo7m6u33NXuyX138pmOWCUvfHlYq01rvZhfBBoc
         7zeg==
X-Forwarded-Encrypted: i=1; AJvYcCXPiEH96YJB9Ukgq5m+OPPj0kve2IIzPQwsxGRmMtPOpZRPg4Zt46KDXVIy6tj1Kj+7wuTC6M/3RGKOIcFY@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf4tH1hqSWUQj0VGrS57JznJhYL+ZHrDGi5GWsaEtQ+itpl+Wz
	f/AG1UzikxtkzdZYy+VTCAMsNi0NLeRPk24yIJg5ZDJekqOZ3zM9sgGT
X-Gm-Gg: ATEYQzylRwt1aG6ETfUix/lkOBlT619hj5ZkpaxGb69MngOs9iV5rZsHRXDAvWH2hhC
	ToXm+Fra05oudBRPu2brYFxFLWY39yQyY/au0baEr54OZwwnAcDKvHNUl2Nvfl8onlbgP+69Ev7
	WtKRaEMYrK9dWhceezteby2iKNirGyaNpz9TjLmNuTmdWm3L6VIM43VdmlJV+p9fs27B93OULVm
	mG15QMp9yOu3s50Ko2tNX0hKiSdbPw/N5DJFSB481k5krruOzEWsPbMvEWQ1XDiI7vBpP+fpN3k
	xkEBj3/kyN+ZwPZ9ryPilLUnhFMNhDBU6kDl971/oU5lTKB9vnyV2S6NhopNaSNKYD8j1EvF+WM
	eVFBKPf64FqHPStDlaK02JDmHIYjS1g5u+nyFN6QImRzyrsw/SDw2Lb/b/IgR1FBDFgro8nrlq8
	br4L0FoKokXpMLQS46ty8K0t2eC4eCLsGL+gMwIwDy/s1E2CITAXnsljsf4ksNWsahMkbrWuVqC
	4tR7C9yyQtcXBoLgWa77x9B8egw0vdoMN/tJOlUlfbk
X-Received: by 2002:a05:600c:c8f:b0:485:3c05:24dc with SMTP id 5b1f17b1804b1-48556710c02mr268944905e9.33.1773742047104;
        Tue, 17 Mar 2026 03:07:27 -0700 (PDT)
Received: from misharch.salamander-pythagorean.ts.net (net-93-146-220-2.cust.vodafonedsl.it. [93.146.220.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6e2b1sm110179645e9.28.2026.03.17.03.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:07:26 -0700 (PDT)
From: Giacomo Di Clerico <giacomodiclerico@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	straube.linux@gmail.com,
	andriy.shevchenko@intel.com,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	02khasar@gmail.com,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giacomo Di Clerico <giacomodiclerico@gmail.com>
Subject: [PATCH] staging: rtl8723bs: simplify return checks in validate_recv_data_frame()
Date: Tue, 17 Mar 2026 11:07:23 +0100
Message-ID: <20260317100723.72476-1-giacomodiclerico@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine the return value checks for _FAIL and RTW_RX_HANDLED into a
single logical OR statement and remove unnecessary braces. This improves
code readability and resolves the following checkpatch.pl warning:
"WARNING: braces {} are not necessary for any arm of this statement"

Signed-off-by: Giacomo Di Clerico <giacomodiclerico@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 1a52d3e1d285..a52884d2129f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1339,11 +1339,8 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 
 	}
 
-	if (ret == _FAIL) {
+	if (ret == _FAIL || ret == RTW_RX_HANDLED)
 		goto exit;
-	} else if (ret == RTW_RX_HANDLED) {
-		goto exit;
-	}
 
 
 	if (!psta) {
-- 
2.53.0

