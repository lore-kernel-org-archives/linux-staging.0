Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CC70
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b9so8356794wrt.8
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EgnFip3DBtwY5/YffZniWOU6/oNo0bDCt9nD3ZaDcw8=;
        b=N/SerJUnmwOssDpn8cHt1cNW/VzjqzEzaL0qWGhnyTscKXfzwW1iO/+bUrBMvCDEis
         9eNVFZvfCo4koBNyKsthOCK5Ol0Kjf42fARMerXFaIe70K2ipYHAgtxEX8JjMojpGXUw
         X/FLyWIS3v4Om5ELY5oh7VPomJpf4JQSUoc2wV1pKzSamx7/ngi4Gda/Ak7Fpp5qGLEp
         RqoNQWpnEmkIjCuBquf7mqhfGiXBm2dTp+7++nAbmF+7zKkp60czqhMnjHwHFTRUNelL
         Y3vReWAgNgn+PDB37NNn2ieXhKAgB5laueFe00WmxTjoeaOXHk3xZ59PwpkvViJgrJWn
         MtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EgnFip3DBtwY5/YffZniWOU6/oNo0bDCt9nD3ZaDcw8=;
        b=nQ8wsjfqWiPZ+a+RGigdYMFKFKnIEFvXpasDkHYuIDH/8+6YSX3odzG53FqR06/N5B
         v7N6BnYFUolSwa9Ayt6eWA6DmTo5mmZjVts3QLKALsyXCLupwAedHAC49QDSbvOlM0/7
         68D8Wt7xyJsvQ/+azfZTGBJFIw0Zr1yeLq6sSJMdNIQ7UM4RDgfMJP9AbYCPfEN8/UW+
         mgRpVMOlDYI0tLR/g6sFKckG1f+OpNcxLRPnb9lQ1kVynX469HxKMzw9cB+a9GhEj0dL
         P1NySnB3O/wHjYK/Vu1Mi64CXMX0r3iLDJuKGxDIelnq5vcDQADeFTU3lDheR6BJMDsA
         iuOg==
X-Gm-Message-State: AOAM531yirecfP/4UsWxGNez6ktrWY4wUQ4mpe/sCYwLSUpPDgo8HfoZ
	LnMA85iNhhGA+01KHIx9mY4=
X-Google-Smtp-Source: ABdhPJwbVCXz9CojEvvS3ulbd4ZdZURpoULNhPrBUrBupahyzZA63j4U8KebujTAeonLsoQ7NiV5ng==
X-Received: by 2002:adf:f0c1:: with SMTP id x1mr19516280wro.7.1616855101955;
        Sat, 27 Mar 2021 07:25:01 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id i10sm19237587wrs.11.2021.03.27.07.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 10/20] staging: rtl8723bs: remove unused macro in include/rtw_pwrctrl.h
Date: Sat, 27 Mar 2021 15:24:09 +0100
Message-Id: <39805614be82f1fd90ee460ffedb8a7beb99dce9.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro reading field ips_mode_req of struct
pwrctrl_priv

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 2d77446e9482..36d9ec82a7dc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -237,9 +237,6 @@ struct pwrctrl_priv {
 	unsigned long PS_BBRegBackup[PSBBREG_TOTALCNT];
 };
 
-#define rtw_get_ips_mode_req(pwrctl) \
-	(pwrctl)->ips_mode_req
-
 #define rtw_ips_mode_req(pwrctl, ips_mode) \
 	(pwrctl)->ips_mode_req = (ips_mode)
 
-- 
2.20.1

