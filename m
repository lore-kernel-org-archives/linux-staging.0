Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14832C2357
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128658; cv=none; b=JIOd8iG35caV5gDfBeqSh0cLXYnCokzFY9qgSIp/8g3w6k5wNGcEvaFBz37pSNbDiBrBoRgDKu9bC85WwraasM8/cIVTdklnV9V7RsxHCDR1vmAjD92UU/FkF66YMQRB9exKgrJ5TBohi07dTaWsAaKpBn8fKjvhsbbrwKpwzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128658; c=relaxed/simple;
	bh=3hU0mJSlz0a3Lg/lIIjKdyRK66MzpbbQLwinLi5C7Aw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JHi1VRyskJiJ9qqP8S89WiErkpyQ7S7JV9VAsDe/qX9D4CJQx9EZry66hsRKve+9YV/+ly2R2wb1YMRchvUUkc2AsmX7TeHpsP3cx+I7tJoDGU5tb7JK4Bi7vOC6Hfe9acC13EXtgvmF+WbeIT9Knvs7mIVhGu8sv7pU6J5n/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpYQjS9d; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpYQjS9d"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4da37f6e64cso36483281cf.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128656; x=1759733456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urZ132At0Po/LpA48SKHNWLuFOtj5UrmYX1lmPgIIK8=;
        b=BpYQjS9dNsA6yzrDRg5DcFp71TmolfKkEJNoPQvrcllWnL5r/WRFHV/yOvNlOCKqHX
         36ZQBLiu1RMZ1MDo6d/FzE4xWolBdWNjPONFM7nRBgrg8r1++akEoNhUWqS6EjarZFPP
         rqQKeOydi27ZE5v0lYBfbCZR5TMIh5Nx3N5g1AiLn2AZoUhYfVF8zGvDest4Y+NB+rTA
         3RnsT+HfEQCIfSHULIu6PsIFKzD4vJsQ9BqH0hFYKfsDllgV0BwNDAaIvUwFVtqwkZCp
         v85AYRNy61CgMYMaJfUXHBYqkV+gV+BycWjQBFZ8c9O5mJbnMvvVBrQvv2cr0N0yaXid
         8kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128656; x=1759733456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urZ132At0Po/LpA48SKHNWLuFOtj5UrmYX1lmPgIIK8=;
        b=TEExsQE0o/L6KmYMlk4fWXhn64OWi0qVcPnDIOFVdtSTb0MJ1wPBOgQx0hfsCHcD9L
         +1rSAxPGgs0P5xYuWVotzH/L1cNkUyP2lkxNqBtpbX4yFxMayNl/ZWyRatnGzzHk1Y2b
         Ms+WJWY03rkycYmx8u7BROuVMCJXGzPplPYHzWzZaSL9oi1xxdz4lDnjOvksFp1SEtwc
         SlPUkcbVgDNCSN4WHbCse+BlFk1I8wiiEnCMQ9sKs4pEDyDsiTnfNFdAyv8+fKvXQdDo
         ZBveldRItHdi30JpVoV9Mf9LcWl9su3t2CCQJHRZrcUxW7g1ZOBNbgg4s5FCs8bARKz4
         1dtw==
X-Gm-Message-State: AOJu0YyrOIPTKJf0ERU2+CjYBXL9MpydE43iZp/pHmjMo/4Gk+k+cNqt
	YGH5fu5LGGIHdzXfc5cUjRVKSDEowh8c7PeRgexi5Uz+MqE2ywjaEiqq
X-Gm-Gg: ASbGncv0dg51wihNq6tkE1sxmDO+A4iZAlAwFwpfLoHyK7BefuDqdmtrIz6JWVlRlxI
	C/B6uq1eX2Ab507lceyYZgLOB7iKDU1ddwOiEyxYtxk5gml/EwPZf37W31rg5qV8kDO0OGbpbhd
	SqQNB+jEQxeocx9wdjn56mrEiGL/GjAUeXIver6XUohuAEezKXchLasnHtm1ISAjGGT4TyWrREP
	Naj7SomHNcv4DrPxlxxvda0YOWxdNCy3piKRz6lKSxC0xkDZMIgCSd84t92fItc42FgqFQ8pCVs
	NqtTYOroU+rqWYbIkNcxTPJF/+58Z/DPbh16j8AZi+OV07HgmSuKCPDLatXq+WhAI2zjdTqQg9f
	URfyXAU330dR7AaBJ4TwE7rl5eqLZF5IzBVvS5ysAHVWmXlRa/7Y=
X-Google-Smtp-Source: AGHT+IE4n+KCbqmRxlHUMQ+S/dHgHWRi5PxE8e1izWVyd/kArNAL2MExOFV6mZp47X//llRpI2XnyQ==
X-Received: by 2002:a05:622a:109:b0:4de:9bac:84e4 with SMTP id d75a77b69052e-4de9bac8846mr89001481cf.78.1759128655771;
        Sun, 28 Sep 2025 23:50:55 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:55 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 12/15] staging: rtl8723bs: add braces to all arms of conditional statement
Date: Mon, 29 Sep 2025 06:49:57 +0000
Message-Id: <20250929065000.1010848-13-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add braces consistently to all branches of conditional statements to
prevent potential future errors when modifying or extending logic.
This aligns with kernel coding style recommendations for clarity and
maintainability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ef9057456768..8879d7056324 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1668,11 +1668,11 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
+	if (pmlmeinfo->VHT_enable) { /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
+	} else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true) {
 		mlme->auto_scan_int_ms = 60 * 1000;
-	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
+	} else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
 	} else {
-- 
2.39.5

