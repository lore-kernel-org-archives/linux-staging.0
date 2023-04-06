Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851543214
	for <linux-staging@lists.linux.dev>; Thu,  6 Apr 2023 12:12:20 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id u8so20446379ilb.2
        for <linux-staging@lists.linux.dev>; Thu, 06 Apr 2023 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1680783139; x=1683375139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hiCBgdIy8eq03QW0G9vGas2n0jUS6qAuhUQkgRBSPcQ=;
        b=NwMNqjFo8wThsLoZnDszHEnFswnjMOJJDEW3C54H8Ov6w67W4Zhl01fE+6JYjZmDm/
         xtSEYMk4b8xGQuCxCAf9rX4nV9ba38zCSL8205DjHnRikKbhpAh0tEVjOmszWsUO3fWf
         xP7huhTdNrrad2FMCqtLrE6Ui5JpB5+vBL2dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783139; x=1683375139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiCBgdIy8eq03QW0G9vGas2n0jUS6qAuhUQkgRBSPcQ=;
        b=f+Nj1IwbzycBY9zxZWajab6DCt4BcJRg6GWMPdaf5x3ua9zaT84OJxRXnKwb5ZRaoS
         CJIVL45z0jzgzlB+ZOMV9dIOS1UJL14VPnlho7kTNrKbazofS2kf9FbPOfNwNPmHNXWv
         kg4uxt3Cv5HMzRI0yagkN7AN2Y5sGNW47TwK3Ddv5yOiXqRdODsRketmbeJCTj+4cG9C
         vngNNiEvVOXUGrgReRiHr4TyCPyNAC83naxK263ti1bA/tWQucZMZQue6hFKKiNVVK0E
         r+gZOQc17CtKx4AyBClucmBeQhYO5bpR19H6H9g6zcVLLD8ETAyEhBmxqK5q8R62wBlE
         HOpg==
X-Gm-Message-State: AAQBX9eNznjz5UdM2qPmw5cJrLqJYl6BXGPZCiknUHurPqSee31oHaFB
	lheQMaq3jzt7aoPaxEfNzLYpHA==
X-Google-Smtp-Source: AKy350aXJuXrIoQCoFQrtu/oOr2bIVumcXfubXv54/hMkKw/UalyjaTZpr3nJhbc+I/QXoe/ZBHL+A==
X-Received: by 2002:a92:c94d:0:b0:317:eef2:f5cc with SMTP id i13-20020a92c94d000000b00317eef2f5ccmr7197520ilq.10.1680783139465;
        Thu, 06 Apr 2023 05:12:19 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id l13-20020a92290d000000b00326ca02f30dsm293549ilg.65.2023.04.06.05.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:12:18 -0700 (PDT)
Message-ID: <b80921e2-9c77-a0dd-9b70-f2ad805f71ff@ieee.org>
Date: Thu, 6 Apr 2023 07:12:17 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] staging: greybus: drop loopback test files
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, Jack Schofield <schofija@oregonstate.edu>,
 Vaibhav Nagare <vnagare@redhat.com>, greybus-dev@lists.linaro.org
References: <2023040613-huntsman-goldsmith-4a41@gregkh>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2023040613-huntsman-goldsmith-4a41@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/23 3:18 AM, Greg Kroah-Hartman wrote:
> The greybus loopback test tool does not belong burried down in a
> driver-specific directory.  If it is needed, it should be somewhere
> else, like in the testing directory.  But as the loopback driver is
> probably never going to be merged out of the staging directory, let's
> just delete the test alltogether for now.  If it's needed in the future,
> it can be brought back with a revert.
> 
> Also, having an Android.mk file in the kernel source tree breaks some
> Android build systems when trying to build from a read-only source tree,
> the report of which prompted this being a good reason to remove it as
> well.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Jack Schofield <schofija@oregonstate.edu>
> Cc: Vaibhav Nagare <vnagare@redhat.com>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

That's a surprising amount of code.  And perhaps there
are better ways of exposing this type of information.
Anyway, no objection here.

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/tools/.gitignore      |   2 -
>   drivers/staging/greybus/tools/Android.mk      |  10 -
>   drivers/staging/greybus/tools/Makefile        |  33 -
>   drivers/staging/greybus/tools/README.loopback | 198 ----
>   drivers/staging/greybus/tools/lbtest          | 169 ---
>   drivers/staging/greybus/tools/loopback_test.c | 979 ------------------
>   6 files changed, 1391 deletions(-)
>   delete mode 100644 drivers/staging/greybus/tools/.gitignore
>   delete mode 100644 drivers/staging/greybus/tools/Android.mk
>   delete mode 100644 drivers/staging/greybus/tools/Makefile
>   delete mode 100644 drivers/staging/greybus/tools/README.loopback
>   delete mode 100755 drivers/staging/greybus/tools/lbtest
>   delete mode 100644 drivers/staging/greybus/tools/loopback_test.c
> 
