Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CDA46BA6
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261449; cv=none; b=rYdfNLABftccZL56C6ZmsR9tpvaWjpZaukUmjWfTSMI3vuubVS0JE4zXvOKe3BCM7zLoBGap4/RROpVqgoeRdG3GS2O/5fApcn6+QzxdAD1DhyprAUfbTLf0T+cmY0V9qU9026NyESQ1hFmrBIxJirllDz6UgE3GGqfTQ6LvV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261449; c=relaxed/simple;
	bh=xUSO0L0OOfzjr5/UosXPyoMQS3r3Io2/L3l6piKs/5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g0sNhsfOCbmyXW8T1fUfV4lxyZnd5JRRW01HrLjO25LxA2G12HXWCLrm1uJ8vasVpaMr8K3oCn9sdaJ+uRX8GwPLAIHYQDEGGZC7nJOpBTHHaE5KHozxrAFmXN744bmgD512T/b+Jhp8jV/nb2vCx2DiFp4XGvmkrsFQ5T4EzP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=RYELrCJ/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="RYELrCJ/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ee5235f5c9so92616905ad.2
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261447; x=1716866247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ8EqTPc0f85y/sPEaQ2P9Fmp+Ujn48v2g0YjXV3Sdc=;
        b=RYELrCJ/w/Ul/kAvbdMR5zEtCZ+xsUYcNIZfaMbD24QKhQ8pAhizD+cwpgC1rAyX04
         ZiRrEwBDzKrKN43MvTlHi6/ci35OFNxzQHz1gW80cZaQrWVi/5Or1Uv1a2vai+vJWNfv
         kjIbhf2hBiQmSWuPA9JseQoqmUgso1z+vzsAa4iK5smKfMYfKy1INuvMRYYbVxK0zFnQ
         2HXwWmsodpjgpaVQZIWMQnp5YaUEkDLBLYnYPg5tJ2MV/mFpZY0+qV3feEbbT7y7HFKR
         5F1weSUtBULd9Iw05vKz9FCCMgvQDYc684zR+VWVOO1nye2z5GDRSTwIaBP+r9vZJ0ij
         SWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261447; x=1716866247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ8EqTPc0f85y/sPEaQ2P9Fmp+Ujn48v2g0YjXV3Sdc=;
        b=Nshs6MLOmPcoOKjBgcOF4aPeR3JCC1AuRpFmiFZjXN3PdpUTQ/8ZCIfwtXV/hcAWRv
         lb/G9I/ZVPQ/dlUoIq+iLVyJsJqHqRoN9TflGs47qhSxMPspoHLc5qru9pbrXg3G6XMS
         DLjQ0DhIHPUTMg783avnR/+WXnArVemkPosH53LnTnNpJpcM4DU9Wup6M+eH7G8khd+M
         tNtskaUnJIz438VsaAL8QWp4Jr3t4zQg+cOxzqc58MiVtoDWBCag/1qbAA2nTPlP2dfd
         GKi5iqHgwFlNtGdCL3CXtlHDDmYfntQD3/6rxQYxtOTELIrEliklnQWA+Yq8xr3M/Ozx
         DqCA==
X-Forwarded-Encrypted: i=1; AJvYcCVFkN8YxMLG1tfJPC6o4Ok0yiSXQWb2Imw7YFrTwjsB7gE1+CxjEXD4zxBb6N/BJY17CUwMZyXXXQKRIMH0ouLSglgG5k7XvDMZS6Hnvw==
X-Gm-Message-State: AOJu0YxXbnGHr10pTNbGYE5KoR5vHtXUWPcyOwC3wS/dHAllMtMcoFch
	f2k0xd4DyWyBsmTo+ofU0DtTHqcVb+Cub4gjtlETYVcuC/94b5zspeSkMbFy/0w=
X-Google-Smtp-Source: AGHT+IENtRCxhNAvkpmcZ59SyrjtbbYxkY+wENlFTVIEpZY1wEkucQ06zKq5zCDgo7JH91LudJzktw==
X-Received: by 2002:a17:902:d511:b0:1f3:66f:e030 with SMTP id d9443c01a7336-1f3066fe370mr40450515ad.56.1716261447012;
        Mon, 20 May 2024 20:17:27 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:26 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 07/31] Staging: rtl8192e: Rename variable MBssidMask
Date: Mon, 20 May 2024 20:16:54 -0700
Message-Id: <20240521031718.17852-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable MBssidMask to mb_ssid_mask
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7f1c2f49227e..3722fc0cae1d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -915,7 +915,7 @@ struct rtllib_network {
 	bool	ccx_rm_enable;
 	u8	CcxRmState[2];
 	bool	bMBssidValid;
-	u8	MBssidMask;
+	u8	mb_ssid_mask;
 	u8	mb_ssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
 	u8	bss_ccx_ver_number;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index c29efa3eef6f..19cb717df3bb 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1818,14 +1818,14 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				network->ccx_rm_enable = true;
 			else
 				network->ccx_rm_enable = false;
-			network->MBssidMask = network->CcxRmState[1] & 0x07;
-			if (network->MBssidMask != 0) {
+			network->mb_ssid_mask = network->CcxRmState[1] & 0x07;
+			if (network->mb_ssid_mask != 0) {
 				network->bMBssidValid = true;
-				network->MBssidMask = 0xff <<
-						      (network->MBssidMask);
+				network->mb_ssid_mask = 0xff <<
+						      (network->mb_ssid_mask);
 				ether_addr_copy(network->mb_ssid,
 						network->bssid);
-				network->mb_ssid[5] &= network->MBssidMask;
+				network->mb_ssid[5] &= network->mb_ssid_mask;
 			} else {
 				network->bMBssidValid = false;
 			}
@@ -2349,7 +2349,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->ckip_supported = src->ckip_supported;
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
 	dst->ccx_rm_enable = src->ccx_rm_enable;
-	dst->MBssidMask = src->MBssidMask;
+	dst->mb_ssid_mask = src->mb_ssid_mask;
 	dst->bMBssidValid = src->bMBssidValid;
 	memcpy(dst->mb_ssid, src->mb_ssid, 6);
 	dst->bWithCcxVerNum = src->bWithCcxVerNum;
-- 
2.30.2

