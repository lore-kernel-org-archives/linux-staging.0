Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF0917CA3
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 22:46:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id b12so13190949wrn.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 14:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4kX4/EANOvk92+tIojhRVqHRQq3FkLftzIvzrby6dVc=;
        b=O+zXr+8OCFBH3GxbvFTezKFVJ1vV6pp7rEsO9XTqBKuUBAcPD9j+YRjL0x8q2kLrwA
         4HW809wY/kZRcV0JxQYe4OCHg4xztFfFuVCJtvIN7fSrFs96wovcZj5fzvx/GjQ2ijgY
         yz25SMG9Rr8C7MzNvPAQpvG9r5xDBJrcXt0+AGjtgZzDbBVqtsirDHBNuZpa2fXSDrJb
         SEfDmDajMlZgkTumExqpDrCCtPu69E50ouWOy734MnDQ+u6D2Usvm6NAetu+mSDqmIH1
         VZkL/5Qjhr6wb0gHDxkz4ivqIT9iGO8uRzGHjiKYiDYaZXPqh2d7IGCl52OCEOt/tFQ6
         NAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kX4/EANOvk92+tIojhRVqHRQq3FkLftzIvzrby6dVc=;
        b=hvK0Bmm9QZhmTKEGrrBeVsaG3LnS520OE9nA24BPxLK9dNPXcBJr9ex1i9IEqqM5p+
         m1MSlBQlyLaIs3A/b2K5YeLFTNhK65Tan9391ksOcNunlpKAVpnAfvzscphfL02N8TOW
         SdcO2B1Xl672awO7+7ujDhAvHIof/+N5bm+EK1uhKyvMpUhUKyCh2ntqvoWIAosIoEw8
         nEu0hEAztxa2jbE3eSPtWiWQSuvd0fplaLGGR4eW67bI/YLbF3JK1A09k0bsN76DRZj8
         OZKQZvp9fsqNJNH6adivqxRgwHLJCdKwHla01QnxgMkB2dQKvXHSW73E2StCKrzq6Gfj
         lhVQ==
X-Gm-Message-State: ANoB5pnQFq8eKZQTQWfk0hiExFcX8mHlKAe5BhAHVflxayuiOYzc0z0H
	GOCchr1f9yWCwqcbfX3KNbcnm8Yvfww=
X-Google-Smtp-Source: AA0mqf6A/nblVO+geoFYaq9gruFl8YL+W6oIjovbTzlwhfG4ceSGhlTRUikeMKLrkKDwaG2NS3RzTw==
X-Received: by 2002:a5d:4533:0:b0:241:d13a:1d52 with SMTP id j19-20020a5d4533000000b00241d13a1d52mr8711702wra.270.1669157170445;
        Tue, 22 Nov 2022 14:46:10 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b003cfd0bd8c0asm133961wms.30.2022.11.22.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:46:10 -0800 (PST)
Date: Tue, 22 Nov 2022 23:46:08 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: rtl8192e: Remove unused variable skb_aggQ
Message-ID: <3197be3cb412eea1c662a5bec1b1afda2cee675d.1669156825.git.philipp.g.hortmann@gmail.com>
References: <cover.1669156825.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1669156825.git.philipp.g.hortmann@gmail.com>

skb_aggQ is initialized, never used and purged. Remove resulting dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 --
 drivers/staging/rtl8192e/rtllib.h              | 1 -
 3 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 80eba5d5ab37..f02e67f68e23 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1946,8 +1946,6 @@ void rtl92e_stop_adapter(struct net_device *dev, bool reset)
 
 	for (i = 0; i < MAX_QUEUE_SIZE; i++)
 		skb_queue_purge(&priv->rtllib->skb_waitQ[i]);
-	for (i = 0; i < MAX_QUEUE_SIZE; i++)
-		skb_queue_purge(&priv->rtllib->skb_aggQ[i]);
 
 	skb_queue_purge(&priv->skb_queue);
 }
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index a8cbeb9545da..369a59a753fe 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -903,8 +903,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 
 	for (i = 0; i < MAX_QUEUE_SIZE; i++)
 		skb_queue_head_init(&priv->rtllib->skb_waitQ[i]);
-	for (i = 0; i < MAX_QUEUE_SIZE; i++)
-		skb_queue_head_init(&priv->rtllib->skb_aggQ[i]);
 }
 
 static void _rtl92e_init_priv_lock(struct r8192_priv *priv)
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7119c9c5e1fe..1152fbf43383 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1624,7 +1624,6 @@ struct rtllib_device {
 	int mgmt_queue_tail;
 	u8 AsocRetryCount;
 	struct sk_buff_head skb_waitQ[MAX_QUEUE_SIZE];
-	struct sk_buff_head  skb_aggQ[MAX_QUEUE_SIZE];
 
 	bool	bdynamic_txpower_enable;
 
-- 
2.37.3

