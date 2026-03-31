Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB70223DE9
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964293; cv=none; b=r6fZEadGNNglPOTHkYCM1pARA1CIDyQI11edl32HvZTy+QEGM0bhIb0WSzUNYt1XxclGRHvq5AKZg41k0iXM+HWQ73/JXimE2b0h6OD/F24Z23DO4vPVmJr1bwCa7CV7cErgtbtCRqt/lShC9SW50sDEmESnKpRhxl1LpYcy+A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964293; c=relaxed/simple;
	bh=ZH3kOGmDEO3gADrpfp5Lcv221yGM51+kYEM5K/9HhGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CYNOaFF5NTZte9wPWfMjdHnQ7xxD0go2pNinKZ6R3LpNA0peH/Tb/mPt77QCntZYJNXzbt8sfCGDgL09iM8fKh9SW9LVc5fVdKvp2IVVgYVz34ufDEpD3ONmpkUAlB0i9aGhYV7qwflnyiqkqhLcfmnFvIXT5aeYrnhv1uo698Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UffKQlo9; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UffKQlo9"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12a693cdf29so5042230c88.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 06:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774964291; x=1775569091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyvLhjVhNdQz9p6/7OsJVs/MzdJnZrYRiPF9CcTyMdI=;
        b=UffKQlo9am4bxzoOiq45UKWEf5ve4ceLMisAa/OIo7DWMqr7LFuMfEq97ajXC1e9pJ
         KtxFrxvyWAROZ7qZ9Zjpe1vNsQJnV3PF52OYyQkVKSAc9bSwkyaT0VN9p4XmfCVezHyZ
         Rz5zvLxwX4ffoHlYX2y8qBsfattb/qFdNhX9B/ZesGlhGDKjYfFR0Mk5ZXILWt5dZhO4
         VtuEaAp1YvRZjuxplEqUOgKH5xgB0v+humculDJWMZPZHmUWjw4IJbD5bCwFXGtDwB82
         26wEeWN8y0i4pE21gbkI0JHDIu2k0SHluoPmFfPeK8AMHbM3Os2RU4Rm7EOMeyXpkral
         TZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774964291; x=1775569091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LyvLhjVhNdQz9p6/7OsJVs/MzdJnZrYRiPF9CcTyMdI=;
        b=QL+JFoVdx5+sco0oUJiGYGTfkjODdK6ek/UAeuc4POwsdDz6gJUGaJpaJSQ0YG5Kt1
         wWXZBsXDGh2DctB4zXCpgfM1LyWh2CFM2rSHsugvtz0ysXSG3Gtpy+Rrh22COD3gZo4h
         k+HZdNRaLl1XmIqn4AnFhtj2Qqe73XuG8X5CpdTw2jdgAzzgKXu2z82jEibhY+CBsv2s
         t871Dv4hMOC2guJoC2MT8PmrF0CVW2P5zYezLQxuHVvq9P83iKsnuRRYDQ8QWC8HjFDC
         BlY0GV3TnBbkaQkRwa8U19EB32WxycHYWhxaozAg0YQx62jBos9FoDw3BQHIvW8jEvPD
         LVRw==
X-Forwarded-Encrypted: i=1; AJvYcCWqq6pdIVX2H6biKWR+qZxIvTDx885ld7gsu2CCwjdKDOFOB0gAiz3dJjGJwmhfBQE/dsp4ejUNRP1Ga3MC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz97OnxU0Xgsz++849hitSg7YNRCgTdFhToJu9z0LYPNXiuVdgr
	jlgF19cLcCqZjKgUGurXgchbNQrpdd6kU2GY5Aa9Sfg/f3861mkFV8c7
X-Gm-Gg: ATEYQzzOP/pdpz8/w82wLst8d2nEYCfWDf1AiUyG6UPfQ6h2I8mimp4wcPDSlgitlIU
	ui+D2lmrrcEBID8rfIWgGvHChpz3ZCj1qbs8dI2cZEymH/kVdqoTFMzSvMcq2LnKPWstjoXD81Y
	tbFNPlUvDbXoFAfZaBcB463P5S14OUrk1JZdql+/J0PkHbfdkQl2P9KJZL3+e4PpxOpdolMZqZQ
	hwIh+QyVh5MnnsP1NsdbyQnz0Wh1uechWwcpUGSMsIA+F9w3TW6V31mbolUeYxrFXr1ElFG2NbK
	JZxfYuVVhdyWQoS3bRZf+XU0NhxcLiTXzSrzD5SFZqcTr8Nzy5oN5FFQVvMz+n9CRKJbEwuwnV8
	k8CUO4jxwN32/QDojjWhnFAMAzw8xvTR95X4O0kOrvHo3MJ9bwhykmmWHVMywLelTiazGpBa0eh
	4oZTTRzNkOYcVcgoYNMqrLwwpzzei98ymhJEtz3gcF3Xfi2pBGFbjqFtt5oyWBGTFvlT3VFUNFl
	qPzPHSkxKSwPw==
X-Received: by 2002:a05:7022:e0a:b0:128:d396:f2ea with SMTP id a92af1059eb24-12bdde5b49amr1721883c88.11.1774964290951;
        Tue, 31 Mar 2026 06:38:10 -0700 (PDT)
Received: from localhost.localdomain (58.sub-174-193-131.myvzw.com. [174.193.131.58])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abde65313sm9642593c88.14.2026.03.31.06.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:38:10 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: sm750fb: constify fix_id array
Date: Tue, 31 Mar 2026 13:37:43 +0000
Message-Id: <20260331133743.18935-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331050738.1547-1-dennylin0707@gmail.com>
References: <20260331050738.1547-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the static fix_id array const-qualified so it can be placed
in read-only memory.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 62f6e0cdf..795e9164b 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.34.1

