Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F070
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 23:05:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so143568wms.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 16:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QCO0LwScrHHjGKpotTmWANPpGoELMy6/oBIbIpif3kc=;
        b=BltfUQ8uH1+zMi9e7ao1SXmhNWFI6lTUjxo7bK1Q8thLw73wc5dzgPupf0BmHJVulo
         uUxcqfl0Jc3rJ3lqQIKokHxed2+DCHYqpFet7XxclEfWPws+ywiTPiB8AB3LioJue1xk
         L9dYtjsaPQXTQ3LfKy0yrNPfEovnmPX3sxGE3zfgwhH4/7NC+LHX4JbUWvLXOkCAeGAn
         9q+VErnnYrOoPwmFBJzgzdfAfJ+jAeJ8SgHt0kMgjHj0i/1N3SlyzsxM9m1y0W66RRcY
         Gq/RShr0FJ1QxbyUa1JsLY2JuaWc0oy9u+8jxo9H5lEEjCNUiGRsCeE+iotbBMYRCNey
         zWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QCO0LwScrHHjGKpotTmWANPpGoELMy6/oBIbIpif3kc=;
        b=WkBabPBG1lkxnB2lTHgi9h6gttc6yiDLqMq/7H/IqboXlpLUGanwrOmjV6yfjpmkTb
         nhqCZWfzM+9K0erfnwrltXyHIq+qGX5NJnSCzmeGoeesMBQ8cqa/zZKagIyfnrV+eKFw
         FjoFgnOYuo0kIBdbnvEGzfoyEAvSh7ynb8bvWV0SV4av2KJ6l9l4woIBfJ68T0jZZfmO
         boC7VxAeLe9hyvC/CNRg9EMFWN1QyIofifazWoil5qJ4ew1yIhtx82rAhHhxeKa9epM4
         +4xo1cz8pZ0Gq2biKAL8MmSru14RQnrxO0jC5pn0KSu4NZWh+vWmRDNqSLWJtpf2HlmN
         IRHg==
X-Gm-Message-State: AOAM530DTOMpblT9/jOFG4yM68bPbavgt3miJNeBlz5KihPEQ1IHGlFu
	UbsH3FUkP76oddin93s+qqEdpw==
X-Google-Smtp-Source: ABdhPJwsCSA/Bg15S8TCOpLuAvSjxZYis9z8vRyH+N5P0fUjHTyvOhBCstHCdPp/ujj26c4bJBhx/w==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr6524118wmc.102.1628031940583;
        Tue, 03 Aug 2021 16:05:40 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id i29sm330045wmb.20.2021.08.03.16.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 16:05:40 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: r8188eu: remove RT_TRACE calls from hal/hal_intf.c
Date: Wed,  4 Aug 2021 00:05:31 +0100
Message-Id: <20210803230535.74254-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803230535.74254-1-phil@philpotter.co.uk>
References: <20210803230535.74254-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from hal/hal_intf.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/hal_intf.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 1d813b6c3678..57819705da76 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -88,9 +88,6 @@ uint	 rtw_hal_init(struct adapter *adapt)
 		DBG_88E("rtw_hal_init: hal__init fail\n");
 	}
 
-	RT_TRACE(_module_hal_init_c_, _drv_err_,
-		 ("-rtl871x_hal_init:status=0x%x\n", status));
-
 	return status;
 }
 
-- 
2.31.1

