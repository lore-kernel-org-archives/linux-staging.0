Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635B23D6;
	Wed, 13 Apr 2022 07:35:57 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id r13so2159729ejd.5;
        Wed, 13 Apr 2022 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26iaV007QB9A1mMUPni92FyAXzasRAgZ3iveXMBEbJM=;
        b=FUVsLLWLH1vs/kjgwGlMEqwW5ZagS8QPkV/VDF2XJ9pZYn7aoUBF0Jb25m40IBBLDL
         4fasd7/2swAi+q63Ku/g+15bWZKsNRj2yS8PMWQABw6C9epe0VHmhSNfgtAJABNOxEKE
         u1OGBTkLCduYwKGWTbfQttCGYmPId59chjh1Il6F/uWwQK35cAO4QinsSTzchF1V5VGw
         wu31Qy9m9IpYGfQCqPo/3KZi4q1Xy1Ay81pUoMwy91JkMgQr4eLB0mQfK2ixFu1I/XWq
         PL7AehTocRejK7dW5ZHaT1k3+oLw8SUSa3MngIbrpV+3R01I7tYpHsc5NFUgscrO8PVR
         sx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26iaV007QB9A1mMUPni92FyAXzasRAgZ3iveXMBEbJM=;
        b=3Gg0lpW8L02/hfxMG1rFfwfaaQ+LMs2PzXrCLlHV60w3Mcaf6/BzL1KUUIfh36NvWI
         +6wNISjJBwkZJ4OKJsaQ95utNDlf7Pd3o3y4rt1HsQuL3K3/nDTF11uRiQqG+bINpKrT
         BFgfTJLn48END4bBjEI9Rhl2W4Ee9649XTbF4VQ8uk5+k504ATfEkkeukK8Qo3ktWa+D
         sGfF5lb59dnLstEuHAwoxKEzZZEFO7JbTunhsgCUIhEyt6MSZqEG3o9Y2xA4SplBTx6z
         MNLZjebhDKdoiNLbl4pho5MxwN09dQK5sDjjO0ZhhBwlUyvRkZQ074lZUEJhj1mpNPgG
         ALpg==
X-Gm-Message-State: AOAM531NzkuClfkNtAP56X/hrcYs5u4QoJJvlX1Z1H8fj5UYZ1FpDLZC
	Mzxq6a/p2g5eceI/URor66c=
X-Google-Smtp-Source: ABdhPJwmIH+f1J7+rWhhfC79YiCHoF8bSKK80CbayncPfS92Zmhy1Jtey8+R8P8H0jtjNlva4t5F2g==
X-Received: by 2002:a17:907:d16:b0:6d6:e3b6:9cd8 with SMTP id gn22-20020a1709070d1600b006d6e3b69cd8mr37238068ejc.94.1649835356047;
        Wed, 13 Apr 2022 00:35:56 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id mx14-20020a1709065a0e00b006e8bc3ce121sm1002452ejc.6.2022.04.13.00.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 00:35:54 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: Remove the drivers for the Unisys s-Par
Date: Wed, 13 Apr 2022 09:35:53 +0200
Message-ID: <3988824.6PsWsQAL7t@leap>
In-Reply-To: <YlZzP5ghZeR1AtIg@kroah.com>
References: <20220412215901.31046-1-fmdefrancesco@gmail.com> <YlZzP5ghZeR1AtIg@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On mercoled? 13 aprile 2022 08:52:47 CEST Greg Kroah-Hartman wrote:
> On Tue, Apr 12, 2022 at 11:59:01PM +0200, Fabio M. De Francesco wrote:
> > The Unisys sub-tree contains three drivers for the "Unisys Secure 
Partition"
> > (s-Par(R)): visorhba, visorinput, visornic.
> > 
> > They have no maintainers, in fact the only one that is listed in 
MAINTAINERS
> > has an unreacheable email address. During 2021 and 2022 several patches 
have
> > been submitted to these drivers but nobody at Unisys cared of reviewing 
the
> > changes. Probably, also the "sparmaintainer" internal list of 
unisys.com is
> > not anymore read by interested Unisys' engineers.
> > 
> > Therefore, remove the ./unisys subdirectory of staging and delete the 
related
> > entries in the MAINTAINERS, Kconfig, Makefile files.
> > 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  MAINTAINERS                                   |    8 -
> 
> You forgot to at least cc: the people/list on the MAINTAINERS entry that
> you are removing here, to give them a hint that this is happening in
> case they want to speak up here (and to give us the ability to point to
> that years later when they complain they were never notified...)

Yes, this is a good idea. I'll submit a v2 and add two "Cc:" lines, one to 
David Kershner and the other to the "sparmaintainer" list at unisys.com.

> Also, if you are in the "delete code" mood, I think drivers/staging/vme/
> and drivers/vme/ can probably also be deleted given that the maintainer
> for that has moved on to other jobs.  Ask them and see!

I can and will do exactly as you just suggested, but only after April 22nd 
(unless others want to do these tasks sooner, and in that case they are 
welcome :)).

Thanks,

Fabio M. De Francesco


