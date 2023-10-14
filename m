Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D977E;
	Sat, 14 Oct 2023 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ3VKM7S"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3231df054c4so2272851f8f.0;
        Fri, 13 Oct 2023 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697263927; x=1697868727; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VRzvbjqCINI1PjThGRzgdXHNyyoQH94qlPK9c4W3jg=;
        b=HJ3VKM7ScG46h5RBfgXV7zgqOb04GX0TNgFb4dEq31oyvYVvLL8n30+VjuVMsfqWFi
         zQG+Hu6gVMWSO0RPrmc0dxChpiIco5EYhqyqjLcH2gIVq3pVoUp4qQqVQ+GFB6z2nSN2
         K3bEibt8ggqJK6M0Lwv1yUL9nr1VKDVyQJnoTnnaGNimtiGWKippfP8ktoMOzzPfABU5
         mAJ9u2D1x3EfBHLhYGJH49YkGttFuV/+pYuHPTAOG0GStT0gN0U03yf3s9LsZ3/DeYHA
         SsHQr3uqx7OEThJZkjdlriKEGkn+yPWihkQZz/3Kbq8f0GKPa9eWqfulFuASVpGmVME6
         /gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697263927; x=1697868727;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1VRzvbjqCINI1PjThGRzgdXHNyyoQH94qlPK9c4W3jg=;
        b=hEpdk4mXwFrc4UQP44/i00uBrv1Jlvu3dbC6z/2SfPB0ZyNZwGzKBPxZC1O8n7gj8D
         LV26DH4eHqkJynYSxx8CU8tmFPS/h3DlQTdfZYlac1/dvXv+72h4gyqHf4lfuJf0V+ox
         kdkRKx/J4owhmDDXzefaEY6QgdRSDUdeNurNwzhWzFF05QrGj2Y4lOpKRzBRSrVhxdRr
         6VhHIcCrTpwSedl0Fz7zdRqYm1Qe3MIIvUQIkxpaOz+VbXHMWs+Fz1nBw9/6pRW+6rbL
         o01q35nQ3TvWS3vKvmWuPVgIRhr0+O8N2lX8Y9dTxeW0K+csB6PiAFzmjcUuBTy5qhx9
         Y/+A==
X-Gm-Message-State: AOJu0YxvRvkXOgC8qyZSBDv5kekFSnD+wxvo2V7M8OV/z9mhQqhH1B8a
	aqMfqzXaB4E55wmXkR3VOoj5zb77UyYcxbVRXgU=
X-Google-Smtp-Source: AGHT+IEjl9+rfnX2Gg8X1OBHZpVzqr/44hZGVggeu2TnQcKCipUXTEy/23qd9OlQsph4TJXX+wsc8g==
X-Received: by 2002:a5d:63cb:0:b0:32d:a40f:d920 with SMTP id c11-20020a5d63cb000000b0032da40fd920mr901050wrw.20.1697263927045;
        Fri, 13 Oct 2023 23:12:07 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id k7-20020a5d66c7000000b0031fd849e797sm22116052wrw.105.2023.10.13.23.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 23:12:04 -0700 (PDT)
Date: Sat, 14 Oct 2023 07:11:59 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: Add bool type to qlge_idc_wait()
Message-ID: <ZSoxLxs45bIuBrHg@gilbert-PC>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reported by checkpatch:

WARNING: else is not generally useful after a break or return

The idea of the break statements in the if/else is so that the loop is
exited immediately the value of status is changed. And returned
immediately. For if/else conditionals, the block to be executed will
always be one of the two. Introduce a bool type variable 's_sig' that
evaluates to true when the value of status is changed within the if/else
block.

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/qlge/qlge.h     | 1 +
 drivers/staging/qlge/qlge_mpi.c | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index d0dd659834ee..b846bca82571 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -11,6 +11,7 @@
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
 #include <linux/if_vlan.h>
+#include <linux/types.h>
 
 /*
  * General definitions...
diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
index 96a4de6d2b34..44cb879240a0 100644
--- a/drivers/staging/qlge/qlge_mpi.c
+++ b/drivers/staging/qlge/qlge_mpi.c
@@ -909,6 +909,7 @@ int qlge_mb_wol_set_magic(struct qlge_adapter *qdev, u32 enable_wol)
 static int qlge_idc_wait(struct qlge_adapter *qdev)
 {
 	int status = -ETIMEDOUT;
+	bool s_sig = false;
 	struct mbox_params *mbcp = &qdev->idc_mbc;
 	long wait_time;
 
@@ -934,14 +935,17 @@ static int qlge_idc_wait(struct qlge_adapter *qdev)
 		} else if (mbcp->mbox_out[0] == AEN_IDC_CMPLT) {
 			netif_err(qdev, drv, qdev->ndev, "IDC Success.\n");
 			status = 0;
-			break;
+			s_sig = true;
 		} else {
 			netif_err(qdev, drv, qdev->ndev,
 				  "IDC: Invalid State 0x%.04x.\n",
 				  mbcp->mbox_out[0]);
 			status = -EIO;
-			break;
+			s_sig = true;
 		}
+
+		if (s_sig)
+			break;
 	}
 
 	return status;
-- 
2.34.1

