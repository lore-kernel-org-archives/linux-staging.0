Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5CC2FB9
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:50:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c9so355953wri.8
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 16:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zmKg5cWLfDtvNzY5XeqvzfTrFB2tK46TS12T4izJ2U4=;
        b=YU6vMGyzdAW0zY//9R+zdy84wWj2rlcQlmnrxAFGLblTkt/MF/JEpEmhNaBHwuE0Xq
         bPUDHVdKZEABL2BES6koYjiCeztZ4GuvsbqlVky6Z4SXhU8Cg+RNnfKr6fWbalsv9x+7
         aNxZnbTxMv8BFPvMT23NhZyD/1VJWWhtMUgoyjwW0MPh6ayrocXwn3geZucThBtkaZiC
         fcU1nUldaHkGCXVPLKooo7awZWl0Qw1GNg6GelnGFHf2eXuqoQ4QGvwWEdl5aneDdOd2
         G5WIcM7He1a34d9nrgmnNRY3EQg0n//0+ifBj5xecFgbbUiuT1r+zkvmoY5oEn5xn7AL
         A0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zmKg5cWLfDtvNzY5XeqvzfTrFB2tK46TS12T4izJ2U4=;
        b=QGaVqQBDMTCBMWmEhMouiZn6SNV5Ivw/UOMsMMWw04Aq0T7wnbBwoEC46WnQximDK3
         KTDq5VWX60GlF/OmNLy8CtXUvOzqIHzIN/Kumy0d7+wB+Mpi2gZ4x7Jy/QCq9jiKJjE7
         XDXnEHUWZ/59PMJIFebVaaXa6gkaLLw0W1qSOPtxWeJJGYUxkYZsBq2PEAdwIauO5Lcn
         odCD9ZtZ/Vli7r9nxea5YeYaRRJH6cstzaIteE6dX/uHkrt3xRuWuTcFvwfwJTQZ/Txj
         VF2/2pQCcTqBBzV15G4TnQn+7JWpaVmDQTECTvSkdUGOrdS9IoTXmrs3zVgG2CIyyIf1
         sjJQ==
X-Gm-Message-State: AOAM530JTamtFZIwMhyIMLiGT+r+nMXS4EtNk/NPDHE91UdkG6Ru2G5k
	PlmK0GqeyKltnPAznPv4S4qJNg==
X-Google-Smtp-Source: ABdhPJy++88X6RefFjSFaTiHAugqJQyK54WiO5LmcuQi9pFNoQUK85w8BesRw4NmgX31jfOra6XCYw==
X-Received: by 2002:a05:6000:1106:: with SMTP id z6mr34105222wrw.296.1628639450642;
        Tue, 10 Aug 2021 16:50:50 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id p14sm13881220wro.3.2021.08.10.16.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:50:50 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: r8188eu: remove unused oid_null_function function
Date: Wed, 11 Aug 2021 00:50:41 +0100
Message-Id: <20210810235047.177883-3-phil@philpotter.co.uk>
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

Remove unused oid_null_function function from include/rtw_ioctl.h

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/rtw_ioctl.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_ioctl.h b/drivers/staging/r8188eu/include/rtw_ioctl.h
index 7ebc52f008a0..a36bd7313755 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl.h
@@ -76,12 +76,6 @@ struct oid_obj_priv {
 	int (*oidfuns)(struct oid_par_priv *poid_par_priv);
 };
 
-#if defined(_RTW_MP_IOCTL_C_)
-static int oid_null_function(struct oid_par_priv *poid_par_priv) {
-	return NDIS_STATUS_SUCCESS;
-}
-#endif
-
 extern struct iw_handler_def  rtw_handlers_def;
 
 int drv_query_info(struct  net_device *miniportadaptercontext, NDIS_OID oid,
-- 
2.31.1

