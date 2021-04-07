Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846770
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso1194364wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Txc1kWdRYk6a2hQeMj64FaQrg0Tgz5yI7LLoGGXJ7FM=;
        b=SYyiFmQplvpRdaIsyuGVpDCawn1fixSvY/KeLfQubcw+D2cMe0Dgz3Cxf1jxlWvm41
         2m6hb8RCiZe7A2lwxcAephoj5FCB3vmduKZ4BcyAtVZXNVmux8O9mMC0azCwv5+HMHNO
         oOarHRFhSlF44CJLLqCXoSHQmaonPQ2N6LOQX2AB+qO2YmcnwsxQamau35VU+Yk3E2qR
         a7bNSxYcEI74MpkbQHXXvmTepc4cjU9teQ2E0hoZEtgc5MTHFWGfRm1igAzthRYA4hT6
         VdIjLNkCjlPlM31AsJS31KMPYh8JOBLpcxefcx1djkBwPD7CM5wTq3acPd4g38eHC5+J
         ilIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Txc1kWdRYk6a2hQeMj64FaQrg0Tgz5yI7LLoGGXJ7FM=;
        b=kGpSSkpRKtFy8x6+ZuSruAv+GMEcl1aj+NM477XvGJYuIu16eKWH5A0RrcV71Ye3JK
         L0VcZ6xzvIpBaGGP800qhA32R8xae1zOmMZtrxZD341SrnRPo5sCeTDZbVE2Y5mrtw2/
         iKgopDFk8IVjuP+/jVK5YzCFS//ojmP1drFUdyeoASYvtATBCedcwbN5j1PreGuH9ukB
         AjHIimr2HzO7TssgOfXt4Y/0OznUPFMD/F1tJV5k4j9SKdZfBTPRIXRNz+UpjtK4ZNlt
         EDX1Fa53JZYKhLyj6jWzlrLxkQjFEFQ2DjM5a3eNmvBjMMa3ujzi9jNtlxDMz8kqSyAK
         Upcw==
X-Gm-Message-State: AOAM531MkdgNaXGIeoQR0B6oapuEQ1d9QJ4eEyrYdTmxwcNPcsc2IUFc
	K/i5bo//nWi2qtnaEOrVOJmB3U2UzBJYsw==
X-Google-Smtp-Source: ABdhPJzwBEjAnbYy1dOxWK7C+RYfX1pbRGnzavR6UdZYIaJRE966xjAwJ2mbSfg11JNYvZLwGpkqPQ==
X-Received: by 2002:a05:600c:4f55:: with SMTP id m21mr3175454wmq.11.1617803410351;
        Wed, 07 Apr 2021 06:50:10 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id s138sm8810675wme.8.2021.04.07.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 09/19] staging: rtl8723bs: remove empty for cycles left by DBG_871X removal
Date: Wed,  7 Apr 2021 15:49:33 +0200
Message-Id: <fe758f88ef6d6eaad9762d16d78dcfa876fcf654.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty for cycles and unused counter variables to suppress
compiler warnings.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 4 ----
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 71ec5af0455d..2d1201b70ab1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1454,10 +1454,6 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 
 static inline void dump_rx_packet(u8 *ptr)
 {
-	int i;
-
-	for (i = 0; i < 64; i = i+8)
-		{}
 }
 
 static signed int validate_recv_frame(struct adapter *adapter, union recv_frame *precv_frame)
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 2f6516283248..5d103d33a128 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -571,13 +571,6 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
 
 		memcpy(buf, pie, ielen);
 
-		/* dump */
-		{
-			int i;
-			for (i = 0; i < ielen; i = i + 8)
-				{}
-		}
-
 		if (ielen < RSN_HEADER_LEN) {
 			ret  = -1;
 			goto exit;
-- 
2.20.1

