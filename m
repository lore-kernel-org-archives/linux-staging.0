Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A251FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:52:46 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52218903f41so801700a12.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617164; x=1691221964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1szKMdZwkmMXHdwn2jyX7UsMVVQqZQ9qEgjK+BqxWBI=;
        b=eS69vhUXOsdSXZwFmG35XILBdgDz0M7uz/0odSm3CtIssI6jH9sFoq8XsReS3Md9UV
         kmHgRTzVXFNjo8Pl6fuPxeQzQzlcIn5/DON8uHqJPdkgSqv2LEt9fonzC5McB8344+le
         M+fHRGkI0NDH25AtvMNlbRUm4t+F7ZHPVjFKIR3lZ5BH5sAUG5KuTQBdj/qySxGP0Zm9
         hENzd7vCcKa7nCol/WYeWfKvKXntzvpCpMc3U5wcz12OE+laCDH/Y/EBWFZw2lhHtNLU
         nTVRK5OtBcPIfbuSbAGHJ7xBz1PKdLy2ZzSYuisGmDhiahHzkFt1q8+MofjAuspcUDVO
         bG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617164; x=1691221964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1szKMdZwkmMXHdwn2jyX7UsMVVQqZQ9qEgjK+BqxWBI=;
        b=OOq8paV1mQxS0u+ywds6uLwTBkPGPA3+y0yyFGuYCo65Cgaq/6QCGuREfGSQqBDNNe
         STIiKUP52YCPc/u2Mnr6Z2/+X3ckylmoNQaAkjyGmIxAe8KhSvqYNYfCvz6oJOWgVeFY
         coWaVOKhIWYz5wej5BB5j/TvCeYEdTGiK8tsfJdim6/wjxejkdAxeeOZ21lfPTCX6rCB
         cdqPVMam0koCcOeYcBi/UwOjVg8LEDEKVnkZVhjUKOiQVuVYvZAqm7Z8OCWE82PmGvr5
         cO89ktvsP1IpVRlMFKQLpqYBOMFNHa4WCYlTRNI/jAB2jbLhQifcPurbqK6xUt4Zgu2P
         YdDA==
X-Gm-Message-State: ABy/qLaHqwPsWKc8eh4HThBOE+CqnYvo9sx+ATpeu2PgRJYpjAgZvdS1
	9IM3hnPGRJTYxsuJXrWYtbxtzohKGS4=
X-Google-Smtp-Source: APBJJlHFgqfYGjEPpuk8F4KBojbefOXxDsu5/wnHBcsSPQsaf8kti6nZ1y7poN8nypQESxruJo0tRw==
X-Received: by 2002:a05:6402:2708:b0:521:f2a7:d57a with SMTP id y8-20020a056402270800b00521f2a7d57amr1369926edd.2.1690617164037;
        Sat, 29 Jul 2023 00:52:44 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm2964854ejw.160.2023.07.29.00.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:52:43 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:52:41 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] staging: rtl8192e: Remove unused variable intb in
 _rtl92e_irq()
Message-ID: <df6efb730ba4119f00b5bcc0d760c9b1fd245235.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Remove unused variable intb in _rtl92e_irq().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index cfad170008c6..50eb8f3494ec 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1973,9 +1973,6 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	unsigned long flags;
 	u32 inta;
-	u32 intb;
-
-	intb = 0;
 
 	if (priv->irq_enabled == 0)
 		goto done;
-- 
2.41.0

