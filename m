Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1D36998A
	for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785057883; cv=none; b=bx6QZCe3ET2f3JthE1ZRSPXjHyVKjm1ulhg5DZdUQ9ElH0vq/AfxSLykkqVwwwUPRQu5FH1E42zB1SLjjZNwws0PpvsPo+2w8OtroQt6C/pC2o/6uYlMKn6iQR29slKlD8lS1RZ6fb5CMurSAXRTvPIfMG6/Q/HAd3pEaR1eWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785057883; c=relaxed/simple;
	bh=SbNbsaMeHaPyAhVrqZ62BhpN7+eu3wK0UPLae7NoGhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vGRREsNE3cwLEPFeM8Iw3DOXIuxV+xmuT2sf/wtjs5sAR4YC9hggDTOrJCcNqTxxSCksrqzFOxEXv/mBGDUS0kKjkVNNuoVxx7+MXwtT/UUbsY2AoM8slHPr6nXqXD+/qdE0HxNl3r+SNxyZcFWrKy71K5nBdKrpRyO11NZDwfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx7r6nPq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx7r6nPq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1668526a91.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785057882; x=1785662682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbMGOrQGeS4sFeL91YEW8y2nktryR+4ahz7YvnYUPQk=;
        b=Nx7r6nPqakYzoe/7FqZdoyfmVWWdRIlgV5f6ohrKI69qxgOlQy/1Inl/eoeRq9tngf
         VuWKskUetbaT4n6oAncgw4l9mU8DX1mSZD3qmdaIR7AfTFbTv4dMy4oW6KM0XNB9HCBP
         6vKeGMWdVZ97q34qwpSeVgxxDgTbv5RaPGiXKq2u2hO050avatzj/DcHH0gAFSzdjfpB
         FopxsUq3tSBuX9VdGtdwXxrm8Us3O9awkxmaaIbotpLl3pfXVZ5Bm7MNyjoLXdEZebO8
         tbMapITVMAT6VmPAntznSa/ptewnQXA0cUt3GqBdNJGJaBV7202qOitCbrocfgBYb9Rd
         VHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785057882; x=1785662682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbMGOrQGeS4sFeL91YEW8y2nktryR+4ahz7YvnYUPQk=;
        b=m0P1lhlbHdayjZcNK5kd3CeH9P3OIBRFwYfQplc+2bwZc2rPKMk4UVX8f2J4kvqjor
         v4bmobxJ16ObvUZgFwWu5jjxRe616lgMVoXFA5bZ4lAO/wYkxSlLFFNJ+2TlyI5NNjw5
         xJLLjheVKVjrJjhmEmmMTfOKYJFdvsiLTyzj+IMoTffqDTFWElRbClOrIWAvplFsJgSD
         06sm2/WXfl/Rt4Jp8+uwUi4lYaVQrljYOSGPoCsdLst4rRCg64hqlpWfGGMyFKaUGnT4
         7pgLbcRcwqJEfF321992LrPc5JPOJ+ekL7nKCCogl7v7BdsU3W/uPvkIAajQbfGidTff
         uGRw==
X-Gm-Message-State: AOJu0Yw2H6KrTo75VNbKJoLZE6itxE20v0Q3TJf3IvxUn9rmQxU0me1d
	xd5t2ENhzdQpq32+IXTRmZHuFIiJ6euUrS9ILdadUy9wvM41/96stY18
X-Gm-Gg: AR+sD13wMC5kkK7IAWidXsKkd8w715IValfbht8ZuBayxebZHX1CUdxrPbQZHsxBOQz
	NuK5ne8WZuMO5CEwM3PNxtnwseBO5+1Di6ZBvvqSCCwogTbhUA+gJIVkaq7litKEb+Kc/pKbdl3
	BObli3ihBkyOhTVRZ50nsDZwcQzJGHAh2knhJoveVcmDZIYB6Y+EZVxBwsV8sctxe8sbdQqaS+o
	XBjmN5V4smPby1D8xx3mveS/4pQuCoNxeht9heSoxlKtPZ53VmNkdoFuH8lzb9KHiWlO7PXjOQl
	U+g+HU0PffGl7EEcQWpBKulEmaRETawx3ZkRC4KKEpijsNwg+QWj/o0ol7k48flXJ2uEn+yrKnU
	W/cBXKcHRulq1jgeG5khVtbBzTm8rRoH+B8qOzoVowXDVnTS8LKXsYW8m88KYz8nrpvfQPWXBRe
	1rZjfk6NhbyoGZ
X-Received: by 2002:a17:90a:d00d:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38f2965eb33mr3829739a91.33.1785057881878;
        Sun, 26 Jul 2026 02:24:41 -0700 (PDT)
Received: from ArchLinux.localdomain ([115.76.55.213])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13002f39sm43639698c88.1.2026.07.26.02.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 02:24:41 -0700 (PDT)
From: Dang Vu Duc Hien <dvdh12707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dang Vu Duc Hien <dvdh12707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces
Date: Sun, 26 Jul 2026 16:23:19 +0700
Message-ID: <20260726092319.529566-1-dvdh12707@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning:
"WARNING: braces {} are not necessary for single statement blocks"
in rtw_wlan_util.c.

The if-statement only contains one line of code. Remove the redundant
pair of braces to comply with the kernel coding style.

Signed-off-by: Dang Vu Duc Hien <dvdh12707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index a4de53872..f107304eb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
-	if (dvobj->oper_channel != ch) {
+	if (dvobj->oper_channel != ch)
 		dvobj->on_oper_ch_time = jiffies;
-	}
 
 	dvobj->oper_channel = ch;
 }
-- 
2.54.0

