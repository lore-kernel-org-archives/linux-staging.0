Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868CA6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:16:56 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id f70so25102778qke.13
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i0//O8/kHt/FcVdYXMKCn8M8Ekbl3D7Z8//RDDcRQII=;
        b=GVNIG1LtxYeCzNiabXrwuwmaNCeRqIA+EXfTxO7rK3tIFnKbN5CO1emVM3wbqX4u7K
         cvbUEbUvzk2qOGsUo1LBizhctJ+Aiwlt4L9pqbekDm4XpSYOW1CYCby6GMpUKezy2Ipq
         INE5NYSPKJx9N5ABO4+wGAQNlEIffHWUjZNFHe/VGPFQoeHNX3gKYOdHfRCvOK4EeW0B
         Yx/oiK0NtVf80Fl8TUADqRUo4LTvP0R6Bljnetf8JEz6vqz6iDeMe5c7/cVTb4PWa+Eh
         kXPd2oE8o0dnC7adTev/tpfUwFKSJyUOOjmCaXKe5gYiKI7h85zVk8YsDBnblGofr1Wb
         NmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i0//O8/kHt/FcVdYXMKCn8M8Ekbl3D7Z8//RDDcRQII=;
        b=CdCbWT7ugDJkblosdTCFqSpeLTuiiJdyuzj3VkLj/SGviLWtOP+TzaA8d80nb0swsY
         8LhSPGJT32sEBin0rxYKSU/neydsCCUgX9kmj36/kNsuSblYjXV6yPPLx5NRqU1XVuLM
         tiqKd8wHzpHHaDxS1e2Od7PV3KFL7lnuhe2N63PBki2yf8+J2kLYrY26TCZVC901sBN3
         bKvRD4II25VPhJ36SE0BrOgYyU1cwHvHkLJIymTtBYkRPyX+O4W35DtC5L7JKzgx6FoO
         SSV3Qu4QHmrJgLc69vrfZyTm+0bMkzWzjpoZTAIQ31tp/o5sn6pkxhRpzAo5PT12/JiH
         Bnyg==
X-Gm-Message-State: AOAM530UGQaiORMmepjqeWA136wjZOVw+z3hbuAKSznIXxhQSpo/bLkG
	VzklctmLBfK75m8dfuGcpzP5Wg==
X-Google-Smtp-Source: ABdhPJxsCnk2GyDicjZ8bWQkr6Lg/0YQ9cgKCR2P81FkwSgZc601Gjsvd/XLirRAaz8RR65nQ7YE6Q==
X-Received: by 2002:a37:8407:: with SMTP id g7mr19031723qkd.123.1623716215712;
        Mon, 14 Jun 2021 17:16:55 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:16:55 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 23/28] staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188eu_recv.c
Date: Tue, 15 Jun 2021 01:15:02 +0100
Message-Id: <20210615001507.1171-24-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from hal/rtl8188eu_recv.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c
index 09bc915994db..2d7d3d932e96 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c
@@ -80,14 +80,6 @@ void rtw_hal_free_recv_priv(struct adapter *padapter)
 	}
 
 	kfree(precvpriv->precv_buf);
-
-	if (skb_queue_len(&precvpriv->rx_skb_queue))
-		DBG_88E(KERN_WARNING "rx_skb_queue not empty\n");
 	skb_queue_purge(&precvpriv->rx_skb_queue);
-
-	if (skb_queue_len(&precvpriv->free_recv_skb_queue))
-		DBG_88E(KERN_WARNING "free_recv_skb_queue not empty, %d\n",
-			skb_queue_len(&precvpriv->free_recv_skb_queue));
-
 	skb_queue_purge(&precvpriv->free_recv_skb_queue);
 }
-- 
2.30.2

