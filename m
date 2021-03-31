Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7876F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:46 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id h10so21504991edt.13
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ptH+4/9uZVa+tAgJFkoaX1wokNsm+azooLW/83BNidI=;
        b=HqnWE2N+iGGexUeEWZPYPHR0qmKLzqE3WFzMOSaKawNhfxiON/V5s77phgspDAP+Jw
         wNV+90cw+Yivw5L33MzxTvEJR3Kyn4WnB1k1XCrny+KhFQExrQGgM1QDfQyzl8Kgcmv2
         8y/ECp2RZO1rDAuUBJC9Xj8FpjdSMmqgwnPc7gjwfO4JKTYKjl3oboBjWts8sFjeLsOk
         tK5cuKIHPMoBPWi7HadcWIRCwWEdsvnWpSSSRoeBX7wIJO6eKe+3mgLzvRBc9OQipECJ
         UmPP8Zr+0ud1LvehzzYE8GnQMcxa4to8s6cxUaXGKu+mVxNIyMw5dT6+ao52zVPzMCzO
         na2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ptH+4/9uZVa+tAgJFkoaX1wokNsm+azooLW/83BNidI=;
        b=ik7BB9T1WQM8SonweEai+bxW5+VN/obVEdfPGkFOmHiqzEb8D0UWPW8pmAbm97kDmw
         DpgBMAvziVLV54D2FSBZb2y91fm5tw3WALISTDhsBIBOB5F5EcIJ7cJQWoZt8DP8jZUF
         2/Ey12FOd6VObCjtsKBuPspt3qNxa1mP/NJ550Rg3KYPhrERvTrUWEXMZMBAAlruYSXd
         WmgXSCI3z9Vdn7Nj5XKACI8v5LRb95Hq5C37sKbDB5NPvXPvkDmyfstoxEpsG/d/Q911
         DZpfvwrlG6segWf0PKjHjmJIBr0v1V8jlZWtGgnlf2yVZf8BjA/JcA8UqcJsCaGmtwVA
         PyXw==
X-Gm-Message-State: AOAM533jPxj+dbIzNBfhFP0yYiTi6qGBCEaUAf41AugZ8WR7dZRCyzcV
	XTttAWHW9OAJHhVSmmwj2eo=
X-Google-Smtp-Source: ABdhPJxEgfMqBOD5jNW4ZopGQXuh4GaIqe27cI8PZ3dgfa9vzGgv2YCQlv4lEyn/wlVyT4AJpNlhLQ==
X-Received: by 2002:aa7:d4cb:: with SMTP id t11mr2576937edr.202.1617183645135;
        Wed, 31 Mar 2021 02:40:45 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id br13sm818951ejb.87.2021.03.31.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:44 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 17/40] staging: rtl8723bs: fix constant name in hal/rtl8723b_hal_init.c
Date: Wed, 31 Mar 2021 11:39:45 +0200
Message-Id: <2a7ecc09626de4c409cd057492fac193c54d331c.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix constant name in log message call

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0273118e70af..0f7da8dbd80c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -412,7 +412,7 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 		RT_TRACE(
 			_module_hal_init_c_,
 			_drv_err_,
-			("Firmware size exceed 0x%X. Check it.\n", FW_8188E_SIZE)
+			("Firmware size exceed 0x%X. Check it.\n", FW_8723B_SIZE)
 		);
 		goto exit;
 	}
-- 
2.20.1

