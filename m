Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CBD6D00
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:50:54 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso3086901wms.5
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 16:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LkoHKZLIi1vYnWinE724V7HbW0RVvMW+Hqsc7/sVvBE=;
        b=K/2EMxsg4HLZb7mljvR8T4HU/DbvwG2J7KJab7E63OdgAIJCp44bBnvIbMSfvAiFHR
         zjPaPWZWM6Sd/xbJU82lAubvEAYGS+d4I0qMAr8MIW1s6JPRSgN2G9obBmOZyAkCbJin
         dEME9JeqIHdU3G9sYT+lGYmySA2ilrhkgQNdtFVtxA+d8Fc0ShY1u4qmDEzGzfe+mLbL
         0EZfEGpnG5/7aMU9oYJtTlAJT5zyZM8F8NfUYaBnIrQDWROyPBE6gnWfSXYVvpCzg85j
         dO0tI2HVC0JrTGHaOXcaURPLOBM4Uo3iYEbwQk5lXJ4z9FFHmCgHMTgMpCUHRzIGAcb/
         EJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LkoHKZLIi1vYnWinE724V7HbW0RVvMW+Hqsc7/sVvBE=;
        b=fKzJ43EPscmeAdhcXMY/AUAnfIRJQZnJD34yB2Hl1ahql+cn54UV9/Asy0lVuWtEVL
         RTsayGSsV57jXO1X0KRiYDqN4KSkoPXG898Aal6zeEdm1yVQJzDWPoK9ieIW6lyJjO9A
         QjaT8vUwHC5bXMF+/WWPqJZqUcPU6taATD3qAg9/KQbfCsLrxZLMbuiIkzAOpYN/xhfT
         XGJ51WIptzVDL8k8sGNWLTfaLWelrxwiDxxpjYRncgB7j7tvRKtNNl03QKCOH6AVWqDi
         6bJ9LuSFA8OacgBWsfffv1rHUI9OzN33WL70gcpoWx/93JxHSbSXYCYtNtpV//xnLX9P
         BihQ==
X-Gm-Message-State: AOAM531wiaW97AiU4wJlCm4BoA5ynjm8zHkL6ZYbjEmsl6+fmea9gCkk
	XhH4kAHhgOMtylx+wA4lPQSXAw==
X-Google-Smtp-Source: ABdhPJzoAbYCpWWOb4+rC+9T+SiL5kKl4hTBqxWbDwn14ing8IQkAzUPBueggGAhD1WsDzMGaaLwEQ==
X-Received: by 2002:a1c:4606:: with SMTP id t6mr16699879wma.25.1628639452939;
        Tue, 10 Aug 2021 16:50:52 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id p14sm13881220wro.3.2021.08.10.16.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:50:52 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] staging: r8188eu: remove unused variable from rtl8188e_init_dm_priv
Date: Wed, 11 Aug 2021 00:50:44 +0100
Message-Id: <20210810235047.177883-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810235047.177883-1-phil@philpotter.co.uk>
References: <20210810235047.177883-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused variable from the rtl8188e_init_dm_priv function in
hal/rtl8188e_dm.c

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index fab385774400..78552303c990 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -185,7 +185,6 @@ void rtl8188e_init_dm_priv(struct adapter *Adapter)
 {
 	struct hal_data_8188e *hal_data = GET_HAL_DATA(Adapter);
 	struct dm_priv	*pdmpriv = &hal_data->dmpriv;
-	struct odm_dm_struct *podmpriv = &hal_data->odmpriv;
 
 	memset(pdmpriv, 0, sizeof(struct dm_priv));
 	Init_ODM_ComInfo_88E(Adapter);
-- 
2.31.1

