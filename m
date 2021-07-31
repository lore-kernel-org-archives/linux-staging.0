Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BB63481
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:23:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b7so13343745wri.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8H37xNBSGIOnEvnHiZeZ4kxx2fU5DnigwTZak5GvhE=;
        b=a5DYPIUfI6Hpoij2rPQILYPEQXmyEye3/2iJosZA/2S4MUojH0cRfZUkgg5lbJ+v7K
         W9DBypGr3WFegDWZjCd16To0kaVdQLYL0kRgyPyygLgAQEpdlHUunQbnogY3El3Nb7xC
         B9iYKm/zCyty7bxq1Fvzo4p+lhRnbG5DqmQTueoPU2Plz3mjRCTeEGXKM0puKYCCklIc
         PuKlWgPBnZTIM7V4kKjzsQoHwITb9HQw1mObsF95o6pIa1W7ewp77sT4250QmHQypesJ
         8cWwwXcegtMtaWqinfzjrL8G2aIilUZVCvz9mr7osgh5R+NYZ0nNjqRN/L+iJiZf2gcX
         SR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8H37xNBSGIOnEvnHiZeZ4kxx2fU5DnigwTZak5GvhE=;
        b=S3a7kBQR33eBYS0hbH7GQgz9TSW6f5t6cLe4ImybrS5JcoBCUTz/od/8Dx6R3Qx8kk
         ODwRcUI84q4YtpMi0T9NGsQh3Z6YRULwUHz3ua14/Sv531av8QQS22HsZqh+gCqtd3G1
         QWlAFzl6MvBMqVIdDGSpdzj8kilqXsARtu6CgdG1X8t5co55QLlRosW2xt9ndErge/nB
         rPP4MTjljb2EyU6lIQKTxk7WpvNK1S5KSHnR9odlAqQMMzwlzHjF+aU0Jer76oauG//Y
         iO6yyljIbULGax+QZbpQOD/hX1yIH7AtNw2Cr9xYbiCo+NY1EzMikF/0Vj6xb+DAmvQa
         cfhw==
X-Gm-Message-State: AOAM530/PczjDw+ZTi6Aq4t18jPdJXruFOtws7yTgPQBQ/CmomQ1/ybZ
	dS9RZAM1/ntc3NAuwBfNdN9Puw==
X-Google-Smtp-Source: ABdhPJwDkdf8OJcGyKC2Cxp/oDXdvW3TL1CRL5nlkIxm3uVANXKggvAXGj5f0L41/DC5EdZ0l5/DAQ==
X-Received: by 2002:adf:d22f:: with SMTP id k15mr5791331wrh.335.1627691038418;
        Fri, 30 Jul 2021 17:23:58 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id x9sm3236011wmj.41.2021.07.30.17.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:23:58 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] staging: r8188eu: remove ODM_RT_TRACE_F macro definition
Date: Sat, 31 Jul 2021 01:23:43 +0100
Message-Id: <20210731002353.68479-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731002353.68479-1-phil@philpotter.co.uk>
References: <20210731002353.68479-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_RT_TRACE_F macro definition from include/odm_debug.h, as
it is called from nowhere and is therefore superfluous.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/odm_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index c11d8925952c..ef0d6b84b2d5 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -90,12 +90,6 @@
 		RT_PRINTK fmt;						\
 	}
 
-#define ODM_RT_TRACE_F(pDM_Odm, comp, level, fmt)			\
-	if (((comp) & pDM_Odm->DebugComponents) &&			\
-	    (level <= pDM_Odm->DebugLevel)) {				\
-		RT_PRINTK fmt;						\
-	}
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.31.1

