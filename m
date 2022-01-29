Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63B2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:33 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id h23so8035826pgk.11
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6bf6lhHbgkl3pCSqm/k2iChu7YEwDY7WU7VmbDU3O3o=;
        b=dAdoYV5mtnPLehk0FRM4X0AdM8jKLGQFg0jMR+yN5Z5ih+CeKbXRjwBPd2qH4e0B2H
         V+FXAjqf/+SSNo+YVyVYCmjt/MjApPsDSMnS0k+6Pox/4Xkgr1SAE+BviaGXjgoiF5Aq
         lBFDjZie4YiXcpQEa8gfHb63GYizTeLovnGa9OqokDBAxxYCgCmPxhJqwQYGO8ev0S3N
         sYL/I+Az1cO4wHR5ee8g6kS1bUpEmBbReZvolJx65i86JjltY4hvL1PoBi8uA9K7DrXs
         A7LdUQ0md+KZKKnQbwAOYMJPioB7Si7rNHCYV4vIlXNe7ocbYerTjJqOKeL7TTEASZx+
         Caow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6bf6lhHbgkl3pCSqm/k2iChu7YEwDY7WU7VmbDU3O3o=;
        b=EN+08X5x4Lld91lcIHN4g73rfBcCXuh8oq8VFEL/KXI2ZMH+ikBfRAWS03BMe1jeoL
         dmFL2EZS74wFwmrNrrOnkQfg5QMlkSak/ZHXBaHcveyDZiBcorDJ+vHYZFLYBuX+pemO
         mxPDNhH5NscO9fdAIhwLkXrIqIjEb/RfZc/PZuwElzsNUrrar4aPt3Y4ye5jKU7ZZyAM
         traBO3VnJdzWMU7JSx5HeAsEcMH8VWF4OiD2A0+h61yxof4+MEZtRFMgmhYwMG+dOtJt
         Cm+p23x8gasPA+Gh/I+JSDskDM0lTmZJXbOJhLYCa3yPJJOPMz4tbGK/zeKijYoih0DG
         iGzA==
X-Gm-Message-State: AOAM531cjOCIvBPOrhUaLodoaMynthaMAwwNAwfDV0NiWUblnmKZaGaa
	Ta5/UJWnQfnZ4dQrxnwlfGUX0t8e4JY=
X-Google-Smtp-Source: ABdhPJwKSvI9hGklRZ4LetcksI2zs63WhOMTuytmMMX+51ZZT0rkLUIdmTFvLeTa/j/lxaf24oZ9FA==
X-Received: by 2002:a63:2ad6:: with SMTP id q205mr9014100pgq.46.1643473893318;
        Sat, 29 Jan 2022 08:31:33 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:32 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/23] staging: r8188eu: remove unneeded variable in rtw_p2p_get_device_type
Date: Sat, 29 Jan 2022 21:57:58 +0530
Message-Id: <83609e3c75a0bde4be612d32d76eaed6a26f72aa.1643466748.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643466748.git.abdun.nihaal@gmail.com>
References: <cover.1643466748.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneeded return variable that is initialized to 0 and not
assigned after.

Found using Coccinelle
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index b093430ff744..6d72b15541ab 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2769,7 +2769,6 @@ static int rtw_p2p_get_device_type(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	u8 peerMAC[ETH_ALEN] = {0x00};
 	int jj, kk;
@@ -2838,7 +2837,7 @@ static int rtw_p2p_get_device_type(struct net_device *dev,
 		return -EFAULT;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int rtw_p2p_get_device_name(struct net_device *dev,
-- 
2.34.1

