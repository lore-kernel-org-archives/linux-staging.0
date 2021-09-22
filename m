Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE173FCF
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:33 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t7so10279173wrw.13
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BVChltKGC9EKJ6ZNCUk9Hr9373+P2cxLA4AwZGUNypE=;
        b=ks7UbFXPddGoit1PyfGVdeFFpK7T0jZZU8deBjkI1/p4adFx6dPnl606s8aM14lM6+
         Z4WBuzyMiVDBv0v5avwbWu93KZGyR+VRLipvVhP6ksyCEKXfGGcqnSOwwRE3IMzjniIY
         wXTjcEuaDR+eqgZjOaHV00U3sF7go7Lrbh173ufR0RKl3ni0k3bOJNL+GMmFwE+IUUJT
         Uh8CR6DSwz3f6o5o+ABnZCK1dXAJz3Q0xCG2FYMFHHN/5NPnchI1ZNApXncP7C7bXD2D
         id6T0ZdxMtgmYbT14hjcMEKCwyFlKpsMLAQUj3wbZxo4DFNPBHzatKaPzG3Mw8a34mS2
         FuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVChltKGC9EKJ6ZNCUk9Hr9373+P2cxLA4AwZGUNypE=;
        b=gK4lQWd+L5OasobAcXJbl+/IQrV+11khaVdaYjnVkBO6cfsMK2ylyZc8rGtRJ2p0S3
         /3tSKRUr+vyPjhiXcRpEGOylnRyxyqBNjaRhN/TKKOq54lDVQLvvGi5Ru1zMJMRfOaOy
         rAMXUJJyWRVTV9nAYSwarzu8xx/xP3BmUoAP1+zl+zRq9Dbx22MM3YHgTjjn4H9xarF+
         i3/Hh837KAO5JjODznWGAppYf/loetTh4Gcn8OvAPhk5qwJRIj/6S4tyrDLXHMgTMHEC
         DcDi3kJsqXNrGJQwRjWEyrlvD5clwn8rikZE1WanpVcLKNnuYUV4mHGbV7f0OTWGeFry
         Xh3A==
X-Gm-Message-State: AOAM5335p4aFeIS7A3F/RQ9RNILX8ftOuozXZtJMhjW0zIg+zumDJFBf
	B0Kwqry3lTUtA0d38ZVTkCk=
X-Google-Smtp-Source: ABdhPJx5DBJRIE5UzJ7jdRz6HuA1kFkssRIMg1IJcSgKoXg9F/VSF2lc6r9au3FtsX1HN7q8Aoav6w==
X-Received: by 2002:a05:600c:3506:: with SMTP id h6mr880525wmq.62.1632341132323;
        Wed, 22 Sep 2021 13:05:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/47] staging: r8188eu: remove rtw_efuse_map_read()
Date: Wed, 22 Sep 2021 22:03:41 +0200
Message-Id: <20210922200420.9693-9-straube.linux@gmail.com>
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

Function rtw_efuse_map_read() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 18 ------------------
 drivers/staging/r8188eu/include/rtw_efuse.h |  1 -
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 4b97ce488b21..163cfd543ccd 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -226,24 +226,6 @@ void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata)
 	}
 }
 
-u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
-{
-	u16 mapLen = 0;
-
-	rtl8188e_EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
-
-	if ((addr + cnts) > mapLen)
-		return _FAIL;
-
-	rtl8188e_EfusePowerSwitch(padapter, false, true);
-
-	rtl8188e_ReadEFuse(padapter, EFUSE_WIFI, addr, cnts, data, false);
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
index 39b30ee1bae2..2e19b7be1075 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -101,7 +101,6 @@ extern u8 fakeBTEfuseInitMap[];
 extern u8 fakeBTEfuseModifiedMap[];
 /*------------------------Export global variable----------------------------*/
 
-u8 rtw_efuse_map_read(struct adapter *adapter, u16 addr, u16 cnts, u8 *data);
 u8 Efuse_CalculateWordCnts(u8 word_en);
 void ReadEFuseByte(struct adapter *adapter, u16 _offset, u8 *pbuf, bool test);
 u8 efuse_OneByteRead(struct adapter *adapter, u16 addr, u8 *data, bool test);
-- 
2.33.0

