Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1470
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:09:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id j18so4904526wra.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mH/dwYStT+su/I7fi8ps0q9leXB5uDo6M/V/p6K/BwE=;
        b=jMYN+/cywf2MvIRg+/Q1Y6lEWrmiDP9FUH8H2OH9O5CYYtAqyIXvH08HXt6hyOJOc+
         57Z92r+zb54GYycIBeD6AdfceTGO8ypGmD9am9nSCJVintpOHjJFQcYrm35qPVHjBzSz
         vEAkfL/9dAWEr+apJfWmWzM4e7XPrMMtog0NIJHp+J2lds0tLQfIY6Bbtue1oCZxPPpb
         bkVXxAvjsqj+Zuzb9dvVRjUqBVj/AUyRlSyGwrXDsKcK8Hj8LZjgFgwfZvYcne1hJZ9A
         rHkW6QR4lddhOa4AAnsMAg6CCbFXbBzSJ6nsRDcw8cB4+WmLvITNojhfr4+qeiUy0I5b
         F1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mH/dwYStT+su/I7fi8ps0q9leXB5uDo6M/V/p6K/BwE=;
        b=c3VkAhp6SJijA/T6WghcHO00Ekf2zw/Gb57R6Q8pCYcQ37OzlnCRwNRlLMHVvKvy4J
         C4MUT8C/aOsN/ir3WQJjpZi2wfQw3yx9ea3L4F2OmcTbNxwoOarjHIpA0G67NxMU7U2k
         mEGI5RcEH0TSuQ2ITXmKYNtmQE3V+Y94u9tyIpTu+RNwzGL8lO0uqgUtAA4M9HCJ4LIT
         2+IQoci0dGJyXHK1DsX2KTEtbsdEjozMmBXmOY0rn8QH9YXEtRLaLl8yP6wiJ+hLWtf9
         otj5+JMRMyx8sK3eTZizl5AGJt+AMV9DNqSbXQ71sbGP0+kONVA31aUBjOMxN2pEf0MO
         ZCgA==
X-Gm-Message-State: AOAM5312GtPOcMSgampA8d59mJirrY+9odpJq244bC7FB7Cyw4rUyNw2
	+X1ccoN4iR4mlxQIHbKmCHw=
X-Google-Smtp-Source: ABdhPJyxdgyYqWY8czGdTqa4KnglCMlOmOIX42QOWjwETtVykzhj6yFHjq8hR41bxfoXe8sg2OTyww==
X-Received: by 2002:a5d:404f:: with SMTP id w15mr13890196wrp.106.1616749789034;
        Fri, 26 Mar 2021 02:09:49 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id x25sm11277320wmj.14.2021.03.26.02.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 05/15] staging: rtl8723bs: put parentheses on macros with complex values in include/drv_types.h
Date: Fri, 26 Mar 2021 10:09:12 +0100
Message-Id: <fea98d1b0260494dc5cb0dfb7fc03d6f74d9acdf.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros with complex values should be enclosed in parentheses
279: FILE: drivers/staging/rtl8723bs/include/drv_types.h:279:
+#define KEY_ARG(x) ((u8 *)(x))[0], ((u8 *)(x))[1],
((u8 *)(x))[2], ((u8 *)(x))[3], ((u8 *)(x))[4], ((u8 *)(x))[5], \

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 1658450b386e..ead4cb9c1e5a 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -276,9 +276,9 @@ struct cam_entry_cache {
 };
 
 #define KEY_FMT "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"
-#define KEY_ARG(x) ((u8 *)(x))[0], ((u8 *)(x))[1], ((u8 *)(x))[2], ((u8 *)(x))[3], ((u8 *)(x))[4], ((u8 *)(x))[5], \
+#define KEY_ARG(x) (((u8 *)(x))[0], ((u8 *)(x))[1], ((u8 *)(x))[2], ((u8 *)(x))[3], ((u8 *)(x))[4], ((u8 *)(x))[5], \
 	((u8 *)(x))[6], ((u8 *)(x))[7], ((u8 *)(x))[8], ((u8 *)(x))[9], ((u8 *)(x))[10], ((u8 *)(x))[11], \
-	((u8 *)(x))[12], ((u8 *)(x))[13], ((u8 *)(x))[14], ((u8 *)(x))[15]
+	((u8 *)(x))[12], ((u8 *)(x))[13], ((u8 *)(x))[14], ((u8 *)(x))[15])
 
 struct dvobj_priv {
 	/*-------- below is common data --------*/
-- 
2.20.1

