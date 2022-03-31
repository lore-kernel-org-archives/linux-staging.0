Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A517F6;
	Thu, 31 Mar 2022 10:18:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w4so33019195wrg.12;
        Thu, 31 Mar 2022 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3njw3DxCJMK/qaimqo+JqUFpsDvCToqYT0qLJezFT7Y=;
        b=lrHRCCq6CmPr1waA9nNdRhHP/C3MSiSrMwO9Kz1WUD0himOpEGemhN7eODcBs80FJg
         18Z0cvz0zsNOJVJGlN7gaeGMblsVl0/QvqxUt0nfpgxMg8QO6+rs8grhU0FNLDed853I
         TXXVgTjH5KUEgeRYlpuVZ8a93weTgxF+ksHAKNxxREsvKdDtTHx1AFWbQVY1GasDXA4W
         SeUahsj61KGflwqDyi+lhQLfoI0mc8YLYhl5XXxuLvuwWGPagFtKJ67MNQra46kLko2i
         2siYBD7mKypQiCvkzKjjnaOYz11YcWAMaRWiLx+aEj2QfLRMkwlGxVfmE6n7t7bWGLWM
         +btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3njw3DxCJMK/qaimqo+JqUFpsDvCToqYT0qLJezFT7Y=;
        b=qRkt5PsIwL/90UCzXk46Rav9p8Hf+wskm57IZKKdjSzNFMLWSITXDPQFMn2uFxS0DH
         R6HlxqxzF5jnWtrY3Jb8e6Ndec7PYYaZr6i8XzDzC7GhEp9iEYQj7VAcnkf+4vsCDwiA
         X4umLnhRaXqQ/Pak4W0PcSrUrJQzYxlzaJ6vrLq7ZqitHsttYdnm7qgFhvZowJzoeiPL
         hknfCU34OjB06p7zoowcnCMdEtl961ZOxu4WpRzHfqrWNvX+3Cms+mqonT/V03rDVMr9
         b9aJDfTi/Uzfsnh09d61W4o8fDW++mkIGD/EL3ultT95devXUUDvMKOFsX3emC+7LzkZ
         eyuA==
X-Gm-Message-State: AOAM533oNkJz60MV053ShOK8Z5zOMIIibXPrMlB9ScJBIRYU42GpPSqf
	n/5rKATm18mmj31AWZDlLvCqmKOuxNQ=
X-Google-Smtp-Source: ABdhPJwa3P6kCNuNRFst5jYLMm/9v2WOB5lOwPTpEWLX8v7cZefkN3P0qPBEtsqm+RvuRANfCZK24g==
X-Received: by 2002:adf:ebc1:0:b0:1e6:1109:5a1c with SMTP id v1-20020adfebc1000000b001e611095a1cmr3545977wrn.228.1648721933165;
        Thu, 31 Mar 2022 03:18:53 -0700 (PDT)
Received: from alaa-emad ([41.37.132.115])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0038b5162260csm10336271wmq.23.2022.03.31.03.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 03:18:52 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH] staging: gdm724x: Fix Duplication of Side Effects
Date: Thu, 31 Mar 2022 12:18:49 +0200
Message-Id: <20220331101849.71046-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix Duplication of Side Effects for GDM_TTY_READY(gdm) macro
reported by checkpatch
"CHECK: Macro argument reuse 'gdm' - possible side-effects?"

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 04df6f9f5403..6f0274470e69 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -27,7 +27,9 @@
 
 #define MUX_TX_MAX_SIZE 2048
 
-#define GDM_TTY_READY(gdm) (gdm && gdm->tty_dev && gdm->port.count)
+#define GDM_TTY_READY(_gdm) \
+	({ typeof(_gdm) (gdm) = (_gdm); \
+	(gdm && gdm->tty_dev && gdm->port.count); })
 
 static struct tty_driver *gdm_driver[TTY_MAX_COUNT];
 static struct gdm *gdm_table[TTY_MAX_COUNT][GDM_TTY_MINOR];
-- 
2.35.1

