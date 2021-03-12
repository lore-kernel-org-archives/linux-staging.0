Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B011C210E
	for <linux-staging@lists.linux.dev>; Fri, 12 Mar 2021 20:51:08 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id g24so4894695qts.6
        for <linux-staging@lists.linux.dev>; Fri, 12 Mar 2021 12:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=c/KySFnDZfob7IyHCkmei1qB3GgilIzgoB/4p8rSKaA=;
        b=REAyCX/eWcWdqt54exPHAS4l6sv63nblfssapIRWIMhKtFGebiN7cl0pb+GY7eTHiA
         Bb04LmHvvvTKc7O+j6DkzRD0y2PCLA2ZcgM7wh1FrvDSYRIXZ1acSh1tAp6Yqdou/f8G
         outmat6/Ap6t8GGTuR5YdpEOpFG3htrqsXzrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=c/KySFnDZfob7IyHCkmei1qB3GgilIzgoB/4p8rSKaA=;
        b=MNRuSzz9sUVErUXEFgDz7UPpvmYHRGiAkuuTnj4SoFPG5jVyTs9hQ1cG0y+oRHQMoW
         9yxgMT4iMGOvFVtZrXor/YlVgIaK89yB1OLFB7UtoraAjdjpPGYpT+2HNRFxoScIzA6B
         Pw1s/+RsqJM+stSMhmJyJsqNrTGs6ayECwg6hIpgw1ZVrxsQv+E5x5y7XXlCu8cdRAce
         FXoN5RzOpueVZ8cOBhIhK7jk0Eu67NsRV2tMuhSjWV8iPY3qhszivuFHrsh5gjZKd3cg
         /QTIMkTFRVmD51ylkmRlDs95j1/ey2xOOysPgvFBhDhyxHGVBW1vnVSGuItqma/8Ydsw
         WG5g==
X-Gm-Message-State: AOAM533nAYYmnX3y0f2Vpo1XYcPhaNIGY46hMrrk4CDIWNqIaWw5W0VH
	Zc8YuQJs4NaHHLk14V/nzisZ9r2jvZKsNefk
X-Google-Smtp-Source: ABdhPJwUohKBCxQgx5NV+NoQqjwHynl8ncmH2xJYnbkgjj67vsGCvXBxccdOeCimwnmbvUjg27uylQ==
X-Received: by 2002:ac8:16dd:: with SMTP id y29mr8288895qtk.159.1615582267455;
        Fri, 12 Mar 2021 12:51:07 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 66sm5207297qkk.18.2021.03.12.12.51.06
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 12:51:07 -0800 (PST)
Date: Fri, 12 Mar 2021 15:51:05 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Subject: Test delivery to linux-staging
Message-ID: <20210312205105.jb3j3ahimzt57tms@chatter.i7.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Initial message, ignore.

-K
