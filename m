Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707AE70
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:34 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d9so6251963qtx.8
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iG8OE2YL93AHo70uxA3LotH7fRVYZCsxjgZkGVOHDLs=;
        b=XRWwenZ4jCzP3qbRv0foN9alEDDPKJ4qjeunrPnKMedVI4l7LFz+pQ15QOVzUscOC+
         HRQpOuu6dbUTSCPUAPBUqnp00GgQ+3UTMrdoKTyZPn1VfTLi9183ROd+jqgoLdB4nxZr
         VzBuKBqR2tRfJQTPtuwNiActgcG8DqXd0VyBPkk1VbHQ7VDn/rvaEHgTRsYX/uJtMStd
         6gNos8ZphDq8N6NqYLff1xiiRoeKJ4Jh9YYlW7UGeVmst8QbOn3GqyJBatmKMnOH6iS5
         +ELifqECCvj3DK+8g7PQeeNubJ2IuB9EDuvd33aFl3Eg4QxoFUBo4/q0IqTDPoZu9jjk
         8R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iG8OE2YL93AHo70uxA3LotH7fRVYZCsxjgZkGVOHDLs=;
        b=GtHnghIKtW8o87Mun86gRAGvOzS0EKgXbgHHziI+RFhA0ZSfq0gA8dVPOkCRN1kSf8
         U7tlVQBW0GB1CAIS9N/ZCKAdyp4h+RPBWWY8AE24qVKhENLLFTPckikfJLO93BnYIRJo
         eiixtpa6bGyehjbpuP408OlNl7cIMCZOHdI6P+QViLaKPnwiJmdt7+HvjsWwg7J4tSp7
         ZRqLuhSM1pUBMmxRmwA6GEkBf3q2xOKt1Ps40To2AUNKqVjEwGzerCtGRfpz4q3bFdiX
         cQoTbwhvjPNR7wF1o81f0wmiutkVhyLtwH5V8MT1mkuVtgMY5lLKkpNWcQfpU9OyjT6z
         z/WA==
X-Gm-Message-State: AOAM530kHxjbV7kEAuVjTnallwrgCa1FcxTvflXQ8j6C6snRV8GLwYPl
	DoNbXyxxYeUNcOSOqAMujOa2wQ==
X-Google-Smtp-Source: ABdhPJyxosQipzIQEh0h/nJiJ4n03VESVFxoh8uhwgzOW7YkySb/ZlGgsPWqtknmacGnvWCetbNXvw==
X-Received: by 2002:ac8:5383:: with SMTP id x3mr7047929qtp.278.1624579713673;
        Thu, 24 Jun 2021 17:08:33 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:33 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 22/23] staging: rtl8188eu: remove GlobalDebugLevel variable
Date: Fri, 25 Jun 2021 01:07:55 +0100
Message-Id: <20210625000756.6313-23-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove GlobalDebugLevel variable and all of its uses, as it is now
no longer used anywhere in this driver.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/odm.c           | 2 --
 drivers/staging/rtl8188eu/include/rtw_debug.h | 2 --
 drivers/staging/rtl8188eu/os_dep/os_intfs.c   | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/odm.c b/drivers/staging/rtl8188eu/hal/odm.c
index 73b63e2ea0ff..ffc5394d5bb9 100644
--- a/drivers/staging/rtl8188eu/hal/odm.c
+++ b/drivers/staging/rtl8188eu/hal/odm.c
@@ -10,8 +10,6 @@
 #include "odm_precomp.h"
 #include "phy.h"
 
-u32 GlobalDebugLevel;
-
 /* avoid to warn in FreeBSD ==> To DO modify */
 static u32 EDCAParam[HT_IOT_PEER_MAX][3] = {
 	/*  UL			DL */
diff --git a/drivers/staging/rtl8188eu/include/rtw_debug.h b/drivers/staging/rtl8188eu/include/rtw_debug.h
index d6b7975e59d6..0de6d7ba5d8b 100644
--- a/drivers/staging/rtl8188eu/include/rtw_debug.h
+++ b/drivers/staging/rtl8188eu/include/rtw_debug.h
@@ -54,6 +54,4 @@
 #define _module_rtl8712_recv_c_		BIT(30)
 #define _module_rtl8712_led_c_		BIT(31)
 
-extern u32 GlobalDebugLevel;
-
 #endif	/* __RTW_DEBUG_H__ */
diff --git a/drivers/staging/rtl8188eu/os_dep/os_intfs.c b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
index 950d70978856..da372936a64c 100644
--- a/drivers/staging/rtl8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
@@ -140,8 +140,6 @@ static void loadparam(struct adapter *padapter)
 {
 	struct registry_priv *registry_par = &padapter->registrypriv;
 
-	GlobalDebugLevel = rtw_debug;
-
 	memcpy(registry_par->ssid.ssid, "ANY", 3);
 	registry_par->ssid.ssid_length = 3;
 
-- 
2.31.1

