Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F80323A3
	for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 14:58:54 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso6527740wmq.5
        for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FlMjHgQlaK6FHnQDYx0IosytZPIxnHkiOAPvdi19oaQ=;
        b=Y1HiMOEfkfEBI+WsKOWdGoVrlidn6m5IQOQ7p2ej9hLXLo9zhHSNSSNF4iUOPzpnnx
         CG1w/FQv/WoaFNymuO8yY5jwia+d1/xZgMCP64GfZ3sDgWIPZXy29kAeoy354d474PZP
         MfMMS0hn99o9c0/R9sHthbB+fQVryDRORZdd0X4OGROGOKraqe6mJ7y8ZRTRw/YI5XV5
         doJGT1MIdxC8Re+2Swqjkl15hg2WW7g/0END+bUFDfmNAKExWI05MLGyc0XODxgxA9Zi
         nP8Vx9r0ZPpAZ6eCJT7MxEyrmtY/JXX4pX/Yjwdq/SZKCJMPFxo3s24H2wBFocXb3Ok6
         G7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlMjHgQlaK6FHnQDYx0IosytZPIxnHkiOAPvdi19oaQ=;
        b=huhVMXwOCAdvUUloBfxRFVVtEnt1Q4LRtnOCh7s1RhXGGzYfzKNDbCNJv6jAsaguV2
         XkGANQUQC95T3OL1oG1mq9niK3wcNkTXguCNq8UCuO+And+LLOOMP0CcklrTKLbyc6nw
         WBLaBQXI6tioPHlZMLccnOvEl/Ay4Ws6xhiGXgLWAyC/MkQrwZ1g+dqDTNSayNRBnjJJ
         CtDytGulLs/c3J1FZfAIGU47qElzjux8v+jzg6DQvjTYWt3rN8Piu/0e1tNGP2K5zzAD
         waoFRrwemKejZjX2UhGyXTKx9B8xVyhuGt/xdY5P+aYvfL3qJs3Os4/izkVzqA90eXSL
         BISw==
X-Gm-Message-State: AO0yUKW3cjHNDYU4zJbDqRueLeBe3lYXFpZ5icdQJwwOHISKjuq6+Qzt
	tbm7GCcknKibZ6S0MsqSmNA=
X-Google-Smtp-Source: AK7set+qxVpifmz0dIEDahykJ0pSQb+uFrrV13ghZRNc++ZZ6vAOhi32MtausLLir6fnMeKL1ELkbg==
X-Received: by 2002:a05:600c:1e02:b0:3dc:4234:fe89 with SMTP id ay2-20020a05600c1e0200b003dc4234fe89mr1793379wmb.2.1675004332439;
        Sun, 29 Jan 2023 06:58:52 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c078300b003db12112fcfsm9931608wmo.4.2023.01.29.06.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:58:51 -0800 (PST)
Date: Sun, 29 Jan 2023 15:58:49 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Remove used constants MSR_LINK_SH..
 and MSR_LINK_N..
Message-ID: <46bd1f075d5e4d211e1fc827843933907f7fee29.1675003608.git.philipp.g.hortmann@gmail.com>
References: <cover.1675003608.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675003608.git.philipp.g.hortmann@gmail.com>

Remove used constants MSR_LINK_SHIFT = 0 and MSR_LINK_NONE = 0. Use rules
a << 0 = a, 0 << 0 = 0 and msr | 0 = msr to remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 12 +++---------
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h  |  2 --
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 1677b6c5d363..62f179f2f174 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -54,22 +54,16 @@ static void _rtl92e_update_msr(struct net_device *dev)
 	switch (priv->rtllib->iw_mode) {
 	case IW_MODE_INFRA:
 		if (priv->rtllib->state == RTLLIB_LINKED)
-			msr |= (MSR_LINK_MANAGED << MSR_LINK_SHIFT);
-		else
-			msr |= (MSR_LINK_NONE << MSR_LINK_SHIFT);
+			msr |= MSR_LINK_MANAGED;
 		LedAction = LED_CTL_LINK;
 		break;
 	case IW_MODE_ADHOC:
 		if (priv->rtllib->state == RTLLIB_LINKED)
-			msr |= (MSR_LINK_ADHOC << MSR_LINK_SHIFT);
-		else
-			msr |= (MSR_LINK_NONE << MSR_LINK_SHIFT);
+			msr |= MSR_LINK_ADHOC;
 		break;
 	case IW_MODE_MASTER:
 		if (priv->rtllib->state == RTLLIB_LINKED)
-			msr |= (MSR_LINK_MASTER << MSR_LINK_SHIFT);
-		else
-			msr |= (MSR_LINK_NONE << MSR_LINK_SHIFT);
+			msr |= MSR_LINK_MASTER;
 		break;
 	default:
 		break;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 13c0e5218ecf..3782db125300 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -172,8 +172,6 @@ enum _RTL8192Pci_HW {
 	MSR			= 0x303,
 #define MSR_LINK_MASK      ((1<<0)|(1<<1))
 #define MSR_LINK_MANAGED   2
-#define MSR_LINK_NONE      0
-#define MSR_LINK_SHIFT     0
 #define MSR_LINK_ADHOC     1
 #define MSR_LINK_MASTER    3
 
-- 
2.39.1

