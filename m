Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C413A48
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 08:27:59 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id s9so17742272qkg.4
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 01:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=72dEB/W82K2J9YzmT/1IApyi+hSVnJL6Erx3Z55bmf4=;
        b=AXPY74mfLoKntSQ9A9PiNWHU9l/ez0skvlaoGAiGNFeb9ohtNfOAUiFU1CjK8Y5mda
         jcKYuo8qQTdbQIes0MtKYtthlU2jbF6514eQ9KKR56IcTw+Awp+P1BsMOLk+sNsfoU81
         G7RbZMUw3pWtSQtkG/FPa+ZtYxFADVEcINn018yK478s65/guyybQyy/y7OWZmMqtFNZ
         q2V0Asa6pVB3ABUTzPxDpEDlbLZVDYkofo0Py38ti8SvLWhUGKdE9V/678jnXQcorBca
         20U3dCxW1Ho9xzIJUC3+mWtHsPs1SI2CKt2mqc+12/V/JIAZxqCLRkUrhdW4rZ61OnfU
         00aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=72dEB/W82K2J9YzmT/1IApyi+hSVnJL6Erx3Z55bmf4=;
        b=l3xl/J3tFnSZmg2LMoIKflhPOj0anvykh6aAe8vYjjzFLb/Xwl1RWNzN5eRMly5ZKw
         ZNY1tqMkUvT/qQ5bjZ7pBtxo6bc7cvF7qvyoy8boXVHUFF051rZCBdgexuobzmXFO0cx
         03ogFX1Vinx2PVVScmRLKG1dUquYQ5UDafKSXEhVq7W7gN7hbKFRFEwvWiQcLjnUYemy
         vvI2JKdE0ulqES295/WVCnMVVn9nXFQDPrfm3wBwoxhyPpPMFWqLkwgb27ZaIsD/a3wY
         1pOE4Q6Roi/a+hICUOOVhipPsD/Fn50ffTlXzlna7Je0fyyaTzYdzOIkO2ZGS+B/Ib0x
         QYEA==
X-Gm-Message-State: ACrzQf1itRidNARpvRTGm4qNoSaAarru8X7QXcuIHGIdDpJND1zZYST6
	MpjKRQeRYhbEkxW6I4cxXbzhIEmkvtBgMdi/ssE=
X-Google-Smtp-Source: AMsMyM6dTximFV/9EPJQOMBdwzYlFwCRr0SaBAsM1quRyDJREjKqe7K+4J3U1QH/FojJ4qlSmr3Jg0MOfLm8Hhp/dkY=
X-Received: by 2002:a05:620a:4454:b0:6ce:bfbf:7e3f with SMTP id
 w20-20020a05620a445400b006cebfbf7e3fmr10558938qkp.748.1663576078379; Mon, 19
 Sep 2022 01:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220917024709.5017-1-shangxiaojing@huawei.com>
 <CAHp75VcH_iWh2yaGLzGevKo1a6h5gptdLR8922cd0KvRKnioHQ@mail.gmail.com>
 <48238f57-5bf9-d9f5-8fc9-fb213c98f502@huawei.com> <CAHp75Ve7MsiwQu-7Bncd84_u_yNrq1Uhqj84jA_YA5LKT7jvfQ@mail.gmail.com>
 <436247c2-1946-af00-7fbf-6d81aac3b640@huawei.com>
In-Reply-To: <436247c2-1946-af00-7fbf-6d81aac3b640@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 19 Sep 2022 11:27:22 +0300
Message-ID: <CAHp75Vdo+hYdKXHeXT=aK0mtbYBLFYzxB-nLUwtPPKZN8AVp1Q@mail.gmail.com>
Subject: Re: [PATCH -next] staging: fwserial: Switch to kvfree_rcu() API
To: shangxiaojing <shangxiaojing@huawei.com>
Cc: gregkh@linuxfoundation.org, ilpo.jarvinen@linux.intel.com, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 19, 2022 at 10:50 AM shangxiaojing <shangxiaojing@huawei.com> wrote:
> On 2022/9/19 15:45, Andy Shevchenko wrote:
> > On Mon, Sep 19, 2022 at 4:43 AM shangxiaojing <shangxiaojing@huawei.com> wrote:
> >> On 2022/9/17 16:21, Andy Shevchenko wrote:
> >>> On Sat, Sep 17, 2022 at 5:12 AM Shang XiaoJing <shangxiaojing@huawei.com> wrote:

...

> >>> First of all, this brings even more confusion. Since the below needs
> >>> some work, we want to have a v4 with a proper changelog, explaining
> >>> also v1 and v3.
> >> Ok, I 'll figure out a more clear changelog.
> >>
> >> Besides, v3 is my miss, please ignore it, next patch will be v2.
> > Versioning should go only one direction. You confuse people with your
> > versioning schema.
>
> Should I send the sent patch "[PATCH -next v2] staging: fwserial: Switch
> to kfree_rcu() API" again as v4?

Yes, and explain in the changelog all of the previous ones, like
v3: the first version of the patch
v1: v3 resent as v1
v2: changed kv... to k...
v4: resend as v4 to avoid versioning confusion

-- 
With Best Regards,
Andy Shevchenko
