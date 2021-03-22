Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100396F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j18so16827008wra.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pkIGaavul49tXOt2X27ShaCcNNX6Dbj/+fu1uukU7iA=;
        b=omE85Ls1/1oLcHGu3Mdj97zZ2klgA+T5MCvFic7E3WX5HXO+Wzex9EWJF9Mfw2MD7V
         lu75kulX8bdqfQtbCcrrKcv0k1Yc/jiwYWzn3iruc/XuL29fk5u3cqVYwYIwmG39dmUn
         4wtbzIh89cIBBWjDKNVfuwPm7kKdW2dF2Rj1iTG0ndSdgjq2ZdmxjnoapS99J76VzbQo
         xnEG4MzV5x6z63raSrTcd6Ow61o9YYQCWUqeNqAIzheCPuAebRTYmWItbuUq+kTOoU4A
         Or4ykI4QHR2Ndh7V5So03L4oy4NIl/aExoNm3YnoL5GDQ1NPcGF5pOgw2NlrXwYGLMHD
         sSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pkIGaavul49tXOt2X27ShaCcNNX6Dbj/+fu1uukU7iA=;
        b=M5TgeoVDA8c/WWu43WeMWPr5Jyp77q9lhKNjX7MXL2UMXSlYGOSJ0OxkvtA2KiQuvF
         VqrMxy0r+0CYdSMnteEb8nCmPVcaJpV8iv9ynChe3/qlWcGj05G3YZllf3b1xXE89/OJ
         ESyre5Pe9OQbZ3pUH1TPgmPbnS1foOcfvQjiLc2Cl3GthxyQY0kcGDi+BmBcBdYVOLhe
         G4ylARDdsLJShwVPPR6yT5mMBQsVUitQOulCPTKrrxo7iA7EL0OjUC3dSSWs+QjU49xR
         BDZQNL3cUWqTDUsZClgPlR3yEKUBQRhQb/+/0LmtLwtt91Djtt/wRxX1diPMY5+4IE9J
         PhNw==
X-Gm-Message-State: AOAM530rdDfD8IHJxMUGsAdQqCt+fCawZ8t1PRpvVqcAcb/+Bax6LNZY
	VbykqqR4P1lYzRv6+9Q0INA=
X-Google-Smtp-Source: ABdhPJyzjqsj2ReHqr4WvY6IX4AcRVmkPyOncBz7wb2MR3LT73UUJ0wp0ENvCBRE/p9YY7CA29qb1A==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr16315766wmd.130.1616420240651;
        Mon, 22 Mar 2021 06:37:20 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:20 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 12/19] Staging: rtl8723bs: remove useless structs in rtw_wifi_regd.h
Date: Mon, 22 Mar 2021 14:37:10 +0100
Message-Id: <20210322133717.17797-13-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/rtw_wifi_regd.h:

	struct country_code_to_enum_rd

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_wifi_regd.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
index f798b0c744a4..66bf3d1b1d5a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
@@ -8,11 +8,6 @@
 #ifndef __RTW_WIFI_REGD_H__
 #define __RTW_WIFI_REGD_H__
 
-struct country_code_to_enum_rd {
-	u16 countrycode;
-	const char *iso_name;
-};
-
 enum country_code_type_t {
 	COUNTRY_CODE_USER = 0,
 
-- 
2.30.2

