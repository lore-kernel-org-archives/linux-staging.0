Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD52F21
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 20:28:07 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id i5so3774646oih.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 12:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZ+ICUNOD4a/G9GF8NueyOkz08WKOuBo2WdTV0ZJvsw=;
        b=aah8c1tqXvTU7RJNnPoeLLlrumzoU6ses4qrrQNE17jPo4ZKyEO5kPpRVtsM/JW+w9
         18R31HlYz6R+M+IjhxZTPUf6FliUYCzWAlIs12ZsUbX1Mr6wNGMK875QeFTPoWcTBEt5
         uYS1ZvQWmR3W/K5OjJp9heAOdxBWKv5vAsuWX/5tJhmCu1KQgkVUwg+vP98hwWvxAgag
         8kJKhnAtCdgM9+bWjymOme938eoVKP3AlNJf76MKVIAJQZpuZZQEDxCHEQI1Rh6p0SCG
         bI0iRQxZfIjPK3lLwusRQVP+aRwXUr4OYFF99yIm8HL7rlMLRxy7teVpna2n9ELqM6Fp
         waNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZ+ICUNOD4a/G9GF8NueyOkz08WKOuBo2WdTV0ZJvsw=;
        b=jd+TbyTZU+vng6dITSaB5uuY+IqyLb7TKZVKYgQsdKFQcCOs/dQJgtQukOeokoCfQT
         QQER5uZB/mbx3PDa7/kYm0qUH6BwqaiuPaHjr7qS2lgwCrdpCIu+GDsJZQVvFocVT5j2
         UvEfuxHNUpZp8y/ZnXfZOjbCRFlyXYqU8HivB/UrHquugkk6QLekzSOJ4AIiOKPyj+kG
         l5b4MIXC4ylXwJRFvWxYtbv1riLL+d1XE/IP0jWW8H9925ASkvFivgLaJY8tAgOx97eJ
         CBcgaP9CmAh6tE4w+hQ/w5tnteCSE2ACFp48Ih2uLGhJEMuRghGdVFTmpG9rcpYSjTKK
         EI5w==
X-Gm-Message-State: AOAM533nNwB9WEy+zV8bb6kX26MGWnXUmFrqkGWr4GOZc8KhYF1hS0qS
	s6ZJU4V4PeW9L0UFa49t1YM=
X-Google-Smtp-Source: ABdhPJy23WynfntBST1K1YK1LrOTCsePRqf4FOzpYNlOSn4/zQDoXbrUEiH+fwQBfmxxydu2gEVJwQ==
X-Received: by 2002:a05:6808:1690:: with SMTP id bb16mr2182292oib.88.1644438486519;
        Wed, 09 Feb 2022 12:28:06 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:758b:9a0d:6e95:934f])
        by smtp.gmail.com with ESMTPSA id d21sm6948035otq.68.2022.02.09.12.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 12:28:06 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: Comparisons should place the constant on the right side of the test
Date: Wed,  9 Feb 2022 17:27:58 -0300
Message-Id: <20220209202758.2940-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index a9a5453aa1cc..e236316188c1 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -618,7 +618,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 		res = rtw_enqueue_cmd(cmdpriv, cmdobj);
 	} else {
 		/* no need to enqueue, do the cmd hdl directly and free cmd parameter */
-		if (H2C_SUCCESS != disconnect_hdl(padapter, (u8 *)param))
+		if (disconnect_hdl(padapter, (u8 *)param) != H2C_SUCCESS)
 			res = _FAIL;
 		kfree(param);
 	}
-- 
2.29.0

