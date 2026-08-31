Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24631357CE8
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141972; cv=none; b=QjseT55TzGASjqUTrANQ0+UazXW8hXnVtfpRl7h7Cj6scYDifYiGIKpxcxcaiWOlQFNzNUjoCN5heJRHSYgELo79S9Xgm8K+lQN5AfeuYAQXYcOe+kRf/vWYfAcCahZn4PRaqHiqs5OItk4fK/b3uFGIIQBofWxifheV8303KfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141972; c=relaxed/simple;
	bh=VpXWm5ulIHFlOpRF0JdshgXcoSIZ3g3Xr07omjN/dro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLcjmN2ix2aKv+q7F9qnYGBE78iDbV5QBH7u2m7WwoD9IjzreAaw6KaHn29okKFTHNGDRhbUCdpMwtKMsGXjS/XM0qlIIj6NPRsoQoHCyy9VL5KYX1YqoKnzAI2Pkhm6nnapgxgPSVgIeEFXS2tcz+KaDPmbWTPINO9C0A6ZJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaJGGtUs; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaJGGtUs"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97cb5850a93so1146059241.0
        for <linux-staging@lists.linux.dev>; Sun, 30 Aug 2026 19:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788141970; x=1788746770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez4tXk3+nHtH64QDv7vPUDcEC3LRkEzDgfB6M+1BVNI=;
        b=gaJGGtUsE+1yuqMQcceI3Y+ssTMa9Armj2tj0PmB9AmZzwUXgNdp8VZlvA+qe0p7Bc
         iavUX9zVyrEXowf6Rblk4W8jUxRAU6YUQ/+xB88LRpXR7WBE430VwJrv9h4mwF1A2UaG
         B6acfNmDfy8JUvEQdOWe/ykW5+a26bTYZkWLX+PQtjHMh5FE+z932gsJ/7FHFmgM5aIJ
         PKhyWIVl7yP7Ap9+CC/k69zwrsPEuv+roZiBXle5qJcYbW/aRNJp1W7+lx5onBSAy0To
         sFGvob4af7WS0AevbPWs85C+hWar/IT9Uf3ggHluevN0eVVJnaVyeEbxteGTI+5DtfQ7
         vyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141970; x=1788746770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ez4tXk3+nHtH64QDv7vPUDcEC3LRkEzDgfB6M+1BVNI=;
        b=UJGSPUyxQbW3XqynGqlzdm6Cs97ynJHH2dKAJ8O+nD2et9lEZqsyR1RP58HD04vCbK
         vhtLubBHV3PYPON/h0LDqYLqWMughS62Df3M32bRMFzyyhYV3EznOvriWgTRMUhGPGt7
         SQcGlVexMmyEGDyPBSEA1nkj1RNqZFikf9rFtIbTA5Hi6Bnq4dWq08yEN90jrtE3r241
         iApyu1cENkGqIl/IHmkTOcCXRwl8siLixGKVc9GWvkC4bv8vdIZw3X+7IjsvrEKuxCmx
         PGNG7IEsK2xXuUcZYBvA2HmDE/tvJ3L1pHhDgzxsiQFNR4dm+/7u0gF0mbcqAufXm9CX
         7KWA==
X-Gm-Message-State: AFuF++nXcAyaYrbR/aX9QFswbU9Jx68S4rR5xa1oLveWvF5on/g/smwK
	VuakxFkjJXej/HwbqrawiZg4jc2tbW4la++MJ3AsNLSHjw63flaIVrg0YN1q7V9N
X-Gm-Gg: AR+sD13shqOg9plbLRtjHieIXHdAZk1VKHJhaLqc3adD6vIKCNXUFr305ClQ4o5KeA/
	htGTyFWEMOnVFurMPsnbx3TdorajQV/y38c2kmKkZs06gMsj/P7MDyRfrKIPel7gwoBl36Qy/BT
	TRRM1fx+mwSQeHBmjfvpR0nBcNSXz/pisG8NuU6zuMwNHMzUfhxhCp0NvEvbAFPZH4rge8VQ6O8
	cnIgpqlLhu7FQUtA5L9r/ukcaUkcDk9ujHXbzDHjLQpg4MTnrjMPdWXikqb2qjuq3CtLylz5tRc
	YEZ8i2RKzfH6pnAwxGrSa5V1OivCfYXv3G2o5LnvqnRbJK/AlFFWy0zNHsID8giG4/uaCAJVsFb
	7E4IJ13UeP9pG6oe7EbbOFtxlsM2uYni8YebhnFlLXjVqjndnmrgIdsTBA2yr/rwMivyelQIfOP
	sNxnhU5yd7eTzJA2oulqyP6V8ott0BpLEEJ92mcMSHv3qOE1vE2A7B
X-Received: by 2002:a05:6102:374a:b0:786:fb19:d5d6 with SMTP id ada2fe7eead31-789ef5a42a0mr311983137.1.1788141969977;
        Sun, 30 Aug 2026 19:06:09 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aafcsm5875214137.1.2026.08.30.19.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:06:09 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove dead beamforming code
Date: Sun, 30 Aug 2026 22:05:56 -0400
Message-ID: <20260831020557.1235504-2-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260831020557.1235504-1-adrianox@gmail.com>
References: <20260831020557.1235504-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The beamforming declarations are guarded by

        #if (BEAMFORMING_SUPPORT == 1)

but BEAMFORMING_SUPPORT is defined to 0, so they are never compiled.
The types they use (RT_BEAMFORMING_INFO, BEAMFORMING_CAP, PMGNT_INFO)
are not defined anywhere either. Remove the dead declarations and the
now unused macro.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h         | 8 --------
 drivers/staging/rtl8723bs/hal/odm_precomp.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index a20b48660e..d29eaba41d 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -936,10 +936,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	struct timer_list FastAntTrainingTimer;
 
 	/*  ODM relative workitem. */
-
-	#if (BEAMFORMING_SUPPORT == 1)
-	RT_BEAMFORMING_INFO BeamformingInfo;
-	#endif
 };
 
 enum ODM_BB_Config_Type {
@@ -1068,10 +1064,6 @@ u32 ODM_Get_Rate_Bitmap(
 	u8 rssi_level
 );
 
-#if (BEAMFORMING_SUPPORT == 1)
-BEAMFORMING_CAP Beamforming_GetEntryBeamCapByMacId(PMGNT_INFO pMgntInfo, u8 MacId);
-#endif
-
 void odm_TXPowerTrackingInit(struct dm_odm_t *pDM_Odm);
 
 void ODM_DMInit(struct dm_odm_t *pDM_Odm);
diff --git a/drivers/staging/rtl8723bs/hal/odm_precomp.h b/drivers/staging/rtl8723bs/hal/odm_precomp.h
index 2987857a87..d4390fd203 100644
--- a/drivers/staging/rtl8723bs/hal/odm_precomp.h
+++ b/drivers/staging/rtl8723bs/hal/odm_precomp.h
@@ -19,7 +19,6 @@
 	/* include <drv_types.h> */
 	/* include <rtw_byteorder.h> */
 	/* include <hal_intf.h> */
-#define BEAMFORMING_SUPPORT 0
 
 /* 2 Hardware Parameter Files */
 
-- 
2.51.0

