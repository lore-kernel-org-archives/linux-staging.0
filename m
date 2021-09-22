Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147783FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:33 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id u18so10419127wrg.5
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1P1gqXNu3vCPl5xPAOjYrMlPBx+j2k44ybuqnwvTH0=;
        b=YaN/VRWdUHm4KFO6EmBYmQV0ORRL1DdPlyz9ckP8LBptgmenmwPuLxBdLPPz2Kvqhw
         o0lMRD3LUO7gN1HK6SqOEasDNlVTFAVbqkwFtnmfVCaoRCZ6c/GbRG7oZvU6CQi8g+ID
         XpGo14Jh+IRMCRcJaEqP9HyXg45ZNWRZ0q3orGJHCCc/cVmGmmay9CO/P9MXajZpuNro
         iMuOejeJ59izumM0o1J8Y7iRXiVKKJzeaJ16006nkRifYmir9lPMnD89qoyki7n3NUMM
         Pe6a7ORJyN5ZAso61tXzaUVVS9gMki/Gs/9VA5iQc3gJfIBgot+DA70NmgYcS6pUkTUm
         ym7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1P1gqXNu3vCPl5xPAOjYrMlPBx+j2k44ybuqnwvTH0=;
        b=tyg/m2JXgj9Ojj8MCqpIJ0W31+vojgjBJ/FjhkbX3QXJlhKx8C3+NFurfICBRdt4j8
         eBVdGhMDgl0TFmedUzviAFnFaGL+2BBIDmQoa2zmTvDjMWv1Y93LsyMC0Xg5J4UfXOzF
         SXz+T6BHtE/eGPhhNCMCWsO977SEB3HrI8fWTmuTFnEXbpAsLMBrz7za38h4O9KDx1Qq
         jdkQq3Rq2t62ZimaUMez08Y8KA//NWm1wE6nikqJeuzftbp1lpo29DGeqFJXviD3K3bm
         UlQIHwUWKrtR+bs3Q+bAXkgCY45EVLaWdRsPSBM7cL6Qjn1bC6LrkYkVehlXM7Q2p6ts
         r1CA==
X-Gm-Message-State: AOAM5327THppkbKFfECZAZW7XBXsXtJ35/ohh8bKoI1NCT4qfTnuYzlE
	w0bkUO28kyBcYI91O0E1K+w=
X-Google-Smtp-Source: ABdhPJwZp2dd7bbQmrzXX6Cjnanyqd6boEs18l3H6SaTHBpDAV50i+2DkQL927Z583x8iyMqb48M/Q==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr921930wrr.246.1632341131455;
        Wed, 22 Sep 2021 13:05:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/47] staging: r8188eu: remove rtw_BT_efuse_map_read()
Date: Wed, 22 Sep 2021 22:03:40 +0200
Message-Id: <20210922200420.9693-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_BT_efuse_map_read() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 18 ------------------
 drivers/staging/r8188eu/include/rtw_efuse.h |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index a55e4861054c..4b97ce488b21 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -244,24 +244,6 @@ u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 	return _SUCCESS;
 }
 
-u8 rtw_BT_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
-{
-	u16 mapLen = 0;
-
-	rtl8188e_EFUSE_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
-
-	if ((addr + cnts) > mapLen)
-		return _FAIL;
-
-	rtl8188e_EfusePowerSwitch(padapter, false, true);
-
-	rtl8188e_ReadEFuse(padapter, EFUSE_BT, addr, cnts, data, false);
-
-	rtl8188e_EfusePowerSwitch(padapter, false, false);
-
-	return _SUCCESS;
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	Efuse_ReadAllMap
  *
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index c7ce63985c7a..39b30ee1bae2 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -102,8 +102,6 @@ extern u8 fakeBTEfuseModifiedMap[];
 /*------------------------Export global variable----------------------------*/
 
 u8 rtw_efuse_map_read(struct adapter *adapter, u16 addr, u16 cnts, u8 *data);
-u8 rtw_BT_efuse_map_read(struct adapter *adapter, u16 addr,
-			 u16 cnts, u8 *data);
 u8 Efuse_CalculateWordCnts(u8 word_en);
 void ReadEFuseByte(struct adapter *adapter, u16 _offset, u8 *pbuf, bool test);
 u8 efuse_OneByteRead(struct adapter *adapter, u16 addr, u8 *data, bool test);
-- 
2.33.0

