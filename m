Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8BF3481
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 16:00:29 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id mt6so5878374pjb.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yc5UbwPjJQACVbhvjLg+y5j4VZ0+YIpYUrLOrohGgkY=;
        b=qx5DLqsbVm3pDju2VSYfAbQl88h0B1EVxHBtlFut/6ctc/nH5qKeikqQP8qDzv5eLz
         4dXp4+bODSNL0hCZEqkcoIXwwgNai7tOfbtTXvvAJFOhkqKw4/R92jWdwWtXJ9MEEJsN
         ro5LWDnEwbyRH9wKa5r5HNbWgvifvNoGYREpxyTCfDqcz+X9QWsBCb1IwHoUy5UGvqKn
         D2CJREa3Lxf2IUklMIDwvcd8J2lFtg8zk4OMK/DqNxMeWeYh3PgASpIsx6JZRzQy1X5/
         PpueJOCkPwHVbIzp97vF2w551yq7JhJQDq7PAJox8mAqy6DFKelLwFc9oSxgYgQ4xlnG
         MF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yc5UbwPjJQACVbhvjLg+y5j4VZ0+YIpYUrLOrohGgkY=;
        b=gozuciV7XOaFxpvUVZ11a2pnjB+EsyBvb1tLo665ARZeXKK4lHKCCDlLJyqEFZsZTc
         jaLU04ExPeCOXBgwK1OEFAqcfXSF4QIfxQyhKC6iC9SWPuziYUyHylp5Ll88mbxNKDJn
         6bQWviotaj/tVgldBx0o7FrwYRKZUs+kMLOLdfrr/Do4HHM9VLLc/0avFbmRyDUWopoF
         PKilX2+Kid1aCBoykpWBFQaX1pKbbRwfJAGbhZj/wXL6ZLKtpvWPlVficSgHSUz3Yxaj
         6scoGf6Mia3e+UX+Cm2HhfrTZ0YYdk7dKT0IY/1e7JezsG2ssxei42Fg3fxRSoHDRSWU
         z41A==
X-Gm-Message-State: AOAM533TbI/lj+EET1kip/xRCQfr5wX8fropNuldgO6XS52HL+hHT1uH
	v4NWhcLYmBOz6/FJnSED2o0CdOOVCKmwLZJLuCMZiA==
X-Google-Smtp-Source: ABdhPJz2logvFN0MKIsYvPCI7xECU1r0uANCc3AQ/xrgU3X9/gvm7fwRg8jd0KyK/HMYlIFMJe0A74gaDSUTZUqwKDo=
X-Received: by 2002:a65:6181:: with SMTP id c1mr507765pgv.208.1627488028807;
 Wed, 28 Jul 2021 09:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210727232219.2948-1-phil@philpotter.co.uk> <20210728074605.pp5rs4c65tofnqot@viti.kaiser.cx>
In-Reply-To: <20210728074605.pp5rs4c65tofnqot@viti.kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Wed, 28 Jul 2021 17:00:18 +0100
Message-ID: <CAA=Fs0mH9YAVhr24YeE3jpZrnuDGhOuhj=Sb9Ekkpb-xoC5LYg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] staging: r8188eu: add newer/better RTL8188eu driver
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Jul 2021 at 08:46, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Hi Philipp and all,
>
> Thus wrote Phillip Potter (phil@philpotter.co.uk):
>
> > The driver currently in staging is older and less functional than the
> > version on Larry Finger's GitHub account, based upon v4.1.4_6773.20130222.
> > This series of patches therefore:
>
> [...]
>
> > V4: don't remove old driver now, just mark as deprecated and modify to
> >     allow building alongside the new driver.
>
> Basically, you're suggesting to put aside all the fixes and cleanup
> that was done since the rtl8188eu driver was imported into the kernel
> tree. The TODO file says
>
> - merge Realtek's bugfixes and new features into the driver
>
> Why aren't we going down this route?
>
> Edimax offer a realtek driver linux_v5.7.6.1_36803.20200602 for
> rtl8188eu as a .zip file for download on their website
>
> https://www.edimax.com/edimax/mw/cufiles/files/download/Driver_Utility/EW-7811Un_V2/EW-7811Un_V2_Linux_Driver_1.0.1.2.zip
>
> If we integrate and fix the v4.1.4_6773.20130222 driver, are we running
> the risk that someone else will come along and propose another replacement?
>
> Thanks,
> Martin

Dear Martin,

I see what you are saying for sure - I think we've both sunk a fair
few patches into the existing driver :-)

That said, from what Larry has mentioned, this newer driver would
still be a better bet overall due to the additional work that has
already happened on it out-of-tree. The Realtek driver you reference
probably has no CFG80211 support etc. would be my guess, but I am
going off what others have suggested in terms of proposing this
patchset. I can't honestly say what the risk of this happening again
would be, but minimal I'd imagine.

Regards,
Phil
