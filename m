Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0B870
	for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 10:44:21 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id x16so3990882plg.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ynj2ZXXp2F8+w3B4Hj/4kMQyD9n1uSjihBN3NYureys=;
        b=PbTgJea5eJ93DfLE5snA7ft+A9KKbBi1qJlySn+fcLn/VpU8bDunyobeFuWVvDY/jv
         /aHFy8wT15h+GKfPS4LB9JooDfPLwU4/rR0efP1nn+M0v2Sjq9ZMlfqlxGG+wCq/AciT
         Blzdfrpq1Bnzl8VWptMopXcWaKLli25VN1GkbRTxGFG2FNo0YdXluxZZzqxOnna6Te7g
         ePG2WGZeVBrzveG0i70IX8BOGurrBUf3BDjMgWMoYWPqB90+IyJjMqJfzKHtdhdFPUgW
         +/f3Y+OWvAmtFeyzz+6UIvPu3BSahOz9Ym2HR0ZubjfgiNSsyJJ+XfqIN73dNHANVg7c
         /26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ynj2ZXXp2F8+w3B4Hj/4kMQyD9n1uSjihBN3NYureys=;
        b=o+lB5vI1kugbu4lHQW9l7t9EkOiyAbIQMJU86meiASqV2xs7efxBsMPgqpYVnegp7H
         8oAZCZ2vHV5cmdnlaXvddejP9A9/25tGvomR1FWm9DjQ1gjcxwker05KbsRbWCfyd9g/
         mZ2ug/8rn8cOSzvPcnHRJq/uK8xPanWpyONcWRag3S3/UX3Uxj+S8EAQHA4yJTKAlP16
         UggZWcXT2ClX0gKJhf8v3fwsnZuYHcy6JMEgOPAa6SOhoBB+1hDeo12lALATdcOiI4xE
         FSEzNL4NtJqRHdGIeti0+lySSA6McTvl83/r2DFCo5rRHplcF2N4woAW1rc8yhk0sNVp
         5Abw==
X-Gm-Message-State: AOAM532fZois68zglLlMIgrvhl+ZkohIQpjiNbzO4QJhTo5QemSanyUF
	PX/0z5aa01Z9oN18kysj1dTxkuvd/mDGtEjVYlXOrw==
X-Google-Smtp-Source: ABdhPJwv2RAb80Aobb9NUqOcDl2cFRiID1MOfglUJVFTXH8E8JorQMm2shy4RYeVohJRaIspInDcctytxhk+nd41b/I=
X-Received: by 2002:a62:1bc7:0:b029:328:cbf5:b6b0 with SMTP id
 b190-20020a621bc70000b0290328cbf5b6b0mr40925867pfb.81.1626950661194; Thu, 22
 Jul 2021 03:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210719224601.255364-1-phil@philpotter.co.uk>
 <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net> <20210720090035.GB1406@agape.jhs>
 <08a8b372-8ec2-afcc-cc54-305d1dd74a59@lwfinger.net> <YPfRf8dgFd+u5hzm@equinox>
 <0c2d97fa-e1e1-3564-98b8-37d5b9a1a9cb@lwfinger.net> <20210721182836.GX1931@kadam>
 <ed7b7d93-f754-dce9-ca4f-425e49c972ba@lwfinger.net>
In-Reply-To: <ed7b7d93-f754-dce9-ca4f-425e49c972ba@lwfinger.net>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 22 Jul 2021 11:44:10 +0100
Message-ID: <CAA=Fs0nvhxEhJhCTWH_KkYyB3Jz7Pi-t2a+6zL3K=O-_3-sLGg@mail.gmail.com>
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jul 2021 at 20:18, Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> On 7/21/21 1:28 PM, Dan Carpenter wrote:
> > You're obviously not a Realtek employee, but what are they doing for
> > wireless drivers these days?
>
> You are correct in that I am not a Realtek employee, nor do I have any knowledge
> of the internals of any of their chips. I do have a close working arrangement
> with the head of their PCI driver development, and I have gotten free samples of
> some of their chips. I am a volunteer that is interested in providing drivers
> for the devices in new laptops with wireless chips that do not yet have a Linux
> driver in the kernel. I also provide relatively modern drivers for older USB
> devices through GitHub repos.
>
>  From what I know, the PCI group at Realtek is mainly working on new 802.11ac
> devices, but are leaving some hooks for the USB and SDIO equivalents of those
> chips (RTL8822BE, RTL8822CE, RTL8821CE, RTL8723DE, and RTL8852AE). These drivers
> are either in the drivers/net/wireless tree of the kernel, or are under review
> for such inclusion.
>
> I have no current contact with the USB part of their driver development.
>
> Larry
>
>
Dear Larry,

Thank you for this info, it's very useful. Are you saying that in its
current state the GitHub driver would not even be accepted into
staging in your opinion? I am happy to continue improving it, but in
my mind this should probably be done publicly, within the kernel tree.
Not sure what others think but if there is general consensus then I
can submit this new version to staging and integrate within build
framework etc, then we can start improving it and getting it ready to
move beyond that. Sounds like your driver is further along the path,
and we should be using it, but I'm interested in what others think of
course.

Regards,
Phil
