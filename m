Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A44A54
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 10:51:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id bi13-20020a05600c3d8d00b0038c2c33d8f3so1534827wmb.4
        for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 03:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fW7h21v3Ivjw1G7/perEqnpmWeToQrSlBMPA8HUbBbg=;
        b=YlFDV8YLOUfJUtA/tnmM25PrK7KOpQHQY2lGFJMNk+l+60xoMCycTAuuHx3S9rIHY7
         nMwNl0FokoOoLTGslZoRXBrjdkltAkXoRTeoOagHgnu0ekn2QfjMOMPRSayMUNea2EHD
         PmbxEJz151Z3iqzvcOP+m6CfWfPU2GVHs6/nvtZQw1zlhgKRTSQf0FwmL5SEK4230H5M
         FjzrbBFkViZarSr6H04LfdhpuLzB7XeLqa97LQoe8iVIuk8hH4bFnfZh6ZPs183AtsoC
         mBE6YFlJ5Yai3Xtb6WuuGKZymUnl/uFszmdEWzYyGwJg/0qGITDBcqQ2sieCAFQZcHyV
         GFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fW7h21v3Ivjw1G7/perEqnpmWeToQrSlBMPA8HUbBbg=;
        b=SaeV8BDsO9dmr3Vn5JIgUvZ5mlXMdfhhSC/Geoo+ef9dil29sBRDpOGvsnddoK9Ds5
         hQJRXCMT5ldaAiMpYkeLQfd5AcsqDe2RqU5dDb40w47JfVVbCHTWa78d2XuBm5GZVlpa
         8l0mNm6EUAp31aqo10LvcCzS4j4SJFfAR1vdwnZOmHNqE9/2VWtQnLcsSWKk47LQtigj
         eU1nb0daDLYmlduL42SqBDPzo2MgBHMXaidxpvgweUQsRm3/pgPGdO3zP2KmByMNgjhY
         l3iqoU1tQPNm8VCL9pb/sQGcLD8nWMHmdLP+Z49ko5BDvk/1sMAQzOqgVd0/A2Kw9Xtm
         TXvQ==
X-Gm-Message-State: AOAM532pCUAkfn5hZKyj7mpRihESaPUXaPW9Itg40u+WImkayayd0DBM
	+RTHdREi9QaKc9bdCt8+eJs=
X-Google-Smtp-Source: ABdhPJxFEtSvxdd+B1CGdwG6gjVZbwxFsjrRBm3mgCGTlktWdC2/h9/QjppSlG72zku9Vpj1ck7x5Q==
X-Received: by 2002:a5d:5886:0:b0:204:85e:5a3a with SMTP id n6-20020a5d5886000000b00204085e5a3amr9875996wrf.434.1647946264431;
        Tue, 22 Mar 2022 03:51:04 -0700 (PDT)
Received: from leap.localnet (host-79-37-100-169.retail.telecomitalia.it. [79.37.100.169])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c4f4900b00389e8184edcsm1617116wmq.35.2022.03.22.03.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 03:51:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Sathish Kumar <skumark1902@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8712: Fix CamelCase warnings
Date: Tue, 22 Mar 2022 11:51:01 +0100
Message-ID: <2364205.jE0xQCEvom@leap>
In-Reply-To: <1786742.atdPhlSkOF@leap>
References: <20220318101440.13887-1-skumark1902@gmail.com> <3a85ae64-00c1-6483-f1d7-c12abdd3ff3a@gmail.com> <1786742.atdPhlSkOF@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On marted=C3=AC 22 marzo 2022 11:42:21 CET Fabio M. De Francesco wrote:

> The reason why this pattern does not work as expected is too long to be
> explained here. However, I think that Greg is suggesting to you to resear=
ch
> and use what are called "Condition variables".

Sorry, "Condition" -> "Completion".

=46abio


