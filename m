Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496B52590
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 09:02:54 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id c16-20020a17090aa61000b001befad2bfaaso749057pjq.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 01:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R4uOo5MHkeQgzq17T9YFrhDC6UuQ0Je/UgBAobCZK4Y=;
        b=NB7oDpZG1zrTleofPpyTpCvySKZckLxHjXrTodWOnM02cHwTokRsxQhz226NYS51v8
         weGGODXATipQwe9eixdr8HjDeI4Z+E/d1z/gYlGrU4gcOcTdmd1zN5D5Vdl2M9SN7nj8
         je5N326XMvsXKjl9kXGyQ4SDYHmobI8tYA++cuEK7Iovn8qXcU6Gx8Cvc+D2nQaZuS1C
         Oh0X1R9UOjS1m0PoPboOEd0zdg4arkp+74+rfb2E8wtXiwcr+heiI8swox8UyoSn9i26
         FtZlGTbNgxrKSVdvnCQx0C/lFtWfTr/T4AM8Eyvcs4k5qM7+3L5cMBclXPv5Qwg2Kjz6
         utJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R4uOo5MHkeQgzq17T9YFrhDC6UuQ0Je/UgBAobCZK4Y=;
        b=EAF7J/vgObceSkIvUqqW5mGxTuNH49Qc3D1hOWL37RLLVHWLQZVEPNCi8d6hfDfP+n
         ydXtZjv5GSG2HFg0GGr4hVePSFXpolUfCaLeiYLJemDYZoYAr3Oj17Vhx5FPmm1lJp1+
         1LBaH9ypzn9u05/j07/KPpaiiILA1lbC6fXHuos5T2v6QZK7N7ZmtiXN/XBJXL865NQS
         +lbRT2X84W+jFkIWH3d//8UKZyIMo004TZ6ubE2Gljh/FV/XvSE0PEV0fGPGT7CAeWn5
         HBYaLXFvSv0TUbiWrurgo44EZzD8irePubPoFJDAgZ5BbynLV8Rnen0Aw4cWGYtAF1uP
         CFdQ==
X-Gm-Message-State: AOAM530bU0IwWXXhMT6G544EThcLfmaHA2xi7wmpvIRwew52oZU2UVMh
	kSYtUBApArkWjEwO9dbqODE=
X-Google-Smtp-Source: ABdhPJwnq5VviDuQV2d+MxqmT3gBbwUOhuOZU5vyoHoOiukTwPepAlMDov6Mb6n6JDegnvyNa5Gr5A==
X-Received: by 2002:a17:90a:1d04:b0:1bc:98ca:5e6f with SMTP id c4-20020a17090a1d0400b001bc98ca5e6fmr26362307pjd.32.1646211773654;
        Wed, 02 Mar 2022 01:02:53 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id q8-20020a056a00088800b004bca31c8e56sm21461840pfj.115.2022.03.02.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 01:02:53 -0800 (PST)
Date: Wed, 2 Mar 2022 22:02:46 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, paskripkin@gmail.com
Cc: Pavel Skripkin <paskripkin@gmail.com>, gregkh@linuxfoundation.org,
	realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: prevent uninitialized data from being
 printed out
Message-ID: <Yh8ytrK7EJjYbrHF@mail.google.com>
References: <Yhmruyr2BUn0+3O3@mail.google.com>
 <593b1840-aba1-3fcb-daef-9cc0011d0805@gmail.com>
 <20220228064415.GB2794@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228064415.GB2794@kadam>

On Mon, Feb 28, 2022 at 09:44:15AM +0300, Dan Carpenter wrote:
> On Sat, Feb 26, 2022 at 04:08:48PM +0300, Pavel Skripkin wrote:
> > > Patch dependency:
> > > 
> > > - this patch depends on the following patch to be applied first as
> > > both of them change the same file:
> > > https://lore.kernel.org/lkml/Yhla4a1Clpguoo2h@mail.google.com/
> > > ---
> > 
> > You can send all these patches as a patch series with proper order. It will
> > help maintainers to not break the order while applying.
> > 
> 
> 1) All what Pavel said is true.

Hi Pavel, Hi Dan, 

thanks for taking the time to review my patch (and apologies for taking
this long to reply back to you guys).

This patch ended up being merged yesterday so I will be extra careful
for the next patches I send :)

> 3) Greg is going to see that and he is *never* going to click on that
>    link.  In staging then we do not care about the order of patches.
>    Everything is applied in first come first serve basis.  If Greg finds
>    out that order matters and it is not sent as a patch set then he
>    just deletes all your patches and asks you to resend everything
>    correctly.

Noted.

Best regards,

Paulo Almeida
