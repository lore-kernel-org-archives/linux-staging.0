Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17D6136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:51 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id g7-20020a17090a708700b001bb78857ccdso5865508pjk.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TUuNPBTu2xyBBzs25ZLnDDMUBtJR+9Kg5LOaf5JKL4g=;
        b=FXiOHgND48ZfHthNYy+QQZ+gOusHf4rgw2u0t+lAZ7qhcDNfumkzzBoPzraPDtom0G
         s5R2yBaGBfn2wAx9+qRjH0dQtJRzHOFAhYOQaeZjIsTAzpU7M1yjwI59mFhyZoOyQ98i
         R0sfoBA9n1yFVaBillL3gQ+mOp5Np7JC4vu7ptBjjzWVHYXaFrRBOV/VaaNksh2/6KFi
         bKUYXtOVMpLZL7YYlrTOdeCUkYUttcJnrCR9dyT4cQU3KPVEUrO69rSv76bX/NC7ZFaK
         bOzZ9yg+9kf0Bmh1ho3YSbEwgbzVNTl5O1zeVSB8opMr0gDHDfIgpRhp9dnsfAdaFJTZ
         vUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TUuNPBTu2xyBBzs25ZLnDDMUBtJR+9Kg5LOaf5JKL4g=;
        b=my+0EFfvY+M5HxgsS7maho0uLfJ/m5AW1FesEs+/q0CF6MSVm3syFbiXPQ4AAr5EeC
         OeFgSjutNWoheiq8mA0GSBANgE5LW8bJyOlIcqfORtPbBy55LNd//nu9YfVsvWp5lkCv
         HOnxgaqeW9TvoSMoa0jc7A4xAA7HjFLV159xLtrUcWz1mtFEi9bBbNBRVzh8wxkzP57u
         0lR2Ije+Ukd6b1yMQX5V2IBaDLLjHjmgeyB+zLtalQ5FwmCNc48b/DMIX1xvguMP8s/a
         XLeJtM/rkLmt9KpkZtWFuqWqSdL+ekF6RPI0beVp3UiHuu95P4ywxd9YSLDNkkL/Zas1
         dXtg==
X-Gm-Message-State: AOAM530J/TUFOKEOryZY+W/GPVSl488oOgmo5jnLQx47LutXQ1WG/IOg
	17LxnZx0PGvS2dTvu9/wojI=
X-Google-Smtp-Source: ABdhPJzwmDdaEnAFlyf7GNjr3zk4DxljBpBpdOebEFf/wd5QpDhDPpWFwXTYJYg2TX2TWUdERr+jqg==
X-Received: by 2002:a17:90a:7d17:b0:1bd:6972:f942 with SMTP id g23-20020a17090a7d1700b001bd6972f942mr1689696pjl.160.1646254130255;
        Wed, 02 Mar 2022 12:48:50 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:49 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 15/16] staging: r8188eu: mark IsFrameTypeCtrl as bool
Date: Thu,  3 Mar 2022 02:17:36 +0530
Message-Id: <20220302204737.49056-16-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark IsFrameTypeCtrl as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index df3331b13..c1c9bae58 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -372,7 +372,7 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 	return sa;
 }
 
-static inline int IsFrameTypeCtrl(unsigned char *pframe)
+static inline bool IsFrameTypeCtrl(unsigned char *pframe)
 {
 	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
 		return true;
-- 
2.30.2

