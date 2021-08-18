Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C506D1B
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:49:02 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x10so6049955wrt.8
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wBmejVnNQ9LA1AHQBUO8SQSm/1xKof11ZR6O9YBXzKg=;
        b=yF1iA0BsSLO1LnObtYMB5UCQUrVuQh/ChFKqFbZGBPA3T5te+q1WtVx9kSg9IJsf76
         7y6dfMyvsTIr9U+7lONzw54a+WEKFNS8MvfSLLCMVKkG9z8VB+sbGesPr/sToCJSE7Sm
         +osTU8tGEGwUgGmrhAUhsi0Oj84DpW+P6tIUKtCSNb3HCcr/CAqIz+KsY7wJEZXo8/oj
         QTTKn/HSZeH5LR2ym9jyI9qCBKIdZCDlxG/I45Hmqh+YLnVYxVymUfyHJN4q7L5wqLfZ
         3xcAlGgOT/flfOLKFojvPw9WjsZFJemLAr1W9IjmVAxhi01Y7exVmxWuCtGRkkq3gYAw
         Tvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wBmejVnNQ9LA1AHQBUO8SQSm/1xKof11ZR6O9YBXzKg=;
        b=FqaWgd5+8nyCOKhy1pAD4vNTgNASsI088FsEuvv5fc9VLvRGOBXPeZYw0P6R2e6aOq
         +HNrQWVT6f19/Tmg4m1ZPWxIS05U5EDm8tvDkD8/ch7uW2mbFBNiKP0aSC9blQScSnwr
         ULnV3VrjsUEHFtgoAwf2ZLe0Y7VQXr1tCDTPNtCryPq2jxd5RJ5eXvQTfJvLmppJ5Z+Y
         s+ls18Q33biLPgjv+jPGt7oPChZRlO/mmhM5d6/eITqyJCkc7wskjfYJGCUzU9cb49Wj
         u2SxfAk37DpBmc+5uSkdhGLxZWTt5Pvuy5C7Srb2PUdu5DgltDluG3iL3D0pQJNynUVJ
         xUUg==
X-Gm-Message-State: AOAM5318sv+zff4qtDZRdOL7WBQh1AsO/feF/hHxzBUtOuIAV8nFx0F0
	WcWvNwzpas1rLRheCNaxtLQmBA==
X-Google-Smtp-Source: ABdhPJw6tXMtjnvCLGhpWayAUKWnwPL2GTHtPUXMkRxhiC0DP4Fu8TDBNN7sY07KV76MsJtWdKE6vg==
X-Received: by 2002:adf:ffcb:: with SMTP id x11mr74220wrs.158.1629330540530;
        Wed, 18 Aug 2021 16:49:00 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1205916wrt.77.2021.08.18.16.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:49:00 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 7/7] staging: r8188eu: remove rtw_update_mem_stat macro and associated flags
Date: Thu, 19 Aug 2021 00:48:53 +0100
Message-Id: <20210818234853.208448-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818234853.208448-1-phil@philpotter.co.uk>
References: <20210818234853.208448-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused rtw_update_mem_stat macro and the associated flags
from include/osdep_service.h as this is all dead code.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 .../staging/r8188eu/include/osdep_service.h   | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index bda435ca9d08..029aa4e92c9b 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -146,32 +146,12 @@ static inline void rtw_netif_stop_queue(struct net_device *pnetdev)
 
 extern int RTW_STATUS_CODE(int error_code);
 
-/* flags used for rtw_update_mem_stat() */
-enum {
-	MEM_STAT_VIR_ALLOC_SUCCESS,
-	MEM_STAT_VIR_ALLOC_FAIL,
-	MEM_STAT_VIR_FREE,
-	MEM_STAT_PHY_ALLOC_SUCCESS,
-	MEM_STAT_PHY_ALLOC_FAIL,
-	MEM_STAT_PHY_FREE,
-	MEM_STAT_TX, /* used to distinguish TX/RX, asigned from caller */
-	MEM_STAT_TX_ALLOC_SUCCESS,
-	MEM_STAT_TX_ALLOC_FAIL,
-	MEM_STAT_TX_FREE,
-	MEM_STAT_RX, /* used to distinguish TX/RX, asigned from caller */
-	MEM_STAT_RX_ALLOC_SUCCESS,
-	MEM_STAT_RX_ALLOC_FAIL,
-	MEM_STAT_RX_FREE
-};
-
 extern unsigned char MCS_rate_2R[16];
 extern unsigned char MCS_rate_1R[16];
 extern unsigned char RTW_WPA_OUI[];
 extern unsigned char WPA_TKIP_CIPHER[4];
 extern unsigned char RSN_TKIP_CIPHER[4];
 
-#define rtw_update_mem_stat(flag, sz) do {} while (0)
-
 void *rtw_malloc2d(int h, int w, int size);
 
 u32  _rtw_down_sema(struct semaphore *sema);
-- 
2.31.1

