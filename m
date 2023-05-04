Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E37E
	for <linux-staging@lists.linux.dev>; Thu,  4 May 2023 13:32:10 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-61a9bb1b3a0so2378836d6.1
        for <linux-staging@lists.linux.dev>; Thu, 04 May 2023 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683207129; x=1685799129;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nxm+pDgY9Nl9paZjWNUsBfXYMyVotcPumkIkdiInpQg=;
        b=N7kwMTzLTMjzJploBYizW5dRn8msuTZH085OybPddCQ3QQv3T7X3whQ2wimrT5Fm03
         rmBc77IokNnHli/CInccuyhH3zhfr83cxJN7XjvhCkWZwCHvuZBlpYu+W3yNFNfg8Qld
         g0AVM+1BRg5pysuLAEoLYBgRhMg7gVQYQdPYxGTkJwdJpxgW0jblHON02ZRj3DzA6K7y
         wrU4ApGX9XmgBlRg8ezgHUp3p1lKBq0xJqd4MX8eXqvsdO9BhfXHogjMeanvF7NIOF5K
         HSuIsycX/qHBrBS6WKhHsosZ/nMVqj0sYNty48nboxIrF+MjPRlIUJa81JPsvn5w/yly
         kZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683207129; x=1685799129;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxm+pDgY9Nl9paZjWNUsBfXYMyVotcPumkIkdiInpQg=;
        b=aGsC1BZfusFPZGpvheZ+FcOWYO6ES0HnkykFOEtKpQTLGRbKQ9XH3xoqEIx2A5VHUt
         dyni5aNyq4UaHxBNIBBUN8Yv5fr/+Nxr3tSWFOWaUSJJdDV5+U9M2MNdyFrTrYLSZWBV
         LO25yi8wqwcQZLx+k0aklKx/jDMDPZounWD/zhcgCjwLfku1pxFGhcqzhY9fGTwkEbhV
         H1TZrEZiv3MQG8pOtFixdgIWYaQk4CEBzWzgY23wwSsfgKxkFo15Ly1ZTnmxPNjXYr3o
         TQMbDSVQLdfaqef2TaqnVMR/KqtA6aJGKx4ao0wXiKdLbKbUwoUmFNF/TWs+gpcws9hK
         bxlQ==
X-Gm-Message-State: AC+VfDxZ/HUApw735cISqEBwmg30iCY7Iad1sFjS1fpX5Jy9kvr+W3YC
	XRvCTFbGAOf5rHAC8hW2L0zpZNU9CeADMX8R22E=
X-Google-Smtp-Source: ACHHUZ6UWMnsNcdI+lHc27gE8HjgqRzOVNhB9CxofE7vmtCb/FAlpz5oMZL4NcI9JnC7jHnmyjV0KhIuRyCfOinhRrQ=
X-Received: by 2002:a05:6214:2307:b0:5e6:1723:a7e4 with SMTP id
 gc7-20020a056214230700b005e61723a7e4mr13963480qvb.30.1683207129109; Thu, 04
 May 2023 06:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 4 May 2023 21:28:44 +0800
Message-ID: <CAD-N9QUCi5xesDe3L_tFTDmRk85vrKXxLpYxbn=4bkkmGAj3uQ@mail.gmail.com>
Subject: Redundant assignment of 'pdev_network->IELength' to itself
To: Larry Finger <Larry.Finger@lwfinger.net>, florian.c.schilhabel@googlemail.com, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi maintainers,

In r8712_createbss_cmd(), there are two redundant assignments [1][2].

pdev_network->IELength = pdev_network->IELength;
pdev_network->Ssid.SsidLength = pdev_network->Ssid.SsidLength;

However, I am not sure how to write a patch to fix this issue.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/staging/rtl8712/rtl871x_cmd.c#n333

[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/staging/rtl8712/rtl871x_cmd.c#n334


--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
