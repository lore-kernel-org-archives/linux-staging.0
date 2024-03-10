Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D93BBC6
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114960; cv=none; b=U1aAstTsBhvnUBgA6S6Gp17zwwTV2eohkd2sUdRb9CFJdRD1oN5uqiAoK8Q2tVoXxrWgNX7cFUVHcER+AdvDCPjB/+Tp0JPU5SPoiMqooW/AmQmdnfYz7c7zY8/PzCFjWrnRyPGO/xZaGqAP0bB4crOQFp89CgX3G1VmC7DFh00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114960; c=relaxed/simple;
	bh=QMV0z9mf9YDD1V2uvitlkWMmFWbtS8GiCtqxLiRVx6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UbD48nQJHSNkqPSkO685LRd1KXCtnGWbtdvwuKD7QatSc8wfNITg2PyxwYJ3QxJaAp135LlooeKFQhZQbe0rvQ7oqYPM5pgUQarq67HgT2+vGgphO5qhVIloF8I95jtJrqUgAp0sIHsWJ8PuZkTV+P6uiM/98ECtM/ilpLxT3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=DFot4cTM; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="DFot4cTM"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29bc1c64a98so1025886a91.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114958; x=1710719758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9TYrldhcrL23tvPQUFhNBx5Yj6HnYD00fOJGXP/nac=;
        b=DFot4cTMCDPBN9DzkKOYLwInjY1+dvvYs3xn97BvWghAxplWhiwnmkQEgOjczbUbi4
         ciHoqJOQ5fZYZ7hIupRhQ8lbNRWDM6j2ryAMDiQq4IqU9PYF6UIuDY6dgoKwPYWEwtH+
         ujXLA3WzJfdbEV5xrM2XNpUrOI8T2iA0VgFbItf+WI18/USvSc8UF+4E813WcnFwl+qX
         XwnYw52HZABCDvDpN/i7CWRxRX5micRNsUOpXWQhYutqnFMfxcwxWbYis1gYG/rPh+bt
         427h6ETg+j/DQv2Hx4cD0XIXdWiSEk1cDyqmPxBDa1zfRM9byD9638w7eKCjMXPAJ4O9
         5k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114958; x=1710719758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9TYrldhcrL23tvPQUFhNBx5Yj6HnYD00fOJGXP/nac=;
        b=DBYHnDw5O85PIILGYJdCXLdZH98f+NNTxM2o1IZTu4d468UF2JuAAppgJdn6bQkno5
         FLmvEXw6MCcaLAhbuvxnJZiQln0XOXLt/z4VVktn/iMTgTK1zFC7Tq9o5wpFIMn9EyTy
         1GH8JrXCKb/EMXZBGmNhe8twHaGOee5kBahnCTvxnh9DhIKDEFD905koV9usZctAxX/j
         IhBMvtHOTT2VHsPKL6sOsiMyn0CEVGZi8PicxcJ0QZjVKgJ+z4rxpNc6B2hOGiOAw8C7
         6/BaniiBI+FBQM4eZ2wbxHodg3NTz/QPTkA9M4oekxsSfTvbfyIxug88jWh652DC0Mdp
         dYRg==
X-Gm-Message-State: AOJu0Yy7zsLsw0fZgVN1zsdoSNTu1Jm/HNA+5l6rCfsKA7Yb9EbT7y8h
	Xl71W1Uc7blmlSAs4uNp7yHG1KHLyuglp4aMhjn2hQwbtvX2TJjsQHGTRlwexe0=
X-Google-Smtp-Source: AGHT+IFuVkhYJAzUsK7cjL//XGCmaqOPV5lvrzEu/IMY3yWrVmtaT2/naXMOXeLxEmgvfGvntiYQIA==
X-Received: by 2002:a17:90a:dc0f:b0:29b:364b:79e1 with SMTP id i15-20020a17090adc0f00b0029b364b79e1mr2598069pjv.25.1710114957753;
        Sun, 10 Mar 2024 16:55:57 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:55:57 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/11] Staging: rtl8192e: Rename variable TimeStampLow
Date: Sun, 10 Mar 2024 16:55:43 -0700
Message-Id: <20240310235552.4217-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TimeStampLow to time_stamp_low to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e3ed709a7674..480315404969 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1659,7 +1659,7 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	stats->bFirstMPDU = (pDrvInfo->PartAggr == 1) &&
 			    (pDrvInfo->FirstAGGR == 1);
 
-	stats->TimeStampLow = pDrvInfo->TSFL;
+	stats->time_stamp_low = pDrvInfo->TSFL;
 	stats->TimeStampHigh = rtl92e_readl(dev, TSFR + 4);
 
 	_rtl92e_translate_rx_signal_stats(dev, skb, stats, pdesc, pDrvInfo);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b2b8947da89d..72264e1ef877 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -482,7 +482,7 @@ struct rtllib_rx_stats {
 	u16 bCRC:1;
 	u16 bICV:1;
 	u16 Decrypted:1;
-	u32 TimeStampLow;
+	u32 time_stamp_low;
 	u32 TimeStampHigh;
 
 	u8    RxDrvInfoSize;
-- 
2.30.2

