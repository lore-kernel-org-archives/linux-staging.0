Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CA9291E
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL7z/kA8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bf55a81eeaso14031625ad.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 05:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697977336; x=1698582136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytqp4yNQw6UYpoau4Yu6tPgcTfKhaPGEv4GOXMbKcHo=;
        b=iL7z/kA8c9y/YptktECgWudGL0d9ghXenFOEipdZxyDfW95UK7t2BqgQYi5W2R40p0
         Q2EVdC4XsATSfxvWezzStMsG0sXnOwXw77fGHrZK7N1YejSbsPNzuYLQbes0ltSHAksc
         VLBoRXw4jS5jVFrhApK2gqB0B0uKPQDz5MHOxFzW2gv2H7M+FPDxlK1HfIN5KVYArmt3
         LsdOpxYHU/5/X8OOBg6rU/HXBZD6qyyNwgxvKZA3Vtp/EY3QtM8uEsqgN9/Kk0+qy1Ht
         Q7/LpdONKNcWbsSm8Y2nsV3pDhE7ClYp1gKk7svWpSqUJlHl22iIJ5YEliTF++YPhLtL
         QpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697977336; x=1698582136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ytqp4yNQw6UYpoau4Yu6tPgcTfKhaPGEv4GOXMbKcHo=;
        b=LsLZkx6NdreGLm71hgSqZUMYED6CcX39kbVy+2ufBf6ekn+BJQdwJir1hgw9xsOjNR
         1oepCprPydiP5Wt490srpolSMSaJUrNACeFc8HWsKZfJmyR9MfwiEQ14U3U88QJ8KbuT
         0ifhH6fzC3eBARaxjTQtAtMLyVn2cubgyFMtJ+IIsS0yAct33cK/hHcCNTzQgKGdOnPF
         t0Swx3IOwW/rDeCoAn/FPe+hF3zZ8d/Z9Cl+kl0pejsm4pXDYqRbGn24cgEmfk9zlFvm
         NFcok4paUCiNsf4BSMxyAbpERAQGeor47brLWahBUJG3Ttio30II81RxwtqlsPKDJKsY
         Riqg==
X-Gm-Message-State: AOJu0YxjbYEZBlJuuGPvY/XQK2WzAHVfmq/YO6DHR+UD1oICstlZalmR
	B8aGkuFyGNX9s6jz45N/8MgGYrfXjYE=
X-Google-Smtp-Source: AGHT+IF1FBY7sLm9rNomTWAVxhv2/l5Ypb5rjdG1xEhEaWJX2DT9XfTahzDniulHJdMPesFNNO62Kg==
X-Received: by 2002:a17:902:c948:b0:1c9:e0f9:a676 with SMTP id i8-20020a170902c94800b001c9e0f9a676mr5156866pla.6.1697977336197;
        Sun, 22 Oct 2023 05:22:16 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id m15-20020a170902db0f00b001bbb8d5166bsm4341897plx.123.2023.10.22.05.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:22:15 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:22:11 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH v2 3/3] staging: greybus: bootrom: fixed prefer using ftrace
 warning
Message-ID: <39be7bb04ce1362b00aa31a638ebe2e88dd81fec.1697976302.git.nandhakumar.singaram@gmail.com>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697976302.git.nandhakumar.singaram@gmail.com>

Adhere to linux coding style. Reported by checkpatch.pl:
WARNING: Unnecessary ftrace-like logging - prefer using ftrace

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index a8efb86de140..79581457c4af 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -491,8 +491,6 @@ static void gb_bootrom_disconnect(struct gb_bundle *bundle)
 {
 	struct gb_bootrom *bootrom = greybus_get_drvdata(bundle);
 
-	dev_dbg(&bundle->dev, "%s\n", __func__);
-
 	gb_connection_disable(bootrom->connection);
 
 	/* Disable timeouts */
-- 
2.25.1

