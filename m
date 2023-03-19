Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387EE137C;
	Sun, 19 Mar 2023 11:42:04 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h8so36622856ede.8;
        Sun, 19 Mar 2023 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679226122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=etS4Y9P+MAqZ3qeshJXE0XPH+xaAZBuPj4c71JZtAato2AI3nreH1nf4wnA0tNb+xw
         gVHys/1ORXAAjsH+xlz+Dcspth2rhy9K2CosWWypIh1Y+hdgjATjQHqbNPl1E/dF2gLZ
         aTks6NhBVYWrNEUoDnAfoG+LDzXhEGXOEvOz7aL/pOvDHUZUpFR557fkXs4F2/WTBLXw
         np7hqqyascOpbq+ULLutE58tkJriUC3SR1jFYFDFZD2eWkSKwupDep5tRPUNMeYS2OPv
         f4G5jgXfWyFanrEVYy8TWL5cFsboV5qlxZh6U4pqRMRb6SCqqyJzEJh/5xbgtIo4unHs
         VeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=cRB02htPvqXMiJav2/PMEkvHdh6uBcUj77erVpepqrKu3OF6cbMLaiLXYWExGnaKSp
         j6kWDRUTvms2rl9XgDu6tBm1kOPcJFxMQ5/HS+tiPtltHGZseZfXGIWoAzYBZCuaJUxv
         3FPgZGdTX+Hwm3SeTWUu/9eHq/WEUNrDfkiocNWx/C/LIN4fBtnZb0U5Y2gpy6fK8gdf
         5O+UdNjTzDwZi/XzOeRmhGgiUMKgLOQ9j608DGCvxlOz0V3CR0JtOv0YaPfk/wuplRFp
         jCrOFqfZhy86paFJ0Nxz29ylFWkar7vzGnV1+5Tkc4O+zWTtnoVZZpigeoQtGPQmzLTD
         PA3g==
X-Gm-Message-State: AO0yUKWl5NLC4Rg1Gpk5mm/ezvE2tYFR/Zk0i6ql70lJSUHq9lxTGHkH
	hiRVTMYeD+/gxwbQAhdgx/0=
X-Google-Smtp-Source: AK7set8+73Y1DR8RnHNNwoEuwKsFRyWb+UaHr5kq7a7sMnBvoZ80trvGxqWUKIIEcGTvSQ2sdd3A1Q==
X-Received: by 2002:a17:907:7642:b0:8f3:8bfd:a8e with SMTP id kj2-20020a170907764200b008f38bfd0a8emr5351877ejc.26.1679226122490;
        Sun, 19 Mar 2023 04:42:02 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709063f8700b008eddbd46d7esm3180681ejj.31.2023.03.19.04.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 04:42:02 -0700 (PDT)
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
Subject: [PATCH] staging: greybus: remove unnecessary blank line
Date: Sun, 19 Mar 2023 13:41:55 +0200
Message-Id: <20230319114155.42148-2-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
References: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
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

