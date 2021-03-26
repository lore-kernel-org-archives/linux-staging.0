Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9370
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:57:11 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id b9so6443846wrt.8
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 10:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1t/0Bpv5qVziM336nk0rPn6pQA+Kb+gV2sVnrRpUuDc=;
        b=QIvHEKJQHrUxt4VR/iUcqTWKK0unXoDuCvLpmIiJgvNaNzhkXOziIKcKCL4maSPhqM
         xE4FeLvGwCRrE2EW7BIK09MyE/jBKSApe9G8vyw3uvkLMDnLZUbzr56ad8sfM6kwW+yH
         c/o4U10tYCLxLqasPQh5zQV2ulBtOHaBuCDcTmgsW5vK6Vo/FO0Is5KOY0splO3aE1bw
         A05W0fmEt4zyERo+CgFiexcXtMWOr65wD9SJpICAHJQ98KhyafaL9Ppwt5h/WGXjkl8F
         aciFDIBzZcODQaMO87Ya8H745aLb6LtpWUiWTuS/cEaBACe8gAY14ZZU2oZ2kmEJUTTI
         9WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1t/0Bpv5qVziM336nk0rPn6pQA+Kb+gV2sVnrRpUuDc=;
        b=EEPjKyckokMLLQ0TvNZD02poPIsFm6lVYlM16w7ZBXC/0C7zDYlqOFxGPL++6K82w5
         ZR2/pPUglVv0fUIGP/Ae181qxopsVKdpMzaUWVSBp+XgU4ljHz2PXhAIc1TYlVv6Rxy7
         88BRsFQx9E9tAcswqPru2eqvhyrYwmNQFR+/FINTCuLfTYXZBKdWB6KR5pc5RtHvOXR3
         qcuwQ2hZ/N42+48roKKWCqLI1NmWMu1LcMJMTDlH1PEUJ9doUsDuQ5ZrHJK5SPPXQNO3
         EUczrgxmj04x+zVzNobxS8zPvoKc9P9eYUa9Qp6Nl9pqxsFcEM9OwdB8akfhj2+GEn48
         3mHg==
X-Gm-Message-State: AOAM532yPtyVkmNXbUuQdV/sTLotslE8JdivLTeMCkeqxeVgFvTphfRL
	2NRSdV2+zFWZHtP4I1j3z5o=
X-Google-Smtp-Source: ABdhPJzpq6eqymGBmVDq77F42urjhWGXEulUKb6s4ehEjkArnIhuodpQFR50lbW45Q9/H8y4hTMRUQ==
X-Received: by 2002:adf:e582:: with SMTP id l2mr15882957wrm.207.1616781430406;
        Fri, 26 Mar 2021 10:57:10 -0700 (PDT)
Received: from agape.jhs ([151.37.215.119])
        by smtp.gmail.com with ESMTPSA id t8sm14586922wrr.10.2021.03.26.10.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:57:10 -0700 (PDT)
Date: Fri, 26 Mar 2021 18:57:07 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixes: 65f183001f6e (staging: rtl8723bs: remove unused
 code blocks conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*)
Message-ID: <20210326175706.GB1464@agape.jhs>
References: <YF3qSsH/3vRy7BRy@kroah.com>
 <20210326155252.6746-1-fabioaiuto83@gmail.com>
 <YF4J2JVz1tHiFsGJ@kroah.com>
 <20210326174327.GA1464@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326174327.GA1464@agape.jhs>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 26, 2021 at 06:43:28PM +0100, Fabio Aiuto wrote:
> On Fri, Mar 26, 2021 at 05:20:40PM +0100, Greg KH wrote:
> > On Fri, Mar 26, 2021 at 04:52:52PM +0100, Fabio Aiuto wrote:
> > > fix indentation broken by patch removing conditional
> > > code blocks checked by unused
> > > CONFIG_INTERRUPT_BASED_TXBCN family defines
> > > 
> > > https://lore.kernel.org/r/9157000821fd6febf25566b8c712fad1995c7c78.1615907632.git.fabioaiuto83@gmail.com
> > 
> > No, please use a "Fixes:" tag that points to the git commit id that this
> > commit fixes.  Look in the kernel tree for loads of examples of how to
> > do this, and it's even documented in the Documentation/ process guide as
> > well.
> > 
> > thanks,
> > 
> > greg k-h
> 
> is what I did, as you can see in the subject. Or I did wrong?
> 
> thank you,
> 
> fabio

forget this message :( I will send you the patch correctly formatted,
just seen some examples. I thought the 'Fixes: ...' was the one line
desc.

thank you

fabio
