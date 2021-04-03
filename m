Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5CB70
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 07:29:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso5181161wmi.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LtTu1b2JZJZec31h8A1xaVmHs2JPp+yjJ40dMGS0r00=;
        b=OsP27Ok3/htF3ya8dYOTaYDDhKODS/FiQlEehDzecnZKj6m3FpbHNi4aZpVDqwkSHc
         V5WoZvXhw37Y9d5PYUlLDoyR9Xojw4iMMiI2raR3B/JzImlYrX1AYFLzrToe8UB+ctOa
         gYFAQ/NkZFci2KhFQJd0/PAtYyQzHN5wRXtR4DyNIqoh112FccHWEcWW22rKNNHOBllf
         2+r9qxSTmwIax+KkoURKCqdWUSAGhldhD/VULj4arAgSCLg7ihtC7i2CFvL5eTcfx/v9
         bVJsc8relQDl2/SiQeL7dgKtkYlkKXjfvlZrLILGXQ2/coj95X+k38DGy/pzFL/mxbdq
         BSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LtTu1b2JZJZec31h8A1xaVmHs2JPp+yjJ40dMGS0r00=;
        b=sH95XMlBVr1G99nG1VffND68wjhD8i5tL4vdy3c4fl2Jp3A7v/JhCUjayUifX2SwDu
         NVQI/+EC+VaC9fjl+e/bm5fqBBWkeuapZ6qIvcxNmx3zjxJLT327ybTN9XyxxqyG0xRG
         pznek1iID0tgQDApfg7gu5Y3aDf6XQ6XxBsFwoLLFFS4ZoPZ4dkc7crpDr1+xmAo5HP5
         bsIIyi8pU0axanL6M1v/6yd8UfDRVX5aNncpJGEgXIxXq63wI5a3LIATdEwmSJSPl8oQ
         Atdl9zAY+IQL+oEmCpu9PX5VqyIOQ1gla9lSUOkpunfQQEsyLRaKhhJT9B7N7Z9FxFJC
         z4hA==
X-Gm-Message-State: AOAM533R6E1jZuuYE0KfXqQYP/KLXW76e0PcWeYBx9dou+ezKOw8+QcA
	2+Jq3kBkzpg5+dZH4VkQJyk=
X-Google-Smtp-Source: ABdhPJyYJLVXxNYaO8mcSfq8VC+cBI1QVEJd/KTGnZpaioplFSKYIef4I+1IQNmg7WhY4E3+V/5AoA==
X-Received: by 2002:a1c:7516:: with SMTP id o22mr15793943wmc.91.1617434977336;
        Sat, 03 Apr 2021 00:29:37 -0700 (PDT)
Received: from agape.jhs ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id e9sm1940509wrv.92.2021.04.03.00.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 00:29:37 -0700 (PDT)
Date: Sat, 3 Apr 2021 09:29:34 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/16] staging: rtl8723bs: remove all RT_TRACE logs in
 core/rtw_wlan_util.c
Message-ID: <20210403072933.GA1563@agape.jhs>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
 <34bf6cdc7bdf5c64d47cb3525897970644de7052.1617356821.git.fabioaiuto83@gmail.com>
 <2014e0fc141d73d907c781ca31c822c96d3a7c47.camel@perches.com>
 <20210402125127.GB1420@agape.jhs>
 <c845d8ea7d0d8e7a613471edb53d780d660142a9.camel@perches.com>
 <20210402174003.GA1399@agape.jhs>
 <906c8d899a3840afab1e624736b44292eacc6c97.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <906c8d899a3840afab1e624736b44292eacc6c97.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 02, 2021 at 11:37:17AM -0700, Joe Perches wrote:
> On Fri, 2021-04-02 at 19:40 +0200, Fabio Aiuto wrote:
> > On Fri, Apr 02, 2021 at 08:20:17AM -0700, Joe Perches wrote:
> > > On Fri, 2021-04-02 at 14:51 +0200, Fabio Aiuto wrote:
> > > > On Fri, Apr 02, 2021 at 03:37:57AM -0700, Joe Perches wrote:
> > > > > On Fri, 2021-04-02 at 12:01 +0200, Fabio Aiuto wrote:
> > > > > > remove all RT_TRACE logs
> > > > > > 
> > > > > > fix patch-related checkpatch issues
> []
> > > > > Lastly, another suggestion would be to just submit a single patch
> > > > > removing _ALL_ the RT_TRACE uses not intermixing various other cleanups
> > > > > with the series and then do those other cleanups.
> > > > > 
> > > > > Using a coccinelle script like:
> > > > > 
> > > > > $ cat RT_TRACE.cocci
> > > > > @@
> > > > > expression a, b, c;
> > > > > @@
> > > > > 
> > > > > -	RT_TRACE(a, b, (c));
> > > > > 
> > > > > $ spatch -sp-file RT_TRACE.cocci drivers/staging/rtl8723bs/
> > > > > 
> > > > > And then clean up the various bits you think are inappropriately done.
> []
> > > > thank you Joe, I tried with (RT_TRACE.cocci in parent folder)
> > > > 
> > > > user@host:~/src/git/kernels/staging$ spatch -sp-file ../RT_TRACE.cocci drivers/staging/rtl8723bs/
> > > > init_defs_builtins: /usr/local/bin/../lib/coccinelle/standard.h
> > > > 0 files match
> > > 
> > > Likely you are running the script on the tree after you have
> > > applied all your patches.
> > > 
> > > Try running the cocci script on a fresh copy of -next.
> > > 
> > > Using the script and adding the script in the commit message helps
> > > others to verify that the changes you make do not have any other effect.
> > > 
> > > $ cat RT_TRACE.cocci
> > > @@
> > > expression a, b, c;
> > > @@
> > > 
> > > -	RT_TRACE(a, b, (c));
> > > 
> > > $ git checkout next-20210401
> > > $ spatch -sp-file RT_TRACE.cocci --in-place --no-show-diff --very-quiet drivers/staging/rtl8723bs/
> > > 31 files match
> > > $ git diff --stat -p
> > >  drivers/staging/rtl8723bs/core/rtw_cmd.c          |  34 +------
> []
> > >  28 files changed, 19 insertions(+), 935 deletions(-)
> []
> > thank you Joe, this mail is so precious ;)
> 
> I'm not quite sure what you mean by that but you quoted
> nearly 200k of the previous email.

you gave me good advice

> 
> Please remember to trim your replies.
> 
> 

got it, thank you

regards,

fabio
