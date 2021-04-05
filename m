Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FA5F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 00:02:17 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id t23so1967546pjy.3
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:mime-version:content-disposition;
        bh=wCxcfmyN+uyu2EuDS2MM3DeNALMCF932/5FQyU6Gi3E=;
        b=pW1LFy3z+aGibN9XcvUaCpLdBNrk7Z5AQjCvKHmlFvMBayizkOw/+QGI86OSrHVQvf
         IoQXZjXmHiSrHdPUChgBU7FZ2melVICdLW5bLgkANGlvnqRGbs4RzgPoHH16ZQaM63Il
         FsD4QOV2q4PZzWzyikp4DYe/jzyJ0JsktZPyPspmr7tE1RmrU1I3FCmeW5eQbHPjK0Lg
         zcNi4MLXxOZe4f2UazQQLSTyyteKnJPhdwlNFRYDxzoBYo08Cz5M4eHBmz1430jZbOWy
         LzIaBQiHvXrbQ25LmePYrN8vUJDC3wuMXorRqhm0n1z96IGO2TT0XkBjbTppSMKqAuKn
         nF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:mime-version
         :content-disposition;
        bh=wCxcfmyN+uyu2EuDS2MM3DeNALMCF932/5FQyU6Gi3E=;
        b=Zmz1wLGAVAvgMnj41uFx7tQCLRpzTQeG3uReuY2Avh6BYcLNWDsYj4pGGQCMrfMZ3n
         d1C5tnF/ZvvdFjUviWhXZ+l/YTzXj8JXjeGF0GvjnqBc6EjvYwo/+FDVmfwtPJZLlRK5
         ax8WGvY7e2K4VUfm5DIh01eeTR3DOb3StYDAABnZPLfPU/7NnO8NmBvKaojmA/cFha5H
         XB3lLPPelkUUjpQOABDXbwsDgiVhN2mRVo2ZTFgeJIF7fc+cZp34Nxfhl7r3CrBNUDvf
         fF3hh33V60o/eZWIYoA5ftqC/RCjAAbKHjr2HPluTMK2hb+nBRnp9a/bQJaXZU1gCFsb
         eC9A==
X-Gm-Message-State: AOAM530KjdP72kn5bLKJ3A7cXgsAA03YyBxq54OUG5JyWjBmFK8Rgw9g
	NMTyaLXwPeEv6aV/9SYy3Rg=
X-Google-Smtp-Source: ABdhPJxpPazXdKfvMEld3hWN/kGBTCn2ZuS94vfE3AVfI/3g+TS9JM/zSr1c9/sCgTSxL04DPYy1lg==
X-Received: by 2002:a17:902:7612:b029:e5:f0dd:8667 with SMTP id k18-20020a1709027612b02900e5f0dd8667mr21654982pll.59.1617580936970;
        Sun, 04 Apr 2021 17:02:16 -0700 (PDT)
Received: from kali ([2409:4042:4d84:a21:5e54:ca6d:ddda:81d3])
        by smtp.gmail.com with ESMTPSA id 195sm13571179pge.7.2021.04.04.17.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 17:02:16 -0700 (PDT)
Date: Mon, 5 Apr 2021 05:31:17 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: manish@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-ID: <YGpTTbWENcr1EejC@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

outreachy-kernel@googlegroups.com, mitaliborkar810@gmail.com 
Bcc: 
Subject: [PATCH] staging: qlge:remove else after break
Reply-To: 

Fixed Warning:- else is not needed after break
break terminates the loop if encountered. else is unnecessary and
increases indenatation

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/qlge/qlge_mpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
index 2630ebf50341..3a49f187203b 100644
--- a/drivers/staging/qlge/qlge_mpi.c
+++ b/drivers/staging/qlge/qlge_mpi.c
@@ -935,13 +935,11 @@ static int qlge_idc_wait(struct qlge_adapter *qdev)
 			netif_err(qdev, drv, qdev->ndev, "IDC Success.\n");
 			status = 0;
 			break;
-		} else {
-			netif_err(qdev, drv, qdev->ndev,
+		}	netif_err(qdev, drv, qdev->ndev,
 				  "IDC: Invalid State 0x%.04x.\n",
 				  mbcp->mbox_out[0]);
 			status = -EIO;
 			break;
-		}
 	}
 
 	return status;
-- 
2.30.2

