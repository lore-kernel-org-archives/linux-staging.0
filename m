Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8992571
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:48 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id x5so382765wrv.13
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qFn1Hbee8soeZsKXnx5NCbBSbEoNpVbwk+kQZRDVH5E=;
        b=FDfhxaOyIox29frvuP0Lz0tW4PQQW1fwil53obFXyk5PHCt1mqDhvBL8DUUOY9WGrS
         unrH11mv9Fj3fHhXy+cCN+2Sr4yv0YqllB12GTFVlSGTrSyM/MHso8m2z7f2nUhGvOgp
         fRQVVhpC7E3w/rh3ploWqZvBOuh/PeQE2gvvjyom9ynL0ymGVSaUFpcxPfMpHn6mcGan
         P40nxi7yw7G/7In3A9qnX93KwAIOYzRftJazzbNa7+s8GYuSP47asOEEKlgnREztj0OU
         zrIupiUlm/ZzZlzRI4RxUuDAkzVcflAsrhxajvGDtmm5u4XbNcttiQccT+cG3byftEix
         eZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qFn1Hbee8soeZsKXnx5NCbBSbEoNpVbwk+kQZRDVH5E=;
        b=qLGd9ViFP5xBhGlpTDgrEcRaCxbSWjNR+Fo+Z1/ZhPgDrxCkuCj1E7gUC16w9Y8vCL
         dxanp32vjOA6HaoIINsnJVK3AeDJv7CrMPaHJdQVuU1uOIkZ+gV48J9EzSVIKA9G69BA
         8s6bHoT/2x8/09AneXdN57t6SzLGDJzxvFrWuhKJby6k/UoEOPbzp++aoXVX/lzYcKnO
         4scZDxqpW2HYYqPdUIr67e0XwtTrjGSY5qSm5IO6lXpvY006yX+6h4oRkalrUhW9bNhf
         yil6tCqnRNedUJ5ECXrHY47dNUEcPXKwzygLH8tbs2WTHaqFj1Q+fLBDOJ59R6GXJN9t
         HuyA==
X-Gm-Message-State: AOAM533QWabDB3dVvkpZmLCC6DPoRVOHlA6u/nop5vP4DCd4DMI0tzG4
	IZSClsvsMHtzlJKjMvUhDkw=
X-Google-Smtp-Source: ABdhPJwUd64AHBh9VWJSuwuaHaG4ha+ch4hJzYS9KtkIGgI7LFr7WJRGEpYv03DR+HwfiVgggBcjyA==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr10068365wrt.0.1619254967257;
        Sat, 24 Apr 2021 02:02:47 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id w7sm12386254wru.87.2021.04.24.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/50] staging: rtl8723bs: remove unused bb_reg_dump() function argument
Date: Sat, 24 Apr 2021 11:01:50 +0200
Message-Id: <62bfb844bc77818ca0595b369e64eca3b8872470.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused function argument void *sel from bb_reg_dump.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c     | 2 +-
 drivers/staging/rtl8723bs/include/rtw_debug.h  | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index ad3cdbe45e55..9dfa71580b2e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -36,7 +36,7 @@ void mac_reg_dump(struct adapter *adapter)
 		dump_4_regs(adapter, i);
 }
 
-void bb_reg_dump(void *sel, struct adapter *adapter)
+void bb_reg_dump(struct adapter *adapter)
 {
 	int i;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index eabc21d2b689..6064de93c24c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -149,7 +149,7 @@
 #endif /* defined(_dbgdump) */
 
 void mac_reg_dump(struct adapter *adapter);
-void bb_reg_dump(void *sel, struct adapter *adapter);
+void bb_reg_dump(struct adapter *adapter);
 void rf_reg_dump(void *sel, struct adapter *adapter);
 
 #endif	/* __RTW_DEBUG_H__ */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 7951c362d664..fa260714b588 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2736,7 +2736,7 @@ static int rtw_dbg_port(struct net_device *dev,
 						if (extra_arg == 0)
 							mac_reg_dump(padapter);
 						else if (extra_arg == 1)
-							bb_reg_dump(RTW_DBGDUMP, padapter);
+							bb_reg_dump(padapter);
 						else if (extra_arg == 2)
 							rf_reg_dump(RTW_DBGDUMP, padapter);
 					}
-- 
2.20.1

