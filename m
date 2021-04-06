Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06766D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 10:50:46 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id n8so3217229lfh.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3IjasWzqLdpd77pS1i7PqF29b9l9kltRxgeNazC6S+A=;
        b=G/bHtrarF3eRtDCKAeVoMEvOieVKk7gdLzBy5N20Aosf+dmmu6i13fbjp5Fxj6c559
         rqlEGsSoPdjIucgOaeLbQfvxYGLrDNoAIUpQ3p1Jp/HY8P15PCFtWl3Z6FKsY/6sY1I2
         l52JxUoTMvzGn4DsGOVc3gMgjzV/GfjYzFi5Oty0mXuQ9CktQHCKXLmkQBSp2KPJlB5I
         IUcMq8V1uSlWwNTpT4ch8hQO4UqnPn6Fq4m5TUubHIc1rHIfoJhu3BLgiFGiKK3Mqldl
         WytWe/hbRKZ8zWaNkB/6JrcAertI927g397TR2N4sZGLeLkkbI34g7UYZ+Ivz3r7Xc2/
         aC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3IjasWzqLdpd77pS1i7PqF29b9l9kltRxgeNazC6S+A=;
        b=BNVYfFCE2M4hnH03upoKw8dchmDQcrqQcnZYlL8hPAvRPQkVw9wL5k3MqgF+bZAOBP
         yk8UINYk1OwcMF0twJBU/EKcRgumB191480XUM0qlpA77zKC82LgNiwDImOTL5T9zvK0
         GrnPEb3jmSDqttNeLA90Lbp+qeAVKuK5pHpxV+EU5Z5VsRvAKZIE3kkxk1/V1CqxT3Wa
         IywEWHqug4by/KJCZFqk/GpdSixbEWzd7ufUebYmXVc9tkdkwx5f44utQ5lsvxNZ4bGQ
         /Ax+Zb71HzHH7hwMke5fWJR/g5B+H2VEs/17tmEA0iMjjm35gr0xMI8otAnWktq8KB4G
         1sBA==
X-Gm-Message-State: AOAM5320sHSDiJciSSddFEPBzg1tet6nfzEUwPA5fcGSnZtT/umirmYl
	nNUHroRcvxobw6CGdRS1bTQ=
X-Google-Smtp-Source: ABdhPJxm3Km1eLJCRTeNWLVwYctyQ5MiwWKL0zuTC1PkMCMyMqlj4Y/TpgT09Ywl/xm69JxK9WOsWA==
X-Received: by 2002:ac2:4d9b:: with SMTP id g27mr20869389lfe.113.1617706245170;
        Tue, 06 Apr 2021 03:50:45 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id f28sm2114689lfk.67.2021.04.06.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:50:44 -0700 (PDT)
Date: Tue, 6 Apr 2021 16:50:35 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2] staging: rtl8712: Remove extra blank lines
Message-ID: <af750c2521fe0b5fbba719f3b5b7344620fc7514.1617705825.git.zhansayabagdaulet@gmail.com>
References: <cover.1617705825.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617705825.git.zhansayabagdaulet@gmail.com>

Remove extra blank lines after an open brace to adhere to Linux kernel
coding style.
Reported by checkpatch.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_io.h   | 1 -
 drivers/staging/rtl8712/rtl871x_mlme.h | 1 -
 drivers/staging/rtl8712/rtl871x_recv.h | 1 -
 drivers/staging/rtl8712/sta_info.h     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_io.h b/drivers/staging/rtl8712/rtl871x_io.h
index c20dd5a6bbd1..c5b12f74ebf8 100644
--- a/drivers/staging/rtl8712/rtl871x_io.h
+++ b/drivers/staging/rtl8712/rtl871x_io.h
@@ -123,7 +123,6 @@ struct	intf_hdl {
 };
 
 struct reg_protocol_rd {
-
 #ifdef __LITTLE_ENDIAN
 	/* DW1 */
 	u32		NumOfTrans:4;
diff --git a/drivers/staging/rtl8712/rtl871x_mlme.h b/drivers/staging/rtl8712/rtl871x_mlme.h
index 46effb469fd4..d7d25f240111 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.h
+++ b/drivers/staging/rtl8712/rtl871x_mlme.h
@@ -77,7 +77,6 @@ struct sitesurvey_ctrl {
 };
 
 struct mlme_priv {
-
 	spinlock_t lock;
 	spinlock_t lock2;
 	sint	fw_state;	/*shall we protect this variable? */
diff --git a/drivers/staging/rtl8712/rtl871x_recv.h b/drivers/staging/rtl8712/rtl871x_recv.h
index 4aa39f4f3b84..1c8298bde033 100644
--- a/drivers/staging/rtl8712/rtl871x_recv.h
+++ b/drivers/staging/rtl8712/rtl871x_recv.h
@@ -37,7 +37,6 @@ struct smooth_rssi_data {
 };
 
 struct rx_pkt_attrib {
-
 	u8	amsdu;
 	u8	order;
 	u8	qos;
diff --git a/drivers/staging/rtl8712/sta_info.h b/drivers/staging/rtl8712/sta_info.h
index d042d900f30c..9b7e5ffa380d 100644
--- a/drivers/staging/rtl8712/sta_info.h
+++ b/drivers/staging/rtl8712/sta_info.h
@@ -36,7 +36,6 @@ struct wlan_acl_pool {
 };
 
 struct	stainfo_stats {
-
 	uint	rx_pkts;
 	uint	rx_bytes;
 	u64	tx_pkts;
-- 
2.25.1

