Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164966D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:01:52 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id g5so1037082ejx.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ngUBXQ+i2ihUjkp8gUBGkSrTyqifWX3PDUJCypzPc0w=;
        b=Xbfqbt76xPH1FnU2D64FvAPPybhnDiLrEROlO6EXEQU0/oUxfczf4ycy2jtKCVF4SU
         SxWP4UT6xmXN+xOJHfC9NxMt5a6v3n9VEkjLcMmy6rU9YUxZayFG4ro//4jhXzrOmKAy
         SDSU/3DhRBAb+IiBC2tWyDZtKHxSAXE9rixn+LEkGgmtLNitTU2brIJTpaYMu148fmqS
         cAKrJBbPFcTtXlOkxP+WV3Inc2v0fnNW05GEGpVd2EpPRmvwOg/DHb7c8yYvVcY3b6IW
         7C5uVQdHH6E0fDlG8+lK3/X5fGyA4vOCeiDO42kAncWsG/KmN+hSAYz8c5b1ThyIC/V3
         Tigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ngUBXQ+i2ihUjkp8gUBGkSrTyqifWX3PDUJCypzPc0w=;
        b=iiq62GNrcz5sHCJakK9qBTArs/IUWtxFsvcKwdinxcZ9eCVMi3X78fOO/q/mk/AQVL
         HqvcES7NpLTWDY4Rgd3g7WEMVfDyxO9qeB68Trqqms8LGLT/YQlHIGfRgufxfa7pzJja
         xWUWLG2hvIWBTi11tbCki4R2DvEUC9S0dDOy1EBPdjCJMttkhX+tHQGjhdhqwydMPT2S
         yFAwvCjjF165V4r8toAmwmfFIihWmo0Bvx528rae5eR3fC0AfAQNdKji2MWzi/sgMw17
         AL2YzYlOxftwPnNKF7NxYm7z5W9dSghAPtjFm584Qb+lJKRBVy1h/5HWHq9PE0MHAcwG
         rDZA==
X-Gm-Message-State: AOAM533zkhfl8ms5TAcaEGEfF7pj8ux1fKlpZEe3i3KmxuaMliqHanGR
	4+Bjcvb/8x4TjdxXlB7s1/M=
X-Google-Smtp-Source: ABdhPJxz+geRV3quPOam8q21bWpQTXEtg+WTnrNmL6afjLhtjGw9A5w3oXKQvYvsqGJvTt2Rs7qvjA==
X-Received: by 2002:a17:906:af13:: with SMTP id lx19mr5961318ejb.508.1617962510731;
        Fri, 09 Apr 2021 03:01:50 -0700 (PDT)
Received: from agape ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id f21sm1128688edq.55.2021.04.09.03.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:01:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 02/11] staging: rtl8723bs: remove unused variable and empty for cycles left unused in os_dep/ioctl_linux.c
Date: Fri,  9 Apr 2021 12:01:30 +0200
Message-Id: <fb1e8ea3cfeda1af27ab1a9393140e144b5cb4b5.1617962215.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617962215.git.fabioaiuto83@gmail.com>
References: <cover.1617962215.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix following kernel test robot warnings:

drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2573:33:
warning: variable ‘preorder_ctrl’ set but
	not used [-Wunused-but-set-variable]
       struct recv_reorder_ctrl *preorder_ctrl;
                                 ^~~~~~~~~~~~~
remove also empty for cycle left unused and counter variable.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index a9820d813d8b..303a236fe8e6 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2568,9 +2568,8 @@ static int rtw_dbg_port(struct net_device *dev,
 					break;
 				case 0x09:
 					{
-						int i, j;
+						int i;
 						struct list_head	*plist, *phead;
-						struct recv_reorder_ctrl *preorder_ctrl;
 
 						spin_lock_bh(&pstapriv->sta_hash_lock);
 
@@ -2582,10 +2581,6 @@ static int rtw_dbg_port(struct net_device *dev,
 								psta = container_of(plist, struct sta_info, hash_list);
 
 								plist = get_next(plist);
-
-								if (extra_arg == psta->aid)
-									for (j = 0; j < 16; j++)
-										preorder_ctrl = &psta->recvreorder_ctrl[j];
 							}
 						}
 
-- 
2.20.1

