Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D6173
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 12:42:56 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id q3so11170102edt.5
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j5cesUquFX2JBEkMkdsasfYAHaeYxSrvX2zDvFjDIdA=;
        b=B3RpgQQ73H0cGGfZhP8uQYfICYqjRQB1OAZntvON1HvBTXd/JYRmxYb8TsVjAjX5f2
         WSHHMkwgXM+ocdrrRYsk60I12aE1i/5VhXQX+4RMb0p43WxeR5/IwNkSUfXnx32tDDsK
         1cVMUvU2M1IsJzZSdALYAmEK8Yimeq8EJKCpuMjw+CE30fCodNj1pukmQhKMBd7tImt0
         uYjRXwE6ko9FRYRJdZwLa5n7zioaetCmTTFhLdej4j5f6N53pnQFVzkUFbUqit+sPhLT
         8gonpjEw3fUEsp1g3PVSH8/dOEF9O+oOAap4uzaAcry/w6g7CMWdWVEFUWhYov7Z541a
         EDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j5cesUquFX2JBEkMkdsasfYAHaeYxSrvX2zDvFjDIdA=;
        b=SeiYPfyuXCiwYSG5Ek29EnehY0OXg8GxTiLPYSJbUovQKTE3A6Z/U/vZ9Mg3fEtAnJ
         xVtPVLN9xWHfcHGsch5OR+QSFDq0xDrumwudh0fqY5oZMI2EyCnM5DobKm5lvlWNiWMV
         mtmodg9MWYQJ3USTuJ5ds5idkXhJVhQ4YDt0/VXO1XPHpPuzbXPAj2FQMCodviEQjoRK
         OyxwnwE4q/wDubiaOz4pRcFoqu7VQ9bEm69D6SMnRlDezJftf9rrFejRSKSYcvkhKuJu
         ndYJ0dwED30KxrdPslUw/HrIwc47I99Kr/kZ1YaM/g2+R1yZc/b6ioyb0RawBEcnfMXe
         iTgQ==
X-Gm-Message-State: AOAM532TMghfgrOgwwK8LBygVoBW9g22swe+spJmQzcO7pEr4gU73s7D
	G0cYU8PlDiWa0b7+GWeBlmI=
X-Google-Smtp-Source: ABdhPJzUCqK0yxFfUoRmBAhGQ9r/gqdDdz4SKziPv/XlXexKz3SMu7V0zaCW9QVmseQb9O5La3VHtQ==
X-Received: by 2002:a50:cdcb:: with SMTP id h11mr2919357edj.366.1628858575243;
        Fri, 13 Aug 2021 05:42:55 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id k18sm864460edo.62.2021.08.13.05.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 05:42:54 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] staging: r8188eu: (trivial) remove a duplicate debug print
Date: Fri, 13 Aug 2021 14:42:53 +0200
Message-ID: <2555683.U4YhqVPOqN@localhost.localdomain>
In-Reply-To: <20210813100536.xkjzfq5pstbhdwru@viti.kaiser.cx>
References: <20210811201450.31366-1-martin@kaiser.cx> <20210812061759.GW22532@kadam> <20210813100536.xkjzfq5pstbhdwru@viti.kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, August 13, 2021 12:05:36 PM CEST Martin Kaiser wrote:
> Hi Dan and Phil,
> 
> Thus wrote Dan Carpenter (dan.carpenter@oracle.com):
> > Please think of the subject and the commit message as two different
> > things.  Often it's people reviewing on email will only read one or the
> 
> > other.  In other words just restate the subject:
> OK, I'll keep that in mind for further patches.
> 
> > > Dear Martin,
> > > 
> > > Just my personal opinion, but I'd be inclined to strip out all DBG_88E
> > > calls totally. If there are necessary functions being called such as
> > > device_may_wakeup() we can always just keep this part and remove the
> > > macro call (not checked this function out myself yet). Thanks.
> 
> I'd agree with you, Phil. Most DBG_88E prints don't say anything useful.
> 
> This comment from Greg made me drop the DBG_88E removal for now
> 
> https://lore.kernel.org/linux-staging/20210803201511.29000-1-martin@kaiser.cx/T/#m05d82a
> 0ca8ed36180ebdc987114b4d892445c52d
> 
Hi Martin,

I think you misunderstood what Greg was trying to convey with the above-
mentioned message.

Well, he doesn't like to feed developers with little spoons :-)

I'm pretty sure that, by "Why not use the proper debugging calls instead of 
just deleting them?", he meant you should research, understand, and use the 
proper APIs for printing debug messages.

Please check out pr_debug(), dev_dbg(), netdev_dbg(). Use them appropriately, 
according to the subsystem you're working in and to the different types of 
arguments they take.

Thanks,

Fabio
>
> A compromise would be to remove only those DBG_88E prints which are
> really not helpful.
> 
> Best regards,
> Martin




