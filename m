Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710FC2CA0
	for <linux-staging@lists.linux.dev>; Sun, 19 Dec 2021 17:48:00 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id bm14so16419501edb.5
        for <linux-staging@lists.linux.dev>; Sun, 19 Dec 2021 09:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:list-id
         :content-transfer-encoding;
        bh=h2JGTItMZLnyhLTpH8eIkTs8tCi5ANTqOzNBuD2pnIU=;
        b=qC1gY8YLolXBV4num+96fWsF3Tb8xlLEn3i41JN0ZAkoMIj2I/3383scNX3p0o9iSP
         ywF+r/xC0hM6iJexkjfcceiGsKb9ATNGM9hkbBpsec2E9RSZE88RExvAqf/FFWGXMGxv
         GmHnAFf/9n+V2j23AVGeagsqnofv+A+Qc8GExRvn1dcpH1EOzfvRCfadE0sCKbmY9ulb
         u4CrHgR4vwM9wvSIgEZMAVALcxb0q4ieio0bRBkpcdSRm7dbFiiIJ/r324BWPPn+6YrK
         Tx1kMaTpDmvarL2xY8ldI5+E615XLEA6Rz5M1QQrKLUegUKcvx9yqNPt6qicdfrj1Oxv
         7wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :list-id:content-transfer-encoding;
        bh=h2JGTItMZLnyhLTpH8eIkTs8tCi5ANTqOzNBuD2pnIU=;
        b=2tvivHh00mMtaAy9WwqSKnGmwZCYEE2QKVQ+8XYpXnAP2B4jB3Img07BneaiKXw0Yy
         eqdXUOJLpzu91+8j5wMct9aAhI7U887iLte7AYKw6j9tWw9GZ057DyXz/3ehwBS8j/b5
         2PfsTrjEo9h5ovMqZU95TIiw0kLyGrX/gmggWIFqdUsKVlTvOgfY5UeKHvAyKbGhunFl
         O001l38GEMGfAD7uiruGFljxQZgzMCLQ/FinEM70p0dR7SkrdpV3siEe0GelfTGWKV+k
         kECMAyVhtKpuLN+uTt0UvsrOJJgQO0+cXtotlj7D4UfYM4QpPOpSq6P37ldin8bug5/k
         138A==
X-Gm-Message-State: AOAM5315fPLZK6EPXu8s4I5FsN3LNZWqVKkZCPrDJosjFD6pp+DYTphs
	Kny2tx8/ehZwNILm2Rfu2Rg=
X-Google-Smtp-Source: ABdhPJyEjvVzzsEDZ9vIdLGyq6ZImKrqRNxtTIPHO5M+n5kDjBfFhcwXZ6GImmKdcVv76zinYSGVtg==
X-Received: by 2002:a17:906:b084:: with SMTP id x4mr9972138ejy.214.1639936078816;
        Sun, 19 Dec 2021 09:47:58 -0800 (PST)
Received: from tom-desktop.station (net-93-151-129-173.cust.dsl.teletu.it. [93.151.129.173])
        by smtp.gmail.com with ESMTPSA id a13sm5717308edk.29.2021.12.19.09.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 09:47:57 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alberto Merciai <alb3rt0.m3rciai@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: drop off byRxMode var in device.h
Date: Sun, 19 Dec 2021 18:47:51 +0100
Message-Id: <20211219174753.19789-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
List-ID: linuxfancy@googlegroups.com
Content-Transfer-Encoding: 8bit

Drop off unused variable byRxMode in device.h, this fix following 
checkpatch.pl check:

CHECK: Avoid CamelCase: <byRxMode>
131: FILE: drivers/staging/vt6655/device.h:131:
	unsigned char byRxMode

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/staging/vt6655/device.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 4706bde1ec1d..84b1dcf80e47 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -128,8 +128,6 @@ struct vnt_private {
 	u32                         memaddr;
 	u32                         ioaddr;
 
-	unsigned char byRxMode;
-
 	spinlock_t                  lock;
 
 	volatile int                iTDUsed[TYPE_MAXTD];
-- 
2.25.1

