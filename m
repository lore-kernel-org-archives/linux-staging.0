Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E0279DB5
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425848; cv=none; b=R/IqxZAvq3TAtjBg8dd+hkXLfx0/qPFrvVjA259fTSK+tadx2nimu6qwc3dBdFnXPvjwNy5rBsvl5iGpvooqALvuxKm+IlrSmhgtzBM3D3WyaYxTkDk2VIj8ld7oA8coNj1kEbXeQQV7epVqxdbErw+hthpPwMkABlh5cpoK5sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425848; c=relaxed/simple;
	bh=5n9IQxhQnrtRL0g75FJvXbLi6NKxdrA+D/K1gRh776c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bXjuL0fNHqAb1N18AFiRuSQKgGVc9siHzyVysG0AaqdgIClzDRDfRU1QM3mLrsmsOhN0Hrcz16zP7SDZJrNNsLuoO0R+GJlfadWmmqc2GoROUnLnUv9tZOBVEvqqsih7JJ6gCM962dFdmxzPyjtvHUYUx0/NPRxZGYZXoPMGVyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQAD/6KI; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQAD/6KI"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4d9bcc2368eso15580701cf.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425846; x=1760030646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=517GtrgrBRpB5jbWrmyDvVuILb+G3yKPnRvwoNOqYBg=;
        b=KQAD/6KICiaa2stSlui2J4r89VGu9w1r29HkgJLl/KbITLvFs86Nv0GahGEkfQZuKW
         6evA+tpMgNoxiBiLtsO/Dlm9tRz8wdCK3fXJl0BkThZ+xJL37IV3Zqsb2/JUsvKsZ56W
         Pwn0B1BU8ufdVMAmp7001yDA3d8reIzkNdJoDErFZkDUFaqCciZi2T2/bnREeJ8GSfb6
         y3rbnIY/4/y5SyJi04Ttsu8d0huunD5XsRJgiSp/+uPRgI9DChslOuiH8YrzfEv4nKPo
         MhRQsD8X1elx+CsUIO86B8VKLK3Vdjo2z0B9OrsR4YiGq1qLBgH6HUd8J16k4o6m3v9j
         QIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425846; x=1760030646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=517GtrgrBRpB5jbWrmyDvVuILb+G3yKPnRvwoNOqYBg=;
        b=mBbrYqNzB8EOu73PcDXwWK7mqY6ZdneW+ENV9h461XO1ofVobkc2KZpVbfZjGB+0yF
         SXq3gJor53D79gDd2D8RGfMla+s1UG9Hf6KXUhhaIYO4VSSb6LtlZC8rT1t1nFx6Bt8f
         m6qABXkLaL5Y3tIP8edZkDknof8vzvD5fSRY+A0t7QvKF5JmS2Y+7WndBaMui1T8Sgq2
         p/YUd6mVOGclB9UwM+HPvmHU5xQdvW1ozYS7waBBn+SGNftzysI7B4WTReKTScM3XrSv
         pX7tmpMiZ68o8sN5RaO4wdUqJ+rXL+J1oXMU7r4Tb/DAMhokEuz/pf8md6eYxTLwPRr4
         nsQg==
X-Gm-Message-State: AOJu0YwbwG1OmLHg1613gNXz7727NiZ87titnAaqbQScnZNQGFcTA18K
	6NgluNdklab1DsiF+cihvzpImKF7lS4haQtqB0q3rjge/VGj4zOHFaoK
X-Gm-Gg: ASbGncv11RB/PN9XH7SRctLCKnobhmkvxQPYV2Bjg0GbQyY+yaMfV387HuIGb0CBXSC
	/pQsnC9bZYp3SgOJEn+VrzxNoNawfi8KOuqZO48EPQlaSEecLKBS34GDk+MdAebe78/vg5YmZH/
	yNiJUj0a5LJoOVpSV4NfjJZIrhWv10gIZiYPwwkOiSYSLMyTSfuE/8EIVzDYAgxMBqSgKaCmaLc
	JaoEeOFRcA0fxkxTfukZKKFKGmi0JTFkYs0rd/xozldazkitQjaqYbY7k5lUa2a6AWiIhVEf6U3
	dSbUETAq5UfzCXygn0lIsKRWScubLl1dmLZXTj6+mt5i9rLvjepiRQhu8qrWRBBNKG2zqirRHJF
	ggh+aAsVJJEHWRjuxhWAMEZccCyh3vwukFuvo9aqLeda/mqEqk+Z+LiaixEPU34qfDAUDGMrGIS
	HHNHTOnO5FaA==
X-Google-Smtp-Source: AGHT+IF/k+pp7Xny67XggJRcWmhBUxIPgP+eUxWO7RljDYDoYdWsdWHipLMnddwW7+4lj23MCbNDCA==
X-Received: by 2002:a05:622a:4d0e:b0:4dc:cb40:7078 with SMTP id d75a77b69052e-4e576a3c704mr1717771cf.19.1759425845748;
        Thu, 02 Oct 2025 10:24:05 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:05 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 10/16] staging: rtl8723bs: fix unbalanced braces around conditional blocks
Date: Thu,  2 Oct 2025 17:22:58 +0000
Message-Id: <20251002172304.1083601-11-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Balance braces in conditional blocks to match kernel coding style and
prevent potential confusion. This improves code structure and readability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 34fdef878b51..14015541557d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -785,8 +785,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					} else {
 						pmlmepriv->to_join = true;
 					}
-				} else
+				} else {
 					rtw_indicate_disconnect(adapter);
+				}
 
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 			}
@@ -1674,8 +1675,9 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
-	} else
+	} else {
 		mlme->auto_scan_int_ms = 0; /* disabled */
+	}
 }
 
 static void rtw_auto_scan_handler(struct adapter *padapter)
@@ -2412,9 +2414,10 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
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

