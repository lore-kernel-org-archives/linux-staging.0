Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4A17FA
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 09:36:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id fy5so7797651ejc.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dWDV/5GVcx0ceVlPM2V+MXtiSomLloUDOadV6lqtfMg=;
        b=A/ERsJ9sQ1PYDiKyL7mwFBD65/CbA4KsnwLlmbCxi7lZGwlhIhvybU+MI5orRZ5s3Q
         1PSnP/B2rhwwxGmLrNCzI201RtZoKioDracSqU0g7DQH0zM6nW3tAWcMLlVEzgNWFlrU
         nDKDJIdELPYCvQZ5J8HBvuOgLTsLPIPQ5p1z9V3AGXHfzpMiUvOrxP+pz3MJbOicX48q
         YtRldte2I4OOaOCgLy5rsGm6WtHw6Wg/asNZ30gh9EYJiTOD0xkapNuXXpS/0cxITEC6
         jSUo05YITtf58iD6Oc4OvKDkVZufWgwwPtPxjNUObqKEQkWYwg04NQcZi1PQxBLr5qoC
         bwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dWDV/5GVcx0ceVlPM2V+MXtiSomLloUDOadV6lqtfMg=;
        b=RNVrV8ixrhklFT4SFIZPLC4LGkxf5KlxquoPvW9AHWnGxSPrZMIEjoxLyw5bDrlL/L
         28UJV3ru1dH41oN3Rm9c68tfi9mhrsnMSpTXmIWGwXX/7sZr9x5q1MkDTIfa7sfSoXhB
         NNJorHkmNlbpxYxA6i5XgVAVvAx56DYC7pPTu6BrCPKOisR+pIdze+CnRSC1qY7nOhLf
         m0nn8W4Gc3MpP3kGkHXU15+pxmBbc8vn4SesRfIA6X+xTB/ThAqbN1bH+5QUvveN3DSb
         R6ZyTdcwLyyPuKl/YX6gK/uZZRI4CFaBnKELkSLFX6pDkhdEOI8co/9EdlGLirYdhlaf
         5pKA==
X-Gm-Message-State: ACgBeo3iwLmpaceTNfljsZaLVae1cnFy/O7AkFgaB9U4Y2kP3HkyuarN
	qBPWPcQxRM1TH6tkwX8AnpY=
X-Google-Smtp-Source: AA6agR4/0Fx1+XkmnSgIBpZVfYUeqT4M+0nrofIYN9yHBINA3c6J4yyg1zrpSZe9QFx7jhvcejerEw==
X-Received: by 2002:a17:907:9628:b0:731:1e3:b168 with SMTP id gb40-20020a170907962800b0073101e3b168mr4400385ejc.526.1660901769601;
        Fri, 19 Aug 2022 02:36:09 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906941800b00734d4bd1792sm2055929ejx.162.2022.08.19.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 02:36:09 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 2/3] staging: rtl8723bs: remove member noise_level from struct dm_odm_t
Date: Fri, 19 Aug 2022 11:35:36 +0200
Message-Id: <5a8256d3823baaa72775da80d821749dfbda7ad4.1660901124.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660901124.git.namcaov@gmail.com>
References: <cover.1660901124.git.namcaov@gmail.com>
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

