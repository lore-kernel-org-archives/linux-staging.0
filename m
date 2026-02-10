Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07F31A9FA4
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737338; cv=none; b=ef+zKF4ertw1Zzx6UIPUxmEU0KvmvtfX9/JSgtHwSWBhq6+gmU+RoSP2aBc2ZDXIGX0nnLqsxFVsqaTQ1cGXlQEWABWjJ4xwIGOyPEl6do4agge3BMLlYIlfOlYYumv2FpLcNTmuTE3EihG05s2TU60PZ44E8LpASlg0CW1u8bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737338; c=relaxed/simple;
	bh=iryKwnU4tgAl/sf21WZcyrU5AvDweLGX9RQVuIgAbsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azeneDziyZfQYtf6DnnSAlID8jP91m0zz/acljFh8woVJ98lhkTDrYKvh8n7LQpH57E7CzoQav0GyYAoFx2k+Giw41v7iZPozERBO0Oos2laaCJvGt9vqzuJEDbjmJmfoRgq7nsatcdS7cXAlxNOx3iEN9HhsuJILbWUSRTZIJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNCjF/6+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNCjF/6+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a962230847so7320445ad.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770737337; x=1771342137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jiJFvi4yLZZcju4V5EADyywc+R2nuyxsw95SZs9/oI=;
        b=UNCjF/6+5lLe18QDvLTOyoLTvz7B9vh/ulEBWL4T77vDjdn6aogGaqGVj+eliXdElO
         J8GAsKzfeIHsvpkaKOGX0/UOvlDz0BNmS3JDW1CWmu3Ka/RKkiMIHxSry3x7uG7gx8iF
         9izKFGvIv/Y9wXAk1AHW7FCL2aI0MSFcwx3/5wLpUDvKoEU2Fq14Vb4LgSnDUckYooN9
         h1q5cAXqZnMvJ/y91IbH4sa88yXee/WMqVhQSSRv5MUB2WQ3UTbM9YMIzsHDv/juLh6E
         nMZR/U/eAb8WB6AxzQTJiqRS63zb1ZNfsrZToVoFIs+8TTtknLXHQtFv+qdWO6vUnGak
         B52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737337; x=1771342137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jiJFvi4yLZZcju4V5EADyywc+R2nuyxsw95SZs9/oI=;
        b=slSK53ECJ8iqpW38wpzzDWoAk0LgBpDjNxG4vogm0hipe4CjQO/8PavmN1BF153nqw
         9y4atl2k1PDu7u1wOTABgt3NeVh88Fjf+3u5eq6BwYreJnMnCQEuzJAjjdHqorPKpPoG
         qy9St719ric8E4YDB1HgWBX9PPMsWJ5TjNhLeTC5yzcHZTi+Az9KMo1R+wVImEupuIt9
         +hEzhmQI0kigV+7gtlMSZk1uC3ONTICAv6eehDJ3wfMfbxs99jkjM9JIdl8p7hIWM52C
         PcqKeJvYlUyqquM7lHrHrCw/Zwj46Zr+hJe1BmWle5zoSjET2agi0Vb0G3eJB6vh+xv/
         cqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4AXBMaBRv1BL5bpRTbCZX8on7HDD2Sm3KJ3BAq+J4WsEGx1McLHHgEzk8KTRI1f5SCn0XqcKP6Sp1Xx3r@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzwxh5T5R34W/KJ7G46n4Y9mCmrE0pWt39RUUthx7Z2REISONw
	UAS/jxyADbpnmYrISJDSfrTNxO9N4wsvzcZmSMr/Z6powvTGdxHsVXrU
X-Gm-Gg: AZuq6aJ8M/jKxF3jU15cyT9AWcREO57RXKL9y0yzDASmWADvnwmUAF96MMlNi3XAseO
	JFie+oQp8kLtZ+fpjk+bioIdhGxZkDaX4jzkvIwyZwmTKJTtM73dMeRfNSHuJz17ploTe5m3ecM
	eM7nhffBQQDtS7ZdzKhWvDG1V+rs3izUu9LIjsa9GTMJtPgk0y6ps3/DJykzGg26NrPhnlGtOUe
	WieqrSIrqJ58L2wJGaXRJqOqsyzMe7McSlpWwGYjcKb+Naq+m22Fzz8eE33m3divyZXgP5GVGIh
	8U1uKbB5xPBMvXpBGreDTfzYx7ey4TUFt4YNhHob+bh64nnt7MulariyjVUX7U7u47ilET8jNVU
	hCCMzl3IbEnrVOYiI71FBwr5Mrqb9Fv8+qFvyef8WPkZbIXAKdiAUBOOeeRFyqmadTSRZV//S/o
	fynGVmfXIj84OCJZ63YugjAp6MtuWdBPm1W1Gv5rkPyryLUA==
X-Received: by 2002:a17:902:d512:b0:2aa:d320:e976 with SMTP id d9443c01a7336-2aad320eb80mr102400865ad.6.1770737337108;
        Tue, 10 Feb 2026 07:28:57 -0800 (PST)
Received: from localhost.localdomain ([157.50.12.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aad3719183sm103282855ad.55.2026.02.10.07.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:28:56 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: trohan2000@gmail.com,
	bqn9090@gmail.com,
	straube.linux@gmail.com,
	hansg@kernel.org,
	abrahamadekunle50@gmail.com,
	davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use block-scoped loop variable in rtw_ap.c
Date: Tue, 10 Feb 2026 15:28:13 +0000
Message-ID: <20260210152812.15637-2-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the loop iterator to a block-scoped declaration
using C99-style for-loop initialization.

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..919bf8db6002 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -178,7 +178,6 @@ void expire_timeout_chk(struct adapter *padapter)
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 chk_alive_num = 0;
 	char chk_alive_list[NUM_STA];
-	int i;
 
 	spin_lock_bh(&pstapriv->auth_list_lock);
 
@@ -278,7 +277,7 @@ void expire_timeout_chk(struct adapter *padapter)
 		}
 
 		/* issue null data to check sta alive*/
-		for (i = 0; i < chk_alive_num; i++) {
+		for (int i = 0; i < chk_alive_num; i++) {
 			int ret = _FAIL;
 
 			psta = rtw_get_stainfo_by_offset(pstapriv, chk_alive_list[i]);
-- 
2.43.0

