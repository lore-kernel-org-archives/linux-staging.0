Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58628138A;
	Mon, 11 Apr 2022 11:03:41 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 125so13840140pgc.11;
        Mon, 11 Apr 2022 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=reKHQOWkpZ4mONWwfy4XZo/3CgCm4MkPhbk06++JasU=;
        b=XjCV4fhb8VG5yocBSZPGpyPicaHPWTu/4aMuE75lNuuv7IYMd9UnQGO5E330Omud85
         ywh6LyxqN7qOJlXtk6GacuEe1GGKVwdiT3+yxRmyxrMI/0GzNo3MyYH1tZoDlM8IAxah
         Dcwq3zJwDwKmyKtC3iPW3T5HdOHBZcpLtmTWwS5RPbpSvM/q57YgsnK5DKDwlE6CJLQD
         pKhu3Im22+6X9bKqUqCOspCguy5nEW9/B+TectQPkAL3dOk4wbaKa40LgHO41sVA6Vnq
         fAQ/+sUkNGpHbTc7lzSCgBJOl70THd4MGXVrftNTupyARYJE0NidTjr9b8ulGWKEnfvJ
         D6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reKHQOWkpZ4mONWwfy4XZo/3CgCm4MkPhbk06++JasU=;
        b=hdEltWaWlajRYSxvTkC7K9zB2IjKBpRLx43hQt06+FhoBp0oXgGMQtOBGFfGIIVIbX
         wM2EYw+/CrwMVMxj2Wc8WKqbEDLt46tkeBl5ai864tJskzqQXWpc7sP5DmHmRSRVQWe6
         qpAZW29Rp5ylwfzAJW6pAcZ0n7K8MTDrAe8pp/58TTrxfTdAB3ItBi/cZa7n2rU0DTgd
         hy2U+QJ/bMQ3tYAQ0YI7pjqKQ+rBBT/bK2TeB3akhXnS4YQ8Wk49nvRciGaik4fcoVCh
         HI3pslY8Jcc0Ub33ppJPBasavMQIOgsiHUAhr9x/7QJTASV0P9IHx4ZbQrE6RIpgZ3QR
         a0zg==
X-Gm-Message-State: AOAM530+803mpnLJPve2aiVWJAdjVzKMbuc5cX2CynzrdgVpwrDlWFgy
	1DLUngdetKIZtSbXTcjzCEFUDxMRam35Mg==
X-Google-Smtp-Source: ABdhPJwkW85fd1XVINQPV/OsVxF0/xy4t66aUDt+a7gy/6j383rbovcOLOpKLaj/kLDdDEnMrYk+rw==
X-Received: by 2002:a05:6a00:21c2:b0:4fe:81f:46c7 with SMTP id t2-20020a056a0021c200b004fe081f46c7mr31764907pfj.5.1649675020264;
        Mon, 11 Apr 2022 04:03:40 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id f16-20020a056a00229000b004fabe756ba6sm38219673pfe.54.2022.04.11.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 04:03:39 -0700 (PDT)
From: aliya-rahmani <aliyarahmani786@gmail.com>
To: outreachy@lists.linux.dev
Cc: gegkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v2] staging: rtl8712: efuse: code style - avoid macro argument precedence issues
Date: Mon, 11 Apr 2022 16:32:50 +0530
Message-Id: <20220411110250.51959-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2204110845280.3197@hadrien>
References: <alpine.DEB.2.22.394.2204110845280.3197@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aliya Rahmani <aliyarahmani786@gmail.com>

Added parentheses in 'offset' and 'word_en' to avoid macro argument
precedence issues.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_efuse.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.h b/drivers/staging/rtl8712/rtl8712_efuse.h
index 4969d307e978..2e1ea9d7a295 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.h
+++ b/drivers/staging/rtl8712/rtl8712_efuse.h
@@ -15,8 +15,8 @@
 
 #define GET_EFUSE_OFFSET(header)	((header & 0xF0) >> 4)
 #define GET_EFUSE_WORD_EN(header)	(header & 0x0F)
-#define MAKE_EFUSE_HEADER(offset, word_en)	(((offset & 0x0F) << 4) | \
-						(word_en & 0x0F))
+#define MAKE_EFUSE_HEADER(offset, word_en)	((((offset) & 0x0F) << 4) | \
+						((word_en) & 0x0F))
 /*--------------------------------------------------------------------------*/
 struct PGPKT_STRUCT {
 	u8 offset;
-- 
2.25.1

