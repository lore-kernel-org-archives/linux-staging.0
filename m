Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985B71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n4-20020a05600c4f84b029013151278decso2407349wmq.4
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QwuVZ4DerzLqtKGB6gfK45URd5Glj/AwHPmshqzuvhg=;
        b=HjRemUUNvRl3hwTB1Llsc1JSydUodEc5HPftrFoNoAukh5l5N87NhpxisjR2ulTA7t
         NV4X+wzypDnT8jDgKbJAPndVhx4SPxY1mSE/nJzl32c8QkXC77feWGpvzON28N2Nycig
         lSYr+DBnUI5bu/o+M43vI1q94S508hVWdo/jGa/iYBLL61aPLFwHPA78xhtWO8OZyz0y
         ihOq8ZVS2yV6mAfR+39s5VHlEK0/l1KT0OeMkVAVxRuZHGRODkHeaHVrKPU1ZuDlhBkf
         1AlZKiygMSOt4GTjCU0FYJMec/6CJ2UMoG5z0I46zQRhOoqkK+CYZqf8QUMmygitbyn4
         db0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QwuVZ4DerzLqtKGB6gfK45URd5Glj/AwHPmshqzuvhg=;
        b=ZO7gPZCK7bYAJg8QXdRPLXm4eTESayyhtPQd7UAfmwLQhg5PGcyCptIvN4BPdSR8RG
         AHbHxoYFzshXB2jMQl9HX1o9RU5IECagvb3VaMK/HtfHcS2VJIJM4Lm1SoJuAg92JS8p
         /Azht2MMFYsmbhcLxHuiuLnkS7oRnUbGEwlHdEQA0ZY+CABSD4Qed9h8PskuiFqwVc+E
         GmCq31Yun5n6bFpRqv36u/vTVPNesQ/qg6ZLiVfv3li3YtWKrxBd4cl48ihWolRrnvQI
         NYhuSWVkyAj0fiKSFHsYzHhh8GwzpFOfoefT/5V8K4PZ5Ilnbi4OZn0Q1xSPtQ9DIcxo
         U7HQ==
X-Gm-Message-State: AOAM530BIY9rBDmasnZpjSKLMb/xZl9bm5ZCIT/R0QRHwyYMvoRcKoXM
	Fxoets4oWILDKabjLTRGms4=
X-Google-Smtp-Source: ABdhPJyN0hknx8JZh2Feky5qyA2wl3lfl1svFqkVZ0rUcFeLwix6p+DEQQZQjmaH3oG+RXmg/lDWnA==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr8559624wmi.189.1619255024222;
        Sat, 24 Apr 2021 02:03:44 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id w22sm13448795wmc.13.2021.04.24.02.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 41/50] staging: rtl8723bs: remove unused _module_mp_ def
Date: Sat, 24 Apr 2021 11:02:24 +0200
Message-Id: <9e8945a3f4f58b32eb2ed3e943f8cc0cd6c26823.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused _module_mp_ def.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 3e391a23ac8f..261317b07635 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_mp_			BIT(23)
 #define _module_hci_ops_os_c_			BIT(24)
 #define _module_rtl871x_ioctl_os_c		BIT(25)
 #define _module_rtl8712_cmd_c_		BIT(26)
-- 
2.20.1

