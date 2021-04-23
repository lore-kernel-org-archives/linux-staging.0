Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E4870
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1392294wmy.5
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B1aC/KYysf2u98efPHVNtXofbiGurQZJ94vgGaYPVJg=;
        b=QmScpSxyI1oavnoQSSBSQx41+9hh8Mc2tv53Rj9OJ80FrEVWiEdiz2JBRXPkMihOx4
         IjRaOUAbPH/qkETdMHd2+w6uuMTNuLTrwlHpUcVzO3rj7jj4VW1siB7uX4jWBORfN7AE
         KxdfrmXXEMQbE+tbU6gPL2PwAisRHrHMKCI9CgHnLxpZNskctk+rhQ3jXCFL/YjstSLz
         UB/nW1k5J1ATRsJ66lxqstEqQIBlionQ+WRulU4CAVSePli8xgv/iNCkVia76BDoZbIh
         rRmXWYhEd9zU6kmHVHC4BtotoedbiGVsC8nLLQwESaHH9Rg965gJBD0J+wl59c+1MM3W
         +/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B1aC/KYysf2u98efPHVNtXofbiGurQZJ94vgGaYPVJg=;
        b=UyV6o/LZNkWcTGGeZG4qL6NkzJKcds4ZWSwMXbK3+SV4UaWixN5jgEGRx7qzOAd2WP
         bYtu/CfoOs6YCZMgOkIZN52mVt2JMOwrx64FhOC667x659SlIclrmLiKYF4Wu58J0wmc
         reAtkAmPN5iU0Zd2xeSLPWKB/FCxi5180ikufk2mfgIn3vHZmEFafexlLC2aTYJbzkcR
         63ItnvOiqYEO9ITVjZhMW3fBmOfNVAb5R1c+etCyGbrtoDBinvGj4QskjQsJBRVQTLq7
         VGzTyRP0TuYy1q5pad4cJng/KNyKWeO25uApuT+JSdGLPaQrP+kyUPdAJadWQtzc7oBb
         jm3Q==
X-Gm-Message-State: AOAM530JnI1h//Af6rS4nzM3QVq6f+OSnP2mvl0CJvxZ4qCMoLQugE1n
	TycAlzsKG/Z+sP9TbGdepHA=
X-Google-Smtp-Source: ABdhPJyGNH/J3++9XX7uONfOj3dr2AXWfImOu0o/+kw1tKVX02lNxyj70Y3cTvqtJMNsvgT44f/Kaw==
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr4740001wmm.110.1619189994956;
        Fri, 23 Apr 2021 07:59:54 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id c6sm38529576wmr.0.2021.04.23.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 44/49] staging: rtl8723bs: remove commented out macro definition
Date: Fri, 23 Apr 2021 16:58:35 +0200
Message-Id: <b1cb624374f6ae8adbb24e8e217966df3fd8c6f9.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out debug macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 1a52200e525c..cde4b1d6a4b7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-/* define _module_efuse_			BIT(27) */
 #define	_module_rtl8192c_xmit_c_ BIT(28)
 #define _module_hal_xmit_c_	BIT(28)
 #define _module_efuse_			BIT(29)
-- 
2.20.1

