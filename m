Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D3D2D97A6
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255642; cv=none; b=N2FOlXqi/slxOI0n0R7ZWG4Pk8JpQcpjaTDVApidXLax8zaPmzd2NK3hg9PnyqQflQdbS+ZretdjYb7RWNUDvxeqJXniULQguFAw2kBLDRPR39aDtvye2HCFOp9gClp0byb9T/rgJGZAjh9ILv3OCJi7r292mPKS/ozeTbFcB3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255642; c=relaxed/simple;
	bh=2JAVq/9enXO2t2T9ParEdQzrg89M6df4SWwhFhzjG4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8A8tLQAli6EgaDNM11+mopy4XHRdhEy0Lg4cQ9LXbq5Ghn4OfuGo9zykE38qexCiN16eGzPQO5Ikl0pusN1mGNQ0eDb45s69GX++UGHCycARHpkkPMIU6/+WT7mCaAK3XqyrJUvbklLbt9HEq3ilaaZgY3NwdXUJpuBXuOydA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqSKv1k1; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqSKv1k1"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a3cf308c54so443763e87.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255640; x=1775860440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SP4zqkqjRKLeoUHP6c1k+j4ZAt8+4w5ZQwKilBM2gg=;
        b=EqSKv1k1beCfXG7ITevy2N/gVVjdq2gqw+37Svxq560gHKlMQHm0o3O8jNu+OSd3TA
         UBWCE58Q/NxrRgqkWfdrEupW5oeHSknjackgMxxTrJ/chjSEaz0hl4VXus9ZOlrglWY+
         6VtjtWwfX5uTjftJJdViCOsGqqPEbz39Xgxtn167V6kCFEevl1dRyHY8ITaZ7zuKr2uL
         qOaNevaa4e+Lo6pv1lsrQLV/mQavgJvPW9Qiu2nynu7q0+2wQ9FFr6A6Qzx69M8WsdTB
         4H/CYXZx9KP35gOOXDbANpF+SX/LH/TAe0uNyXzzhAI0NnjU0eCLqxA1+B4hyLlI6YE5
         VwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255640; x=1775860440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5SP4zqkqjRKLeoUHP6c1k+j4ZAt8+4w5ZQwKilBM2gg=;
        b=U934aqb6VNQMJUKMiupw+Lwn1PDu4bNWjAEpKX3e8aqt3MKSkDG1LsTTiPYD+z1SEs
         agf4/7bkFWUwFfPSBdLFEO9tD6pQM7uQCxkWf5LETlbgp4NtdWsvvDpTxN8Z4/yubJb1
         e0fo+KA2Jgewp+Uc5+oWIIcpSjAwKMwW1DkYB9Kyv9ihEQ9ThA8fVOahcLHBnA4hQYUj
         4w2t7wM/HcYIjnSKPsdF6lvT2UKGIlddqYVhIM7BLfL8Di6DZ9aviAsAcYqqKQHav2zD
         xSht/PrS38099c8uAvP25pxd6SVw2TerPKicfELHZQCgrfS0XEYHwiwpy8gGxpnlyyIs
         002w==
X-Gm-Message-State: AOJu0Ywzb7tSn3dyasq3oneMeLHDXwMYChoTPL16q+1NH4nF3+EHO5ga
	6L5J0GGvtK0c5qtITk8Ocr9IRpT5pJwyD1r+zPPwK+pW9CXVlBKDQox8
X-Gm-Gg: AeBDievMp67Aqiks28N/fpScn1ESrsp+pLXSDNJAGim1JKIuiLQ7I6AXtpQQIVnDEpq
	6iv5UCl9EQcGBgyvdvgrl7/Rrl2j3efOQlrPV2Iru3hes/r3xsST1JgZdS86cgfiRtQ2LrKW0ne
	nU6W0Sh6b9ojeimDNlx+5AieOzzheoMTvwNPQf280g8Ym+rEB2jdTeZ2WXQ5Y5GYcgT5W3PsWsI
	tS9PWu2YtKhaigylavT6SHtkc1DG0GaYQqkIHazz65fvnRrd8htq3tFuKUxkb8RCeS1nwXmbBKp
	iTYQx92d0enoM0ZPfLAtvZVFQ17Ti7XXoVWt6KTNiZJgERnPhBNKhNFgEp0tOZgvLiv0z28VEs/
	8QtzPjhvqDTTw46BMplahoyk8Hw7wwVAxDthw6BPJUFoPnAuMTLHsi24fwVeomkd+5fu0gC36+y
	ioo2O9FtLa78eSqPM47uNOOub+lmF2B8JD7Tir0ezS4Yw/mGagZ9Pi
X-Received: by 2002:ac2:558b:0:b0:5a3:d100:3c82 with SMTP id 2adb3069b0e04-5a3d1003da8mr178144e87.23.1775255639583;
        Fri, 03 Apr 2026 15:33:59 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd34f0sm1737604e87.76.2026.04.03.15.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:33:57 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 7/7] staging: rtl8723bs: remove space before tab
Date: Sat,  4 Apr 2026 00:33:27 +0200
Message-ID: <20260403223327.1831215-8-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403223327.1831215-1-linus.probert@gmail.com>
References: <20260403223327.1831215-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes a space before tab according to kernel code style.
Discovered using the checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v6: no change
v5: no change
v4: distinct subject
v3: created

 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 4e8980d86965..808ba94a5998 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -31,7 +31,7 @@ enum {
 #define		EFUSE_REPEAT_THRESHOLD_			3
 
 /*  */
-/* 	The following is for BT Efuse definition */
+/*	The following is for BT Efuse definition */
 /*  */
 #define		EFUSE_BT_MAX_MAP_LEN		1024
 #define		EFUSE_MAX_BANK			4
-- 
2.53.0

