Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484F1FBD
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 12:09:04 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id r13so10462781ejd.5
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 04:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUl1546N+qp10i0i36y2HdxIb4kjY3BH0Sd5jvSSiAU=;
        b=MucVjFGN8de3cOtGGWnhedk7OK8fbB31NNq0sfKJeVCZQUWHxMRMmOaQUuIpATk0sk
         PC4npTbP6dNGxkWrkFDtAdwRoMBEswV9bqjmrYsFAkRv+hVHoEq4A2Y4qazi3EKm0/Z6
         huZI7yMyhnA6oSYPX1mKz3xdYYmHzSaPTZcQRqp9VqwHZGYMAn3V1g1WIRlkvzqDwDQq
         SfkNAJpLu9b6GIvxtbYp57uGNrnqOnNfNXA7u+XQc5msEPmMS37Xo/VSoO52jFmdSB1k
         s6oFijzltf5sIq9L0pkC9rTHWDeuaj90abO2v36PvGzPu/yvWp2hR5MZStJ4kRIpFual
         2MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUl1546N+qp10i0i36y2HdxIb4kjY3BH0Sd5jvSSiAU=;
        b=51ZNiVbMFYOeVTRFTvlHs1+Fs6e7dNwhPwZOMtE8IYErNlaZKToq32K+0fD9HZqmTC
         2T7XaxFirk9bLWNhzLR1nUWbTCqhCfDTMuEmF3OYDzpvGrgi0NYyZkfEJe0FKRekcm8z
         RtKhCILIOELYbsqO8C2FTPJ2m9lwk/TpTUGgnf1a8ZLLWherw4wy5Bl/ylDdJhd77DQ0
         OMTr0bnw6wersNJj8GvuElifv+o1BoivkR6OF975deesBGq4diCpjXHbqdW9IO9eBxPM
         nXPcJFwUUyRvZbTsde9qhUzNsbYSsjw2KnTnKiUfcIrRSO9+ToRDcNhAlyvtFuDdPTcJ
         xnrA==
X-Gm-Message-State: AOAM530elWNQw0b3QhCNQiIAIUXuOBMuRDndu526taIdXHvwnx/+Y5K2
	6wsi/Gv8ewZRghmcObrkZj8=
X-Google-Smtp-Source: ABdhPJyJbU8MHsMilG18YpmMzfWdqShMcVy1zGY1he58NIZlERXIdUuCtFnXcblC8jExfLpQrWsp1g==
X-Received: by 2002:a17:906:b252:b0:6ce:41e2:5bb7 with SMTP id ce18-20020a170906b25200b006ce41e25bb7mr5824649ejb.179.1645790943024;
        Fri, 25 Feb 2022 04:09:03 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8d.dynamic.kabel-deutschland.de. [95.90.187.141])
        by smtp.gmail.com with ESMTPSA id y14-20020a50eb8e000000b00410a2e7798dsm1229418edr.38.2022.02.25.04.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 04:09:02 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove unused function prototype
Date: Fri, 25 Feb 2022 13:08:41 +0100
Message-Id: <20220225120843.10674-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225120843.10674-1-straube.linux@gmail.com>
References: <20220225120843.10674-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function prototype rtl8188e_query_rx_phy_status() is not used.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_recv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_recv.h b/drivers/staging/r8188eu/include/rtl8188e_recv.h
index 0be9896eaf0f..87dd4152082a 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_recv.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_recv.h
@@ -42,7 +42,6 @@ s32 rtl8188eu_init_recv_priv(struct adapter *padapter);
 void rtl8188eu_free_recv_priv(struct adapter * padapter);
 void rtl8188eu_recv_hdl(struct adapter * padapter, struct recv_buf *precvbuf);
 void rtl8188eu_recv_tasklet(unsigned long priv);
-void rtl8188e_query_rx_phy_status(struct recv_frame *fr, struct phy_stat *phy);
 void rtl8188e_process_phy_info(struct adapter * padapter, void *prframe);
 void update_recvframe_phyinfo_88e(struct recv_frame *fra, struct phy_stat *phy);
 void update_recvframe_attrib_88e(struct recv_frame *fra, struct recv_stat *stat);
-- 
2.35.1

