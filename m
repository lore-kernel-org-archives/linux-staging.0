Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0CA48
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 07:45:50 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id z9so9826552qvn.9
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kFvZI/ho5flJ8bVZw/ylc/FIxIuDfNKDgEZ+nDka8w8=;
        b=dLohcl4if5EP3FOyLzRPPu1gWHmx6diuJE+db2s/9yCYxgm6ki5+ZtDDDSp3yZQoSy
         RUXGgUO+l1IuULfiR7c5BCpgBYtrNFRcw/nZxiFqMfmqeN6fxVFa72bgrMUIbF4LpMX5
         zLUN692AR915ivVRxhQIBZWgnbpcM1v3o6wAlipYSWq23Gd1ZCXwtTdrh+/hEPqhu0mv
         Xr/kw2NPNG4Z65gNU7zZFeFrH/rPWRbop9WPtksi3CaA5D0iFFAFNyMXHz/FxvNOagnP
         usXYctUombiN7vUqiTjKR/sRaqZNNtjt0+XdlyYBy0yJ3kVWnjCY/DERlUVX4yJaoQf/
         XB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kFvZI/ho5flJ8bVZw/ylc/FIxIuDfNKDgEZ+nDka8w8=;
        b=yYaNWTDWuYLQwXYtBqkpkN/ARgHs+4gZSQjnn6yVB6UHE9G/iiwL1Fjv8oo7u0Zlq4
         SaN9Ky8G0K8LB9bYNgVFSDLk5oCyMSFKlK/qfJ9nNcMwq3I3sgyZIKikur/KtuXeQu61
         TB61yPNKeUxlj4r8vJ/FXp3eKSW2byRw3p3wPTSd/bzoyKS2DvgK9aNsO+iHZDiWDiRU
         RGIqTGf6ys1R3xWeSldFjRema6aw+QE7pVjcryhi4aEeJm5pBGapgHVgJFYjeFWVlgli
         fcyDK11qAF4fpH6WJCR26mwxxXkLMks/+FyJ6nh7/7Szxz2xL+fYJJXUc0ryUjXUJ2VD
         aW1A==
X-Gm-Message-State: ACrzQf0D/kqFJSw3KXCTyon07VHZWtb3I+RXRzvQb1zb6rvKTIikNf93
	RGXiu9xXMPUTLmbNNN/P7kE7KyTnfQ1413eqCCHWljCVkvI=
X-Google-Smtp-Source: AMsMyM4QtlpJ5vvcpxPu28MHfCVbWjCdcEjrAksnXqf8ORGp+qU4Q6bMrTggPwyHm2N/HmvLNjkoFgDCYL8B/aVh/o0=
X-Received: by 2002:a05:6214:d6f:b0:4ac:7748:2e5c with SMTP id
 15-20020a0562140d6f00b004ac77482e5cmr13357180qvs.97.1663573549781; Mon, 19
 Sep 2022 00:45:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220917024709.5017-1-shangxiaojing@huawei.com>
 <CAHp75VcH_iWh2yaGLzGevKo1a6h5gptdLR8922cd0KvRKnioHQ@mail.gmail.com> <48238f57-5bf9-d9f5-8fc9-fb213c98f502@huawei.com>
In-Reply-To: <48238f57-5bf9-d9f5-8fc9-fb213c98f502@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 19 Sep 2022 10:45:13 +0300
Message-ID: <CAHp75Ve7MsiwQu-7Bncd84_u_yNrq1Uhqj84jA_YA5LKT7jvfQ@mail.gmail.com>
Subject: Re: [PATCH -next] staging: fwserial: Switch to kvfree_rcu() API
To: shangxiaojing <shangxiaojing@huawei.com>
Cc: gregkh@linuxfoundation.org, ilpo.jarvinen@linux.intel.com, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 19, 2022 at 4:43 AM shangxiaojing <shangxiaojing@huawei.com> wrote:
> On 2022/9/17 16:21, Andy Shevchenko wrote:
> > On Sat, Sep 17, 2022 at 5:12 AM Shang XiaoJing <shangxiaojing@huawei.com> wrote:

...

> > First of all, this brings even more confusion. Since the below needs
> > some work, we want to have a v4 with a proper changelog, explaining
> > also v1 and v3.
>
> Ok, I 'll figure out a more clear changelog.
>
> Besides, v3 is my miss, please ignore it, next patch will be v2.

Versioning should go only one direction. You confuse people with your
versioning schema.

-- 
With Best Regards,
Andy Shevchenko
