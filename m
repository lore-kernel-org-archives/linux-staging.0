Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428DF70
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 12so4371425wmf.5
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dOcMFyd2U/M16R9viZmo8dIjWXkIaFc+9uM51NwuTag=;
        b=J3ZbrB8wJVoHPtmufYVWOBHBt/jf5FElZkMcqS9IX8rKqR+FequYSqPc/8WaCbt/2V
         kAm5rtnHnT0eAcxwrUZfvRESwVUUqMCQY3PWhpVesKp64S1ktMepOBp1oKOdNrz2yeGO
         pngcgkibbuuLXH3Qc2g60tDATdZtazD0lis0mI7jOmLFLGDJzXG6UiLbsj+D+npOeqmm
         D/9xMRRg19KqfVmlrDv0FS3IlYU6lh4SCQmXYMug53HDUfwHMhKSFkExEaTFbT6+SUPW
         StWhtue4Zoz6IbYXMS7QnQTGDiAxUgkbwVtJgixsRNni8l2XI9j2rKmQ7coHGnH3nsJA
         aiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dOcMFyd2U/M16R9viZmo8dIjWXkIaFc+9uM51NwuTag=;
        b=ShCELnFPqvy44A67ccs0Bt/njLaMKh24aZlSQRmBJBxvMxbOmxrOMwJGSMM5tfNMbt
         zQ+4QDFgmm02nl84wX8Zhf9ft/d5WzydqeNizmElL1xSYhdq8U3aqw5Yby1XAOpa6iRT
         n7z5Whs5HrK3tEeNEuio432nt/+NAjAn35IQBQ72LQdtbW8XPEdypD9+q4385iEQzI/7
         xQH5LrCsdufvqp360CtB6jlfZfGY4pnigLJaa45h/XQAn5e2tHhdYz4yuM58w6V1sATg
         j4gu+thVkaY7nmsHyggLcIRYMcidDGSWHA/agDPw4q0wn0xsOHOTQtRagRz/s4WAUIU7
         843A==
X-Gm-Message-State: AOAM532NnTHjr5veaQVniMaw1nxve4P/PY8yhS93Jbboc62PneCPaEQJ
	m5wpXvWmaYuxErRrVZdLo0I=
X-Google-Smtp-Source: ABdhPJxt+Yh3hzyxTTMqBJKPZFK46Oql8bq5vRR+/E5bA/r5kCB1sNGne8iOvH8SMhc+FqGNM60+zQ==
X-Received: by 2002:a7b:c418:: with SMTP id k24mr17531682wmi.169.1616855113861;
        Sat, 27 Mar 2021 07:25:13 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id i4sm14723662wmq.12.2021.03.27.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 15/20] staging: rtl8723bs: remove unused macros in include/wifi.h
Date: Sat, 27 Mar 2021 15:24:14 +0100
Message-Id: <1192085c7e891f801751f3adb7884083a2999483.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove declarations of unused macros in include/wifi.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 48db55419bb3..4f8d08c00694 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -102,17 +102,11 @@ enum {
 
 #define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
 
-#define ClearToDs(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_TO_DS_))
-
 #define SetFrDs(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_)
 
 #define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
 
-#define ClearFrDs(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_FROM_DS_))
-
 #define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
 
 #define SetMFrag(pbuf)	\
@@ -123,9 +117,6 @@ enum {
 #define ClearMFrag(pbuf)	\
 	*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_))
 
-#define SetRetry(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_RETRY_)
-
 #define GetRetry(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_RETRY_)) != 0)
 
 #define ClearRetry(pbuf)	\
@@ -153,10 +144,6 @@ enum {
 #define GetPrivacy(pbuf)					\
 	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PRIVACY_)) != 0)
 
-#define ClearPrivacy(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_PRIVACY_))
-
-
 #define GetOrder(pbuf)					\
 	(((*(__le16 *)(pbuf)) & cpu_to_le16(_ORDER_)) != 0)
 
@@ -222,15 +209,8 @@ enum {
 
 #define GetAMsdu(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 7) & 0x1)
 
-#define SetAMsdu(pbuf, amsdu)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16((amsdu & 1) << 7)
-
 #define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
-#define GetTid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) +	\
-			(((GetToDs(pbuf)<<1) | GetFrDs(pbuf)) == 3 ?	\
-			30 : 24))) & 0x000f)
-
 #define GetAddr1Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
 
 #define GetAddr2Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 10))
-- 
2.20.1

