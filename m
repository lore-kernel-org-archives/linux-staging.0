Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9A53FC5
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 02:17:21 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 17so4707066pgp.4
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 19:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/sjmsh9eakhfmy60Q2gVdlY6aMelP0NlPu9C4Ba02A=;
        b=jhgyEmp0JY6JQ+9cdCm2kjrpTUW6sww95NsHtIAUJbHUxRDy0SGUJcKbEQ0UxzvvfZ
         Oybqa5xZS4uqEz7bgRofvWRPZ5DM6xPsTZIs6BdtSUnQX8SAwCm6iHGuqjIxgAi76+49
         9LZCWOFYMx0IdFKX/o8GjgUYwnVxCZ1y7JGPu/Yx9Ls51EIvwISoURx7pVG21EHy/NLQ
         WndOxVRbB/FPW2WpMEc+XvFF7ubwg4B885MBjcTTniTErNYp2dPTJ1S/pPhiKE4ohvfz
         3hKXONx2hvw8hZ71d5xM9AMyXo20Ac15JFceLeI9a9pkZstjv9bTQUn9TO2wtGVthG8E
         7dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/sjmsh9eakhfmy60Q2gVdlY6aMelP0NlPu9C4Ba02A=;
        b=OORC+7lZM4QPltRYxNK0MjHgMbAaQZ1e6PxQS8lbk6ZDVP7YbQG0sTB/fDJHKZopjH
         3zTtTJKLN7p27kspUDhMZbe/kl9NGCp9OBcyPyoD55iyx3+UPLNfeD/IBZZssaWeWq72
         eDI1ynT1l3fCLpwQq224iLxueSmwgISRZIvs0/xPfMsmxkVNcTLTJf8G1YWLAegA+ZM/
         hp3uCxXUCGF3hqIGG0Fh9E54CPyeEtpt1HZd/IgMNyyERuyDDNlUh8Auwtm/Tsc5DyFG
         7bLzBbHQG7h5psxS0c2WUr3YQtDgsIdXWJmsc+vVBhxrQ78Y90GxrCj0IwIGNrDMnVRU
         gVPg==
X-Gm-Message-State: AOAM533SPIse1ypB42VgP1XbGGWuGIYtKaSQZgahk+n+A5rd08zAU3AB
	lEKoDwgLSrmr8Me0GHQ5KDc=
X-Google-Smtp-Source: ABdhPJx5nBuRk/IfAa4RASH9hWpALmfnLPZZcqRytph9ZFziTyeWgiadKfsWUUxWUpQL8+qhzdcP0w==
X-Received: by 2002:a05:6a00:2284:b0:43d:fc72:e565 with SMTP id f4-20020a056a00228400b0043dfc72e565mr2622712pfe.84.1631758640683;
        Wed, 15 Sep 2021 19:17:20 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id y3sm1180586pge.44.2021.09.15.19.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 19:17:20 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] staging: r8188eu: Use kzalloc() instead of kmalloc()+memset()
Date: Thu, 16 Sep 2021 02:16:58 +0000
Message-Id: <20210916021658.181216-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

This place can use kzalloc() directly instead of calling kmalloc() then
memset(). Replace them.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 92b8f2c..9c257c4 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -463,11 +463,10 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 		if (wep_key_len > 0) {
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, KeyMaterial);
-			pwep = kmalloc(wep_total_len, GFP_KERNEL);
+			pwep = kzalloc(wep_total_len, GFP_KERNEL);
 			if (!pwep)
 				goto exit;
 
-			memset(pwep, 0, wep_total_len);
 			pwep->KeyLength = wep_key_len;
 			pwep->Length = wep_total_len;
 			if (wep_key_len == 13) {
-- 
1.8.3.1


