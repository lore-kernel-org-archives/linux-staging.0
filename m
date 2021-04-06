Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DC86D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 12:10:01 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id s17so16199387ljc.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3IjasWzqLdpd77pS1i7PqF29b9l9kltRxgeNazC6S+A=;
        b=S1R9xTNRJ6qErMKNLecSOhfU0ZS5czLdE4zGKv2duJ4rxyIrJrsJJXLABBX9ZOGg1V
         A1Bm8UIrJrHnmZ8hoei+UoW/blHMCIUDPhlv7EvUdh/Dv8rDByVmxiBPoH9KvKE+aWOT
         gHsLe7LBWEPqbkPySQBR5ZC5zV6mdCYuDlUF561lLCL7HzYv2CZrG5lEzEXAxi5dDUuy
         pIdDyfR34V0GOtMYbLw8dv/KaNYKpVDyggmUYkJlPs1x/pdDBAQuPAjrwrh0AvKRImOm
         IwZdOnovvQ7xG+LxXWakHhEqwJhuTPSgzyPQ5REigQePE+zTAKo+ohP3jJwCl7JdxTZx
         xjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3IjasWzqLdpd77pS1i7PqF29b9l9kltRxgeNazC6S+A=;
        b=aOC0QVY7SA+jJDIf6FiGjfKf0NNCbMJHxLbg8Rz0ag7l2+6aO1M0zE96GJPZbsvzx5
         I9OYV06w737sJ4QM1Rw9DqJ6CLqtCNsBjRCxnpGaSpHTObalU4cm5snwByHNCM6z1Zpq
         wiOpyuGOlAGvro8fItPAIua9wk6tuivqBnPSuTeKgwoAS7+zrxU1rS8FVIkSSEms3wJ+
         d6Drc+FGYSdMtCz2T+/JFKo5bYIdcMZ61DOo+RDMkGbl75SByEqeupM4ZRUtxeqb1pLF
         Nn+Y1PadR541dmAIjxDmQjh/o9fsvZVHQBSnFSd/uT1yXTH5cqKj4/cdUzr+UVKJHg0N
         tYIQ==
X-Gm-Message-State: AOAM531gR1ZzVn/F4snVRvEGpGbPCAORLbaxJ4w0Qkem5ytpQcLmOjDZ
	sPSvtk6ubpHbclRSAj3X8gk=
X-Google-Smtp-Source: ABdhPJwIUl0MQfZ/2/NMGem9fKhQEYoeM1YIRR54q07OehkznMauFsU6YQNzeezICHosCdxoz5TRLg==
X-Received: by 2002:a2e:9715:: with SMTP id r21mr18955331lji.224.1617710999935;
        Tue, 06 Apr 2021 05:09:59 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id a7sm2135510lfo.177.2021.04.06.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 05:09:59 -0700 (PDT)
Date: Tue, 6 Apr 2021 18:09:58 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH v2 2/2] staging: rtl8712: Remove extra blank lines
Message-ID: <f61f6d330bc3fa53d4d420754d1d461b6cfcb2de.1617710602.git.zhansayabagdaulet@gmail.com>
References: <cover.1617710602.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617710602.git.zhansayabagdaulet@gmail.com>

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

