Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389829CA
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:02:07 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id w3so7743215ejc.4
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JytH94vJbFCj7GF8XTLRPZJht9eld57OrRaG5ECiMQQ=;
        b=HA0frDEEl8tu4uCWwfdOa71uh2WD0uWeXL8s6LZ64BeJGsjy2ZHFTPJ3Dn/QJIYy5f
         bv5l/22hlVG5ydcJExLLTmZ+0fQXphesxhYA0zxQ41Jt8/vDvCNxJm1z0DyELXmGpRST
         O2R889XsBO0eSR4zteK1YkkmMKO+dotKAyOlSxdD9/NQ8/atRVMtVShk/nbiVWfZvlSO
         WVPvEjDw/a4uaKUi4IRANEWe1/Cm68kUq1TNiQTR9MzrbCLyluq4NZc9tol1hTn0zC9X
         kw5Qq3CBpSi0nQkPMWbplu4NWK7ELys74hSrcspbV6Vhi+tCMjbG/mNQdN1zEMOuNlGd
         lwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JytH94vJbFCj7GF8XTLRPZJht9eld57OrRaG5ECiMQQ=;
        b=BVOVdRCkXB2lNIXIu9bwE4TIvzfMHA1Qopkk7q21UwEHkJ2q9oYCHIZ3MYBjBBnyv4
         7meaMQ0yTERynsdUaeJA0ipBzI856xlk8PzyFxQ2D+oB4OdHxqPBv6+p1O/hG5BsjdBt
         A4QtckkA6DH0EeUlNQQ7tY/5oLb/b0hstG1IsndqztuPvJykxdM5ncLcitPdIpMFj703
         fZcZlyfcOCz+awoXQbbJjGrOozNHvCg+fYR1QJy7rAihAevYMO2n0oacCE1SHJxIcoI2
         bsIJnEcnQsbRfuEOcUakbj/5e46/fkt+h0TYwjIkmEiTeVCkK+/whEh9avf3L+LzZGSz
         2nuA==
X-Gm-Message-State: AOAM531etR2kWObWppYb39emRWz4len42bcRqzpdWD2OCppcQSuG1xAq
	OW7l01mQlLnsPgELmLsBCpM=
X-Google-Smtp-Source: ABdhPJwEt4KOxtI39dsUCn7FcQMHvZfIfa9co23ZLdx9gxo3Ha1HqveEuWc2UE+XRqwnvpWdIb4I/A==
X-Received: by 2002:a17:907:3a98:: with SMTP id fh24mr5486136ejc.371.1617962525933;
        Fri, 09 Apr 2021 03:02:05 -0700 (PDT)
Received: from agape ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id r13sm1158992edy.3.2021.04.09.03.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:02:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 11/11] staging: rtl8723bs: remove decl of unused static const variable in os_dep/ioctl_linux.c
Date: Fri,  9 Apr 2021 12:01:39 +0200
Message-Id: <05cc97a114269ee55ac9a91c61493c885fcc0193.1617962215.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617962215.git.fabioaiuto83@gmail.com>
References: <cover.1617962215.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following kernel test robot warning:

   At top level:
   drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:36:27:
warning: 'iw_operation_mode' defined but not used
		[-Wunused-const-variable=]
      36 | static const char * const iw_operation_mode[] = {
         |                           ^~~~~~~~~~~~~~~~~

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 6f52b8fb0d6e..e5f0cdc9711e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -33,10 +33,6 @@
 static u32 rtw_rates[] = {1000000, 2000000, 5500000, 11000000,
 	6000000, 9000000, 12000000, 18000000, 24000000, 36000000, 48000000, 54000000};
 
-static const char * const iw_operation_mode[] = {
-	"Auto", "Ad-Hoc", "Managed",  "Master", "Repeater", "Secondary", "Monitor"
-};
-
 void indicate_wx_scan_complete_event(struct adapter *padapter)
 {
 	union iwreq_data wrqu;
-- 
2.20.1

