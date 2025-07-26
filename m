Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A785219317
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504439; cv=none; b=oBpuWGcp1BrNk+JpfaTsT3xLjpll5EZDeqlvdMb9vWUlOpPhPRNSGsz/rjkFNCgK6kYBSy1K47DcWgoyKZ/T73wUQwgOO8gXMXSLMp+JBIeqcav3DXV2ZZpb/xhM5dlhHuYSHhJU6rZ9zS1WhVqjFba4ECEADfHai0CgY0YybqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504439; c=relaxed/simple;
	bh=bHpCkXw2jAUbdB0APKtn+P8IbyPZtBP4nbGI46DyLuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iOUTvKRIe6BR3kEcKziar7IOLEMtUX5OUQJFtEc4fjbN4viiehzaxiqRrPBh9SUB/of/g1tdiBzwq7Xd8l36PANBnxXcLqMqedgzMpR4668Yp4xX9XXANdn0v0yJC7ppPz1unt4gQM8jE+QoWBF3/yGPtZ4+mEeePneoaD4Kmj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOwBNMDz; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOwBNMDz"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e29d5f7672so248373685a.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504437; x=1754109237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63m/SWyED5sYk+Oa2JkBziHJjgzvSnwpbvgqu5JEyLM=;
        b=lOwBNMDzUwPlStXiGQeQA2j65Z5UEzVwZHyDabShAg/keIwj5LYGLXANYfPxreeqmr
         lK5iyzjmMO8Imw5mdYY3kC+JPV2+oOgCcHEe73d5n9h89aQDXatkHdnoiRVs5Mzn8B1E
         XWunrZdyVjp6dY/3vcdxnAN8jvi0Xx+Z3YOzeWlt/9AyBJc+zwONlZliTIRxzebVHjjQ
         nh25kszM8KORLBdXmoWRol5nc9Oz23L5dgXX6g2+cWnl8TSdyCFxwxngU3L6PoXhne3p
         084YoxBSZTnhhQWL7wM4cqd5//Cjnqr02o5Zi5/eeHfTItuMLoaUUr/G0Ag2N/Id3Z+Q
         NnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504437; x=1754109237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63m/SWyED5sYk+Oa2JkBziHJjgzvSnwpbvgqu5JEyLM=;
        b=GVg14roRp37XGgyedvVA3v3DZDQzOB+Qs1c/90mzi3RMLm+OQqeViwE273WpBVH0R8
         eqtXKyhJYXMNMV6kLUozPqLAyKhFS0xZAcjLs6MkNgn+ZeJObkogwvqlhhAbdBom5g0w
         Y3Vzl6x5AdDbz+hKwBrxZzQZUcA0P/WX9bqqahYSCc1L4jmZv7Ysfd8Z/5lgV4MCm6oG
         /1L3EJOFV0w0sf/s7CaLZV8wlOS8491rbwnAQGamDxsznt+J7zgYk6XvxNKzchKCmck1
         a1eE+Wn93k2uyHF6xpvqlL7xndqgWSg/WUjZHOO7vwbgZmaodVNrG8kVuAMHNWRJDqtX
         SgUw==
X-Gm-Message-State: AOJu0YycnltTGZYnZTryOKv8O+qUx+wQ4P55HQePqBY8byVUgvx6TrSU
	mjeOGkjJu31M52MU1j6rB1EDfzCkk8AFl8TO1YRYmz3HyAzLQhvh1tqS
X-Gm-Gg: ASbGnctl+Utv9jU7eR0UQUJuSm6AQSpssEd7WLF4XG43nmKZ8dWu9ZVRBdjalf1eGhB
	rcmvAzw+uLFRoWV7C58GeWr+KMhKcuW+KWU+mwUeTZcInBcsMj1AMmQIb9eyZd+P9rtyWO0qnhe
	DVaA1Tudbjb89vtj5B0x4CK9v+p6n/Q4MQRBOkUwL12gzeoYqzhUcObOpqdKJq6JMXiSHlVHVbO
	v0cTAcf3iYpMzKY0EDV+sy1+wZeUID0I9eSrXUYpklC6arDH901ePZWUkne8cLwNMZ8ur4b2ISx
	wgat5EaBrsWSkRj3fzxV2URMZi1GtYaqBwVsqFaAhKT+78Atuk+Ax9hUPxn0idHtovb7vMmGpoB
	Uu80CH1d4OGudK7kAYoR5igi/M2Uy0DaWsKbTh6paj57h9Kq1jp4qLaw/9YxfUg==
X-Google-Smtp-Source: AGHT+IGoCI3vD+pDpwPHdI/MTAevkKbu28bSsdg2wSHhYsvByghAdZ5a+1YJUELp9vOMzDuwhZjohg==
X-Received: by 2002:a05:620a:370d:b0:7d3:f17d:10c8 with SMTP id af79cd13be357-7e63bf9d6d5mr613157185a.43.1753504436927;
        Fri, 25 Jul 2025 21:33:56 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:56 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 13/20] staging: rtl8723bs: fix unbalanced braces around conditional blocks
Date: Sat, 26 Jul 2025 04:32:11 +0000
Message-Id: <20250726043218.386738-14-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed improperly balanced braces around conditional blocks to match
kernel coding style and prevent potential confusion. This improves
code structure and readability without changing logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0679253355fb..3702d7e7a954 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -758,8 +758,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					} else {
 						pmlmepriv->to_join = true;
 					}
-				} else
+				} else {
 					rtw_indicate_disconnect(adapter);
+				}
 
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 			}
@@ -1578,8 +1579,9 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
-	} else
+	} else {
 		mlme->auto_scan_int_ms = 0; /* disabled */
+	}
 }
 
 static void rtw_auto_scan_handler(struct adapter *padapter)
@@ -2281,9 +2283,10 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
 			operation_bw = padapter->mlmeextpriv.cur_bwmode;
 			if (operation_bw > CHANNEL_WIDTH_40)
 				operation_bw = CHANNEL_WIDTH_40;
-		} else
+		} else {
 			/* TDLS: TODO 40? */
 			operation_bw = CHANNEL_WIDTH_40;
+		}
 	} else {
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
-- 
2.39.5

