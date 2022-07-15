Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D8E17F3
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 06:02:59 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id g1so4972329edb.12
        for <linux-staging@lists.linux.dev>; Thu, 14 Jul 2022 23:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=144ZJWV5RjQz+UzM2njFcIrCkknpd4SwL00831ygP1Y=;
        b=jbvS9DWUzl1FDvZKC+P0KSY2NMQGLYCtYB6QXnl/IGcvmIr04gst0FLgaP07bbBKst
         Xeul6Csml8dc4wTt+rKiSUvv7BzQIHfQxe4LQQpE7+JH1+e771MKL0xwuIFnpioDhmQx
         xn04XCNaApDd7s97UV1gPwR5/7bPavLHPIDsHU2ZZPgBIFvqL8mVwFUGBpdPgghVglRs
         7+lvpuvvyaqvQ7rjq3tqAHd2vqOHJikWUxePgsuZWXHB1rgQ7MLt6MvP3b8OnF/D+fRJ
         qmXoULasfIrxQsYKFpYCWzRYW1xe8ijyocL5CxNKu7utSj7TnkZidSx3X/vYNX3mEiv2
         1BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=144ZJWV5RjQz+UzM2njFcIrCkknpd4SwL00831ygP1Y=;
        b=PBZ2IC3Fa9yTHM6cGgner+RZFqYL1cAiFGhOl1fZUXwhDh6aGd07ywwN6Ny5C+zvz/
         t39CrUeD66jF0pUA1zsPuKEX7KAhFQmIMnEvpPCg2c0J7G+NetGIqeMT3odslooSNYtt
         LIJ0/vfe+VsByE+x76A+2jjiq0CQX/SU3SIa1xvT+ObNWbXPTXj2H+hETShDbigASdc9
         pgUP4g42i/J4sT0yFlyT0tUWvoapc0AT5eyYzIDqsEsaDqXiogZ6d5Z6is0D8l2fwhoR
         HndD4jjQGyM3Dr7Ou1feezI4jgKUo4RWRq/dsdvpMNE6nVvcWJ9avYtOveGGf/wY3pid
         m35Q==
X-Gm-Message-State: AJIora9hbzES2GIzeohofDR7uIE0srlfPyoRok3tQ0Rrwtw6FPNjtp7n
	sKdH6pVDyx3EUzbrByIQDEk=
X-Google-Smtp-Source: AGRyM1uI36Bk+qA7TtylAqmcBXv0W6J3C1zu3YCCZg7kwhWrN0NbqGzWhM7t4fJpcyOhCm2q+25BTw==
X-Received: by 2002:a05:6402:d0a:b0:437:66ca:c211 with SMTP id eb10-20020a0564020d0a00b0043766cac211mr16876254edb.29.1657864977402;
        Thu, 14 Jul 2022 23:02:57 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb91.dynamic.kabel-deutschland.de. [95.90.187.145])
        by smtp.gmail.com with ESMTPSA id r18-20020a1709061bb200b00726298147b1sm1594112ejg.161.2022.07.14.23.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 23:02:56 -0700 (PDT)
Message-ID: <be6d3fd0-566f-00ef-1404-830176d56e98@gmail.com>
Date: Fri, 15 Jul 2022 08:02:56 +0200
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
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
References: <20220713075804.140986-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20220713075804.140986-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

just a typo in the subject line: r888eu

regards,
Michael
