Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5033872623
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 04:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778992541; cv=none; b=bLa8cUv1GOER7SDMEEluy7x00S58EK8jAKNucqmAQg2fq4GHXznnRXY3tfIfs6LWkF0Ev/YwTFdHxhXYpqwWzjG+Maxck7chQI/r91v+1b6WP5L98qWd8/UGD5EATD5r8AsJnDtnsGcco2Ag1TWetnkGkhVICBnGBcVr8v0G7Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778992541; c=relaxed/simple;
	bh=jAUFVJlwSkUvYLej5lDWUfcdWmjy/T72TyTmC+yTU8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dysKDBW1HX0wIa14NZHJ4y66oJlIssSPTPsRxlC0TlquAjfiKwjncI0UwsaBBar10UY0qjUqDVtTETQRQNJw0S3PTC9ijqVHq5CFWWzVx34FLIVHEB31s8W0AF4f/RCDExxeFWuivJI6ir5UpQodZLnaluUAB+gO9AXuJxa6dRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/9cPASx; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/9cPASx"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e4004a4a6fso1396199a34.1
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 21:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778992539; x=1779597339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9R3JzuwDhapmoRuetkhs7VNnYfvYfnExgTfN7cfW74o=;
        b=f/9cPASxfMWf4toObJQF5yaRfH2MrG+cQNKtSi8wKAl+3GPZLG+NCTP00nxVUDFAq5
         XNv9TeC978W4tsc+C1lLVbNNfN0DRXen//PBMJlgd1uc9ZnFk3KY/ppB9cn2NhpOtDS6
         XV/I1InmNm24dCDXRCrQCG11DShlctE3KTHEryd8Smxqkgl05SBqa+8WH2v2Cd4YLN0x
         DpZjH3vk7tWvm1scJoT9jq3t5bO5h5TPh04isPOWhJNSXoWJDg3c1qe94WrCUGQfCIay
         IyK0hCNOVemcZ9MtCenuGIRR3IJPfE4UEWvlmqePSOcWscxScDbo2YGWAk4VHoc90z9b
         Nt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778992539; x=1779597339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9R3JzuwDhapmoRuetkhs7VNnYfvYfnExgTfN7cfW74o=;
        b=p2F7symjRjPoe7zkCHEQ19VkW3O9x7J2iHAyJEChT2WUcTH7yavCipAIyV13nSMA9k
         1swUVGG2B8vfzmm5TUzhTURDPMxFEbd62SHl1fFjvIy5nKTJgUcN87In4iDxICf5MYkO
         jSMALArLJcHB3yrSS2LIRUE1QH3F7rYjudfXTATE0pwPwYU+xsPemQmRMdTfI0ZqdQDT
         SL4mZteKaOcI49QpeKsLkKnmVxaupmzW4KsaP6d0cSmbHTm+W2OG6KWpvKLmJW7WRGSx
         OL4iTn0v+Lyruzl1nVQ8nIq6JHFDneVMRc1mFvSDN+lcU9FM6oHoeNFezsgdGeCw3r7m
         nsPQ==
X-Gm-Message-State: AOJu0YypsFEL4SKweJlwmt+PgD/I2nyK38DIpKJtj/Sx7+eNrEusCu+B
	9OoYlmzuzcq9s1bvbZQoOMCISw8fcUSbXbF0jTP/EEYxvI/a1Kth5vi7
X-Gm-Gg: Acq92OGV0usxtSdkYJwKpnlbXdSV5pK73dU8fjQEEhXer4qgvrLDiUTKClKIU3u43Z/
	2hHdH/vTAgmZSmU2DzBKNI/96RLYZAphfKNl4rbEmqJIq+XWgbGhcm5bS20ENChO/6MN0mJQ53N
	tMBZPkWCRJDRALSQlbjk+HJekgZkv3DRGeO+2E2JZoG+lfbaU8niyiDtJ8QUa3/xNxtYxwHzCWM
	WgqTHTv56dltQKwJIqDd2xzRwhTDR+5T+iW34Gwt7u9nuJNALZfG0jZc6bM883kT/+IqtR18q36
	rv2QmS4K4Dph5GncWM6Akf2MzhPmaIjOvUiJSi/EIv7BcSvKZGpe025djBVEfgMVUEZGeHq9ZKo
	OIsVWeOPx79wjRMWLiTNtPJqNB+Mc8brvioEBLVcw6iTVUR+ZfoFb1x4E6tErp1d4rQRxNPjx4x
	NscUv7aQ3R5CU+g5l5bCiwl8Tco2hq2NM=
X-Received: by 2002:a05:6830:6106:b0:7dc:e45a:adda with SMTP id 46e09a7af769-7e4f2b6e6ccmr6643463a34.19.1778992539319;
        Sat, 16 May 2026 21:35:39 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:a314:9972:40f1:1f4d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55bbd0be3sm4996317a34.15.2026.05.16.21.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 21:35:38 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant comparison with true
Date: Sat, 16 May 2026 22:35:20 -0600
Message-ID: <20260517043520.47423-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clean up the checkpatch.pl check: "Using comparison to true is
error prone". Evaluating the boolean variable directly is preferred
and more idiomatic in the Linux kernel.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 07a6db1d2..349b27f91 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -531,7 +531,7 @@ u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, mac_addr, ETH_ALEN))
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				match = true;
 				break;
 			}
-- 
2.43.0

