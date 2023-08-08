Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002D17744
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 11:30:02 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31771bb4869so5772597f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 04:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691580601; x=1692185401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBceCfVub0Uw5B1q4o8BqQH40Gf5UUlogeBvGLCs9CI=;
        b=Jp0HDERCDp6Y7stD/+Wp+4h/t4pnKdXZkT+bbeVlfbc+53JEeT4k+tlrWiOcr107/w
         LLBldfh43PJT24sxxe59hatSkhx63DidnDIzYE0d7b4N+5PIS7NMpX4uyI1B8ffSbMuV
         fpg9ucX1voAEEueFwsgY24ifl0fuebX4sX80xrIqxR6jCNmm+drDl/uKGhlN5H1Y6MQz
         wRqo9IJ4fM0e6J3QQogjo/mkMF2pEjmCGXF/C2XBRV2s+1Lf2/SmT2RQ1jf4XZVmD6Au
         3ObSHHXyFmY1Qr1irIxK+MsE+2RKTtSGrV/ALsF7NcuzFlJqC/uOCJWxhw8OKVhrRoKO
         VH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691580601; x=1692185401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBceCfVub0Uw5B1q4o8BqQH40Gf5UUlogeBvGLCs9CI=;
        b=Yb2i6puqpmaFq15iRG0rc670ZAQILp24aif+K3WnT+DoEUvOL+EfNkEIq2LkYXvajz
         SkjhhIBSTUc8pAXDm89ailVhRRs4zjDIJ46hN3kz1kxzhscpj/qae2lUaiaqY62hGQtV
         lmIaoXsL77/suTqF/CwrdCjHNa+zm7nFTiIONunm2pbnuex0fscyCKWziH067rC4BAHy
         ZOUf0+5Xliikq+9+lFdRpBjZ+qT7OjMywhWdlfTlR5T3S8YrmhwF5LHncsvlZfc2vFMB
         Lp1X+H0CfN8AK+DH90s0ZuKOsLB0BxgyLqMIawOG2KCmDO0dur7EqBusrMdvB+QhkQ/j
         j/Xg==
X-Gm-Message-State: AOJu0Yxc4LdUfaBRqH09QhXMB5Kkxzv1YO4fyDtuAsgU2qMy/0FlSzBq
	vYLpWIFAR7t7QeU+JY7k7oY=
X-Google-Smtp-Source: AGHT+IGNPr4Z9DZZAoaGnQzPNQfwyQm2wCYHvJF1i7mW0tIAj2rOF1Jx7++Gjp7KSdYLVA4awIg2qA==
X-Received: by 2002:a5d:4d0c:0:b0:317:51da:83b9 with SMTP id z12-20020a5d4d0c000000b0031751da83b9mr1454840wrt.49.1691580600814;
        Wed, 09 Aug 2023 04:30:00 -0700 (PDT)
Received: from archdev (pa5-84-91-151-142.netvisao.pt. [84.91.151.142])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d5246000000b00317f70240afsm5456092wrc.27.2023.08.09.04.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:30:00 -0700 (PDT)
Received: by archdev (Postfix, from userid 0)
	id D0BAC1A3960; Wed,  9 Aug 2023 00:25:13 +0100 (WEST)
From: Diogo Silva <diogompaissilva@gmail.com>
To: dan.carpenter@linaro.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	diogompaissilva@gmail.com
Subject: Re: [PATCH] staging: wlan-ng: cfg80211.c: removed unnecessary parenthesis to match coding style
Date: Wed,  9 Aug 2023 00:24:48 +0100
Message-ID: <20230808232456.3402-1-diogompaissilva@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <dan.carpenter@linaro.org>
References: <dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for the help. I did not realize it was a re-submit. I tried to look for anything similiar but since I did not find (my fault) I thought the bot had assumed it was a re-submit because of the empty message body. I will try to find something else to work on!

Also, thanks for the resources (lore.kernel.org and the v2 patch instructions).

Best regards,
Diogo Silva
 
