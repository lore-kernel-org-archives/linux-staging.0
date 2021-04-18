Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E54871
	for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 16:48:22 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id c3so2800873pfo.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=jAaKUfUcTBzN1eaNKA5kBWKVSugP5XYulKpJt/IIaLw=;
        b=a4VUMesj+ViRkIufmRfiVXZJ1iH/1y5wMI8p2r0h3dGgMtlbMlo7//DMGEqc8EdfjM
         zlgD0wxQ1MsskRWXAuUlfPHcT/DXf0qbOgbalqPE28IGHbH9+bgiRse6FiW2ZUyvsRDX
         5deZqtnrAZVQQXuzCfTPvQZcdkufY8kw/ATngw5v9404GEsf91qC2JL5jORmVfsRHmJK
         k7H62jdm/+uZtheuLkE8gJRqaPiRq1P6/eS0ZO7H/8I4DZ0C+61lDppbP1VMwLSqN3l4
         JqeMs2CWtBjtQIZ9cgULOJfRI5i/SWNQKQRFPjqAE6LS9iK5wRP3ZLuUwPoR6TwW44zz
         tDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=jAaKUfUcTBzN1eaNKA5kBWKVSugP5XYulKpJt/IIaLw=;
        b=UVUs7VJzLGnxN/5v1/7RztMIczT8aRBPbbNNNnfBWwmsWLwzIce5u4+Ly9zc4+lXCX
         +z9cQN9RxPIn8GyPK6gdM7I36jsGumgyLAemMyZ3+wRX83Y+9HKPD2+Lq65h3KjcS5VT
         0vQSsWapKerHpd5iKga8knS9gvi3k3sYcA2PaQX7gDZtsbTFZUqqQjtN5UPs8qfnjF92
         dI8IItNeC4l7Ppkp+c41SGbZesfzCltLWvvX8MgCQ3YslYrOxsuzqlvFPJq5MgXHtNTM
         NAwq0IRefjABg6yLMg4PaXC78Qt/JMzLaPILP7OOuOQZ/z6uQtY0QpcCy4pk8+/vY1Pm
         oNjQ==
X-Gm-Message-State: AOAM5321Xhs1NuBZFvxmW9cwDVXbaPPK7P2e4OCPDB/EC4DOdVngHZKx
	6p/AquvG2HW+bSUvLjubNzw=
X-Google-Smtp-Source: ABdhPJwT6b8Z5YM57KwecCttty/jNOlzjGmIpvYV4XVZuoyF/ASzfgfDLDFf3OYx+ylAFz0UryylnQ==
X-Received: by 2002:a62:3892:0:b029:250:4fac:7e30 with SMTP id f140-20020a6238920000b02902504fac7e30mr16436281pfa.81.1618764501691;
        Sun, 18 Apr 2021 09:48:21 -0700 (PDT)
Received: from user ([2001:4490:4409:d07c:b4ac:39e7:e05c:f39b])
        by smtp.gmail.com with ESMTPSA id n52sm10354260pfv.13.2021.04.18.09.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 09:48:21 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
X-Google-Original-From: Saurav Girepunje <saurav.girepunje@google.com>
Date: Sun, 18 Apr 2021 22:18:13 +0530
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	john.oldman@polehill.co.uk, ross.schm.dev@gmail.com,
	marcocesati@gmail.com, insafonov@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: os_dep: remove unneeded variable ret
Message-ID: <20210418164813.GA57451@user>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the following coccicheck warning:

drivers/staging/rtl8723bs/os_dep/os_intfs.c:1156:5-8:
Unneeded variable: "ret". Return "0" on line 1199

Signed-off-by: Saurav Girepunje <saurav.girepunje@google.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 1f34cb2e367c..920ec25c9a4f 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1153,7 +1153,6 @@ int rtw_suspend_common(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(psdpriv);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	int ret = 0;
 	unsigned long start_time = jiffies;
 
 	DBG_871X_LEVEL(_drv_always_, " suspend start\n");
@@ -1196,7 +1195,7 @@ int rtw_suspend_common(struct adapter *padapter)
 
 exit:
 
-	return ret;
+	return 0;
 }
 
 static int rtw_resume_process_normal(struct adapter *padapter)
-- 
2.25.1

