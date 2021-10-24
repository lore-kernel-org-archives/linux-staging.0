Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED82CA1
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 16:27:15 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g8so599362edb.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H299UAlRGy5AL6y5+sDSOlxsW1n+KrGZrT/E7k60mw8=;
        b=b1uMKuexLkwut/IeKNYWkAZ78YykWQdo0Mi5j4xoWu+TOwqVfECJVsW4aMwb14PNQg
         UHXybubtZRmLGEb5gxpx3a4sLl32Q5GI4McUqvnEdYLx4/TxBX7fiLKEYdh729OSwyz7
         U5fo8UE7ylu/98ihGy6bBsaCpaSWUDEeV64mNcvIgWVa49e/zTmO7DLiW499PFlnW0E0
         HJ1w/1JGQyh6d705plwYzGBRoB6RBSm8dPz6TATOAS8DdWrZ0n4MLQNQd3EG5qTzMnpJ
         ufPhW0ec89VBWIQGjE21uXHbrMk17kQlTzMHwYX6BGJ+1S2Wp2JsebN5YxbkZplDoEBM
         2K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H299UAlRGy5AL6y5+sDSOlxsW1n+KrGZrT/E7k60mw8=;
        b=zNeHeTR+KPzXywqcJ59D9c2KwJlBsZMG93ymfSHByv22ed/nYuo1QGzB/ZJutVMXFn
         5skctMiepzUuF4xMbiIxjxPCu+UTw9WVHAmoZvh9IvANL8Hn/+6SHnSb+bfeEQGzX5dj
         GM4WHx34P4EYq1ewDywrUeoP9RF4v3ODXJzijD5jINRPptgWhoRlO6jMzy1AUVz1zbeH
         v8Jr/LWzmC9OlPUzF0qs3dxiCZfiEYiix5WN39Geq0i98InDs0zlZqi38KbQiGrME9l5
         Yl/GUJ3FslyLBANbOYqTmXnNvvftoAOrlYqgMErjLagsbPKaITVmmg7jZ9GWgrHhaNXB
         AFWw==
X-Gm-Message-State: AOAM530uJeteuqnaa+7mCT3lEl7NDaMCCkQ4LVlYM9Q54/QkA8eoa50c
	uPs2fnGU7VpZ6wSLflINxis=
X-Google-Smtp-Source: ABdhPJwnfkKlgveo+wCKf2g9qjticT6q79beBtK4asleaxTw/MJguybOiHnFCIhFnMTUhIKHyc8sLA==
X-Received: by 2002:aa7:d34f:: with SMTP id m15mr18999490edr.40.1635092834166;
        Sun, 24 Oct 2021 09:27:14 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.pool80181.interbusiness.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id h18sm6268333ejt.29.2021.10.24.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 09:27:13 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove four unused semaphores
Date: Sun, 24 Oct 2021 18:27:11 +0200
Message-ID: <2067076.ETZ9WjcDCG@localhost.localdomain>
In-Reply-To: <YXVR06W46mx0EaZU@kroah.com>
References: <20211022113936.7909-1-fmdefrancesco@gmail.com> <YXVR06W46mx0EaZU@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, October 24, 2021 2:30:11 PM CEST Greg Kroah-Hartman wrote:
> On Fri, Oct 22, 2021 at 01:39:36PM +0200, Fabio M. De Francesco wrote:
> > Remove four initialized but unused semaphores.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> What semaphores were removed?  Please be specific.
> 
> And can this be broken up into "one removal per patch?"
> 
> thanks,
> 
> greg k-h
> 
Hi Greg,

With all due respect (I mean it), I must say that I'm not going to split this 
trivial work into four patches of two lines each.

I understand that here you have the last word. After all, yours the tree, 
yours the rules. 

However, I'm used to do only what I can understand. After noticing that you 
can take in one shot the removal of 7000 unnecessary lines (e.g., please see 
commit 7bdedfef085b), I really cannot understand why you cannot take also the 
removal of four initialised but unused variables in one only go.

I'm really sorry but, if you cannot reconsider your decision, please drop 
this patch. I'm pretty sure that someone else is willing to do what you 
required, but not me.

Best regards,

Fabio


