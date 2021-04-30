Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285522F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:05 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id f24so7083063ejc.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esklRFhcv92jAvcOLhHGS3GTMlKhQ0QkDSmO8wy1pRY=;
        b=PRbb+ZxzQIXKhEW0PCoQ2yZIPvBDyc+nlsBX/I2sCBIvDhvdTEyy3JgLVztQkHdNbU
         yDgYtSGdZr/2tqYSiBB91XC6C5VNEHoN0vch05eRRivlB0DX6uXb/poDawK7f5duzCG8
         Tuptf7IND8FOLOnfRgWQn0/iQ5N3muKluZl7nvdBQyUwM8/u7E3+nCgkOf5Hju/ZaOGj
         euYiFdr0RJfsmKu2RbEDHq2FzgHwaiW47Pl5DZ6ZqDM1Zdyo0bwoBn3c2DihFO3E32q+
         rxJF8Ur4zRQDcGanoVL5AX6jLDfYOqmluLvpxH1Fvcu9vIUAjKs9pDofOiiA4We+cA0z
         aq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esklRFhcv92jAvcOLhHGS3GTMlKhQ0QkDSmO8wy1pRY=;
        b=P8rZXFQeLol3/e3WqrjseBcmlLiOIfp1Ofm6dn9CkJ+wzlDeKNuuXlbIWlT0Jx7nfZ
         RoUAC2nNe3bjRiE9zhs89m+xlh6fpOx1JxpbljILbuWdBTxY5uj1VJlR1H3gEu9I0bem
         vb/T3o0bV9IrbHYQ0cc++dF8oNQkaPpn7Gn0E6R5SNNRl6rR1EJPEFWDW6vDYBxeeqTW
         hwj1pPjzGgxg7sVI11lR+F+MhYA1A3g7TW7UhHrll2bfwtYsGdXaixdddRAYeur92uHK
         Li9SG1DiCB6ltqIZuEF3rvnF0XBc+5QWFUl3Ej4/YS1endLyjqMQm5coPyKWVkOXMnKS
         ZpnA==
X-Gm-Message-State: AOAM532CDRFo/U9euOdIndhF028FviO85Pl30E1Gb88YRiP46RjA0S9h
	9/35Njzw7FsERWSi32HLSyI=
X-Google-Smtp-Source: ABdhPJw2RYTakUOpINOYkRFDPymlL2BL3toq6Osvp7StV5MUY/5rcYQyc42YwEw26xTUOXA8MzTENw==
X-Received: by 2002:a17:906:6854:: with SMTP id a20mr4593580ejs.329.1619793903806;
        Fri, 30 Apr 2021 07:45:03 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id o22sm1434118edq.60.2021.04.30.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:03 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 33/43] staging: rtl8723bs: remove unused enum
Date: Fri, 30 Apr 2021 16:44:03 +0200
Message-Id: <6893322de95a5864161b349c6ea1836c78289465.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused enum.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index c5444f965699..c4616a69425d 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -78,12 +78,6 @@ enum {
 	BTC_CHIP_MAX
 };
 
-enum {
-	BTC_MSG_INTERFACE	= 0x0,
-	BTC_MSG_ALGORITHM	= 0x1,
-	BTC_MSG_MAX
-};
-
 /*  following is for BTC_MSG_INTERFACE */
 #define INTF_INIT	BIT0
 #define INTF_NOTIFY	BIT2
-- 
2.20.1

