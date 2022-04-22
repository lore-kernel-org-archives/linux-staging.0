Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B51323A4
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 09:33:49 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id d198so5397755qkc.12
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 02:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xbbjiZS8IMvesATR7m3IJgMWlJJ++cnKlBqL7PtE/I=;
        b=n7kmRouItCvMnCGn6VeOCe2T+bA1ptgIMVX71sn+XusUp7H0uZbo1pW5riTC2DxdLC
         bpBYIP8FzAx5VzLIgG8/kY0VbsQe3k7KRW9Gj45OHWpd88Y5GSpvJVwA/bGBNTDl4TTI
         RmKa5X2mUYqXB78ErZpCCpu7dBtCjBLjivhwCtZJmCTPdFebYhWQEtPu9tZ/7mblW/D2
         uJeUlst4D6hgXxzaUNpMTcNeikWAP+7BvACNOzQ2nA0OFCjgiwwVVWGi52xVtv2iJhlj
         XieyXScIBMMdiqgXdIbKN4379kCRd1a+guzeR5HdeRKeomWGmXvQspBkteULPBD9ECl8
         l8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xbbjiZS8IMvesATR7m3IJgMWlJJ++cnKlBqL7PtE/I=;
        b=2vkdHlnMPBBDZm9kQDVpCU3htPnJ0pDuu2Hfacxf04EWJ6/iqKKzfNapRyi/3i4qqC
         5LWEr/F41LI2kv/iTrInHxyEhFKx+H9G7LGkh4AKbk/D5tPPgfNnApDpICLiIIO5FO+k
         hiYWVpxM3doRmsUkRiRNDefMtgDKE/tOL2RWNNCc2gwDhA8x1yzM99PoJRsWdpOqoE5/
         1ceBZuXEe5WZVdMUDjGt78gNbF+Ug/tryZedWAbOE8uxSu08zOXIkqstIqqINmbrVk/J
         bpV3+BnuuE/pYDSm5N7anMKyZi1JqtXRNGdFKa/uDFXk26zfyZPq1tUScXovfbk2sBB6
         +s1A==
X-Gm-Message-State: AOAM530/tftISyB9Inijf7BqhiWrfLmlOoDnOqPUBNImH7DgJwRD2S5m
	Fa7nER53+DP86FwyL7FmW8E=
X-Google-Smtp-Source: ABdhPJxDccAT2Zd8xDVtpcRKTH5g1sNeZ1fwrl9KbrT1B10LwO0eIjROMwJYlGpRQzF591ZbCsFoAg==
X-Received: by 2002:a37:9f96:0:b0:69e:abd9:f68b with SMTP id i144-20020a379f96000000b0069eabd9f68bmr1985315qke.773.1650620028121;
        Fri, 22 Apr 2022 02:33:48 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id c136-20020a379a8e000000b0069e5df9d953sm687610qke.34.2022.04.22.02.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 02:33:47 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ran.jianping@zte.com.cn
To: nsaenz@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com,
	dave.stevenson@raspberrypi.com,
	gascoar@gmail.com,
	ran.jianping@zte.com.cn,
	xkernel.wang@foxmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: vchiq:remove unneeded flush_workqueue
Date: Fri, 22 Apr 2022 09:33:40 +0000
Message-Id: <20220422093340.2781311-1-ran.jianping@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ran jianping <ran.jianping@zte.com.cn>

All work currently pending will be done first by calling destroy_workqueue,
so there is no need to flush it explicitly.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ran jianping <ran.jianping@zte.com.cn>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 70c9d5544b56..249dd3e30c2f 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1841,7 +1841,6 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance)
 	mutex_unlock(&instance->vchiq_mutex);
 
 	vchiq_shutdown(instance->vchiq_instance);
-	flush_workqueue(instance->bulk_wq);
 	destroy_workqueue(instance->bulk_wq);
 
 	idr_destroy(&instance->context_map);
-- 
2.25.1

