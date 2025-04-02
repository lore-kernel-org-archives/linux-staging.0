Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676823F429;
	Wed,  2 Apr 2025 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598081; cv=none; b=ALVIgrXRf7Ll8+tBzl3jpljpQoTJGzXc+SBOLEj3aQicxGsiwUaVHRYFHQFw0B4yd4hBHOODo+KepcDPVsRDaiCrZBF7nqve/Gaq9LUKJMo4O2tF1tqKdGilxYhqZv3F2B8wtv4fXqgiSI+DzzhJpkiC3Jqqaqa4a0vhInf3ttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598081; c=relaxed/simple;
	bh=TKE8yYqSvh5CTfDsthEGrDa+fvp8GLdxByJGAAoWQ5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EzXZ6ds31bZRQ5qtpJApsgY4JHNMdW69TN92yxtmilepgiAf74tM6wgRZ9HV6sq3vB0f7hf+iHBR0AiBAXX8vxr8VWKNG8yUAQTedV6rQfoF3eCod9+o407BDM3lYS9X7vimYpMcVQY+dnQzSy4VOY0FR3FvADGHllS77bEcvdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nngKZJGe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nngKZJGe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso32781335e9.0;
        Wed, 02 Apr 2025 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598078; x=1744202878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rEM6GDoOc8qSQG8ptxriqMDYs/u8ieO+7RntT8HZ8Q=;
        b=nngKZJGe1sbRqazsUUXqgt/bE4DYntHnvZfO+NhASectubM6Q9VHzNtuhwO8LROfFZ
         yXcRLIUCxWeDTI+Us12jipaW0bXuo0PvTMKGe3wqZQpSfllVlnIpmeBsl0XGB32dz08u
         smxC0fq3pjktWP1ICt2gHsT+lgVnzuTzNpgNm7QVwgkc1JmK0ZNnEuldyPl6ko+/hydd
         gKeTBlhR1D/NAz3uDOD4+gj0dxrM/kon2rvokaRa92x6lStcVTLW6Rig6e2o/RHgjtG1
         c191iqTuVvm7qE9e64ZE5W9+vxUfx8hUNMJCqfueXy+dFEGr8YwulP3oXfc4CyJGEQU9
         +icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598078; x=1744202878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rEM6GDoOc8qSQG8ptxriqMDYs/u8ieO+7RntT8HZ8Q=;
        b=wfKCB8wTISNjQem3U2rZbnF62AjcuIGVxvV1TsUyIGWXLSLe9NeBqDZgVfLOIgwRih
         c4wTD3Y/Y+SOw+O0y+ELXOxLOTJOawFevrWNRBzaUOIZeebBItl/aYPcxEzsaBT7Ra9e
         HMlrklqNzir5JENkRe9dL08+TBIYFqjfPMMytCpmRg+W7dhPjqXiMJdeXPCk8Cl2noEW
         UlIxfDcedXk0mjAJcnBGXwrmebJ6GLoSiizauXXJpXmZsorjezn2MW+Xfw3Cz83RbmIT
         IClHeI499U9RqHeUs8j1NTjcn6rKeTjwVxb00AIu+Tz6QA4tn1GeyFSpZJXRkzMWCr/B
         zoKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJwh6XpD33v0aGy9rWA0JStI8G7o2SZUnnyW71uD9BVA8JwUp8RxAbazbn/pq86nZbw12hiicxErht@lists.linux.dev, AJvYcCW8zh9cAJDE6aVNhEBqM/ytaVvwl9GADKOfFU/3aqNcju87Nsk1Jf6ure377V3PLRsLdpsQQSdkk63ZSdCp@lists.linux.dev
X-Gm-Message-State: AOJu0YzaoKbH1tY6q73Z9TwRWFWOx0lJAcvR/fwp6GzwejwKXFmedF1q
	MFjEh1X5e/2KdfUm0bWSurdLXnJo7y7dHsh4oTHx9iFoIDWD87mq
X-Gm-Gg: ASbGnct4zizbzj1YP0j6ai9x09aPWVkB6Bk4lzvQ2H3wCTCzVX+eatByaxcjR4jF17M
	eBjCcruclqunY0ZUh4qscWKWOQ+9XSxcUZ4wMtNUkk8kB8KMXyFnm2XaDRBHs1L0l73F9X0bnLo
	LTKhCLusJRD/fkc6FslFAsDKeULTFZ8ZIFmE5QgYUml1I2PJp4H5L1aUWVb60meryJMhJCzgsr9
	3pYrEBH9fJarLZNi9+HrGZqbCbxKo5+lTc8wo7YK02tDgCuO0qMiGuI/NaWaQSmK0bB66TaUNX/
	w8CD1yUzRrU9AYN4oWPEXFsZX24zU4rdWFFSOAzJSA==
X-Google-Smtp-Source: AGHT+IF/ugBq75bTqrl45fMDCIyEjBFz/p2e/sr3I7XVZNQJ+ZGWvLt+LzQN5HokwK4sHTYXfc3xAw==
X-Received: by 2002:a05:600c:34c2:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-43ea7cdf399mr62342575e9.27.1743598077828;
        Wed, 02 Apr 2025 05:47:57 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm19675985e9.39.2025.04.02.05.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:47:57 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: rtl8723bs: Use true/false instead of 1/0
Date: Wed,  2 Apr 2025 15:47:41 +0300
Message-ID: <49c14bf7475d121e7b3f600e46b93c003851abd1.1743596287.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743596287.git.karanja99erick@gmail.com>
References: <cover.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by replacing 1/0
with true/false in cases where boolean logic is implied.
This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index d46a04b9a05e..199727f04516 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -386,10 +386,10 @@ void update_bmc_sta(struct adapter *padapter)
 
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
 
-		psta->qos_option = 0;
+		psta->qos_option = false;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
@@ -1967,17 +1967,17 @@ void sta_info_update(struct adapter *padapter, struct sta_info *psta)
 
 	/* update wmm cap. */
 	if (WLAN_STA_WME & flags)
-		psta->qos_option = 1;
+		psta->qos_option = true;
 	else
-		psta->qos_option = 0;
+		psta->qos_option = false;
 
 	if (pmlmepriv->qospriv.qos_option == 0)
-		psta->qos_option = 0;
+		psta->qos_option = false;
 
 	/* update 802.11n ht cap. */
 	if (WLAN_STA_HT & flags) {
 		psta->htpriv.ht_option = true;
-		psta->qos_option = 1;
+		psta->qos_option = true;
 	} else {
 		psta->htpriv.ht_option = false;
 	}
-- 
2.43.0

