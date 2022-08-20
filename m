Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A228A2F5E
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:00:36 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id io12so2133843ejc.2
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dWDV/5GVcx0ceVlPM2V+MXtiSomLloUDOadV6lqtfMg=;
        b=JiEBkifvfg0lWSRIxGwa+OENQ+A+yfxE3zt8rjdb/C/QQhREWZifNHSEEWG51lNFoR
         egp/MFromiOsaLYfI2u1yWKIdkgNy1lFRnL8obL1p5piurJ8vfKOzI12VPklVAnnOr4h
         JqIlugN2d7y3B2kzkAzq8HHFC6IOsAVEv7AXQTn8Db+wuhy4UgbHXK75Y+Z8iKjNTgTn
         mgqYFOj/P52jfp+W6TlsCUNWaXnw2ZBedihrHhyf45omFxKnIHsuZYEjKTcb0nHeaw34
         RjtQK/KHiKZ+AFKqakDs6Fv9Od5+we5R/nir2k1Z12zZsWc/NcOZYZsRa5tgt8FBp2Gp
         PKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dWDV/5GVcx0ceVlPM2V+MXtiSomLloUDOadV6lqtfMg=;
        b=pBI857E5EuPI5ILrSkKUH8+4offm6lEeH029YFSOuf7/QnHM5u4If51nzkO4MbUmmB
         oQ5S4Tz6avdb3icdtFjr2SrTAymDt4zxghGMTFcvBT5UbhCoGyfAOOJbV8wdH57GHoei
         CWvcxdFqu4HX4o/jZqRDBfmv64TziqxzdIfn8RKoShMxNgcOEk0L1OOclXGHALVJ/I4E
         9CPNNr16Q6ZNprt6zk4IxLvpZOPbmsCfaFfUp6SUt0WvESQ4cvbzX+Y+1ZVJsMDCHyCk
         xnwHaw6AE5g9XiymaxIpGynHhxcEYR/EAiMPVcU7KsvcMulQCBY6CgLLxV0JOnudhX4j
         RJfQ==
X-Gm-Message-State: ACgBeo2m1/cLxnqIqI8+NzklTj5+pslrZXkSFdQtfxySEiaDNQCdUQYR
	Rw+HfVx9OkenPbaaIfWPsvE=
X-Google-Smtp-Source: AA6agR727ufje9R4miZjxMKOqFBcm7cPFP4BNgnDN69z8tkeYwUpFtDqh6qCLsiin3KTUKI8kTQByg==
X-Received: by 2002:a17:907:1c1f:b0:73d:6883:9869 with SMTP id nc31-20020a1709071c1f00b0073d68839869mr1894852ejc.241.1661018434912;
        Sat, 20 Aug 2022 11:00:34 -0700 (PDT)
Received: from nam-dell.vm.stuba.sk ([147.175.88.220])
        by smtp.gmail.com with ESMTPSA id x19-20020aa7d6d3000000b00445e037345csm4938841edr.14.2022.08.20.11.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:00:34 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: hdegoede@redhat.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lkp@intel.com,
	namcaov@gmail.com
Subject: [PATCH v3 2/3] staging: rtl8723bs: remove member noise_level from struct dm_odm_t
Date: Sat, 20 Aug 2022 20:00:03 +0200
Message-Id: <5a8256d3823baaa72775da80d821749dfbda7ad4.1661018051.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661018051.git.namcaov@gmail.com>
References: <cover.1661018051.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

because it is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 19cfc2915458..033f22b0f394 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -863,7 +863,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	u8 Adaptivity_IGI_upper;
 	u8 NHM_cnt_0;
 
-	struct odm_noise_monitor noise_level;/* ODM_MAX_CHANNEL_NUM]; */
 	/*  */
 	/* 2 Define STA info. */
 	/*  _ODM_STA_INFO */
-- 
2.25.1

