Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06086D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:16:12 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id 5so2293224qkc.8
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=otZvd52HgbyL3fi1OkvvEviekwVNI9M+TtY2lQEoSdI=;
        b=srFWfh1cArrRbPRwJGzPbOB3pkZRAHirYSCmGCggQiMl9pgTOuIE0tCNslOp6fq9eo
         e8T6n8+Ck6WmK1vxAwOfRbWNTLtt4APiyiWzKpanBHtS0K4CqMRTlp+pyQLktMEX8sY2
         yxxkwONlNUA44r/8X+/rLSiFTEx89FTrr2nnxNTxmmwoDzs4vIPyQ7n5cxxHj8vi8d2S
         TMV4qRQGuPodw4ErfjDJfrvwjpSA4D7rZs9myfxcFMvk/BJ/kGR86R8nIMeL5RmFewL0
         uu8VHWWdppS4Yi23tBcD0S+B9FxdoHbWN+JzEhEwekZ5ngTZF7m9NFzzqGTgP5xSkhOJ
         B1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=otZvd52HgbyL3fi1OkvvEviekwVNI9M+TtY2lQEoSdI=;
        b=bcarutGUEO0z3ELkg437m5/krL8JHCuhW0ikFz1K2hJUj7Ub3fMnK2ZKWih7VYUUMx
         /9cBEJDud3Ie3VgCgLymwvTuUxSoaDLbaBM6G6kTpbch58ATgPfRamLI+PU0X+/eg8AV
         RZYgfo23U5fk89b0kExyU/dTPQOFXqqh5TDkPY//Iq+O007RYbBf5jOVgDs0jkYIHNgm
         iw3ftT/BFJTfaeG20b8p9RgkxIzZxRCL9QNN7BYv4im06Tgq1qxCBmkSrlt9LvM3NLQN
         JiuJsjhXsmmVTZe9CN8WxC9Ens+UfKdwDTEoqXshNsCQtP+c9mORxJy2j1veyj2D5MVE
         H1Aw==
X-Gm-Message-State: AOAM531hJx4jblH5cbXfaPVX1p+DSL0cgc3ANL0KwOw8jJdg/Pw1gtqo
	jUZ34aEXb3RxgE0lnKKljJkMI1o54fxvPuUN
X-Google-Smtp-Source: ABdhPJws9+4DF2dtY9n57QhUg+asmpahuJDxMb0W5+XUR0EkQzlIGuZvvMYfuM1OQnzEySpQ4PH5hw==
X-Received: by 2002:a05:620a:2118:: with SMTP id l24mr11231441qkl.153.1623716172079;
        Mon, 14 Jun 2021 17:16:12 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:16:11 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 17/28] staging: rtl8188eu: remove all DBG_88E calls from hal/hal_intf.c
Date: Tue, 15 Jun 2021 01:14:56 +0100
Message-Id: <20210615001507.1171-18-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from hal/hal_intf.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/hal_intf.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/hal_intf.c b/drivers/staging/rtl8188eu/hal/hal_intf.c
index 9585dffc63a3..60cfd31e855a 100644
--- a/drivers/staging/rtl8188eu/hal/hal_intf.c
+++ b/drivers/staging/rtl8188eu/hal/hal_intf.c
@@ -23,7 +23,6 @@ uint rtw_hal_init(struct adapter *adapt)
 			rtw_hal_notch_filter(adapt, 1);
 	} else {
 		adapt->hw_init_completed = false;
-		DBG_88E("%s: hal__init fail\n", __func__);
 	}
 
 	RT_TRACE(_module_hal_init_c_, _drv_err_,
@@ -40,8 +39,6 @@ uint rtw_hal_deinit(struct adapter *adapt)
 
 	if (status == _SUCCESS)
 		adapt->hw_init_completed = false;
-	else
-		DBG_88E("\n %s: hal_init fail\n", __func__);
 
 	return status;
 }
-- 
2.30.2

