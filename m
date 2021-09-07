Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFAC72
	for <linux-staging@lists.linux.dev>; Tue,  7 Sep 2021 21:09:54 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g21so15789578edw.4
        for <linux-staging@lists.linux.dev>; Tue, 07 Sep 2021 14:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5NPY5Lx+zyVAxeyICgaHLJymUzcNGdqg/vyuIUtGPk=;
        b=Iu6tlX+GEDCEUsHOVOn3+5fVFv58/hsD1/Ux4jYKeo/sTq5OI3T75unevKpEP9aGmR
         VyIFASq5zySOGU3+ajM1DzXfgPDE2o94tu0k+omqRSoWft+pQkktVgAERnRBsRZ698RA
         lLbTIg1nCZZJwWK6G/hW9h1eSENeel/QKUgV8qNdsvDi4D86TftqRjGTtuFsPwrCC5ce
         SC5P8zdgwcYyBcj5KcT9opMmffrA/PoNWbQIn+cEJadmO7E/DIRa6nuBL+VWYXl3JUbg
         r1zDjRf9bTU3wt9UJ5Akze03+2VFYyP4zATlMm0XDKQ5rWoMDC3657sEUFkglEngmb9L
         A5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5NPY5Lx+zyVAxeyICgaHLJymUzcNGdqg/vyuIUtGPk=;
        b=FBgbQC89/bBRsKBBhgcBR6iPYiUNn0fSvGyuaqAdrVFgPfVq6w1DU41q+n6ss2flKP
         ceKYCkbOex1pBTs08I0Y9o8XTUH9Tx7rybiABWm2OuokAoPjbDLneaF58JMZQhlTW0lm
         kcfnhL0ntOa8ykS3yQcj6G/zrfLJAmYzlNuTucLodwPWT9QdUDH935qYJJYa4U/kcr0H
         8yo8NfKiLZPAuF8By660Ug0fwTQvwvQqRrOCFXYU4X9QRa3/iCZV3wGOPFskVAdV5B0u
         cZBK8hSYZIOnAzbUSlFdld6AQiotPY5BGtXfvAYu+7bGJISNVnlPZYjj3zQuIU1X40B+
         m97w==
X-Gm-Message-State: AOAM5339ilzNZPM4ubqY32loM8EGzAvO3yX89UR0gW9xJ9wEuLsZX+fF
	AkBH2lQLhNXD5GW+W0N8nc0=
X-Google-Smtp-Source: ABdhPJwVSUeTQyr7P+n1vnUyQP/tub6I3vOdnMbwGX4zLxEcc/pNmafyuEG66MALY49okk2GNa0FkA==
X-Received: by 2002:a05:6402:2801:: with SMTP id h1mr209390ede.209.1631048993410;
        Tue, 07 Sep 2021 14:09:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::dc38])
        by smtp.gmail.com with ESMTPSA id l7sm107490edb.26.2021.09.07.14.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 14:09:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unused function Hal_ProSetCrystalCap()
Date: Tue,  7 Sep 2021 23:09:24 +0200
Message-Id: <20210907210924.22287-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function Hal_ProSetCrystalCap().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mp.c    | 9 ---------
 drivers/staging/r8188eu/include/rtw_mp.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index dabdd0406f30..82268f754da0 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -924,12 +924,3 @@ void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv)
 exit:
 	;
 }
-
-void Hal_ProSetCrystalCap(struct adapter *pAdapter, u32 CrystalCapVal)
-{
-	CrystalCapVal = CrystalCapVal & 0x3F;
-
-	// write 0x24[16:11] = 0x24[22:17] = CrystalCap
-	PHY_SetBBReg(pAdapter, REG_AFE_XTAL_CTRL, 0x7FF800,
-		     (CrystalCapVal | (CrystalCapVal << 6)));
-}
diff --git a/drivers/staging/r8188eu/include/rtw_mp.h b/drivers/staging/r8188eu/include/rtw_mp.h
index b2befe09d944..73fb6974d076 100644
--- a/drivers/staging/r8188eu/include/rtw_mp.h
+++ b/drivers/staging/r8188eu/include/rtw_mp.h
@@ -466,7 +466,6 @@ void Hal_TriggerRFThermalMeter(struct adapter *pAdapter);
 u8 Hal_ReadRFThermalMeter(struct adapter *pAdapter);
 void Hal_SetCCKContinuousTx(struct adapter *pAdapter, u8 bStart);
 void Hal_SetOFDMContinuousTx(struct adapter *pAdapter, u8 bStart);
-void Hal_ProSetCrystalCap (struct adapter *pAdapter , u32 CrystalCapVal);
 void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv);
 void MP_PHY_SetRFPathSwitch(struct adapter *pAdapter ,bool bMain);
 
-- 
2.33.0

