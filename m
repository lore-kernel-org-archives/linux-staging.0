Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69972
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:40:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o39-20020a05600c512700b002e74638b567so1350217wms.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ds16IXU2vNbsdQO/dc3L1eeaxH+v8TjOAf/ArBE1Ksc=;
        b=NErbtEpsWLPvWPgtqRVHT4IVDgQ2qCI0k8HA0G+A0ZB6+BCnVSMby6IBM4UmZYIw1K
         CAy7lz44pT5+W6F+/LVSY9u0BT0vbLKLULdGVQD+Ivt7E/VlwdDfGRnKED6z6P17dKQT
         DC7llkPrZzZ1oVJSt1jigp96OfgcE5M+cvW5BPMMWLdJGQiUWltAs6UEUpEj0b5zb0/3
         2Yfi6i5wi3HIPvFEcduQQfCIuL1sPjnA0lcmnpzqBJFqOfTYkguyFMafMftkDEwz5g+X
         nLCgE1Fabjvvo0Gg147+RBmmL0QNv0A3SjTo7/KOfyPiNvCQL7nB/u/t49FfeQUOVGwd
         DhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ds16IXU2vNbsdQO/dc3L1eeaxH+v8TjOAf/ArBE1Ksc=;
        b=N0vwhtF6UZzChwWU0uQOcidFlw/IxLvZVcOf8ti8lXBnJK68AQZJtQN8WmOdW4XHlt
         iiFWDLQeJvNHiqkYiWO0VbJscQ3aNCoIKOD6AVrXluIaBduDl9oFxzOwVz9YIvUTjtWz
         mJIYf6ZvuAsvMiToY69uib938wsSnchiKdJovSPCfljITCWe047DJoRCRWmRDWZ9Nj08
         Prf/qI5ZL5MkVxYf412sDlF90DYeooV9UQSzjTC5rvTA46zuBduMC7Te5hjeQur7tCKP
         5qoD2IEDt5spMg+QJ3tJUDcGvQiwf35ufSwJMUwMX50TQPH5h+/2WgeUY2QBjxfVRFRo
         znQw==
X-Gm-Message-State: AOAM530Am+UH+s79R4KNAE90pIU4BJuQvq9HPQZ4k3kyQ4KAmKfSiESR
	leuXpKwjGJZJ1+kL2IrkEtY=
X-Google-Smtp-Source: ABdhPJzgIAS56OsHpK0ht5hesJFnBIORKknDuFnp2OuAXb3F9MI3URJthp+eyQfMtukV2hlfJDJLTQ==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr3007306wmz.93.1630759254463;
        Sat, 04 Sep 2021 05:40:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id j207sm2094071wmj.40.2021.09.04.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:40:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/6] staging: r8188eu: remove wrapper around ReadChipVersion8188E()
Date: Sat,  4 Sep 2021 14:40:31 +0200
Message-Id: <20210904124033.14244-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904124033.14244-1-straube.linux@gmail.com>
References: <20210904124033.14244-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ReadChipVersion8188E() is only called by the wrapper
rtl8188e_read_chip_version(). Rename ReadChipVersion8188E()
to rtl8188e_read_chip_version() and change the return type to
void since the return value is never used.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 24bc8ba8726e..64a0223f0ee0 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1689,7 +1689,7 @@ static int rtl8188e_Efuse_PgPacketWrite(struct adapter *pAdapter, u8 offset, u8
 	return ret;
 }
 
-static struct HAL_VERSION ReadChipVersion8188E(struct adapter *padapter)
+void rtl8188e_read_chip_version(struct adapter *padapter)
 {
 	u32				value32;
 	struct HAL_VERSION		ChipVersion;
@@ -1726,13 +1726,6 @@ static struct HAL_VERSION ReadChipVersion8188E(struct adapter *padapter)
 	}
 
 	MSG_88E("RF_Type is %x!!\n", pHalData->rf_type);
-
-	return ChipVersion;
-}
-
-void rtl8188e_read_chip_version(struct adapter *padapter)
-{
-	ReadChipVersion8188E(padapter);
 }
 
 static void rtl8188e_GetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
-- 
2.33.0

