Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9B91CD1E4
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949183; cv=none; b=Sg+zsR2I5FBO9GqXshErRf7sl/b/QbhhKFuyMxSE3Cqp7BqaeCvYDA+AxCKm+OrhUJt6jtJ52WD3BtEA0d1TGGF+yyKpM3+WVQC4ohl+9ka/4LgDqaJn+I4oqGtlUd7cL+gi0mJkL1m08JLe1qIcknPb46B/oBoxQrlkbWd7R24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949183; c=relaxed/simple;
	bh=JmI3rvfGEf1Z1riF8sZuENvE+ZlBl4htm6xrdJ3xaEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Opjxp8gucxKe4+TUUhPKjt1CHtJCJmaebbfidvetausrumeJKGDuHjNsZRYC+z6shq8aRSroD6ETSxMRoFtPvoifYfon3n69z2O4NSwiFFGcS1yVdTVLvgRKatcbkCNNISocz930BoiBslrWclOvjSsWCEQLxJpPZ/09JwyQ/r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzpyKSvM; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzpyKSvM"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-7291d89185fso567386d6.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949181; x=1757553981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=420xhJpXeiS8O0VHfKZK4Z2TaOUNPYgxom/AXLmk2uA=;
        b=bzpyKSvM8e1UuH6+ziORR2/ifuLMqAHOz9kGd6XNKVlpN3i7O9+Sftl4xFbvC7mpP9
         O5HJDhk8Un+2pBGoiSgY7Q3XJyvHqt2bgk/6EGIy7yR38fo7I26elLwM80ZNakDI89aj
         RplJ3Bgra2NiF5Smz1imRG7KcmXma1/9xGTHHMkV7hjs1K5U4PRTpSoVbxiG1pUPuEU2
         aJMWqf1zTDKV0iJ+9c57HA8EDSGXWiwkXhe4Qk+qO+NbHCp+kW/jiAEg0rS5HucUj60d
         pkWYzzLGAq3O48qBVZB0WGj0leJqXuv0QSNzp/ian0G+Lp/ygExVNM9PH9UMjuyM9vDk
         ygDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949181; x=1757553981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=420xhJpXeiS8O0VHfKZK4Z2TaOUNPYgxom/AXLmk2uA=;
        b=LdM5mjoENkkBEYjXiDfEJiovDoSiYLtG80gMeHVsA+0KsdclEsP3t4J8d0ZuqtN130
         2Yo9xyBu/UDYgKm5ShERcYDo3WQjUenaY3OcQS5inBp8KNep8ccJqlZ8M79f4sHCtRFI
         rPqKWkyizcBkrlFs0IFHZM2fXrrPUIAGW7YC1sw9As+BD8K+lCg3k1BMbxqU0Ju0DDsh
         eIYGGS9b0lxoqYn9czC9kcsHmgx66/AdFpAicV9m02c3myHoP8g+HHwB3hVAAYXprgv4
         BhVId18Jpdp7WpD1v7iPY43ZUG7zIAHG1nO5NDculw3BZrWAU4mBJSjiJagDZAXg/b7y
         D7tA==
X-Gm-Message-State: AOJu0YxpIlAiqA1h5h2PhCSPw7j8jUdhvBCNoQCsK8TjUR+A0TDiwjmt
	p18k1UFyz6rxrPohxvTQr2aMHflxTC6ULr9mQLEW8nVUqEgxvVce+Hut
X-Gm-Gg: ASbGncs0Uzki5EcWBk7pyrYwHSIoaSzV68wj26uajZFUHf/3twqEMiT98QJYigMvAxk
	2RHeuCfbwYlgv0Eldpvw9W5lO0fThLZtd5znu/NbDBBquZMKfIgoxQjmD0oy7h7NZxnci+CYK6x
	pNdP7Zhf5P7A32KgCHdxC4Ir+1CzgnGfxuaNu+clvXTtbHpSDXlxYsUryLMiyDwbii7s2/k0EFL
	NPbgLLrE4As42E0Wm7gDEvmbtqgUQ31J8CE56kyD2w4V2otnON140GQrSOYiOcHHpklCQtdcH2h
	w7hs1375Nx+g7dtHwXhCyTdRZXUDyn3MOXRLRGVQR7PERz9as1/9k8YMEgKG9PujahOdn/iumWt
	hmFXVUVd9uvc56xgyH6zkaFJDq5GEUFDhmJ98K9CCxGLaik/m/+xcRkSdOaXxHg==
X-Google-Smtp-Source: AGHT+IFdg4kYXNK2wp5imxm6qx0TMPC9UbGNFWAN6Hjfu1048qdbbG8CCwPTamkhoRkHUACqjcoF2w==
X-Received: by 2002:a05:6214:20a7:b0:719:263c:a5d4 with SMTP id 6a1803df08f44-719263ca915mr148729196d6.47.1756949180862;
        Wed, 03 Sep 2025 18:26:20 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faf5sm38423266d6.65.2025.09.03.18.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:26:20 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 02/16] staging: rtl8723bs: remove unnecessary space after type cast
Date: Thu,  4 Sep 2025 01:25:22 +0000
Message-Id: <20250904012529.215521-3-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
References: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary space between the cast and the variable
in two instances of type casting. Improve code consistency
and align with the Linux kernel coding style guidelines.

No functional changes made.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 516e736d03f1..43244e950faa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1101,7 +1101,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
 									(cur_network->network.ie_length));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8)cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -2547,7 +2547,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
-			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
+			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);
 		}
 	}
 }
-- 
2.39.5

