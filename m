Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EF02EF653
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784491183; cv=none; b=tmwxzfshFIOugvKU5tYe68rklIIr1YrSFpoUzNUbeQcHPG07zPoDFSWvr0q+TOIp8hWwUxVh7Qj4SKfgBobAW+gHlvGe7gN2fe5R07Up7O8Hw//Gs68istIxDyS9k1kvB7+38OyVagKlIocQORx2mVGm9en3hxSlxrSms4cvfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784491183; c=relaxed/simple;
	bh=EEPlKfCoC30099HNBnVHrIieVhx+FCQ0TXswDsBvPAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZghQbAQrweQAXT753TaEyLyxfBdAz64wmlIVLOsebOdk2fA72ueMgcMWSIqNoRfFWGMn8OW6c/46JK79TRXuWz3LMICZTXEHTrxkuWLga0nW0hoDF3/KHQ4eNKHPrZY08eOLJ3MUdDBCdkNYWaDNjzC2fgrLG709JS4GK9LzDZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXn1jUo3; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXn1jUo3"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38101f85591so2497670a91.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784491182; x=1785095982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=29R4VvP0t4h5JYvi0rHChbjYG421EIIS5l4SaCWoOTE=;
        b=DXn1jUo3JW30/PhpfkHZu0YOrX8qqcjd9vbcRKV8kJ12E0uMjNA6ynXckkNw0rLCY2
         FEmqTzgD/pnagpteDxdWz56ExMQo12g1aK9aFwhEHVV1ZY1j7OTs9WC4C8DTP4LLEbKd
         J3XxER7lmC93Qw0suqOockHrH2bnpcTIt02lzwXwmjfwiUokpHp7E32wsGXbFPvng2BY
         npDMs8K4BYyWxSIk4YO3AxgYxgcCO3dccrEx8nMVBi8HFDtI77QvIPfyAQ5UQDRxkR5+
         SlPE0VJ+eW+8BqRuxcG/jENzf6Iwp5A7hdLl7sOXo5I+/5pB3RqOkCKnlCWxxRgt6LjS
         JD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784491182; x=1785095982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=29R4VvP0t4h5JYvi0rHChbjYG421EIIS5l4SaCWoOTE=;
        b=E4SliEoq6dpXZgupwAjIrhLYwJybrdekehvRO33G/SpYA7C5ucJ5+pnzLh66OA8Vzt
         BZcXls4cPXWAufQLKHQphobiql287qXeZxTJHw209DsPWRWtYlcQwH0D//S0PXShY7Px
         tGc48pne/sRC9/+Vc7OtXzkowrAeOBdyZcQA1F+WMHZKSzcrFMIrhFkoFq5zm+N1r3yY
         BgPBPmpdPVEnSHUztYgkt/zVYaE9D/ZuUAexAr1KlWnVxuMJLetngpjg/2AJUNG7O/vY
         ImIos7CNxF1asXweagqSpnMfBI7578e4evo5JkioREdLP1m+zOk545sROv1APnITnV8Z
         UjYA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9AB8g+ruPGnmws2DB69bLiwYcKhKYyUgHPN6NsYhlldwds6LBtT8Bs4DhriaAiKp0NvnvSKc/mwO1OVgT@lists.linux.dev
X-Gm-Message-State: AOJu0YxOmUoA+WM0/ya8Ka0lK6Z63BL4OCoreLgtUajZyiSqi8vKHWAr
	6bPYycT6pLyCyTa04UOosD1hpYE8d1tBLmfZ9PUF6K1pM/phkX3EzlVs
X-Gm-Gg: AfdE7ckJTxeR6cYUcv2bjA2F0m5/EOxkD5TtfsZKjkfK8vSO4uVv8WNdQ0lWmtmng1f
	acbsR1gLy0FBwmaoigp7sVAeOxi6QPUwfmEUFWbK7Xitb0w+84uRREDUfhMlacIdrNTl9o8wt1j
	dpB1O0dBAL4xQ5FcNKUg2aYbOgfbR48Nyz8bK7nlpG3FnMgx3OE66DSag/srxRErj4LsnFbt63i
	IlX+bav83M9N7R7bu4smL9GiJRIWPNzdvEKt18Kqbm+ZRTEqVtRN6Rk2CTuSLwmRBU+uKxCCHuf
	GqN1RM+7wRUfn53nommFLQw7dp9qMLrPO6iK4RLsbH6Z9gDUaVhXMsXx3lpsAn4EvU6Td77f+Kw
	7BYRvCNkef4hLFujQdR10eh+lYTDJd0DMhdnw/AH2kxkbge1igYJOyUyxATl2Z9vKYYIXVjJBnB
	Bh
X-Received: by 2002:a05:6a21:6e88:b0:3bf:bbad:500e with SMTP id adf61e73a8af0-3c3acc2f2aemr11768807637.5.1784491181685;
        Sun, 19 Jul 2026 12:59:41 -0700 (PDT)
Received: from PC.. ([103.172.209.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20c158sm31076333eec.29.2026.07.19.12.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 12:59:40 -0700 (PDT)
From: MishraMohit21 <mishraloopmohit@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MishraMohit21 <mishraloopmohit@gmail.com>
Subject: [PATCH] staging: sm750fb: select FB_IOMEM_FOPS in Kconfig
Date: Mon, 20 Jul 2026 01:28:38 +0530
Message-ID: <20260719195839.24937-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses the FB_DEFAULT_IOMEM_OPS macro in sm750.c to define its
framebuffer operations. This macro references core framebuffer operations
fb_io_read, fb_io_write, and fb_io_mmap. These symbols are defined in
fb_io_fops.c, which is compiled only under CONFIG_FB_IOMEM_FOPS.

Since config FB_SM750 does not currently select FB_IOMEM_FOPS, compiling
the driver on a config that has no other framebuffer drivers enabled
fails with undefined symbol link errors during MODPOST.

Add 'select FB_IOMEM_FOPS' to Kconfig to ensure the driver core helpers
build successfully in all configurations. Keep the select statements
sorted alphabetically.

Signed-off-by: MishraMohit21 <mishraloopmohit@gmail.com>
---
 drivers/staging/sm750fb/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/Kconfig b/drivers/staging/sm750fb/Kconfig
index 08bcccdd0f1c..7d5ad423e41f 100644
--- a/drivers/staging/sm750fb/Kconfig
+++ b/drivers/staging/sm750fb/Kconfig
@@ -2,10 +2,11 @@
 config FB_SM750
 	tristate "Silicon Motion SM750 framebuffer support"
 	depends on FB && PCI && HAS_IOPORT
-	select FB_MODE_HELPERS
-	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
+	select FB_MODE_HELPERS
 	help
 	  Frame buffer driver for the Silicon Motion SM750 chip
 	  with 2D acceleration and dual head support.
-- 
2.43.0

