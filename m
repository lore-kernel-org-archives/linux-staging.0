Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16CD291E
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1cQ57+k"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-27d17f5457fso2511579a91.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697971352; x=1698576152; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytqp4yNQw6UYpoau4Yu6tPgcTfKhaPGEv4GOXMbKcHo=;
        b=d1cQ57+ksIgepObe3mYCK8/HlIT46IFFC0QRmCMbBxQMv2YochrPEUrI63JwI41kGO
         pzL281yDAyrVVV9L8xibop4/DUqNF3erZL4C6vhC8lpXgLRiezCzf9v6dWWvij2abY50
         WO0OrRfZ7rzUHOEutTcWRiwAIFZPMidI+JO3uvj0t2W9V6Q8W4IoR5dNOg7ZW5VglDa8
         2aZQXtsNBECIzXJirIhGyMB9PjivrnCZi1ENv1aObekx1QKxxFuqvSn06EoFuwSAIshZ
         6ZKca5vlTkCbIlUl5GsZPxcd39oliogNy4XuPv1irF5FIO+wqoLgGTQfiFd/fIyJ6A0s
         08MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971352; x=1698576152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ytqp4yNQw6UYpoau4Yu6tPgcTfKhaPGEv4GOXMbKcHo=;
        b=ClLPmi2SY5rehPR6txvVVQbjgF/nfbGRLwjdMxrNOMmb3VeCjI3ZHGzFNoogO26ga9
         tuHz5dIsxGyvoEm4eTt89XlKVqvh34Y3Ug33Rqt17dBHvWp/yOe6gyP32DN0jf3fdPkG
         Nc45Fy8TITc6NddEHd0wtCrjPvG+pMumLHdIAVDgC8th6rhQzVkk85YyG9HJY34Ox/ED
         JEiFSDkTIMJItsXRsiGqx5y+G625KhyxgkOjlxrbQGMwR5iRbLeLC/Hibrd7CS2GjHOv
         kxTf7NRESfO/6H5L2mUs+iW7Yz1SiTPsNwgqscaqW328gAgU4dg+UQMF9Ks0E3ST4ClN
         sIKQ==
X-Gm-Message-State: AOJu0YxcyB0RWpSCavxQu0nSkiagMeEYuBnQF0wn9orYKnEn0/rPoAQZ
	sTy8pD/8TRsZRw5L8zKUHbI=
X-Google-Smtp-Source: AGHT+IHrw4gIaCM3FljDQJo9ciCCj4OiFXfzKFtUS0ANYKs8SoGdtBOJTU/EcVAiD+emNOG7IHMhMg==
X-Received: by 2002:a17:90a:ab82:b0:27d:886:e2d2 with SMTP id n2-20020a17090aab8200b0027d0886e2d2mr14005323pjq.7.1697971352250;
        Sun, 22 Oct 2023 03:42:32 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b001a80ad9c599sm4269872plt.294.2023.10.22.03.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:42:32 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:42:26 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH 3/3] staging: greybus: fixed prefer using ftrace warning
Message-ID: <cade10d4b94127900a015e0b2ab94da5dd8c2c63.1697969950.git.nandhakumar.singaram@gmail.com>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697969950.git.nandhakumar.singaram@gmail.com>

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

