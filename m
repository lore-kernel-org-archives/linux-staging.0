Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A771
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x7so50646158wrw.10
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B1aC/KYysf2u98efPHVNtXofbiGurQZJ94vgGaYPVJg=;
        b=IEpn+rUgo/JgvRuVTTWPxI8iRJ2UDFAkqucjjaT/kfQxpMuLPuBFa/mZkp6Aql6TUR
         7c/T45mAZ7YPwiHQB77KhzUOnPudzM5yhtTKTD67EEwVinbs1rL2l19bpnh4ZgYSzixs
         3iTLp2E8qodBog5v9b393jo7ZucU+hONm7008+/monL1M7RhBkB1K2sigzajCzkDb7uS
         HepQnKpz0CR2Vfi9i4iY2wQs8CSAscT19eFJGaQIZriqtu6KEj/3BOSxBwkA6Tn/pjAe
         dp/Gd8TOV1+PtZdiaMEKax6h5ZVn42TVkcEGEJy660q9G+fAd74VVOPDGg2VyXEYX4Yn
         zPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B1aC/KYysf2u98efPHVNtXofbiGurQZJ94vgGaYPVJg=;
        b=gh9N1dvlk+XQVhMGX3tnZuKy9SxmCLGWeTQqNUu78BRTituCXKSIlUhEZIJQgWbDQ3
         DTDzKcp1UvG5t4bABXI6oOsq8GbIizrfiULpYzljaEeOok+H7Jgf80r1ud7p5ZYtSKF7
         gnPGn/4YlWDXrZJeI5nN2fbTfXb1cOsA0bUWmaQ5w9yGsRGkLsBtE7OcNiCfNgpcJ9N9
         IR1Of35QvrHWIwPU1u4ypyr2deuQ+FIhIFuC/fjb6L9xjNQShQw4k5rCtl9hFQgrI3f+
         JaRQVAMKCbijeIzSkJTKFziKfqUdqm5dWjAS12xOIkn3UynhcJ8cT1ahIOdWTzHUFeFo
         +Wag==
X-Gm-Message-State: AOAM533oEHzTgYwNU4zG06nlHMJu1kkygpUrhGsc3OvPEwcKFuA68pWW
	q/YARDgkS0BvFhm5gZGLHPk=
X-Google-Smtp-Source: ABdhPJyrXMWqG4Zvj0jQ/tYhT9XOh+t/a+VU1Ie6ZHv4OBTaq7GECNDzydjhTYtIux1x+NKpz6SWWg==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr9853223wrs.7.1619255031081;
        Sat, 24 Apr 2021 02:03:51 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id t206sm10198617wmb.11.2021.04.24.02.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 45/50] staging: rtl8723bs: remove commented out macro definition
Date: Sat, 24 Apr 2021 11:02:28 +0200
Message-Id: <2b56922e8e4c5fde6e594a9bbeb888bf7717015d.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
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

