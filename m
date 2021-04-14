Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8672A6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:09 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id n2so32783022ejy.7
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gsRq4XrCIbEI1Y0MYbckaGY82KlEcKihUFnkf/W4oNw=;
        b=ZbkeJ08q7zC/ZxOElHjCdRmwEFpf1itx0NinXxj4Yo/0c1IvB5WaV7ygdcFet977iR
         +qFlbo/pkGO8DATNKVR1wrIuAZznJHXNqYTGkn1lSiXRv/CLabOHKNITTClNDDFlc5bZ
         ldvlxc/Mhf3uq0QC6iuooGs6tCbowyDu00++p146uK8cZGnY1iDmeHxbTclPVuAP212A
         k2Gowlzbx+wT2Fc4bCmGAJRUEkQ0KzqQtsfkwcAAJo7in4Iapjfd9ki6KiXXsY7srFLw
         UgijUdXAA1E2PKpJlI+2syD6bm+ofsQaNKFg29VJhanVDwNnFQKVJMPUPuDWTWlepCE5
         JxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gsRq4XrCIbEI1Y0MYbckaGY82KlEcKihUFnkf/W4oNw=;
        b=XjGTZ7+xOOm5laExPymsAE3cP/eVfo29LAkD+wX5fHLVr4lkmQMogsjwsZnCCrh0jb
         oo9bqxdjBWC3/AXQjuBN/+Uk7jLD+BbbFKvorhZFubKYhxU4eG9/N5UuiuguHZEedVBa
         L6eWYg6TnlgJbZ7ze8yFHlbcSt54Ujd9zX9lRStMJzGci5eE8QcgQJJTa+d0llFFnMQy
         nb2fIZLQH/pDGcXs/Hi3gEDMLxzgsZIjTCB+d3e3wT6hFNUYO6E99qdd483Hw8ZXLdqP
         ro449IHHmtzrkgHLHjFZiX7+vR8M4J7nzsSkhqOAhWjQGTttaYcyPQmIk/k1UOqWWd+N
         W7Gw==
X-Gm-Message-State: AOAM531527NPOQjbIBNCwSFp+GlFsJakAx6CNwcy8U7Osg5s+KmAOqe1
	nQJqT+FIV69btY6QrB+KyGuYjA==
X-Google-Smtp-Source: ABdhPJxXteaIGyMyGsDbjsvVQnCFGeuHLu4HK7WaS1kHjo2XpkFunpBo/YsvXSB2mX0tfMnor94Ovw==
X-Received: by 2002:a17:907:1c01:: with SMTP id nc1mr132058ejc.283.1618423928040;
        Wed, 14 Apr 2021 11:12:08 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 32/57] staging: rtl8723bs: core: rtw_mlme_ext: 'evt_seq' is only used if CHECK_EVENT_SEQ is set
Date: Wed, 14 Apr 2021 19:11:04 +0100
Message-Id: <20210414181129.1628598-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘mlme_evt_hdl’:
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:6004:5: warning: variable ‘evt_seq’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘issue_probersp’:
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:2543:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d1dbf234e9e02..f708e7b9f8fc8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5980,7 +5980,7 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	u8 evt_seq;
+	u8 __maybe_unused evt_seq;
 	u8 evt_code;
 	u16 evt_sz;
 	uint	*peventbuf;
-- 
2.27.0

