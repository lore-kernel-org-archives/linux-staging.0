Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEF123AD;
	Wed, 22 Mar 2023 10:09:34 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x3so70479812edb.10;
        Wed, 22 Mar 2023 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679479772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yru+/DJoW0l+gdfnZqzMPZHjYgVuqgrRcLKs3lSPmHE=;
        b=M6Mosss+BmvxqIkNxh0I9sIkanHXhjuavvFe9xCQtfjpYhR8vRfnbUIfB1WiWGLor0
         c/+8Fl/ZUbGEUi31LFq6Ju9M/muyfxJUhii3za1e9HG2JZ0NSUuByjdB1tSuPhtGxY8Y
         Nf+RN5G/XyQYWYi4f2/cdUJNdNAApdiYlS/cIOpbKQI9Q9G++5fMHxHGqGiEylQFB8Fk
         ps+IrR54AQBnzTytnt1FqW09dLlpJtXn3+jaLBkUxVqNpoIm6DLoIJJlN16lEszwD0Ue
         epbtZmchK/ZNepS15LuUh/nccrwlGmn/p81tA6SvbT0Z3028m/NtqUrGtWsq5AmZ7Qmc
         2s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679479772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yru+/DJoW0l+gdfnZqzMPZHjYgVuqgrRcLKs3lSPmHE=;
        b=cHCK78WtTg2Mnh7ZBiNVNOOqwLqvkV2suXbg0wRlHRsuj0hhcWJcDv3lpodcsC2ESx
         lKvpo+P1KoKO4nTeSBQ+S7JcO3IFi3BIVYvPoOcSSk4R7rWSz6ha7VMjlXV/Hh8RJMP2
         j+qD11XnCTu/SP08DIII/eclfPTeoBorNxpeXF78lq1IGGcTa9XDNY4fmZD3Gr7miIyz
         7BFaBQyt0tqKCnsBauzjsIkMQHONVB10RZelxgsZqoIBvOvZP4HBe4q9/SzF2Yx9xSWR
         8aAURFcYCyn0KjmAJ37gO8nPKOrceEfUAb/iQk5U4CdQFuPuLqSVDFp2SW1HFI6IKVy9
         ly8A==
X-Gm-Message-State: AO0yUKWlXxjiTQ6SmhHNiRQeoVr5Enu1l/deN566xuyCLcCtBo5lN8hm
	ZOoruxesMOUZkHoU9W/YJ3A=
X-Google-Smtp-Source: AK7set/6uoHR69K90iGRKvBwbgrmpRQ1hfAMzKw4nU5pgrpBEBX/HIBu1pABx8tb83QbDHB/Qtz4nQ==
X-Received: by 2002:a17:906:1853:b0:92f:fc08:bb0a with SMTP id w19-20020a170906185300b0092ffc08bb0amr5888741eje.37.1679479772557;
        Wed, 22 Mar 2023 03:09:32 -0700 (PDT)
Received: from alaa-emad.. ([41.233.203.65])
        by smtp.gmail.com with ESMTPSA id s9-20020a170906454900b008f89953b761sm6954993ejq.3.2023.03.22.03.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 03:09:32 -0700 (PDT)
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
Subject: [PATCH] staging: greybus: remove unnecessary blank line
Date: Wed, 22 Mar 2023 12:09:27 +0200
Message-Id: <20230322100927.28351-1-eng.mennamahmoud.mm@gmail.com>
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
 drivers/staging/greybus/pwm.c                    | 1 -
 2 files changed, 2 deletions(-)

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
diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 3fda172239d2..26d39e08c3b6 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -24,7 +24,6 @@ struct gb_pwm_chip {
 #define pwm_chip_to_gb_pwm_chip(chip) \
 	container_of(chip, struct gb_pwm_chip, chip)
 
-
 static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
 {
 	struct gb_pwm_count_response response;
-- 
2.34.1

