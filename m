Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B477053360
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345284; cv=none; b=p40YfldH1x31kvWfRDO+eQpCU/Flm/QINShUAUypn/c9//dObNXdSfmzznX9dtdQx3C9XoVqMJVgQDUMCxF++w9uolJWH4tmvBY0bKzSEuUJMjjG9clzG/yXH5EdqU50R5VOOzX49c/8TxLUAVrerKrCilcjguZR2nR7RcGnVI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345284; c=relaxed/simple;
	bh=CINZa7BZ9kwdDRvCzgXCeiUMShws1T7hlMcYDXKXccg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n/cGlU6m0s9CjepBXAOV2oXrmDvjaOxkvc1wm79En62h0ZGzrVw1an3Ed/zU43pFjcp59HkHHtHBXGHWR04YdLy1eznyYV41p6nib/Mw2ZJhbxKJuYNp2V7UNgUsaTY06jUdJDkkHc7dCS45Ucu5B8khqyYCLg0qhcqYqC7AkgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=jc3JHv85; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jc3JHv85"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2a52c544077so2870453a91.1
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345281; x=1714950081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szh4UKx+DCu/+Jb81IHvm3sJHBJ5ImWZ7XqJmmyg3wk=;
        b=jc3JHv85ba9lOyp7BsonVcfRf3hr85ZgsDQfuVLMRZYB3KC9XAGIMakdly7bQNvEVF
         M8i2mI3lH+vP7DkBU6QVJjl173whzKdtIRGSZXuMN7WiyKWbN9MnTNt0W1olrIGSW6Xp
         DMnb68O4NXy3ffnlfvO0m0+92r3bEmZ97Obg2InO4kb+VMLc3UWCxHR3ins4+M0fi924
         XyHZ2oWItpuKvFoVctehtAdBikx5pT63WeMVL4VfsvJhOXISm2xOjLfPdWUV6egt1Ptl
         OPeJqJhCT+YcA8pPAsPaeWJku2m9CdF3bgSwG2mcK3jBp1jSj8sUTs6WOjknmYyPdPKN
         Fl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345281; x=1714950081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szh4UKx+DCu/+Jb81IHvm3sJHBJ5ImWZ7XqJmmyg3wk=;
        b=T8k/X78agCSQGGz4Z9Dwh1xvs8CZ2DFb+QNMmg9keDyo6Cfdc+UhG9S6JXXZIIM6Pq
         +euYSYEemyikxVVwWXYn7INCyqdZWhs61kNr+X1I1Yi42WXPQRCbL/7bGboby9PhXefu
         pojEVzEKJ30d1y50MWDVEZkjABGOdVg/mgfVDK4W7XdNsgoNlLj0H6Fd2LVKQZ/dI8IH
         iqlIhPY912msxXse0J2asQkDCl5faDWCQuBtWa2Qt+nOLac1f5J0UUUGRBJEPGmSfg/u
         LMhc9pHHna1gjlNwavglP8yZw0vlnwSdxeGe0MiaAmHmXpbc8OgRqM3yCoIyd0+dUezm
         NKhQ==
X-Gm-Message-State: AOJu0YySgW0UWAiBEePsy4PkiUOYkAQpDjTwgoUIY0ifNvEGdpRtyENc
	pvSjvNbnX81Rjqlt6UWrISDe0EPiF2j3DWZza2tS45mwWmyRxVMhKrURWNlxXaA=
X-Google-Smtp-Source: AGHT+IEayXLaLCT7Ia7HGBREBpMOGoPMsguYGlKFCBMNIDhZLcTnbCBm/Um9a55y4twAp7YTf9gqJA==
X-Received: by 2002:a17:90b:684:b0:2b1:9845:e09b with SMTP id m4-20020a17090b068400b002b19845e09bmr1107604pjz.49.1714345281097;
        Sun, 28 Apr 2024 16:01:21 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:20 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 18/18] Staging: rtl8192e: Rename variable DssCCk
Date: Sun, 28 Apr 2024 16:01:06 -0700
Message-Id: <20240428230106.6548-19-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable DssCCk to dss_cck
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index c1446081956d..a6e0077630c7 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -34,7 +34,7 @@ struct ht_capab_ele {
 	u8	rx_stbc:2;
 	u8	delay_ba:1;
 	u8	max_amsdu_size:1;
-	u8	DssCCk:1;
+	u8	dss_cck:1;
 	u8	PSMP:1;
 	u8	Rsvd1:1;
 	u8	lsig_txop_protect:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 963d69680049..9b0a981f6f22 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -266,13 +266,13 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	cap_ele->rx_stbc			= 0;
 	cap_ele->delay_ba		= 0;
 	cap_ele->max_amsdu_size = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
-	cap_ele->DssCCk = 1;
+	cap_ele->dss_cck = 1;
 	cap_ele->PSMP = 0;
 	cap_ele->lsig_txop_protect = 0;
 
 	netdev_dbg(ieee->dev,
-		   "TX HT cap/info ele BW=%d max_amsdu_size:%d DssCCk:%d\n",
-		   cap_ele->chl_width, cap_ele->max_amsdu_size, cap_ele->DssCCk);
+		   "TX HT cap/info ele BW=%d max_amsdu_size:%d dss_cck:%d\n",
+		   cap_ele->chl_width, cap_ele->max_amsdu_size, cap_ele->dss_cck);
 
 	if (is_encrypt) {
 		cap_ele->mpdu_density	= 7;
-- 
2.30.2

