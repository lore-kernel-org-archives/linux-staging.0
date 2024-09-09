Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFDB14F135
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 04:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725855339; cv=none; b=KgBwNLAQCXWi52Gd+71SIp3XI84hu0GjDcdkBEETFXdfSyWEWV4ZbxjHgH55nNJJKZT0o1exgXhtRFsfvAJCjbJyrMX0aOd8BPhWznuLHGIiPoHx336arRdOOT+3nLJ1nJHQfuJs29Fc4VD0v/PGlzCTmWWJ+Nbhp4v/SrY4nmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725855339; c=relaxed/simple;
	bh=xfFbIdUvQEA+A0pXM0s1InktvjXSjWi99F1gPsoIfj0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eRfS1B6jXXYVtHPX15HLITbl1eRdRg0JZXgkMkhHh/91upd8KAFC2Swt5pFzUPJddUVAucO7MyoJtl8hEgqB4FlQuQyX4efDwTPN8vU2SbI3/LbSjyAgwV8GLI/XH+m1j650KPQdlGs3xOMBLfaM8FF1mVm+NHb0Femf2DqbMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4v/i8AC; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4v/i8AC"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d697aa2e8fso55653a12.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 21:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725855337; x=1726460137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ce7h68vToLcd8NxAA1OJexkTmfKcB9e72XkVNR4Uymk=;
        b=M4v/i8ACfQhcbVzAtIT1AhBw90vBhDdPKpH+YpQiLHpxPrsqsRyAMsQ7hIwz9bc7cu
         RIkY3XM/2U5EiOeOp27Sn8gJtkehKoGUm6N2fC1fxhDLi21VdHid6Kb5r6iv0qpWa5M/
         DGBDIsxoegbb9kDK//O/7QRGh90gzc5dK+hyDDyfT8ikP+20jlrpwj7GzoTHvp+MDN72
         8q9cTgudbKxc8IrLV58/qnXOFAcAxMkBbT6OhgZdimvCFx5UOB7vHs+GXbuHCcTqxofo
         Y76n3gvM/jF9qq7nVJl7wW13VEEZhkgRc1Ii59P7AVeHY+PvZ78o3Wfeme4kBQzVlg1W
         s/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725855337; x=1726460137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ce7h68vToLcd8NxAA1OJexkTmfKcB9e72XkVNR4Uymk=;
        b=BYSaKLOFNDYcWcfM37v0PvXVrMJVHBD0XcnbEZgmstUkhh0C3HNRIymzWUWkKI1R+d
         Qe9nSAZio80aXxVSjzhhhIcBu+4fPgvL4h6kiCD7VrZ8KGe3V2aSHgo6sKmF9Sv699XW
         SHqCXAfdAGTu0wxL6YsIjhdDrFZJE/mL8D7zTkVQc+mLpQC3JffnaUxefiQWH8aMbZWd
         odeihIEZG9wyci5ob6dzkI9dxHVJ9OtgZq/OKYwVIVz7yJZg5RGR5b+OvdF8Lc4b4NcH
         D1BaPCN87oRzjpwIqwVdVpzfv8s7pl1ygNecc4T2kVlkKSTB41llC4wmMuFZV5u0nPMH
         Eo8A==
X-Forwarded-Encrypted: i=1; AJvYcCWgFWGPpRvHtvcTBOwLWgz7QP3Az05A3kpjtX5Aza4DTK1XXEQp2d2GTBXILXiOZOf53edZD3dCbkSd8lwk@lists.linux.dev
X-Gm-Message-State: AOJu0YxD/boNwkwGXdtAPVtT6pIMCoERjbuMYFGY9R3g9Iw8RfeW+U8T
	TW5A8bTGkRTxTsdwIdKcmn/i+l47rDRD4wEGYafZd2boSn2Knmlk
X-Google-Smtp-Source: AGHT+IE8NvG2UROO50TdKyrvT/xGy3ZWfk+qOwr4EpD1xc7WZGH+vEoU+rajZoxhBvP1GFsh4TYBBA==
X-Received: by 2002:a17:90b:3889:b0:2d8:d736:c35a with SMTP id 98e67ed59e1d1-2dad510c012mr5055661a91.3.1725855337499;
        Sun, 08 Sep 2024 21:15:37 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db04988465sm3411971a91.53.2024.09.08.21.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 21:15:37 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] staging: rtl8723bs: include: Fix spelling mistake in rtw_mlme.h
Date: Mon,  9 Sep 2024 10:00:30 +0545
Message-Id: <20240909041530.2431-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v2: Created patch series as suggested by Phillip
v1: https://lore.kernel.org/all/20240906141134.10118-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index e103c4a15d1a..e665479babc2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -131,7 +131,7 @@ struct mlme_priv {
 	u8 roam_rssi_diff_th; /* rssi difference threshold for active scan candidate selection */
 	u32 roam_scan_int_ms; /* scan interval for active roam */
 	u32 roam_scanr_exp_ms; /* scan result expire time in ms  for roam */
-	u8 roam_tgt_addr[ETH_ALEN]; /* request to roam to speicific target without other consideration */
+	u8 roam_tgt_addr[ETH_ALEN]; /* request to roam to specific target without other consideration */
 
 	u8 *nic_hdl;
 
-- 
2.34.1

