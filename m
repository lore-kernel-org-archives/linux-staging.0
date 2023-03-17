Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0179C5
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 19:13:35 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x3so24188437edb.10
        for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679080414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kU/IS1dtYj57qCBoVq56ZCvXzu4g9U4ZWrc/U3hX9G0=;
        b=hzaM0uxjpk4JIjyY/zbeCSZcL4ShubyS/mTSxEoPcqjdlr6BXMkhdYF8e/4jpOZROk
         sTH7TJCnbsaDutp46WT4/qVwEP42qItLbZtAWQdsSctVM2XeFEII6rOxHh/4bfUdc2yf
         086Kmf4Ag9XKfCBRENmlk9VW8TiSnDZYi2hnmqq42FXXIFnxaLB4tqa3u9sE+h1l2Xfp
         m2fTEnjmQh71MLsPHHQ4zGf9J82gPGgfKyrIAggrn3rmvw7uEocCqx4eLakYuBWN0imG
         loUdJ0iI10L+9OLY4Bdd/RWCd5zQHRJ3Rg2Y9rjRuwC/x+ehH6RbOz15DBw2IjytdMGC
         bmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU/IS1dtYj57qCBoVq56ZCvXzu4g9U4ZWrc/U3hX9G0=;
        b=i5BBPU/hi1FW5RgvT8lftF3oJ1QFQ0SVwQKhdF4tIWygWd5lr4sdm4opCiwO+VW5T9
         zlyW2qi/kRTBWH1UFVSq8YOxunQ6KwGIZG2NrUWwfrExMzFOLJl26W66LlO5c8rj1DlE
         pkVosSWFV4rd6/Pph/H1vm0OXzTttEiueK6BbFcK33X2YW9J5vkW8JTkhyquCREMI+0w
         tN+QhJGDhppecSdF4mhi/8DBHkD40Pw2EoFhl/efF/ldd6ai5dLdr0WitPR51bmcMPUs
         zuonGQ8t5NOw+/2cScsxeWQUbORjGQR9Nfj/I+ztsq6xaG0nJo74OAgyOecMelx5Myv2
         54wQ==
X-Gm-Message-State: AO0yUKWaKMZea52c2n/hWEf7BPUvgsd7gpSgyYAvcgS6FUXj1f61p0ZK
	W1wB2h8dopldwCsXA8p4Z4k=
X-Google-Smtp-Source: AK7set84gc3AqMh/LT9CCrWYUTjFK0pDiBcwpA1kGdOXEbjQlXNm8DWj8wQD2ttrwlTt9MQV2IkTvg==
X-Received: by 2002:a17:906:7394:b0:932:170:e07b with SMTP id f20-20020a170906739400b009320170e07bmr2773690ejl.7.1679080414616;
        Fri, 17 Mar 2023 12:13:34 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id i27-20020a170906251b00b0093128426980sm1294304ejb.48.2023.03.17.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:13:34 -0700 (PDT)
Date: Fri, 17 Mar 2023 20:13:32 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] staging: rtl8192e: Remove unused macro
 queue_delayed_work_rsl and queu..
Message-ID: <4f08897d188c61fc2e611afbf9f2de2ba18cffef.1679077522.git.philipp.g.hortmann@gmail.com>
References: <cover.1679077522.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679077522.git.philipp.g.hortmann@gmail.com>

Remove unused macro queue_delayed_work_rsl and queue_work_rsl.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cb904fc4f574..8965bb605eaa 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -62,10 +62,8 @@
 #define IW_CUSTOM_MAX	256	/* In bytes */
 #endif
 
-#define queue_delayed_work_rsl(x, y, z) queue_delayed_work(x, y, z)
 #define INIT_DELAYED_WORK_RSL(x, y, z) INIT_DELAYED_WORK(x, y)
 
-#define queue_work_rsl(x, y) queue_work(x, y)
 #define INIT_WORK_RSL(x, y, z) INIT_WORK(x, y)
 
 #define container_of_work_rsl(x, y, z) container_of(x, y, z)
-- 
2.39.2

