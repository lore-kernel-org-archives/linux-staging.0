Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4228825;
	Mon, 20 Mar 2023 23:04:54 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id w9so53073918edc.3;
        Mon, 20 Mar 2023 16:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679353492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=c+NNbwr/+NJQq6R7u+ToUNyv1k1hJDK98hxkI8xpb6Sz8cHGTsBQ1Am/YOXVVijHnK
         n/OZGpTKM9gZD9bgPOe62QJGu7dcQkGOpyKZ2H60WsZadCeGE9vKA4jpFUmBtm3uM0/S
         ukg7FKm8ZZt2dGFVfs6GLO6lFZ89si96Q6vogwbSCBiNa1JPhnsXgk58cWLe6znvtuTJ
         /pXesrDYYcku9sOSU21Dp3+O+1gl81Rm40MB0sOI1mXayrykUCa4E2lOGXZCAZOJgOHq
         u/HutsC3loij572OEhBJFAc5vRlyfrbIn4Yvs0b0unBx4WaXVkluJF2jPju8T214mjlV
         0pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679353492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=CPG22hM+Y8WZ+mxofSOVG81KieR8v7cdPwMjFGOYC6j1FQHmVhUfXtlY5rSj6PCm2+
         WJdtieJEPKVkGVnDkHxoT1A88JhaVk+oSEB7qUyNUIKY/jalTsuVFqs9jEEFLqN7OEHb
         o/+/kbKtUR0lA4lpzkXcS/yv7LTZILDySx+ND6SefFt6L84FqFAhWeWkOlKBVzWaJVca
         7xMyGwyGOCP9QvMjSNf+ZHgpQDXArOlmExIUQt/0tZNUUGSthDOfkXMPa66K03Arw0bx
         oE1Mk6Lha3cQRWNxxgZbVHzV0YOFM4h6v9jtnzHMknbJdzD+B9274479rcFVZoOjz532
         1lGQ==
X-Gm-Message-State: AO0yUKV3Txsf8p1t+K0FNgahSTr5rVwQqy482IMwLX5T+o/lbDBM9E0F
	PPaOuBGSqQ/kkMvSZuXcHVk=
X-Google-Smtp-Source: AK7set+wgkZkpddvtjrwRkWTzSXRdr48NS7qmGH/+RLgQhNolVcXMwNfqT7C+AR6iDCzQz0vkD9e8Q==
X-Received: by 2002:a17:906:594e:b0:8f5:8da0:a482 with SMTP id g14-20020a170906594e00b008f58da0a482mr1279214ejr.25.1679353492536;
        Mon, 20 Mar 2023 16:04:52 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090690c500b0093188e8d478sm4956403ejw.103.2023.03.20.16.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:04:52 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	vireshk@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH 1/3] staging: greybus: remove unnecessary blank line
Date: Tue, 21 Mar 2023 01:04:32 +0200
Message-Id: <4ea07eb91d7065d81799ad684741ace685a38088.1679352669.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
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

