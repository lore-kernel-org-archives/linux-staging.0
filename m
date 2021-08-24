Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6980C29CA
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 07:27:17 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id d16so35930454ljq.4
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ssEJXS5mWPr1Oq2NWHBdclycHEgmiyzEVQ1hB54zJfc=;
        b=EZotiKOWqWceedGd639AfckDcj6us2YrlvptzWSYTRVyNjx2FLWtghZEqPtkup8CHG
         qbzqkFclisobdc8gdgYl1Bn9Oh7j5aNtMSd4uU0+uzNyV1GI+NEgy5BFnJhueonyVnZH
         ctDyoIqBNewyxGT0QZgOfbbOaFIZ1vEmA2hRBgGkJoCeqU4OBDDHx6xyVqgVVjobGmuB
         H+PcspQcvnnt4gWPufvrq+bEAAmpziQznmSR6fZOVnk4NBP4RYZGWk/fukQTCrxpZ9sj
         mXRcj9HC8TRzaS2BGv87MsBd5kGFzSOqQz8Y9T3gd/8S3xecSzlZgJ0R4V0h8/GYZcwl
         c7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ssEJXS5mWPr1Oq2NWHBdclycHEgmiyzEVQ1hB54zJfc=;
        b=c5+7ByGGyRo4woIJaQivcWM6DqQGBgOPE8XzFZDLAfPczpHE8wZpEkh05h7Y0QCwEC
         uilz9UgG5HmWUkZzSvl/YAk+Aab7fjq7c/Mpg0L3rxOLP1m1JvbRWZmELhR2P851RuQ/
         VVgEzBKqxDOCr9Ils3Yhlj0OfL9ZZRy5ouaBf4qoJeHqyORGwxFEFW4TQepVvGFFoqxM
         sK7MV+kiZVpCEKSyD9dk/PluiLWYvWSFg2dQIDfFeutUClNIYzBkfyUhlN4tPUR+v6qL
         J1QQ3os7f+1KwgcLgDY7OWJMdiNhhU4vcyYGvMKn/GRoh3CpHM4q1+zkDUDhi2OIHJSH
         HOdw==
X-Gm-Message-State: AOAM530i02Nc3/jqWtsarBPzU//rcd3fwF8kwHVsJGxY/IamVFEtNNBr
	0ZCqnJuHDVfU+EOKY06ZGMI=
X-Google-Smtp-Source: ABdhPJzf+d3tbE/rt7WNuEWsP2ouaGmBIcwvSl103N0kEFhagfqLaPhigwFZxnAAwOgY873gbtmEOg==
X-Received: by 2002:a2e:b53a:: with SMTP id z26mr30188401ljm.95.1629790035529;
        Tue, 24 Aug 2021 00:27:15 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id l8sm331302lfh.157.2021.08.24.00.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 00:27:15 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 1/6] staging: r8188eu: remove {read,write}_macreg
Date: Tue, 24 Aug 2021 10:27:13 +0300
Message-Id: <d591e29d77da73790c71f7a8e508a8b16fd48f65.1629789580.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629789580.git.paskripkin@gmail.com>
References: <cover.1629789580.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 2 functions are unused, so they can be simply removed

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mp.c    | 39 ------------------------
 drivers/staging/r8188eu/include/rtw_mp.h |  2 --
 2 files changed, 41 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index 93bb683b628f..0a0a24fd37b0 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -7,45 +7,6 @@
 #include "../include/odm_precomp.h"
 #include "../include/rtl8188e_hal.h"
 
-u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz)
-{
-	u32 val = 0;
-
-	switch (sz) {
-	case 1:
-		val = rtw_read8(padapter, addr);
-		break;
-	case 2:
-		val = rtw_read16(padapter, addr);
-		break;
-	case 4:
-		val = rtw_read32(padapter, addr);
-		break;
-	default:
-		val = 0xffffffff;
-		break;
-	}
-
-	return val;
-}
-
-void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz)
-{
-	switch (sz) {
-	case 1:
-		rtw_write8(padapter, addr, (u8)val);
-		break;
-	case 2:
-		rtw_write16(padapter, addr, (u16)val);
-		break;
-	case 4:
-		rtw_write32(padapter, addr, val);
-		break;
-	default:
-		break;
-	}
-}
-
 u32 read_bbreg(struct adapter *padapter, u32 addr, u32 bitmask)
 {
 	return rtw_hal_read_bbreg(padapter, addr, bitmask);
diff --git a/drivers/staging/r8188eu/include/rtw_mp.h b/drivers/staging/r8188eu/include/rtw_mp.h
index b64b16554343..3a259d991348 100644
--- a/drivers/staging/r8188eu/include/rtw_mp.h
+++ b/drivers/staging/r8188eu/include/rtw_mp.h
@@ -410,8 +410,6 @@ void mp_stop_test(struct adapter *padapter);
 u32 _read_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask);
 void _write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask, u32 val);
 
-u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz);
-void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz);
 u32 read_bbreg(struct adapter *padapter, u32 addr, u32 bitmask);
 void write_bbreg(struct adapter *padapter, u32 addr, u32 bitmask, u32 val);
 u32 read_rfreg(struct adapter *padapter, u8 rfpath, u32 addr);
-- 
2.32.0

