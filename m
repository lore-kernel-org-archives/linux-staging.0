Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6ED17FF
	for <linux-staging@lists.linux.dev>; Sat,  1 Jun 2024 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717230724; cv=none; b=LSyU92X19v3c1GdIj4rII3ytgcj3/cH1rmn5DMiT+9tL6ZrzlIkHx2Cm+/b/W02lPP1NZIdjs45Tnt67rzplXmP9thFpUyQe2VZzBcW/4AuDN6nxT170OlqxNte6/XfWJMrrXFc24vrr2/OyIsWCALCvzKoPVf+7E7jj5Z2q/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717230724; c=relaxed/simple;
	bh=FKb4cyZxX+aHBqlharm4di4pT4yRKJBQrV6+RAj1SmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EpKeaWhO4+OoH9Y1iCeWgS6peHMYCYK/SrU/TlSfy+Ch4m0sF77zZv7Uj+0NIsCUjVpA/mx9i8CDLhiH1268gpm6kHa2lWJLpEXTIYJM1wP1TTEPznvaegH6xIUlxFHdKLslL9m4Lnh+Ph7JvcMxtnvMuVN+aAn1duFbP7Z6hj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIaA9RLC; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIaA9RLC"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c1b9152848so1735278a91.1
        for <linux-staging@lists.linux.dev>; Sat, 01 Jun 2024 01:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717230723; x=1717835523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H3hjzwanBytkl4obEE6D67qP07qRMuRdAI0wYEzYvMc=;
        b=KIaA9RLCu2OF/oB+XXyhdCIEY6qalUSVLcCiTZY0BG5JHszmfy/+h94S2x3K21inQD
         3774Mt8Isj/KFkXDgmTy2WtHYvwFb5Mb68J9qX73MbAKZWBm+2Y+cXKyuZm2WezSjgvY
         8zlZPlTvaPWGFPLyc5S6Tobx+Y5YQqG9JdnUVu9JkoP5XRNon7+92MHeWpsSzRT1Nlvb
         1bOcbzckwXFvt1lSZcSUlghfYAXv3vFEn62nPH+zc7jiZ4mHd06EfscbRQkfeMesx3r2
         ySYSYl8G4bL++WHkrxbw01GAahaNwFPCIRetUV2zYiyX6oQgvC/QGrwUXw9dhkjkSNl9
         YPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717230723; x=1717835523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3hjzwanBytkl4obEE6D67qP07qRMuRdAI0wYEzYvMc=;
        b=sU0/IMGdasEhT1Alhl27isdXcP6kz+KMwMqlsS0WBkMo1iNzPiQXk1PdkNdDnFgHc8
         0sFlyoKt0tsL37WRI+rTid+HnIp43PWR5pu8j/d1IRF11wchUrwbGzd5QR3JHo/Zb8Pi
         GY8F2neboBigk9/rKv9g6Vmba92P1BsicCJwSvS50zS3nkyPk3WAhvi/OiRE1TFzG2xc
         Gkcwp+68KmSzV4Aff0LQUCUXVq8nr53m14CuYmvvklP2brd7e55sxpjWdx6ADSA7Isei
         RxuasAhaLfzkueO4MfHlnxt/3oQOEtHRIYwzzfMcI+EYXokZ96qzhLlaP6MXZV9Es+Qy
         IB8A==
X-Forwarded-Encrypted: i=1; AJvYcCVsZpZXJkj8eD/43qA83m5Um5KTBfAhZBzeCdyqOr+06S12onSt5h7MWuqYRiKWbj6LmeMKPVoxNpGNeALIgAm/nyYYmfv4rFKnx0aVjw==
X-Gm-Message-State: AOJu0YzUvPS4VYQlZEbpITHs+0JFpO2DYvGMSbFVKNdOhY5O6u7hdt02
	Q7KiXKhaX43Vki7QklfBlRUINlNGQfmIK53xqLAvFhccuOB7j7pw
X-Google-Smtp-Source: AGHT+IEn0wjLCo6Y1AE4Mp4UbxabwPlAjXIHUBxQsF3C/qD+vV4XI4Luyq32+AdsW0zeHI1BnStLHg==
X-Received: by 2002:a17:90b:2282:b0:2bd:fa57:b361 with SMTP id 98e67ed59e1d1-2c1dc56fce1mr3603808a91.11.1717230722679;
        Sat, 01 Jun 2024 01:32:02 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a77bb65bsm4384000a91.56.2024.06.01.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 01:32:02 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	ruanjinjie@huawei.com,
	bragathemanick0908@gmail.com,
	colin.i.king@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: hal: Fix spelling mistakes in odm.h
Date: Sat,  1 Jun 2024 14:16:53 +0545
Message-Id: <20240601083153.96242-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes misspelled words to increase code readability and
searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index f5c804a1b9d5..010274ba8079 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -76,7 +76,7 @@
 
 /* Remove DIG by Yuchen */
 
-/* Remoce BB power saving by Yuchn */
+/* Remove BB power saving by Yuchn */
 
 /* Remove DIG by yuchen */
 
@@ -878,7 +878,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	struct odm_mac_status_info *pMacInfo;
 	/* MAC_INFO_88E		MacInfo; */
 
-	/*  Different Team independt structure?? */
+	/*  Different Team independent structure?? */
 
 	/*  */
 	/* TX_RTP_CMN		TX_retrpo; */
-- 
2.34.1

