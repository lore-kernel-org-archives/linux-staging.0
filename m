Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53B41A254E;
	Wed,  2 Apr 2025 17:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614236; cv=none; b=UuLUS/U1Nn0mS//AZic7JP4UE+HJFbjczLF/LyXkSV8kbpPWJ0b3s/tVv1LIS1POsPPyjy+0YvdJfibpKvbEJV8+eQVcKgh/x/bdLzj9nmYsjLBPkP6e+HRj06mcU7fLM3G7N+UuCf7I3Nzz5xeXGiWLy+gJw4Po7M6j6t+UVRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614236; c=relaxed/simple;
	bh=VaMFdFfclsC+WFCyzHYDRn44c9vE4yPnhIs+rwALdxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QeW8O9zyf7Q6khDll8khiDZB5pAtvpS+Sz1CyL5WZoWDusJyPt1funo6y5P/bNFfuNyI4Ucb5cNiJ0wkkNC9u/ID4Fj3iFBtGkA1bPxSKOgOZFHzYSBjhF6bRxQA5KOasgYMh/dJUC0NCHRhoBRtVyHqxnCJpDvylsLnIv4DEBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8TR9ekk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8TR9ekk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso66718495e9.2;
        Wed, 02 Apr 2025 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614233; x=1744219033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+C4G4SbGxknyB0zTfgPx+p1t+bnYiQcQISoKxR/Vkc=;
        b=h8TR9ekkEFetfg6wqyjV0xHGtYg9Z9lnvA4lYGzO3B2Ux0Eu5vxwGIuiXjWry4B93K
         AzUhLTLvCSVC9gvv2G+/rIOKuf2PxrfE+pcm+65q832fNtn9KG87XAeju7VCD6ulEsy1
         HH0v6FIERifNv3KrKfifhDGlYU2dHTeO/5fEMQzHPaog0Y8VA/Dw4EtOlq0L5sphH5Fb
         WQED+1CW4pt/u+zpgvYftfUX8OaqF/oPNrSvannivPsno91eDVRmTapEFOAfb5x1Gwn5
         3AV8s4sAYYhLmOrAkFJ73ru8sGHUlvMR8XXmjPpwahP0D2fTNlEzaJsojDt5K283x1rC
         uXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614233; x=1744219033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+C4G4SbGxknyB0zTfgPx+p1t+bnYiQcQISoKxR/Vkc=;
        b=aSH2LfUexQeIBpbGEdvDZuDC3wUwt9YwEyS85b+u/vCXuwtFxSfyO+7pamgrbPE/xf
         772m69rZY0wZGKsfpr7yiBavIZYkqUNBEDpC80Cv7w1ev0wmxg7Ix/1i9zUpjMD5USXs
         oB2JFws9OBWgcJqD3GUOIj+Dxmf2Zqbw/Kkjoc6IFWVZ2fDIKLLPYzU0DCUnHzmQ+inX
         FY4Iju4F3P5ne4VngDz3d+7/2Y7dQ/ZhVjL7V44u/AqERt/+QRthdkHqLOzjYW/FQ623
         LqFvbd4zlsYx931uTWrkGVN+x8ungLEOtmAcwMBON8qerAvx8MDemYekDDx0TmqnWzm/
         wX6g==
X-Forwarded-Encrypted: i=1; AJvYcCV/GFVwV0iOAZM5A867+/Th8vlb6CctwG/8SzsM28ckSJ4LL1dUj/rJHcEQ+Znp6e8s/rqqtSiXMLDEGX/1@lists.linux.dev, AJvYcCXlPjtOIkPYjImIFipGxv4mYhS2C3taUjrM+EZs/fvSFkuZRXGdgcv8dDBWVqfGL+5MdKF0nN8/Ve+U@lists.linux.dev
X-Gm-Message-State: AOJu0YyZjBqyprjbBsfJOHV/nGtBfOCHEp7J3uDNKX/Bzb427+D+rK7H
	nW1DPAzrX3MtMiKS1MFx7FPdXNWea6xhpCqFLatnd+zcIiHqvUfu
X-Gm-Gg: ASbGncv0CfIC9ATndZnAY3LQ6X/j6wmV6aaUnOJjSYLQ5o0B74fZsj+EROo30WUa55I
	MnWCvNpINSZqsUk/EIVOqdzb6RJK9IPPixqtaWgJrKSDcwqHq3YZF8rY/nPTIWOYMp2W+AvKWM5
	SU2Ni8eVuHVB0nou+MOUGxlJv+KzHbjCyLYehkh/y0k6r2VbucyzRfZf4Q1KvL5UdmL2blxI81+
	NXo34kyWaYWbdVdtD+AiB1PlnN9RcY5YGeYKAxdL7dAuSmd6t7ZGHG/jR3eur2GpK8yCP5eH31i
	OF/uLzHXqKJsJkd94w0SX8utIiEMGSW/xV10TPAneQ==
X-Google-Smtp-Source: AGHT+IGXAJCPar3HVUFKQjK06ujZSRm1R6M97IdO3GlXbC5NKiu0ELwX7yqGkBPK9kj/Fy5xyyxC6g==
X-Received: by 2002:a05:6000:18a5:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-39c120deb39mr13203589f8f.14.1743614232894;
        Wed, 02 Apr 2025 10:17:12 -0700 (PDT)
Received: from pc.. ([197.232.62.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm26713525e9.11.2025.04.02.10.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:17:12 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: rtl8723bs: Modify struct sta_info attribute qos_option and ieee8021x_blocked
Date: Wed,  2 Apr 2025 20:16:44 +0300
Message-ID: <cea7ede3db3709a13f1dcd25976779cd46da713c.1743613025.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743613025.git.karanja99erick@gmail.com>
References: <cover.1743613025.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by ensuring consistency,
replacing instances of 1/0 with true/false where boolean
logic is implied, as some definitions already use true/false.
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

