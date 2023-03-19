Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BBDE4C2;
	Sun, 19 Mar 2023 13:25:50 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id er8so25460358edb.0;
        Sun, 19 Mar 2023 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679232348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=mNQgmGbT+HVA15+DOSJlLUEnpBIvOyX+j5cvdZStAMH3VF92O9PT06RNqnKRcLovaL
         P30ex7z0Rp9MyvhsrqrkReKNRvyDU8AwDnEANAvLUiQ6kvbh9Uru5Up9soTO/7BSyub8
         Sd58TAIV1/wEw/MjVS5H4ulLp8ToU4GBHkw/APoVrk4OPB9rBU1ml8FlRR1IicVjvqnU
         TIVfbOmEHMt2YTG0rr16Qxh3pVdfbKIs0nVC4oMTf0MSbp0tnoRKdErZji/f+qQ2jf0u
         WXpQJjZ/5ob5O6P+f2bPFt6qcqoEEpnPUkHalWUkXthEOEMawcOA2WqTCGknztflUuhD
         /FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679232348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=agjBHQkCjegvkwCu5ayOwRBLEx/+kRwv4sGNCP4Xp321lS7waKhq+5SPnZSwAS7Me5
         pD3TCIgtosmHVLQ+zGjurksOsyeVatVyaAoHNJunDw26UvVh9rpPpqmLaYs3C0ygNXFU
         725sC65GGXjKQ843Wub8HKhdS6OKVQvK/Z7jdPfiOxY2t2xhxgrB7uIH+eoF/D2VUp3f
         2419rl6TfOCwtOjmzaIWKf8ceHUCe4Fc9Y6KSWfog4v/AvYLJFVwL9C/vIgWLbsKXCuN
         QMxspkAffoUWKsd1aY7PbzAL6w8ILwz9jNXQCv1ClWFq4+4GMZrwXMTWYoUmafCO4wGG
         CBHA==
X-Gm-Message-State: AO0yUKVOFIFPJYLVDimgnXFZm/gwZOXPIyCldPdCOapYU7pIkc2WADBU
	7qzonx+U4KY107hx0Cork5yU5gWa/1A=
X-Google-Smtp-Source: AK7set/2uQPzlmU1OHFq9zDhnY7GnvreG7DHR7u3GAV4giydFft8V9GEoMXX+yqrcLSXhEr6GQVUyw==
X-Received: by 2002:a17:906:2e91:b0:931:7c20:f75a with SMTP id o17-20020a1709062e9100b009317c20f75amr5049951eji.53.1679232348497;
        Sun, 19 Mar 2023 06:25:48 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id by22-20020a170906a2d600b008cecb8f374asm3235200ejb.0.2023.03.19.06.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 06:25:48 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH RESEND] staging: greybus: remove unnecessary blank line
Date: Sun, 19 Mar 2023 15:24:51 +0200
Message-Id: <20230319132452.151877-2-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank line before struct as reported
by checkpatch:

" CHECK: Please don't use multiple blank lines "

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/greybus_authentication.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/greybus_authentication.h b/drivers/staging/greybus/greybus_authentication.h
index 7edc7295b7ab..48b4a9794d3c 100644
--- a/drivers/staging/greybus/greybus_authentication.h
+++ b/drivers/staging/greybus/greybus_authentication.h
@@ -41,7 +41,6 @@
 #define CAP_AUTH_RESULT_CR_NO_KEY	0x03
 #define CAP_AUTH_RESULT_CR_SIG_FAIL	0x04
 
-
 /* IOCTL support */
 struct cap_ioc_get_endpoint_uid {
 	__u8			uid[8];
-- 
2.34.1

