Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C342C85
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 18:09:25 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id q124so20237350oig.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 11:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VMeuo93WgPwrBuUuBbSgsCE1Fw4En6FyPDPeYnBfWA8=;
        b=FgMqFeC9adu5QyteyxYY2vXqWeeZ1CHgoMG+aBDujj77fojVng7TMr0EzQYI8pWKQE
         F0yQUjASbHMRR8csiBlR6dqSBnJYomn/9KYwlwi+XOj0NnKIXqxLvc/1j/5DU/Lppyh2
         ldB1BYpUpu5Bjma1vv8hIN57JRzrX2j6bwDBQXcHGmfIjq0ij295B7AR5+gABt7DhIb/
         Q5tjVbV2rWYiye6guh2fezrL6c97YtzSQiyrgn7a54qnyXkB3zF6n8nVLfD3vKsgqgWh
         JmdU95Pq1kNNUpN0k28MeC7D6d4EO/cVfvm2p2m8v4yf80maK1/1WE9veYcvq4+nhM1W
         Sksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VMeuo93WgPwrBuUuBbSgsCE1Fw4En6FyPDPeYnBfWA8=;
        b=qM1DVXENlsdEYtIsDckTcDba4vxtLd4nZKf2AuZ2/iUB9UVrNOHlmY6bnhrUaGm4WO
         66z9vMpWMyKlZyGMOF7pZoaqri3ERrVxX3S6QUhM2Sd/Y/vMoPQQzOb0A4DZdWLVMQCa
         DY6LkWsCFmugZkI8k5BVa3p+wuNi5E14fCNGPNzm7saJDvT7YgGgwGuJSHguASwWOkZY
         MF2HgpepercNWCU1JEVWSXvp6Fx4/89Bcqfxy/QX/YIGqYP2fKEKgNxvwq8s/djXdo9m
         m2ARSgs5hSkGpn+7DzNmxJij2hoojkxGVF0rz5xURAzQpnWyP7BB+1BisrPlWgThXOI2
         xq8g==
X-Gm-Message-State: AOAM532ypxWFmA+uGhiUNtExHpIj7EKXNOQaOcpi2m4qv6cGgcusERqJ
	7PTeiVtR/5fVAYCDD1p+oRaFjbdeYFJIUMJD
X-Google-Smtp-Source: ABdhPJyadYotOQSEJ+LTfYsJYZqjiZIqLldFbIpUkWXp8vog/7buo7AWgov8qYCbDbA6s4zSzNN0Pg==
X-Received: by 2002:a05:6808:158c:: with SMTP id t12mr28674296oiw.24.1636222165181;
        Sat, 06 Nov 2021 11:09:25 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1025? (2603-8090-2005-39b3-0000-0000-0000-1025.res6.spectrum.com. [2603:8090:2005:39b3::1025])
        by smtp.gmail.com with ESMTPSA id q6sm4084407otv.6.2021.11.06.11.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 11:09:24 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <21b97629-00b1-0fed-a4f3-fc318372aea2@lwfinger.net>
Date: Sat, 6 Nov 2021 13:09:23 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>, Phillip Potter <phil@philpotter.co.uk>
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
 <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
 <YYa0e98JTsE0PPDL@equinox>
 <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/21 12:16, Zameer Manji wrote:
> Hello,
> 
> I would be happy to test the patch. I am not an experienced git user
> when it comes to
> taking patches from mailing lists so I would appreciate it if a commit
> was pushed to a
> git repository that I could pull down.

Sorry for assuming your level of familiarity with Linux. I find that anyone that 
can do a successful bisection is pretty adept. Unfortunately, I do not control 
the repository, thus I cannot push patches.

Please tell me how you read E-mail. Do you use a local mail client such as 
Thunderbird? If so, I will send a special patch form that can be installed with git.

Larry
