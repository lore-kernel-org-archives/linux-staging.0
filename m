Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6C95F
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:31:07 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id x7so5287751wrw.10
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H7gV2Io75BmHpwhQaw6NovithxcDv0ix+Sn60I7HwJo=;
        b=pKGiotCcrQz5pFszeTD6f9yDGZSlaGCS3aqLvuhtA3bKa1tJgaHoEHvi3flxL/J0Ee
         8MTLml3KZviC8nKyEiyZ+jqrSJtyaC07UsA06nrfet538QtXSIIvGMsLtZFLUTq2bMMI
         lfnAvWknnEiUAnPG38Ha/+ueXLeggua+hpahSCaUZ4aLqUcJLQkCap8SvLdB0cunmvg8
         HAIgzI11uk2P3cUNPIwq/xsAITEeY/BguojAV6kr+KPz1zQblmClZlZM+M+Ux1Am6W93
         dnvfi79Kg2HDRMGq6DfHlwi8h3CW/uC3Vw0o/Dgelumh2SyVhEh1NfTgxxw/3PS5anUV
         aN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H7gV2Io75BmHpwhQaw6NovithxcDv0ix+Sn60I7HwJo=;
        b=nB0QDuJ4qEu6UnsJDW3GHFz632h8ZYUpMXFiTsxK1FC/6BxHCRTS4fjc7bFqouyRoS
         lMyTKXxSfH5gwL6xMeukLQvUvlyWMX26scVCxO4m2qi0zcrwCq9mXnXesDclqxfnwq02
         yNkj/L5wd7EvuAdZo9GtKX51Oz84wFG1tCnEiFpI6QS6kuzbVMptQakqLG8BAHK+PrYv
         oHezH6le6/wqLxFKuAcJ771xbpbUFKvpJJ0CZZN0xzRJO6ccSJw75SxGkT5rK7udwwsU
         vltSGFU+GLoLbtX7NYVq97QlTD3/eOAnroOnbOcc6T7RamPYlFOcvYXd1n47d9EShd9M
         EVjg==
X-Gm-Message-State: AOAM5329tKSXqX1Pzv6/8cIt0sCPcHUSu6ToFVQPIdfkO/aY/5kxXuZu
	Lddzca0ipa8Os3PQasTip8I=
X-Google-Smtp-Source: ABdhPJwj3qNDgK5LiKlA2HmtBn18REMsm+NuhHHnNLSvlO44ziCBPkiyaZwQv5wG/SLX3ue/Atwsgg==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr15992886wrq.116.1617384665895;
        Fri, 02 Apr 2021 10:31:05 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id u9sm12408511wmc.38.2021.04.02.10.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:31:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 30/30] staging: rtl8723bs: add spaces around operators
Date: Fri,  2 Apr 2021 19:30:12 +0200
Message-Id: <c79d3561d861f59c23e251b28da7934b20b7e096.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issues:

CHECK: spaces preferred around that '+' (ctx:VxV)
161: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:648:
+			*wpa_len = in_ie[cnt+1]+2;
 			                    ^

CHECK: spaces preferred around that '+' (ctx:VxV)
161: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:648:
+			*wpa_len = in_ie[cnt+1]+2;
 			                       ^

CHECK: spaces preferred around that '+' (ctx:VxV)
162: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:649:
+			cnt += in_ie[cnt+1]+2;  /* get next */
 			                ^

CHECK: spaces preferred around that '+' (ctx:VxV)
162: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:649:
+			cnt += in_ie[cnt+1]+2;  /* get next */
 			                   ^

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index eb2058f2d139..a0d664e254a8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -645,8 +645,8 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 			if (wpa_ie)
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
 
-			*wpa_len = in_ie[cnt+1]+2;
-			cnt += in_ie[cnt+1]+2;  /* get next */
+			*wpa_len = in_ie[cnt + 1] + 2;
+			cnt += in_ie[cnt + 1] + 2;  /* get next */
 		} else {
 			if (authmode == WLAN_EID_RSN) {
 				if (rsn_ie)
-- 
2.20.1

