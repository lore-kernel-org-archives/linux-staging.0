Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45772590;
	Sat, 16 Apr 2022 19:18:27 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 125so11940091pgc.11;
        Sat, 16 Apr 2022 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=cEiFYO7CvfRyx2lxfp/dzLomivsTy3qKaQW3t/1AfgA=;
        b=hjhW4uwSoiJ3c41yfoxcSod5NklVn46w57mFDsyZSSAbFNscq7GfEDF2n69+jgBU/F
         ZhCf4FjSWojzwk+zZGwcEbar4ct/cbGfd2eveL/hB7gga5rsGJy7MENwxAGaVcc5pIo2
         EQIUYVmcm/ZID7UwqnIIxLDG/kPCxRKGpvywa3K8oyasbskgiAfNYJJ1vOl3XlIKBeCp
         xMdcpw05UCMjFnGsOYsm3qkFUOOyNo2QzfYIQkzYDbCxzdTC4B/dDlBNYLQW1iH5MTX8
         LD7nBPDyLaKRH29NiZbn3WYCc/vxBJczs183CgGDAeBiBPSHBiMzYnbYaY2lHcWe0U7K
         4iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cEiFYO7CvfRyx2lxfp/dzLomivsTy3qKaQW3t/1AfgA=;
        b=yK6dYEqybrmj2kOobsqSmUWnliYQQnF/AnR2BEtg2/XCCmd2wfKQc+gE7u6wtkHLvh
         knJUWumyfrOJrlljc2BmlovMsVQT+lmRgnWretlCSBe3xhxQcv8+/svKJjHm7B0GbU4/
         VPbQOj5QS6YCO/4pHoCCxDrZ1TnnYXAgygXaJDyMNG56GBYQcIncwz2LsHrpxXNcno7L
         KX6vYxR7rq5DbbkWIX2nbZ3V8AyRB9WNqyWyVJ5uYdpGbK/OpXoSRTu0z9+4zCHNdid/
         VCRXmWDTUL5w8+1CyPiFMX+298YDT9s8CXKBdWRC0O8bO6wcFxsei19eIbVSe+R4C1WC
         oVyw==
X-Gm-Message-State: AOAM530BNGh0dootbLruOEgi+Wrzjyi3xmc6/qoXFbAzp4VHEsk1M0y4
	G09wkESinuT9M/lO44AxWIY=
X-Google-Smtp-Source: ABdhPJzgLqlNi+iTW3XfsMmksrs4Si6d6BxNd3yiSJYhM4GHXT37Bc+odwKwilPJVYOUYvT/NjF8gw==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id l15-20020a056a00140f00b004e069959c48mr4780091pfu.59.1650136707150;
        Sat, 16 Apr 2022 12:18:27 -0700 (PDT)
Received: from Negi ([207.151.52.3])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090acd0500b001b9c05b075dsm11913701pju.44.2022.04.16.12.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:18:26 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH v2] staging: qlge: add blank line after function declaration
Date: Sat, 16 Apr 2022 12:17:45 -0700
Message-Id: <20220416191745.7079-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Adhere to linux coding style. Reported by checkpatch:
CHECK: Please use a blank line after function/struct/union/enum declarations

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
Changes in v2:
  - Correct commit message.
---
 drivers/staging/qlge/qlge.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index 55e0ad759250..d0dd659834ee 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -2072,6 +2072,7 @@ struct qlge_adapter *netdev_to_qdev(struct net_device *ndev)
 
 	return ndev_priv->qdev;
 }
+
 /*
  * The main Adapter structure definition.
  * This structure has all fields relevant to the hardware.
-- 
2.17.1

