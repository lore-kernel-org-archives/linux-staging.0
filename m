Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDAE1843
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 22:18:42 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id v66so20376371oib.3
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 15:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BwvFqRaw7/r31nlcL9DNcUXufOMLxk6prSBHpW93H5Q=;
        b=jNc9CU9UeoxHPfaoqHA4vz+jPpf6dXwvFB9lYhkodQpraa3a/2lAdJiPDodG7S/Ls1
         3+a+rWG32LsATfLlIKmM6Jf/r8BnVmy6+PW+McQy7Yu9gk/f3PUZKUYQIZNoG/UQSPAq
         gyVUW6V7wNgjwLQQ4vUYvFGtXMrZBbWOGtp26clpY4FX7qfA7298KlrvPDwrERe5y2XM
         halg/UdntPdWzHFrFQ4zXfYlFbIk9L1Ryb7AkZMeSpPwl1/smplwgh8bZhGmitY4udzU
         K2VfzEMfv4meE+XskWCpLLMpNcCatVRL7RUl7EBs+rHphCLb8CvaQRyPnDTy7EDLZhaM
         nyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BwvFqRaw7/r31nlcL9DNcUXufOMLxk6prSBHpW93H5Q=;
        b=oeYLLC+Cg5RXjOm38HJVLCRpn3qTohch6w13f8n4OIVoj9WbkNd2aR3ws/FLFYqzUr
         gMDKKIJY1aN6lUcng5tW7Ti1xieZXYWASHqI4cJppdEsvqhOg8MuRb+wUpNY3kbZ8zyB
         VMsFhqyptHBgd6XC/FAmo/lS9KpTvk+W3LLJiFYo/+gUEgxXZfIG4W4s/Ue41ycZQcMP
         +iBG0+YSxQmIadeypmtqR/JGikmNypi5K9wemGu6/oeXKNY1ufR/qzfcnd/dgi/UKBLW
         TZ9AcG6nFjoNM4VJOYDN7BDlmLlttHUYYl5+Ot6gXb8UDHCVsFZqxBGVVIQZwFguvL8r
         QKKQ==
X-Gm-Message-State: AOAM5307iRN+X8yu6Mwew/uw4q095DC6He2qcvhfw0rfra0H9oWnG8G+
	9zi2KagVKZnXdaX/YbQ8VLj6iUt6Csw=
X-Google-Smtp-Source: ABdhPJxugFpWlbrLMnohwSEDLTAViWqjB+7KQrp3qJpAsRmic64cD+V2heGtaSZX/oIA5AxMQRJLHQ==
X-Received: by 2002:a05:6808:188d:b0:326:bd47:687c with SMTP id bi13-20020a056808188d00b00326bd47687cmr9292697oib.25.1652739521625;
        Mon, 16 May 2022 15:18:41 -0700 (PDT)
Received: from localhost.localdomain ([191.84.230.150])
        by smtp.gmail.com with ESMTPSA id t22-20020a056871055600b000e686d1389csm5721349oal.54.2022.05.16.15.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 15:18:41 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	ojaswin98@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH] staging: vc04_services: remove unused macro
Date: Mon, 16 May 2022 19:17:41 -0300
Message-Id: <20220516221741.1015814-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BITSET_CLR is not used. Remove the define.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 82b7bd7b54b2..1ddc661642a9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -79,7 +79,6 @@
 #define BITSET_BIT(b)         (1 << (b & 31))
 #define BITSET_IS_SET(bs, b)  (bs[BITSET_WORD(b)] & BITSET_BIT(b))
 #define BITSET_SET(bs, b)     (bs[BITSET_WORD(b)] |= BITSET_BIT(b))
-#define BITSET_CLR(bs, b)     (bs[BITSET_WORD(b)] &= ~BITSET_BIT(b))
 
 enum {
 	DEBUG_ENTRIES,
-- 
2.36.1

