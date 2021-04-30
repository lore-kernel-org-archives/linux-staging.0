Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C220E2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:50:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id l4so105631983ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c+zhqiWolsRpS0pXdjMbRlziauRw3Z75fImkeJqnZy0=;
        b=f9bO5bVnY9RC3Z83q+bzToUas1OXT05VR8Q5dae3kMrSiL31eE6i3d+xiaAa4/lwsS
         mlhx1peh6gCER3Jt/6HYJq0KnBZ8YgPSDablXAIoTcyG+Nze74Ul5XVLWRxgKIZHAO4X
         4p2ixZDXBF9pm1EJoZJmbg00xUHcNQS/0fSO8FWTIE3gqnLhlQhCC0j+q4ZsCSeYMadV
         1bb2WruEa9FDLOv+tj1IWoTO3VkzyrsvZKG5umNdJGRlcPtj4yuMNOJzYZLb1wZsfEH8
         uSZnOervfo90+IRmFQQ4Zbi6YzFV341FAyADMEvauXol25t3Ce1yUcBl+UUfq4agsjFF
         24XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c+zhqiWolsRpS0pXdjMbRlziauRw3Z75fImkeJqnZy0=;
        b=pksGuUuKl0ocMl4l3kk9GWkRON0wod9AUxP+ohHHVNLpGotjxU7SSEFia24iJJy/Dc
         uieMVmD5xiF6Ttw55ahQQ3EuYohq+uF6IMfEzHgH7EP/cnlp3r25tIOBQ5rgsAt1/LLN
         XVJ/0K2SDq4tPHH3bjX0KuYfClT0j7ZQ9/9O3VysNM3C1q051vKHH8yEPVCn8u7gKovh
         TfYsqV9Ei7NTimCH2VbGDUCYGaeYW/LiarsjIgK8txEJ1QKbXkl9zQ+IGSMk8EuDVzCI
         1ipY6LY8WZuOkvwfvoawA6J4nNRioEb7tnblRq9Rg9qkVFJJaBAEBfE/xORkr0/EPAOE
         4fRA==
X-Gm-Message-State: AOAM531x1b28iPU86yOCaoCxTSqg4Q214kpcWnSwHBU0zSMJax4KSR+n
	YksL1JE9W8w+akj5h2oXR+RcQvGXmfo=
X-Google-Smtp-Source: ABdhPJzVA9Ff8z0j17pfnQSwN9Ng9Ie1Y57/NUB9OGLnxQk9fOq0TULDwctmP6cuNSX175YpY6PuHw==
X-Received: by 2002:a17:906:53d1:: with SMTP id p17mr4744914ejo.470.1619794203383;
        Fri, 30 Apr 2021 07:50:03 -0700 (PDT)
Received: from agape.jhs ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id g8sm2053127ejt.25.2021.04.30.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:50:02 -0700 (PDT)
Date: Fri, 30 Apr 2021 16:50:00 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/43] staging: rlt8723bs: remove if-else blocks left
 empty by ODM_RT_TRACE deletion
Message-ID: <20210430144959.GA1387@agape.jhs>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
 <646608de41fb1ef915834a33453b0a99907d46b0.1619768150.git.fabioaiuto83@gmail.com>
 <20210430143100.jfdaitqlqaclmajp@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430143100.jfdaitqlqaclmajp@bryanbrattlof.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 30, 2021 at 02:31:08PM +0000, Bryan Brattlof wrote:
> On Fri, Apr 30, 2021 at 09:43:20AM +0200, Fabio Aiuto wrote:
> >remove if-else blocks left empty by ODM_RT_TRACE deletion.
> >remove unused variables to suppress compiler warnings.
> >
> >Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> >
> 
> Hi Fabio!
> 
> I just wanted to point out a spelling mistake in the title 'rlt8723bs'
> in the off chance you submit a v2.
> 
> Way to go switching this over to netdev btw.

what do you mean exactly?

> --
> ~Bryan
> 

Hi Brian,

thank you! Ouch I've just sent a v2 for other issues...
no problem I will send a v3, sorry all for spamming.

fabio
