Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFDA12B64
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 15:10:07 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5189f49c315so3672054a12.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687187406; x=1689779406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snu+S5y4+SEbvZxuNqaJKxNoj771q1fsuo3zQR1oJlc=;
        b=XW/t5IoD5oqI+Vp+Gl3zbLsWvZdsIRxACNRjO6CSI8qrSw6uMY8OMl2ObU5ogfm8Jd
         kFPxcrhVvDpKqg8Oc4lHvP+UnbhL7iMvu7VNoj2QJcOF1J8OqILf24OKTsaKbt6HdcUA
         gBqWMDIusLDXq+qIhvHVgJPXrnxYmPHnZ4+p8JXaYIbZyxk4x9SgYUHiRU1RmujvhLRA
         Rcz9+E6LWceMrPFUru4iqnVJaokucWJzy6FgsiA0EdCcvklgV8J0k1BN2NTFYN+F6ydu
         zVLdWd4VL7wpKuSAuf7T3/xv+SXkLVSNEt2DFMtVIowRlb/JkhWhKGbG7+hTqX60zLOq
         QtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187406; x=1689779406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snu+S5y4+SEbvZxuNqaJKxNoj771q1fsuo3zQR1oJlc=;
        b=J+YEeOjEWj+qRvAT7KgE7t0gZoGfeNbdzZKQEEqpvW6b3w66IDu7bKxfRxsAVXdxR6
         Sa/rKikQlOO30ye7ZwSHL/BGXP+T7U/Wvij8MEKLvKPEJ30MTxu/HN8FUw9Xbi2bToJc
         Xqbs3iW0AiumBgczSS470wqrp1WWVyetT45KmaqDx/lQtfwyPfv6xC6flo3uwUi+89AN
         zvJxiq1yalCQ9UUtY4MEi14LMaMxO8MrqL3tVMYM1/LEUnjqQdZyTn8NCvaQoyRc8Xs+
         bwjwJ1BbE3IVBKYj1mlQ6udsWqO2yyXCopvrWsw0bOEyiMZqqEiab2qNMHFDez2B+LFs
         T5lQ==
X-Gm-Message-State: AC+VfDxtozbgdU3Gqi9Cq8o5NWOAPaW/AAgRsmM3p+54ek3Djt9BU3We
	ZPKoDtJ2mSN8fR38dZLDrqY=
X-Google-Smtp-Source: ACHHUZ6p1rzi/cv+fMtaGRWBi/CZoN77pk2/R0btD0J8YIKBkR21JIJ9whPigKMIpHXJff9kZtRl2A==
X-Received: by 2002:aa7:db89:0:b0:51a:265a:8fca with SMTP id u9-20020aa7db89000000b0051a265a8fcamr5143511edt.27.1687187405909;
        Mon, 19 Jun 2023 08:10:05 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbd5.dynamic.kabel-deutschland.de. [95.90.187.213])
        by smtp.gmail.com with ESMTPSA id p6-20020a056402044600b0050488d1d376sm13297186edw.0.2023.06.19.08.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:10:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: rtl8192e: remove return statement from void function
Date: Mon, 19 Jun 2023 17:09:52 +0200
Message-ID: <20230619150953.22484-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619150953.22484-1-straube.linux@gmail.com>
References: <20230619150953.22484-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary return statement from the void function
rtl92e_config_mac(). Issue found by checkpatch.

WARNING: void function return statements are not generally useful

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 24180670ea0b..b0857c5709dd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -268,7 +268,6 @@ void rtl92e_config_mac(struct net_device *dev)
 		rtl92e_set_bb_reg(dev, pdwArray[i], pdwArray[i + 1],
 				  pdwArray[i + 2]);
 	}
-	return;
 }
 
 static void _rtl92e_phy_config_bb(struct net_device *dev, u8 ConfigType)
-- 
2.41.0

