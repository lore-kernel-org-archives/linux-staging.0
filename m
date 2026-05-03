Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91033B975
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777845543; cv=none; b=fOjuOUUNuD+QQxPyas4pLGOpzC2PaDFxMjb4aAxxni5KPHTx78XX2CJ7qVZM3ckZUTODQQ4stgfQk4QCa3C4oydPr0TJB6lUgI60Bu265QWcBk2hPfxSLFa9eeknuIkOmgnA4TDFuZlpTbRJMRz12zMT5TDNoVEZy9c+dc7MmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777845543; c=relaxed/simple;
	bh=Fg+vOZ3XnPh89CA616nZZF032A52w2MG3iovJ4NqH8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=naXxmkkzsLe5ZLecOajemuy+fXh4Nv3rS9UeFPjOmJDV/Gx2yLeldg1xQUXaMPl3Bxi80+DUXZhSiFW3MWhYFEQON/FF+AYaMZ5+DwdOSV0oNUHrVbpC63amDbHJS0JPjviQqbe2lJcEcj3hCZN4IduMOuE8THYxFwp4cNEgVok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOzvFx2A; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOzvFx2A"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bc188a20e0aso72954966b.0
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777845541; x=1778450341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kh7hceN3aSr9xzTuW86uYigM3iPh8eWc59qfy2U2Aig=;
        b=bOzvFx2Atf4fcQkPYFSJA3x/diZscS9xK6D2Gyb4mslN4ZYWOIUJoHRyU4DbUNIKeP
         H7rqgR/MD7wausV8gq0euy1IbiHHi88OAkWGiHnPhUz10aMXIjgcbM7wqPKbQ4F0CqQm
         p+6YmVVeCqKp7sGK/q3R79J4dgxPcrqbzYli838ucK1LeEZDLIventy5jgulvKspY8AY
         uUXELZ1+gCH0UNa1eLEbV6L4O+c8orxptlvFyfYQfiSlp0d53L/kR4G1RorVz3V7me/r
         EBx/z03ipLu+uC5nA4+K0i1wysy+/bV1ZnGedf+gJdkUXdsNvBtWGgUwjqdsehTvDhx0
         oqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777845541; x=1778450341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh7hceN3aSr9xzTuW86uYigM3iPh8eWc59qfy2U2Aig=;
        b=FjvQtiTNzYfjHc+sWur/WApguN2AFGjRM8lst2o5YFW1xkfLMD41pf4/arjRtWZbRK
         s9H9X5RfS6d9vkBtKGjoeM/IyR82N8DMNvHtoPIToTz7e6mQenx2v23HiaguEPy2n/e/
         2m7PBFeFrvC4zW34H4+AEBgZkr2pZKk8VTq5bE66qDeMQO1T09Lbn2T3nIn3kmTeZKSl
         L2Z6FU4SuF5BwijBc2pvtpGVZ6aS8R0uccFRzcXmJV2Z5ExJOvNX0gGGlzSgT3rHXdd+
         FFzxd61ZgXxbAG57BSKbyNEASOIxf+V2E8Qk55IpfI7jmC0XfSJ8NAA/NZeo5V9NipN7
         JSlw==
X-Gm-Message-State: AOJu0Yy1AQwz3BURh8QYZGvUUMWBbAdrGBuudmIJS7p9lHF6Tp1QtyOI
	DbT9zX+k/c68Uq7okajoY4SmtkfcBZo7+ALdEnA1M1pZFG9HePyTdG2m
X-Gm-Gg: AeBDieu5Tnw2L6xkreX6hsxok+BmvJiue0D9hWfyF+GBGotSX5fk9vte/84fOB16hb/
	HNFEGgnLkCfezZZfGYY4ahJ2aDf4e7PUocBZj41oDPdLDbnQ3HYF4LAgAbd3EFb2/SzwX4TYity
	TH1FauXVq/yxPz60kaWm0GI1rmQ2+iqjTFdGzT3zD0PJtrahSToOg4Y4fR9XzrV+RgA4F/70SBr
	7JWztbIJRYjw3p+wzDgIi3EbrSYNRk+GjB34cTfgy1ULexdEOYGt4KWCBRoUL3Ij9nJuVdzATAd
	18zkAvat6d1PQXHUsXSgbT577VTWxS7uUpx57fhu2G1cWBmSW31xwXs43gOlP1Jw0vipVEN/M82
	HRzAeNW8Rqo8P3e6YO0aOatnQ1c85RYzARb/l5L6WjWew/z6nlbe529g6cwEgz9FQFsPPTedL2D
	qyFxEshN/SAwBZ07JylaJS2WqQK9+l/L3BN7F3Gcg3z2ht6xk4fLbGtJ4l
X-Received: by 2002:a17:907:ea5:b0:bab:ca56:a42a with SMTP id a640c23a62f3a-bbffddc76a0mr370668766b.42.1777845540630;
        Sun, 03 May 2026 14:59:00 -0700 (PDT)
Received: from DESKTOP-4RAVOBJ.localdomain ([77.47.209.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1671c1d3esm107678366b.42.2026.05.03.14.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:59:00 -0700 (PDT)
From: Denis Arzubov <denisarzubov8@gmail.com>
To: denisarzubov@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Arzubov <denisarzubov8@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove extra blank line in rtw_btcoex_LPS_Leave()
Date: Mon,  4 May 2026 00:58:40 +0300
Message-ID: <20260503215840.51342-1-denisarzubov8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank line after variable declaration in
rtw_btcoex_LPS_Leave() function to improve code readability
and comply with kernel coding style.

Signed-off-by: Denis Arzubov <denisarzubov8@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f..27dfd00b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -65,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
-- 
2.43.0

