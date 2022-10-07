Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABADF4C87
	for <linux-staging@lists.linux.dev>; Fri,  7 Oct 2022 20:29:44 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w18so8833949wro.7
        for <linux-staging@lists.linux.dev>; Fri, 07 Oct 2022 13:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=acRXa3EbxjDyuWzNCvorzoeftSZn5YgHw3PgsDGMlh4=;
        b=ejhUykAcblfBmQrplTJ1MOeHuxLMSdvlZGi/Zyp4Htc37OoT3TCD+E199JOXX8ET2S
         9kf6GTe3w8/gHeaTZm/UnnBLeOTWnQT5TXEdzs9UjqtceNJDCym/b9SJ/XzAgOxNga19
         wM5h8hLITh6aiuR3pBTXv63m5W4/jTCCqONJDOyb9elLVqqecnJyJpT5uoN1yON3auxB
         9zRPRO4bBf1JQ4mTQqQ0iyKIA8iV7ak5WWFnbgB13RSpqJfiUsrAOYX0sQBGS54VKNuZ
         1h9korPY7/0Rl+uKXm/+6vHCTuEhEYdKFTL5Xir1wmZbqSEI2I/fHWB3MLKcmNa4qwMb
         bQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acRXa3EbxjDyuWzNCvorzoeftSZn5YgHw3PgsDGMlh4=;
        b=rUPglfcTadpJQIJQdLlMd31VzLe+2bkrVmW8v+66tbrEceKYKM1OgQ+qcxsjQLVkU0
         Y/Uui53Oninm6ofO8KIZI7zJ46fzR1fYbKpmfCpaXmbBulrcdbb/gx5kCGFJNFwjlmzx
         D7l4FABLCPmHigVoWMCJ8gZh3n0HKLw/vNEvsL5Q+P3ueuOH0mSm3qbaREsnCL2htHfj
         ar35WtP17TPy6/nWhaRu2zquy3lrmMbb+Z3SUSqRo2lLp7yL1KeW9rwqn6pu7U8PSHr9
         JzcOo3iI2pZcaeeaPpzwQbaBunxjOXS/MN+N64gWlcieXgvpmyHBHSg5EbXLgjvhOdRZ
         cfSQ==
X-Gm-Message-State: ACrzQf0rN91CwtBf6E7TzYX9P2uqTv6hv9VhgmUPgWggDW6eFxneDgaF
	JF16o1w+3T6aafXiURctffEVpjH0lHUA+tHZ
X-Google-Smtp-Source: AMsMyM5Q6e6m8tHnLpJSYt1IEkbis6gB4v3Y0+Cot/ua6m2dEHtOxf18bWfz/yW4quBb9mKWTPnWZw==
X-Received: by 2002:a05:6000:1002:b0:22e:131c:4249 with SMTP id a2-20020a056000100200b0022e131c4249mr4738044wrx.50.1665174582783;
        Fri, 07 Oct 2022 13:29:42 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6dd1000000b0022cd6e852a2sm3564195wrz.45.2022.10.07.13.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 13:29:42 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: Kconfig: Fix spelling mistake "accelearion" -> "acceleration"
Date: Fri,  7 Oct 2022 21:29:41 +0100
Message-Id: <20221007202941.2756304-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a Kconfig description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/sm750fb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/Kconfig b/drivers/staging/sm750fb/Kconfig
index 8c0d8a873d5b..2101a6605efc 100644
--- a/drivers/staging/sm750fb/Kconfig
+++ b/drivers/staging/sm750fb/Kconfig
@@ -8,7 +8,7 @@ config FB_SM750
 	select FB_CFB_IMAGEBLIT
 	help
 	  Frame buffer driver for the Silicon Motion SM750 chip
-	  with 2D accelearion and dual head support.
+	  with 2D acceleration and dual head support.
 
 	  This driver is also available as a module. The module will be
 	  called sm750fb. If you want to compile it as a module, say M
-- 
2.37.3

