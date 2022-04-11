Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF2E1FA0;
	Mon, 11 Apr 2022 21:25:18 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id r25so4437185qtp.8;
        Mon, 11 Apr 2022 14:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=sEEO1a9gpg66HFf13zmhoKxUPpsxt/WYjEBH7Mta+38=;
        b=fUqMBkoKzef3RisQA1sUZojBghR4Vv1ytVm3k7JG8Xk1pRApJTqIcviBhfUKzadIwH
         SSvyJ3u4de/OQ96L15TYxpf5ictDfgiLTTXmvsiamW1eVgISuP/C4Ypwu/yJB3v3GXz1
         hlh3LonXPcIBsg9oVjvgcmUTYqOMMIrC1xGw2KOhYxGjIXq92mwktFtxSms2Rfwrah8D
         vWPsNxxYN+d104ogLLvOMh7IowdB/qKPsrNOlGQbP/Hwct4dHgLvowJfg6hM5elnPNMY
         N0iddWazs/3sQNSNRSme9eByZh25T1oWOfLAGuaBAP8Uxzytux0nHpe6E2ChV/AAI/+G
         jDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=sEEO1a9gpg66HFf13zmhoKxUPpsxt/WYjEBH7Mta+38=;
        b=SqngBOOWpwTb6s91w4KfvDtCUwS+QCEjuxl7wo/4v98PYz1C/O+lODoTYsvLsMj1+i
         5dThh8x7V/WugWhOpOz2DiV1sCcfP3fcVsr6AsQafWkRQOOvTY7b8k2II7BOkNuYjpgQ
         OnImD3oBe6c740hHd+B46boyGvwXXjxS7m8vNAqI6Nq6fUgPiLx9kWRWIpOQEGC5GIsE
         tNeHPRlylUZWozldpCc6jeMPf18Sq/h5XRvwlnZnTcwAeYGtS5dpbsf7ziytW1SHxJEE
         GE4Z+7kwtTMJ4AWpD/16LRSZEQxSOsHOeId1w0rZZGeipGGIwua2b849XbKHvuXonOE7
         QKcQ==
X-Gm-Message-State: AOAM531eNw8mOvPXecbWkeCjE4BrWKRqal4EQUVd9Lx6vu8o0T1CItvz
	bTM3YhrEqhexxKA4yUri7mE=
X-Google-Smtp-Source: ABdhPJxoaAOAT3J6wBlu9H4yGWw6bUYYlgQ+wLghgi86o+hmgv6kpZAYytWEwUVB+aUW18LO9op+ng==
X-Received: by 2002:ac8:7f01:0:b0:2e1:e86f:fd59 with SMTP id f1-20020ac87f01000000b002e1e86ffd59mr1083297qtk.448.1649712317458;
        Mon, 11 Apr 2022 14:25:17 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id o66-20020a375a45000000b0069be238e5e3sm6853883qkb.48.2022.04.11.14.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 14:25:16 -0700 (PDT)
Date: Mon, 11 Apr 2022 17:25:12 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	Jaehee Park <jhpark1013@gmail.com>
Subject: [PATCH 1/2] staging: greybus: correct typo in comment 'Atleast' to
 'At least'
Message-ID: <20220411212512.GA2797956@jaehee-ThinkPad-X1-Extreme>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct spelling typo.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index bbf3ba744fc4..45afa208d004 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
 static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
 {
 	/*
-	 * Atleast for ES2 we have to meet the delay requirement between
+	 * At least for ES2 we have to meet the delay requirement between
 	 * unipro switch and AP bridge init, depending on whether bridge is in
 	 * OFF state or standby state.
 	 *
-- 
2.25.1

