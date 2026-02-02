Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6C3EBF37
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014309; cv=none; b=VCq+EW/DIwALrOROQnN6MGJwwjVBSHOOaG/KYVk0oU2S9MEtMUuDd3A3HP8zc3/UfjRnXd8oa7cIz9BW/gw2OzoUP3lOsuELHnilxQq6tI8IwW2tvLptyJx2s5bv6h+HydKelIYFrGAqr56robikHPLaCr9ezgOco5XHXhhWC68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014309; c=relaxed/simple;
	bh=c2qyeHjVaOmyrtgY42eDuxJJm5mkYDGCfcQLnxJhSbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p210/icPHHevOMuaDeOGIiYiw6y7vJLCFDlDWyJ19gNSuI57TmvzzGnZ27ghN3peB2ORLHLNQIxQfVtmRZlaaxalMC92g1MAa7To22xgBgvQmsofJpWnj/Jw1giiIvybcft1JV7yFx7+YLSqzvbzhBoS3msx9h1B7JmqbLYca24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch5Wtngx; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch5Wtngx"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6481bd173c0so3494946d50.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 22:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770014306; x=1770619106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAfwHYV8/UgKwbTNXtNiOxc4+en9+lyKeBe4ZozbvW0=;
        b=ch5Wtngxn5OOapmqQX4aX3iWJnaKpGrKPDC5Bt99vJ6MhjBLz5tNMLsRXAjyfjRnTP
         x8Rb1jn1bqoMMqclsmcwNNSTxO+yh2X84XKSV/V0EP2x3ucEI1WeFgHOxvBBEHNqkSIC
         ozjT91KMRaC8BEH+/gVCwT6GPnIjEZv+wY6yR9zFBmbSeLCWQsrrkgKCB6sX1ZG6Rasv
         g62A4J7I+XfZqpQWMC++z+2tAsu9c9eQ+7B/DuiesEjvB+P6RV7AgpPfz8d9fixlYvb3
         raNSkonS7b73a633AN31FyMN+3y4p9VLk9jclK6GW117nqOqNy9mX7rr8pBIpXOWmlr4
         4kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014306; x=1770619106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAfwHYV8/UgKwbTNXtNiOxc4+en9+lyKeBe4ZozbvW0=;
        b=OwTPexHMr9ULbQsLxLpd/8woEDVTKA/DqJYVSnigoSdtpAKg9xmMhRHSubYOu6DwE2
         xb+MK9I2pX9ID27/neGd4ujU1VTgAxc5ISQESfUHROtY+zJodQsH6FNVhdGqqs9DCdTL
         XLBCXZwK6tpLQyfomB423kAWsBmSbQfPFe670EveYHmQcVEFdPfPeEIJQcMBTqqXAHr/
         XbKArUX2OYpxepmPttORzDDwWvWlPqOLjeL4EP2FXlrLto59/SSfzLSIdvoI5vsNurun
         hIJTgf1uNykxY1hxiGALAZryQILAIYTgV/JFbInYw0z71jOtJNnWvLEMgQlabGylkXka
         X2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkhZx4t1/r66eJ1ysL18VbE+8NJ4D9ef2mzMvLDDTS0MPdNdYKsuQFsbFWxX9/UV9cuPsIdD+xp7UUJzbw@lists.linux.dev
X-Gm-Message-State: AOJu0YxMXNJ6qqCKfen3H2Jqly9+DeyJdujskswPPb9hGniyfxPvzl4c
	PZNDML1ttV73M09cCBm9ahkXuf83GrWfEkFqZptBEDvGdqQJyDXJD+5X
X-Gm-Gg: AZuq6aK/ajnUY+aD1dzpsXoM8Rgno95BoV0xycQDXGbg8ud5aigplgDR3gp4dhjYd+O
	iCgvWext7iaLv1I9KPxrxlOmbL7ByMM27fBrbld3ReqZFB6Lgi0OobEbbVC7zB61pGtk3bjznP4
	2DjZTV3S0BrRqFLyApkrs9bnvW2pz0g0cojlQroZB+0xH3Bhpgz5MQqKK2c7TQTYlJKnI/PmBpK
	T4EpQb818YC/QCCfZDAXxEkEw/sPgzQ8pMDMEKd36QtN60bZYCXgJwDrPOjGf1nXyD2d+aNdcAN
	OgpQIGVPsDdOfQqIUD1X2P+Nx8r/Fn1lMA3Nh3MYkvJkpSExz/i06Dz320TOmmECK3+N6Zrdc6h
	N/HD7gMeQOEvp8fUwNCIP1EoKpFGwdLobQcFyHQFXKQf0YrBTBY1KFtCui2tLJlWY0nPbLfqaM4
	OjQOqr76KXXlN+Qf8okL1iels=
X-Received: by 2002:a53:ac82:0:b0:649:2e3c:7d76 with SMTP id 956f58d0204a3-649a84e5c58mr8022667d50.69.1770014306344;
        Sun, 01 Feb 2026 22:38:26 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960e0965sm8478547d50.13.2026.02.01.22.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:38:26 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org,
	straube.linux@gmail.com
Cc: dan.carpenter@linaro.org,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] staging: rtl8723bs: fix null dereference in find_network
Date: Mon,  2 Feb 2026 00:38:08 -0600
Message-ID: <20260202063808.664468-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pwlan variable has the possibility of returning NULL and is not
checked for NULL and then later dereferenced.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f81a29cd6a78..29dd0b56223a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -835,8 +835,11 @@ static void find_network(struct adapter *adapter)
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 
 	pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
-	if (pwlan)
-		pwlan->fixed = false;
+
+	if (!pwlan)
+		return;
+
+	pwlan->fixed = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) &&
 	    (adapter->stapriv.asoc_sta_count == 1))
-- 
2.52.0

