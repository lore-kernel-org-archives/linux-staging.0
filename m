Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C8517F3
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 06:06:35 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id v12so4988835edc.10
        for <linux-staging@lists.linux.dev>; Thu, 14 Jul 2022 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=NrPyiJ6zYcV53GOx13yfEhBQnfJ0RCuGsOxgnDEHyUw=;
        b=HKtmmWvzYPan8/QiQi8tWTPbhSZjo7IEdS3mKD+irpEt3Edpn8phLNHMh6Kx+ONqts
         14jMlVsyLiQR5Afc6yLEpeCO2IsW9Rp9KUj+yVkW8GrGt+pTWl0ltF8XH8mfIuNTKK5z
         44BoAmCGgdcCbxIG6UFG5Z1lhTEPUUBvgYLx9MWf+AN3+/4N10kEix6Mw4Sfy5m81LCz
         aDWfY0IHxpttxEaukmLy6Xx/Ohs+mRpOZRbOaeqQO93GsVisncLcdDFvz+UwfzWMH52L
         cdHxYkt/9RxCb6KhAkPrE4GDxNkBk63mw88w9V27tIQ4nN2/NncqhjCC9sXcXvOWNd8O
         GeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=NrPyiJ6zYcV53GOx13yfEhBQnfJ0RCuGsOxgnDEHyUw=;
        b=eKk6/u40E7cOtlx7Bf5gvFET5Z9EflAvO/U5sxtoLcOUoB6Ocn0jRuhAn4tca9YugI
         lKsc785aVJWLJpyWIXnF/kYR4mSV9fdyWEGOejxGvPtx4KYSSFeXUyJj4l6FJtuKFGRK
         NOFJJSTHNmi1zw/Cq2bM9Flmi/DutdjatExkg7rC+3RWHFdLHQSWv8orizxZ5tJwKy9o
         H/ZbwBdO9a3KvzQlNV950m4h4tebtv4QgpMMFOxiDVffPGo0BhtfJoGa9tYX+McZmTkD
         RVAd6ykhgkJT2m0X/UQl9kBDOEQlacTKUCsOgxtPLhXerxQurxAfNTeIwTZyodgpRkpF
         evHQ==
X-Gm-Message-State: AJIora8n5lRrcYp8KwttQ9B7PGzqQqnKolkxqoeqmpSNcG3hLNXg3jQm
	U5KoAzFDQE8lfAhDt0wAWeA=
X-Google-Smtp-Source: AGRyM1vAhXgE641OJlsXfz1E9GgQa/F4HihZk1Y8cyKbou2Kaw1nI4ekXG3WcmeV3M+bu4az0uljcA==
X-Received: by 2002:a05:6402:3689:b0:43a:7c1c:8960 with SMTP id ej9-20020a056402368900b0043a7c1c8960mr16507423edb.79.1657865194052;
        Thu, 14 Jul 2022 23:06:34 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb91.dynamic.kabel-deutschland.de. [95.90.187.145])
        by smtp.gmail.com with ESMTPSA id o1-20020aa7dd41000000b00436f3107bdasm2220934edw.38.2022.07.14.23.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 23:06:33 -0700 (PDT)
Message-ID: <772c4b9f-484b-3b05-b130-7069ec39b72c@gmail.com>
Date: Fri, 15 Jul 2022 08:06:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r888eu: use dynamic allocation for efuse buffer
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
References: <20220713075804.140986-1-martin@kaiser.cx>
 <be6d3fd0-566f-00ef-1404-830176d56e98@gmail.com>
In-Reply-To: <be6d3fd0-566f-00ef-1404-830176d56e98@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/22 08:02, Michael Straube wrote:
> Hi Martin,
> 
> just a typo in the subject line: r888eu
> 

Sorry, I did not notice that this patch is already applied.
So nevermind ...

Michael
