Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE42C9D
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 01:32:47 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id hv15so4787671pjb.5
        for <linux-staging@lists.linux.dev>; Sun, 09 Jan 2022 17:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wDInHq/ZBlgHE+7Mddqlt+1G7R4LZ45IdBOOJm5Mw+8=;
        b=quWx7dX4s95s9Y4pDV3zq/+tlw208MQUlShVhvYwgU7l0KQUrG7tqx1ea7OMyRCmRR
         bd/0W28I32cblxyKYHdTVTtcecI+bmgs43d1JpY7MxM5ryqNu2xWMzPqM84uAzc/CuWT
         poE+cJ5Mp6JTM00Cwm0EoN77e89bvIpbprdu+403rrMciz0Kr1dhs3DrGk1DFwmIG2oi
         O3gRnKqca/gVSzD8qMJH1uS4IaXGOCQv2qSgdlSi0HGE1KvnxWzP/clSCOvTpMGVJs0S
         j7SgIDCXrTvN5iTfpH7hmrerUBluO1qs+J61DIUFdoNTTsd0FcebhnYuer26CH8ThFGs
         SgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wDInHq/ZBlgHE+7Mddqlt+1G7R4LZ45IdBOOJm5Mw+8=;
        b=Zd60Ty6ywTdvPUY4SlYJmGuxehrl27vhsDYzP+Eh7p4tbe0dY+t6eOx2WLvNqamsvk
         QK43wgygqQs+F4Q1SrET/NaibHWHiYlLWPNAdI1VBivCYETGdJSyas9F/AiingNEMkLK
         xokCz5KQIVAry+np/MDlDQM963YDkgdK3OZ7b2NGcngro4LUJJLef5i86JmGz0uP97Pu
         LYmT8Io9mtqsapBJKbYgFv90suxsBeGpNLwY4b7A8v/XHcYfxetRPe4o/YTTs9lc4U2f
         G7/7UD5TkcEN/IFq6/h/m+r2GxVQVRMVzOL+O3XHzUwIA5/5/X7G245MQAa3lIRnctZI
         HPhQ==
X-Gm-Message-State: AOAM5311w3kBr/U/6MtZuqoq5KpHyrniFyVRseMZS47Lc1VpzXEatwUo
	lUeLSaoXVMbBA6zAe4/9gEQ=
X-Google-Smtp-Source: ABdhPJz9uRvifEgabZZKRFZ1ykOa2i62a9OXRm/5yWOH7bMRipy1qBsgeq3ECdIVnINcIfyjQZBwvA==
X-Received: by 2002:a17:90a:ce18:: with SMTP id f24mr4423863pju.98.1641778366606;
        Sun, 09 Jan 2022 17:32:46 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id mn13sm4021566pjb.53.2022.01.09.17.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 17:32:46 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: marcocesati@gmail.com
Cc: fabioaiuto83@gmail.com,
	hdegoede@redhat.com,
	saurav.girepunje@gmail.com,
	kuba@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>,
	CGEL ZTE <cgel.zte@gmail.com>
Subject: [PATCH] drivers/staging: remove redundant result variable
Date: Mon, 10 Jan 2022 01:32:40 +0000
Message-Id: <20220110013240.644190-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from ips_netdrv_open() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 05482341eefe..757efeb49d08 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -922,11 +922,7 @@ static int  ips_netdrv_open(struct adapter *padapter)
 
 int rtw_ips_pwr_up(struct adapter *padapter)
 {
-	int result;
-
-	result = ips_netdrv_open(padapter);
-
-	return result;
+	return ips_netdrv_open(padapter);
 }
 
 void rtw_ips_pwr_down(struct adapter *padapter)
-- 
2.25.1

