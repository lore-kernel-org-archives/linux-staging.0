Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF5920EA
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 06:43:28 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id u6so2849109eda.12
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 23:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dWDV/5GVcx0ceVlPM2V+MXtiSomLloUDOadV6lqtfMg=;
        b=c2xrHvYIlUGROUVRIrTOI1acCiwZdrCJH145opnExd/fHYrjeIJgBZlZNfakbMvXem
         3TQMfLEoeCGKAab/XSjfkxwzya4iteFwDooM9FWmVxfMB+p3xybknBqEMXbKcTy7kCu1
         b05cqX2JvBKcPA4gf7EPbbLQbE/WLrdxQ0AWzczwkD92+wf7vLWecyDI5pI4RfGpuDJS
         Zh6MqAn1uzsLzBHKuKDubvimx5U3cRjGhcfVNpJi7D2W0iKzp2A8er0IPwHBLmQC8TgK
         C1ae7FFxUEQ57OwbQ5OR4ptHG5D6xo0fln/iWJ0JkPaT0A2nueznG4iMts+r9LyqtEvX
         2TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dWDV/5GVcx0ceVlPM2V+MXtiSomLloUDOadV6lqtfMg=;
        b=GEi7t/pMlU7vhGP8wxd7jkb3u2BmT+bDOSbcQURP9+iOPQS9iR5pYwiwFJ0LMDOgwh
         Ym3N6TcDWPAxUGC7IeifqWybsdkdLlCgoen4b6eXtVTqriBnneSELt0lEbvX6VXT8qrL
         IS4JVlQGkJTLfPeCQx/djuIJonwmrCHNU/uRxZXjeGSjsY0W8e54Obsmo5SMl8YN+9WY
         axNOslv4hKHhe4XtjjdcoZ+zvlqYOSiFShW9lJGGEUkkU/cQqvw8Q5UQ0pODM5rXa4xz
         ZddvSp1L9+Wm3jGmOvPnqRgqO88ptMdYjNFRa51CX98HxWIOX26pwhg+Blhs4UsPVpBu
         jQhg==
X-Gm-Message-State: ACgBeo3gWhAw5hiWFEVijVkIQyWM0LoSj+UftfUTp9G0TqZpxu69PHjE
	GFn1RLF9B+K0O2BoDMEBITE=
X-Google-Smtp-Source: AA6agR46t+9YK94cWnLir63Q/+nawfjA6O9Yc4vsU9nRjXI03iWoAlDdBKAMof8ayDO6kCfa1M97jg==
X-Received: by 2002:aa7:ccd5:0:b0:445:cede:7936 with SMTP id y21-20020aa7ccd5000000b00445cede7936mr8552592edt.223.1660977807206;
        Fri, 19 Aug 2022 23:43:27 -0700 (PDT)
Received: from nam-dell.vm.stuba.sk ([147.175.88.220])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906329b00b0073c0b87ba34sm2935816ejw.198.2022.08.19.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 23:43:26 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 2/4] staging: rtl8723bs: remove member noise_level from struct dm_odm_t
Date: Sat, 20 Aug 2022 08:42:44 +0200
Message-Id: <5a8256d3823baaa72775da80d821749dfbda7ad4.1660977536.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660977535.git.namcaov@gmail.com>
References: <cover.1660977535.git.namcaov@gmail.com>
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

