Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A948F70
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 00:42:43 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id g10so4888547plt.8
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 17:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=IroJdoAcq5zAI1honZ3ThwMkWQDS5Bqq0q4OifWOrBY=;
        b=i3C6WhOMU0EGF4ZLXdWYwphURgSehOFih2BYREbGOAokXJ7mN1DWHHZcFPF3r3lAZU
         zekilOVO0OAJ/QLe/J1Q/dLt0NqTBP8TxHNnDvo4ECHR9o1QCvRwkFwt/DGH6taUAchR
         ModzHy0esq9zd2fKxkn/lD7HhWA6zfnk/xgt+Y9piYPpkJkA5fQcj4Utz+gM1MztnT0v
         uiqfpOaJoReWJ91Q+7RJWbhs/3vyObiVvGEccB8zkM54rtOCS3a3Z1hUEQyNIGHQuzqm
         h2FPvaLt5rJl47YRSqAcO724h10Ns+UA0p8hb8vDhft8U8DcuX60ZICALDosO6Wsn2EI
         W21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=IroJdoAcq5zAI1honZ3ThwMkWQDS5Bqq0q4OifWOrBY=;
        b=U+JfDf/eODxkdEwNjae3ENYfSrcTLucuXEcNzoE85ILtjDUlzRtEDkqVenm1jQkfgd
         YtESQPov4/YMagmFCXNuwIdTm2NuA8ANhsrGIvbQA8zQWMr8lP1kryyEAjDai3/xIxKx
         kAyQ3z540y0RGoMWXvY88ddB6C3ogGbvFh1nZkIp+3T13ZhdRJBbFmigxFx/5Y2S/UZR
         8024AjMTQtRDZJ5IzCGIlsPGcxGQYLTsRGz8GiclQodmKNWimeZowm7lkBg9MF3OLeMx
         Y7xEmA4X20NiETCfzvqPkn8+QusztHib9WAdXDd4RIO02pvehDssGweg1EpiCYkTldaU
         5hdQ==
X-Gm-Message-State: AOAM530uAmXIAs5INLroVE3eodVC6gzgizozupLDyKY0sICusnHXp2dB
	ZBJqPxAkBm7/Y9cOOXB88OY=
X-Google-Smtp-Source: ABdhPJwNpsGO0DHC2BtRNKlK9V+ctRoirx70WYVOQGZUY22wzasZXkjbc84kRaSHg7nHtSBl2Oyyvw==
X-Received: by 2002:a17:902:ec06:b029:e8:e57f:680 with SMTP id l6-20020a170902ec06b02900e8e57f0680mr6438673pld.8.1617583362893;
        Sun, 04 Apr 2021 17:42:42 -0700 (PDT)
Received: from kali ([2409:4042:4d84:a21:5e54:ca6d:ddda:81d3])
        by smtp.gmail.com with ESMTPSA id q19sm13364813pgv.38.2021.04.04.17.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 17:42:42 -0700 (PDT)
Date: Mon, 5 Apr 2021 06:11:43 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: manish@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	gregkh@linuxfoundation.org
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, mitaliborkar810@gmail.com
Subject: [PATCH] staging: qlge: remove else after break
Message-ID: <YGpcx9MZuZJFy0Z/@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

linux-staging@lists,linux-kernel@vger.kernel.org
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

