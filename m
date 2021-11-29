Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199C368
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 00:20:54 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id j17so14774398qtx.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 16:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mBYWbHSpfXgXH5cLbVWv6GtvARXh6hrvGhWRBfRo3Q=;
        b=vBIhkUnqu93IN6t2iVYf+Yh+Cg5TsidnqEoVA7yk1qBhNmhqaMwBWFN2K3ln0vp1/M
         iRJZHWGlgHUJX7RlaGtafoPIjfmp/d5yz9maV1/kI8Tra6YGZPUVx0niwbjgDJHqGfCF
         e0qsG2AzQbQdxKzHAolt8EgmJw2iTMqOlDdzJ8ticvM7LxZ9sruyfAPuoafLRK/ie7+y
         jY6mRpHvZduwNsb1+ZgE7pDpspr7UQ/usVtfbmImKjMK6ShLUoYCzrrAKogDsNLKCzuM
         NxZMw/VDp8jxcpWllwq88ub6htmy5uIw67iMhk7ndEdskGuZhEzS2IWQcPYMHYbPxgq0
         5Q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mBYWbHSpfXgXH5cLbVWv6GtvARXh6hrvGhWRBfRo3Q=;
        b=xu18W8PeY6+zJ3w536+dzZU8n8/H36EJqvmI6H/rxXn8Gm5RUrxuoVDGZaOsNMAEaS
         iBsG4Ukv4fwdy68Dd/TO18eXU+CgfGMu6S2qSPzM5GsjxseYMUNWPZcsr3SGg7t7lnUf
         F/4T8mj8uMA2DF53felF+hVzHiPjrE1YyLo5+hfAsJYgBP1c7nwZzcAlpLtPmi3NnoAD
         bjVuhS/tUacEfI/HiKN+HIQz4Gv22ocllbV3Sa3eQK/YR7Uvu3Te+teQWBPyU9WY0rzx
         aurmxfK1RMrm8k5fhLszyRjeZeEshgEy1+frSpznDBFlCluBxDmuFNaapRc/rV0RmOiL
         Uu5Q==
X-Gm-Message-State: AOAM533MFB+rBMqQtYVMbysgEqxobRMIbNIOAu5QtKPFrvhy8ukFEL8W
	AxRCmukYjQBawDWvhvxwZugdoGwiMG1vSw==
X-Google-Smtp-Source: ABdhPJwl9JS6wEP/RQn+hZ2HpCnFJmMYvcdErkMsDQwUzC/5XfShVVPgpplqq9vc7Un1DCcGM2P1Mw==
X-Received: by 2002:ac8:7f0d:: with SMTP id f13mr39520459qtk.341.1638145253264;
        Sun, 28 Nov 2021 16:20:53 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id n74sm5681022qkn.83.2021.11.28.16.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:20:52 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] staging: r8188eu: convert DBG_88E_LEVEL call in hal/rtl8188e_hal_init.c
Date: Mon, 29 Nov 2021 00:20:39 +0000
Message-Id: <20211129002041.865-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129002041.865-1-phil@philpotter.co.uk>
References: <20211129002041.865-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert DBG_88E_LEVEL macro call in hal/rtl8188e_hal_init.c to plain
dev_dbg call, as although the information is potentially useful, we should
be exposing it using standard kernel debugging functionality.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 001e4a198630..db87e91ab8c6 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -541,7 +541,7 @@ static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
 	memcpy(pFirmware->szFwBuffer, fw->data, fw->size);
 	pFirmware->ulFwLength = fw->size;
 	release_firmware(fw);
-	DBG_88E_LEVEL(_drv_info_, "+%s: !bUsedWoWLANFw, FmrmwareLen:%d+\n", __func__, pFirmware->ulFwLength);
+	dev_dbg(device, "!bUsedWoWLANFw, FmrmwareLen:%d+\n", pFirmware->ulFwLength);
 
 Exit:
 	return rtStatus;
-- 
2.33.1

