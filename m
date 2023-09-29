Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6CE4123C
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 14:18:37 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c16757987fso143038511fa.3
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695997115; x=1696601915; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8j2Dqke+VIw3sY3uBi50vPFlbJnXICNf1WlSdn5wTHY=;
        b=am1I/XsG4judkIxkIMVF4mRtfNS4pdIlT02btCmsFtaewc31kjgLfSi4un9rS6UDz7
         8FQwH/YrPltKIT9yES9TpJiCD51qluSNxjS8MSJjqKaqQwhf48Bk8we0CRwMiIdOlINw
         542RXheEDCLyQ7w4EECXQOMzpHLtxRYo6N/d3+cdQkmnfrkNd2g3KrbSanNHjYSD5hxV
         LMkmRHmIm1Gw60WFmu0FPxicVaZr8FBma23cnhgc6mexc0pbA69W1nLPKTViBvrN5bEq
         nXG5xuJLqmAoesHVbwGljxbRBTVGVWo/2dCmbpVW/kMzitI2FxyVx/9V/OzhVL24h8Wk
         mMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695997115; x=1696601915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8j2Dqke+VIw3sY3uBi50vPFlbJnXICNf1WlSdn5wTHY=;
        b=gvGFmoNYW+G7aD0Ae6Y/aak0ZvTitKupFFIPavB6EhGzKs9X7FXqHovxgQjk6yak8j
         i6PVhEjEUHM8DfDvtMkGZ8JkgBDQMGxci6dgNfZdw6wBl9k81TR6r5DlkSEXnxp/Cetc
         wmVI0Sd8mhIv2LnLpn1P34qwrGWli2xKpoH/sidZviqo3D1QGuTmZJQuJDUj96TDPf9W
         YEJfmZKTQu0UmLA/2dinNOf7+td+AzulXzIblTvEJDNn7eGc9rGsNS6+dR+H7B0CuqjW
         2mZTiiu9pyz0UFTQoKwRs298KMtAlQozmzkGbDzXDxDp7vJEYNnqnHh0gXvHj4nJqUJS
         nkCQ==
X-Gm-Message-State: AOJu0YypS6EZIX+RSsrs0bGyLBwwGUtbCxeikq6n77aNF1/XqyN77pdE
	kC9Yy/5y3qIraYKr5qsC2uXdCQ==
X-Google-Smtp-Source: AGHT+IEekDnaCyM1jFkUv5e/jr17//76CHNCjve7vjqB/6LansiKHyMlI0JbtqXT4j1Rne7qfOcrKw==
X-Received: by 2002:a2e:b0f9:0:b0:2bd:f8:1b6a with SMTP id h25-20020a2eb0f9000000b002bd00f81b6amr3604555ljl.36.1695997115593;
        Fri, 29 Sep 2023 07:18:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k13-20020a05651c060d00b002b9358f5088sm1481286lje.53.2023.09.29.07.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:18:35 -0700 (PDT)
Date: Fri, 29 Sep 2023 17:18:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	linux-mips@vger.kernel.org, linux-staging@lists.linux.dev,
	Oliver Crumrine <ozlinux@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: next: mips: cavium_octeon_defconfig failed -
 drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status'
 isn't known
Message-ID: <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
References: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>

This is weird.

I managed to reproduce this once but couldn't reproduce it again after
that.  It seems like an intermittent thing to me.

regards,
dan carpenter

