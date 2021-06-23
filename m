Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F62FB2
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 23:49:20 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id x1so5891921qkp.7
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 16:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0AfTz6lhFALWAF95V8eX3JJFOOKj3+2vlJS3pE/R1ls=;
        b=cXHblTphWSG5QRPX4XbTDuvZM6SEBRTZK9kCHiqJAmNU7S2LU7EGON9S9SCkpySPV0
         gh2Hi14OyLl9PH2g9VMEM/RqGk7npgj42A4Y/sDWfw9wlyDvT31Del0zkCDdB6sBJmRO
         t11FmF5YdOMghIvgVjACB/7expbenjTYKtcCcSEOarx9vYWC88cClN4wFvBg3urqoSuA
         C8iTy+kW19OMcZK9264DTbBtDqd9A6snzG0tXxFJPMC7ckTZep+SLEkNKkf0rtpQL1lk
         fg/++qQcDtyevaDTBtPeMx/zytIbo8qGxsnvvuOV4Btv+E6QvHcqMtXLiCg3/SQ7Cm8l
         94zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0AfTz6lhFALWAF95V8eX3JJFOOKj3+2vlJS3pE/R1ls=;
        b=QCw9lQ156lbUHgQIXCC9suyRpDPv4nU9v8xGZ2KEFC2AFxsvz5Gk1P34b0snMFpGs3
         MV1I2tlHJVAZVWEvHDObrVzSIRk5zUVeHVeKdyK041oTcn0gvCbzNMlboDRKszP4UlTi
         vbwxguKADE1yfOAV21sk9Zgsso9IxKp9wPnAuRGN6r+whEaWbAVljGvfXKp6xveCuELx
         n/YHpXUTfSAa2sAmOwvOy9wjpPZS0BookEeeZBQwkOoOgzkvPNufyGUS7SUCFRI4fjei
         jCPeQUZLctdMbskFmpiICMNw6Gu3cwn61Dte5SaKAslFSo+rh6n4vX5KkPUAADL8BG8s
         RVCw==
X-Gm-Message-State: AOAM5324469vHvMczv9Z+lEiC54m5392nP8JRmCvR4aDPI7ZByN1/udk
	nAHHhHPnrv8tBUAgKlJwVS0Qdg==
X-Google-Smtp-Source: ABdhPJx9sKTslX/FV37xwlqSeS+PBabwSpntZu67Z4BX91AtQS5DZ61IeWIAowYM58VL1ZyKGM6CxA==
X-Received: by 2002:a05:620a:134e:: with SMTP id c14mr2733366qkl.301.1624492160049;
        Wed, 23 Jun 2021 16:49:20 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id w2sm992387qto.50.2021.06.23.16.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 16:49:19 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 9/9] staging: rtl8188eu: remove MSG_88E macro from include/rtw_debug.h
Date: Thu, 24 Jun 2021 00:49:02 +0100
Message-Id: <20210623234902.7411-10-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623234902.7411-1-phil@philpotter.co.uk>
References: <20210623234902.7411-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove definition of MSG_88E macro from include/rtw_debug.h, as it
no longer has any callers and does not follow kernel coding conventions.
Removing this macro leaves only RT_TRACE and associated definitions.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/include/rtw_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/rtw_debug.h b/drivers/staging/rtl8188eu/include/rtw_debug.h
index ac123ddb8acb..72a18ec3ee32 100644
--- a/drivers/staging/rtl8188eu/include/rtw_debug.h
+++ b/drivers/staging/rtl8188eu/include/rtw_debug.h
@@ -58,12 +58,6 @@
 
 extern u32 GlobalDebugLevel;
 
-#define MSG_88E(...)							\
-	do {								\
-		if (_drv_err_ <= GlobalDebugLevel)			\
-			pr_info(DRIVER_PREFIX __VA_ARGS__);			\
-	} while (0)
-
 #define RT_TRACE(_comp, _level, fmt)					\
 	do {								\
 		if (_level <= GlobalDebugLevel) {			\
-- 
2.31.1

