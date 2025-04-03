Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2D81A5B84
	for <linux-staging@lists.linux.dev>; Thu,  3 Apr 2025 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743719341; cv=none; b=hv1x1alRAvb3rk5HAeFRe0ttim9LZyNfaeoJTeehfdXKB7cjY3ImFDHcNjjC/wVSceBqJjjv+ICiNRkjamydxnFIjwdNHjuG1grXlABGdwo85t6Xe5+Rh3ZnYloi/zjSV0U9rBaUCh1asVzG5FPIOfl7ilylcAy5n1lDYfYU/aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743719341; c=relaxed/simple;
	bh=VNOHXYzanmqg7O/00y98gBzoYRvCo/KtlZ8xLKauaR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PO54GHu5M+pfhA3jdL46ZVN1E+KhNekxoTJ2nWq4Y0IYjnfQZ/1fFVwPzjVlyr3NI20t+xMxZ5GIpVHQU9HgiAduz3jO5pAK4FaApUNp81pp9/U1MpEOxUUm/nptAmxCdBHfRIl4QWtYiRMAJXQtqomgdHVijjxeUyQsUDTVe0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAClKgeo; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAClKgeo"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476a1acf61eso12721221cf.1
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 15:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743719338; x=1744324138; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spI9PNT3CiPhRFNnxyIZwUOLBX1aSj6NeXw6KtRgKRA=;
        b=TAClKgeowPCi8GobXV1ILbLT0s39jFeY9UCX6GFNtHgNT5s39ctFWfxFfzTF0zgDbe
         B9BXkNUmiuoBNiPp4BjoIHCXa3soax12IvBREafk4p5VTlSUcIrVpzNccGkXTwMHIIMw
         rkvMh70iOpV3qrpeuv/uYRAkYPUSyN4Rj41lV12gs19mVbqTRTaxB6mKy3LexR1wtpyN
         MXnS8MhbbBjw3EvyCThIi0Gnuu/r1dM6uhhq+VCgFZTC42r9I7TIy+Z4HidXOkdXRCib
         MNl7xTVJ7Yv7w+jjVeJ2xdg4Y7DV26GFoLIeCyLc1cDlzdPT7UfVET4kZaqBHmynBI/I
         xZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743719338; x=1744324138;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spI9PNT3CiPhRFNnxyIZwUOLBX1aSj6NeXw6KtRgKRA=;
        b=AM8EnMoh7w16EGNWyYdT3DSRGSHVLXD42GOUemL6bnvBlqTilr9gPwQ/hSOdN+RwBf
         CIDPvo+RcBQemaRDj8ZoIMP5Pd0xTuKcFukIytj3VRbB3UurTF4G1Fm2M0fsOyaox+Uz
         foi49tz265BGtsJAremOIUsHK/3ciUJzwQkkLDHB/4hRg5ZcxHRG8//e7F6j0YSZQnOk
         0ZITMsr/PDFbtti008qldVC03trhpXI/jriwJiTo7m419BV/FhLSPc5tX5WTPdMuEkIm
         Y0lP3gEpihmQdjHSBC0e3GYaAV6iWyoRkBtLQKGvBUp9RePgD9hdDqJ7FjdBnCG4HEMF
         5Bzg==
X-Gm-Message-State: AOJu0Yw/7eJ3BtlDJrjU0v7HpwPojDLjmimJIN2Pkve7kX6p0SRmdPSZ
	+Ab4PQyhFdtmmAtpfIwxvSW0RDtlVti+SLty5Iq94s3/gBLDFxm0BVm+tTMU
X-Gm-Gg: ASbGncu9rHsfdF6pFUyKRyIHDysVubWcmiJuIMhYGIeP1vrkKyFPWjDCThk0I/r+IcS
	bI2Juf3ZliSwr0vvU38SyKa8h9AHt6ogyEFdRUZNmG3zWVWVHyOctSNjDhWHUXQnLNpPR10xFrH
	ObCoPkBWVWnkuGvVcKqiNt3NOg3s6tCS12SSwKkyldMj2trsltXAHX5oImyG820bBD5EpyrD/3l
	LlBcAdMRdccDl9Lk4JIZd34fzlKNGKJKroqGOJgaBqXAXSC0ceuYtDtwyXLkUZ+Jrx3++/dc0mh
	LHcUNWtpck4AWvBo8ODDf+aHNt6eXRh/FAwE/zZMl5EOuoAh
X-Google-Smtp-Source: AGHT+IE9WgGCJ2iSics3es7U5UWvXNoEZFFhxKCgKyK/HuseosMRyE2bue6YHDURYTFx8izS281UYQ==
X-Received: by 2002:a05:622a:1102:b0:476:fde3:8a63 with SMTP id d75a77b69052e-479249d5d28mr16541771cf.33.1743719337778;
        Thu, 03 Apr 2025 15:28:57 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96e566sm129960585a.63.2025.04.03.15.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 15:28:57 -0700 (PDT)
Date: Thu, 3 Apr 2025 23:28:42 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <Z+8LmpgIIWlfhmSX@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct sta_info field uses the uint values 0 and 1 to represent false
and true values respectively.

Convert cases to use the bool type instead to ensure consistency
with other parts of the containing code where true or false has
been used.

reported by Coccinelle.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes since v2:
* Improved commit message based on suggestion from Julia Lawall
* Clarity was provided to Greg Kroah-Hartman by Dan Carpenter on why
  it is safe to make the change to the struct.

 drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ed6942e289a5..82f54f769ed1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 		psta->qos_option = 0;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index b3535fed3de7..63343998266a 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -86,7 +86,7 @@ struct sta_info {
 	uint qos_option;
 	u8 hwaddr[ETH_ALEN];
 
-	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
+	bool ieee8021x_blocked;
 	uint	dot118021XPrivacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-- 
2.34.1

