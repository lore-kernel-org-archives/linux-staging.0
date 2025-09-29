Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20862BEFE4
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128649; cv=none; b=Lp8v4CQ8YQNDM3bsAwpszlU4BLEIkQozp59FjwFNMb5OPkZdKWCGL+qxlUCJE4MJS3t1DwjMWDPikmNAXqp9XCRlYZ1fPztuhe9x8dIJcnj2qd/yvai2Q5paoyD53SwSBpE23COZeq5zKxAQjB5NChsjZs7zKG9GKsYug9j4aQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128649; c=relaxed/simple;
	bh=ZIDFMuE4M5pN3hNXaXhKSfNWI42Rb3epwAfW5TFj8CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cSU1trNI66sMwGAcfavHDjGCNQoNu8sy3wyPqA9s+tiG8Fl8GWnVquIpg3MdG/JgQTSdtTrl4wYhmOQuf3BPdF773kI7Kqqp9fYkJDsjmQx7ZQDLz7y9rX7MywHf8NHRT97cXiOm1Ui7dWm1t2AROiWNLdw62M1o3jxSAhtoWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c59iEPuZ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c59iEPuZ"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4de659d5a06so17488871cf.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128646; x=1759733446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75NYRUjzu7V9uiI556WCEEmql3MK5Ygx3IijVaMkk7Y=;
        b=c59iEPuZfWx3hxNf9xPd3KGZEFVC4AYRr90idqNqlBg4UQqWQf2WT8zXttXvpZKuXr
         8n07JcFBkHrinP5LHj+ilpX0daRfXPy4tBYvYtf2ZMx3cqe1+bDUU4nBUjhwBLHwVclY
         DkroPmKJTI+GRSiaoH7Wwc4Rcj5kx8o68ACW+5/Q1rxZxRBtyApdWDY7PnXAf2gkAgCK
         qYvc+KCOBJfWzXSf6NykvUb/ETHVdud/Wi1+SUGT82gFHrzdP3D31IpYHCJYKL+AWr79
         L2RTffRLWXEM8P3yX8Re+HW83O/FfirICd5LzutM6VACTO9kkgNkR4VLZwV7M5JzENGd
         YoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128646; x=1759733446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75NYRUjzu7V9uiI556WCEEmql3MK5Ygx3IijVaMkk7Y=;
        b=EiGrWhDwxF0o2Y0ARdDqiEvo/59xZCMet5ehdMGBXEbRwpKeZt2J3Dl53GwuRgA818
         UYY7nOmKdC9qm6Oa4VGkQRUYzlLHONo7FCukCIOZMWlQ/YRgBsLyii337Ha/ukQYgajv
         xwNUOiSf3OYLAQynVMFg2kkRTo6tmPbB55VHodeH68drjehViV3ZcxnKDiU+k7jONlQT
         fewpIFhYwK4xJg6e6O/r37NRW852O0tR4u8DeUpN12rOgm5BXMEtX8SYDcBlbMOgVB2V
         zesLHfcxt//F+EeLN43pEfWVp5eAuWMw9yoXMbYzA4z1h+dyV6j3OzWQNmRUnPoQ7Euq
         T/bA==
X-Gm-Message-State: AOJu0YxAn4ZNjUO0NUkUaGD2kMJ56LcmpfpdoAl99Jcf+cMxRTxoL3c3
	KAuC8jQqqXoWwjYijE4Q7+60lejAjsDfP/tSO5wbvSipRUsIJ0mFoYtC
X-Gm-Gg: ASbGncuL5Pio42QDIkzqUMVydqUH+BoQCpZ2fJrTFNkm7W2qEeGRKnSvDmJIay75tno
	RUaYtAiN8IKKiWPfSXFv74/5S5f7O5LgBGcLh7NbqD/VLkFKTDeT+WdEGMzxGsSc72oHtgV3OtN
	MAXs/Ylb+huSGD/+G5gQpYWBuW7tnZw7liA7hyRtISO0k+vJu/Tr+6JQ/enAb7lXxpq34RmqAT9
	rUFTI35R94KZA3LyT83yNLDBmWn8mEPqkJjS0p3+J70A8gRytDS/JI9uxiIgMXGItnF8qcoJR8D
	9mh9n21shQxHvGOvkfWlYKUhtyhR1D8VvCAU5oP6kuTBr9yAZgdHbgxWFEaRxHUdRfNcWUu4z1c
	iJk3lB7MI/7su6b1vkO+3Ne+XUGZX8A3cr0NMZWiykfUfzxrSDltQoDa92wwH8zixPqtNZr8t
X-Google-Smtp-Source: AGHT+IETBXJT9TSZrRNQtwiykHOuZOUkMcuhaG49sOTr4axYPf3sExOFa2JBQHhSe896Y/AgSfSP4A==
X-Received: by 2002:a05:622a:480b:b0:4b7:aff5:e8c2 with SMTP id d75a77b69052e-4da4bbe4440mr188684981cf.58.1759128646578;
        Sun, 28 Sep 2025 23:50:46 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:45 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 08/15] staging: rtl8723bs: remove space before semicolon
Date: Mon, 29 Sep 2025 06:49:53 +0000
Message-Id: <20250929065000.1010848-9-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary space before semicolon

Drop the extra space before a semicolon to comply with kernel
coding style. This change affects a single line.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ab626c88e7dd..d05ff073af2d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2236,7 +2236,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
 	/*  adhoc no 802.1x */
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ;
+	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0);
 
 	pdev_network->rssi = 0;
 
-- 
2.39.5

