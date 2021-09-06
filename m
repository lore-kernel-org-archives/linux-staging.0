Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723213FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:16 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so3784471wme.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XTMuSXUGv6jORp8FoEcnxSrkC9WrOP9sRqE050m5myI=;
        b=csd0P3BaNla3NS1SJFCbvqIxlibZ7t4BIcND5DYDew4kCPWr+FUJuQqQrHCRIC4lzp
         rextAv9cL/8ArPm4C/DM4w4E+nWUKavWNCsXU9bqzznzOm0W+MdeVsSA72Xj1ESSaUCq
         BMW50TAqTTuzEhD6a1tcSi2P/ABFQUft/DgV3BMB7T+jUd1lxbvBvN4IbKDBhfh+WgFm
         wOFk4YWHRzWZ5AeT6QpKPInIFENXpRReUWvE5XDfz8cRbjyJU8zETa4goscVyHGOq6kr
         UOtEuUtcazL006PYmOfdilejmuXnPeeErnmRdykH5CiLQxZch13YwLIBFpFvbrk7E/30
         5auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XTMuSXUGv6jORp8FoEcnxSrkC9WrOP9sRqE050m5myI=;
        b=uZ3lPBhupNKjiLKY7IFQCEdlgpQLzZx5Hfim4FX8ftDa8+y0kU3B8Jkc3kqp16HUuO
         niPLuzIAcBwG7Q3eIJ8csLd5SzylNwEW4sZ0XB+j3mEvcFFLJyFTY5svc57MIdcKi9q4
         3Z54dxYt+zddTQHx05cxiYStqlKDD60jLRBHpT8FUD02LIhKOaeEck857UT7LXAqdS/A
         1H45y18efXJsC3/ONyFr0t8BpugyU5PdIjYP5CiRrd7rS/i8LxBU7OCv7A8ug5+kxi9s
         d41ryuHc6hQBQb8bA3DGBXf38s2hOBPprYukeQvMzyrAS9/OUT8wrUejBtJX20SOolsY
         xNnQ==
X-Gm-Message-State: AOAM533wKWtOxC6+EhRO3gwBkrBBks5P98Gc/nm+3HsWMyqxB1PidTg7
	DwXbIs6/4acXAwPj95sLruLvJg==
X-Google-Smtp-Source: ABdhPJyiQPwYyWvYOo5nK/2zaln2xpF9bzTLWZqfbyWk5gEg13/vgLj7KyYs/B00J1/gyOWEf207TQ==
X-Received: by 2002:a1c:443:: with SMTP id 64mr8826261wme.180.1630890074812;
        Sun, 05 Sep 2021 18:01:14 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:14 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 07/14] staging: r8188eu: remove rtw_hal_interrupt_handler function
Date: Mon,  6 Sep 2021 02:00:59 +0100
Message-Id: <20210906010106.898-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_hal_interrupt_handler from hal/hal_intf.c, and remove its
declaration from include/hal_intf.h as well. This is just a wrapper
function that calls the function pointer interrupt_handler in struct
hal_ops if it is set, which it never is. In addition, this wrapper
function is unused anyway.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 7 -------
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 79cf6df0f598..8b90bf4f5e58 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -299,13 +299,6 @@ void rtw_hal_write_rfreg(struct adapter *adapt, enum rf_radio_path rfpath,
 					      bitmask, data);
 }
 
-s32 rtw_hal_interrupt_handler(struct adapter *adapt)
-{
-	if (adapt->HalFunc.interrupt_handler)
-		return adapt->HalFunc.interrupt_handler(adapt);
-	return _FAIL;
-}
-
 void rtw_hal_set_bwmode(struct adapter *adapt,
 			enum ht_channel_width bandwidth, u8 offset)
 {
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f3951c405927..fa3c09e3c2f1 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -331,8 +331,6 @@ void	rtw_hal_write_rfreg(struct adapter *padapter,
 			    enum rf_radio_path eRFPath, u32 RegAddr,
 			    u32 BitMask, u32 Data);
 
-s32	rtw_hal_interrupt_handler(struct adapter *padapter);
-
 void	rtw_hal_set_bwmode(struct adapter *padapter,
 			   enum ht_channel_width Bandwidth, u8 Offset);
 void	rtw_hal_set_chan(struct adapter *padapter, u8 channel);
-- 
2.31.1

