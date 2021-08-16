Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376E6D1B
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 23:45:05 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id u16so8775089wrn.5
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 16:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omBY4l9pd9PCHLsGgjxVlkygjoBOXq+wPh3rMM5RV0Y=;
        b=db2ryDw+V4CsofvmNSWr+uZXc6aWntzhWOo41p21fuVk7QBgnP7HyVXDunIgnSQ6ZS
         qXcTzriPKukoTGvCwjSi0GWQwha3+hUZeq+dpGAdZRFp9zysYu+6M0OG3I7nBoE4gHcE
         ffwsdFdQhMvjQdQzGzsXPSjNroJAdtSnuAsC9mDqhfN/rmDR6zj9YHadF6RElpIkJJ36
         cqSz3vc4/gLe+JwGgDHr07pOj2nR2y86zri4yq9BZmT4sxx/NJFoyyM/+6Z5LVjntyVq
         OawCtPrVEScoDxYKPvEUVtIWaAWXrZWqjdtlw2AO+RqtlMBWUoT6lKuFXKKLFzrzyW1n
         Rhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omBY4l9pd9PCHLsGgjxVlkygjoBOXq+wPh3rMM5RV0Y=;
        b=BWgOpl8UrllFjc0js7xSWX/VPMURUSN+Pzl4rnOOxAHdV+ky8cADpz/8MvQL/XAxZW
         qfkWR7scCBLzgPlLRFgVd0EaGq5qzSkodzG/wqfm0el7CQluRdBSHB6xISdnlUUNu12z
         tYYnTHSIVmVqYtb6Si/QgI/Z1cSFKR2HydNT32Yl1sM46NUCmHQwak1H5hI3JKSVRQ2k
         QsOjKiqU6mOlohfja3SuXbcQBi0/iOv6yj2xwIyMNpANFYjCVe9F6896EA4duUJa+Fb7
         DktpxBLYdK4WvChMpZGky2oU2WTz2z1MEaGHsUti4IwayDLN+cNle7yhW8qkqEVw8Cvt
         ZRIw==
X-Gm-Message-State: AOAM5337m34Q9t0miHKcvr1sIpeQWAPLdmhF91FE08PgAkqJQPaUsyBB
	ctY7ljzNmuGsjvhjRi1QuBmpQA==
X-Google-Smtp-Source: ABdhPJxBs0P9i8ccjNS9osD2K8GM8/JASHY3TbS88lGqVmmsfxH/zlq4GmhwqAYagZ6M7eje0JrScA==
X-Received: by 2002:a5d:634a:: with SMTP id b10mr518984wrw.305.1629157504405;
        Mon, 16 Aug 2021 16:45:04 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id w11sm291521wrr.48.2021.08.16.16.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:45:04 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: r8188eu: remove unneeded DBG_88E call from rtl8188e_Add_RateATid
Date: Tue, 17 Aug 2021 00:44:58 +0100
Message-Id: <20210816234459.132239-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816234459.132239-1-phil@philpotter.co.uk>
References: <20210816234459.132239-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneeded DBG_88E macro call from the rtl8188e_Add_RateATid
function in hal/rtl8188e_cmd.c, as it is not particularly clear in my
opinion, and we should strive towards use of existing kernel machinery
for debugging purposes.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 4302054c6c83..77c057e276a5 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -173,9 +173,6 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
 
 	bitmap &= 0x0fffffff;
 
-	DBG_88E("%s=> mac_id:%d, raid:%d, ra_bitmap=0x%x, shortGIrate=0x%02x\n",
-		__func__, macid, raid, bitmap, shortGIrate);
-
 	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, shortGIrate);
 }
 
-- 
2.31.1

