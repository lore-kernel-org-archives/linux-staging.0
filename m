Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64971856;
	Sat,  2 Apr 2022 14:07:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id r7so3283147wmq.2;
        Sat, 02 Apr 2022 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fg7D1iGUfw9j684AaN9ZwUUtm9p5W+5qSKHanyjniig=;
        b=XhKe6RBzOIYGM7e1jgWJtS6NaOo4+4DLXXecjeNVeEgHXKdrxJ54a8D6RAAHjJ5QOY
         BlkaPbXoCClrtXJ5Rl+dzMbMRuL69iFqyY0BlGEa6j7/TXmR7/nEewXOEipQuLbycwIk
         EER4AZGnsSfOtNsL0LkfXOnzds3+z1PJQxYRzwP81AX1QWdDebCsV0KWRSnw+6vtvogF
         RGJiuz0XHVxeTkSCQToYFFxfOD4hKaSZBJZQnk7D3gzEXzm/YPXTNKl87tQ7RD8FIWFg
         BkOTUR5Vqcs+P3DxcqD53+CDLJ/i8yM0CGVjDbEQsxQBmYHYyBnwouSSEkHLUR5Y/cz0
         LmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fg7D1iGUfw9j684AaN9ZwUUtm9p5W+5qSKHanyjniig=;
        b=jkF8M1J9Y3F3s1voPOt5V0KwlorhpMxGzy5VJdNDc2SBOWGai7LYDP6VbXbGvDnU71
         FAblCaWeXR17HUEXWjRQWPmmNpMppkn5Dzk1Pw4hg0CCmnH5o4SapaCdJSC6j9Nq3Vq5
         k0tO89AR9d6FvsYz0E/QPDoKdDwJPNYkt1BbdIxNowK49oEZ/xovnqOl+uCNH+ctXp/8
         SGpWfj/FIIvGH8yFTFFn6QWNxvWPnA35YOqTTgCAaN9NMUcZZDLNHZdVx+1NTiTj/SLk
         x7Plk7wo9S77dA2RgigSkupGPGEyHreN7MN85C/D108lxrf9QdSdqmke1sfUejkJ2AY3
         WRqg==
X-Gm-Message-State: AOAM530gO101hNvarZsC763lJf+ni/NjKIWcTD0mRFMnSQFTS58nUUCF
	IHiIeLayeAG7gNiTMEPetto=
X-Google-Smtp-Source: ABdhPJygcdRjc8ahdcTdoCmXr0p4Hl8GYpF9eDNU5lTcaWSQGrz4m6EBUQgXxO4UOGoIYdwA68lXVw==
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id n16-20020a7bc5d0000000b00355482a6f44mr12523721wmk.58.1648908423127;
        Sat, 02 Apr 2022 07:07:03 -0700 (PDT)
Received: from localhost.localdomain (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d440d000000b00203f2b010b1sm4638195wrq.44.2022.04.02.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 07:07:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: Remove redundant code from rtw_free_netdev()
Date: Sat,  2 Apr 2022 16:06:57 +0200
Message-Id: <20220402140657.10549-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtw_free_netdev() there are two redundant tests. The first checks for
a valid pointer to a "struct net_device". This pointer is the argument
of rtw_free_netdev(). The two callers of this function already test this
parameter immediatelly before the calls. The second checks for a valid
pointer to a "struct rtw_netdev_priv_indicator". This pointer is always
valid and, even if it were not, vfree() is a no-op on NULL pointers.

Therefore the above-mentioned two "if" statements are unnecessary and
redundant. For this reason, remove these two tests.

After removing these tests there is no more need of the "RETURN" label.
Therefore, remove also the "RETURN" label.

Cc: Pavel Skripkin <paskripkin@gmail.com>
Cc: Martin Kaiser <martin@kaiser.cx>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/os_dep/osdep_service.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 7a6fcc96081a..fc10eefe04a9 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -116,19 +116,10 @@ void rtw_free_netdev(struct net_device *netdev)
 {
 	struct rtw_netdev_priv_indicator *pnpi;
 
-	if (!netdev)
-		goto RETURN;
-
 	pnpi = netdev_priv(netdev);
 
-	if (!pnpi->priv)
-		goto RETURN;
-
 	vfree(pnpi->priv);
 	free_netdev(netdev);
-
-RETURN:
-	return;
 }
 
 int rtw_change_ifname(struct adapter *padapter, const char *ifname)
-- 
2.34.1

