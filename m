Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F497C
	for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 13:02:30 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id k4so5175696plk.7
        for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p8rAqTMQ2XWjal/ekmPzbpXL4sv2yzkmbXk/WYInG0Q=;
        b=J6Aeym90Qy7VvagYHJbWEoIg+d2WadfzFnKyUGz0cxZRSxhvpDAkZjUZ7Tz0RdjTe+
         V2gHk2sQmmEJJc6KSe7SXmlQ5yjByo+Ts95qXsXhYzFwvBt4L/vPOdjb5LVKnLmcfK5x
         HcfNqM+4BTydL8FplyHJQfRopqpOr8xicBNxYtC/V3YBnrBA9zBDKPw3EDY8ePH2CJlP
         JFyZ3SNEJH338tHvdh21LKXbLDAim5DyDlcO8upRXgOiJa9wwhXLx8yy/5T9IbQFfoC7
         nyE+L/9mAm8uodApvvqHxti+ZLS3wXdXJEWp8sSCJlqVINKpYgI8fTvMFRNZCU2ftZVc
         m2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p8rAqTMQ2XWjal/ekmPzbpXL4sv2yzkmbXk/WYInG0Q=;
        b=RsEJET7oggQMzj2Us/6OxXQvxzn32R1aq1U9rlk2wGj7kY9s/T3NY5v/oeGz1OOi2d
         1EmP1Cfr8bad7AVawViDQdz2lU9bH4nXX65l3c8Ih17kCL/z1mQQeANoDMzn+3iw5A0e
         jpKSuBQKjLjXZul3fSYTPukRGx3Aa5kqLj+52Jn4oAoajSrQmsWFIVJuWxwaFCLFGAWD
         CKyEfGPEY8iMNUseiR1qfRbt3rzQWV29pJqhoS9nsw8wJ4HgS5SLMpptvllIM7sDZdF1
         XQihhHxNyuS4BneoC81yygWN0U6NrxN2nnRVZU7yY5c6yqOw0WcdRkbiphQ/TLsl+21o
         cRvw==
X-Gm-Message-State: AOAM533a2C8c3Kd+pIJgy4TMIdMvfWgnno1c8TXaf/oUp4sHKNmK694U
	1wNcM56UYwci/gHwX6XBOmY=
X-Google-Smtp-Source: ABdhPJwAIIyfCLGQZTmPZl143X0zqHT/wc9wmMavCCX3LYvhAQteaMrULWE7fGph3+AgK9ezAIRCdA==
X-Received: by 2002:a17:90b:3c51:b0:1d6:aabd:6a3b with SMTP id pm17-20020a17090b3c5100b001d6aabd6a3bmr10729005pjb.241.1650718950431;
        Sat, 23 Apr 2022 06:02:30 -0700 (PDT)
Received: from localhost.localdomain ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id c139-20020a624e91000000b005060cdff4ffsm5808994pfb.129.2022.04.23.06.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:02:30 -0700 (PDT)
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 7/7] staging: rtl8192e: Remove u16 cast for u16 return value
Date: Sat, 23 Apr 2022 21:01:50 +0800
Message-Id: <20220423130150.161903-8-wjsota@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220423130150.161903-1-wjsota@gmail.com>
References: <20220423130150.161903-1-wjsota@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove explicit u16 cast of the function Mk16 return value.
The variable hi does not need to be casted explicitly to u16 as it will
already be casted implicitly.

Signed-off-by: Solomon Tan <wjsota@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
index a305b79c53e7..8bc95651e384 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
@@ -136,7 +136,7 @@ static inline u16 Hi16(u32 val)
 
 static inline u16 Mk16(u8 hi, u8 lo)
 {
-	return lo | (((u16)hi) << 8);
+	return lo | (hi << 8);
 }
 
 
-- 
2.36.0

