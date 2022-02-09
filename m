Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3B2F43
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 20:33:07 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so3815395oor.12
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 12:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YVhiOF8iv2xIg9kYcs7/IvgqJ+jTjVp+C/mxqQxAHV8=;
        b=IMuFYG7DLvcriu374lorFQTy1rdZYFQgDePxlljqs3bFlxdrM3KloXehndGqfik/rj
         48ZiJ8kmNp0rfYr5+w66gNKH6yy+Fz5Xtb+NPSlvvQSMe3j2I7fSsTMXDRSjxtp/9Ov8
         aYzJ09UtegV2GP5fszfWROUcQMOynSkTkI0WWR04/Q3xkvzz0S/VpdH8w5nkAIS/UZeU
         V5ojHC4Ur/eo5OAxBpKKEldpCpnqvUel8sc6s1wWjqRnRHjIB6CT7xiL93OQZ07V2Kdo
         f6yCq0NTSrF/YYZ9rQPvjovtkICtStpI5WhJRFI4t1Ris2FVfwaYGuQj9YAA7s3U69ka
         lUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YVhiOF8iv2xIg9kYcs7/IvgqJ+jTjVp+C/mxqQxAHV8=;
        b=1/IaosL0jV5A9zAUa+zg+tovwhAG53xxDOQAblxpCAbmpZ0iSeNSmmyc1q1yHk3jQL
         1eQSazQvVCNkedeOD+LJa2+QhgHZAL2c1Qz5AD8j9dQl23ZQ0rMkT76DVDh8fClulkz9
         Cy2F8PZ4TMf+2AG9GHcge7QdZT43DEBQ4VyrrD8S/xPsqBk9IqboJeiUO3gEtganaG5I
         krv/Hjtwj3j+cE/pmN/JY2PJz/rTTNqOjZc1uoPrVCGK783vgLKBVcWdKGy8gIhFdf0z
         dxFzp5uAX44djVByGvtB5u2piot7D0jwd76VDlT8LdnqZ4HuNyKaG9awvLL1VcUCWpVq
         wH6Q==
X-Gm-Message-State: AOAM53272F292LuNIRkiDB6KNgH/tUpUa7YF946UdfJi2izarMscoaPI
	K0RWrDdT38RludbBmOfrqc4=
X-Google-Smtp-Source: ABdhPJxAtO6Kq6OIAoojf5SUerefeAMYP1QbgsfPihawjTNVODfPK4W77h7JFU6ebe1aNA1QZSYiZw==
X-Received: by 2002:a05:6870:3815:: with SMTP id y21mr1423624oal.330.1644438786477;
        Wed, 09 Feb 2022 12:33:06 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:758b:9a0d:6e95:934f])
        by smtp.gmail.com with ESMTPSA id u32sm3051052oiw.28.2022.02.09.12.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 12:33:05 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: Please don't use multiple blank lines
Date: Wed,  9 Feb 2022 17:32:59 -0300
Message-Id: <20220209203259.4718-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

CHECK: Please don't use multiple blank lines

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e236316188c1..ef0dd395b1d8 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -433,7 +433,6 @@ u8 rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset)
 void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 
-
 	kfree(pcmd->parmbuf);
 	kfree(pcmd);
 }
-- 
2.29.0

