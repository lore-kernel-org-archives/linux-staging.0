Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120223FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 21:59:47 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so2763582pjb.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dV2HwutanGEMSVTHUYToK72cxw7X/GcO81aNccR4QPw=;
        b=F6A829Luql9VwPos1+eSZTb1jv9suIGsQ9Es/k7eT5czwSSzFPjXCHwEWL9hVGWdAq
         33f0ohCHpP1vvs2j64TxoV4jl+0Yy8kb94m3ExVE3r0qKi7eNLA6W9jAVjLNwBDJGH9a
         hPyZEoKEByq9JI3IKvR/mwExVEmxB+ZmuR+RsGwupQZEshercoENGqNV3anIoWQSqYCj
         4wOB+Os0rKDK2gE3ZmtBvRgwZUC2o4rl+vVU7ebW5rMDPcOxDKuUvm3lzAayX8FFe+Qq
         FomCB88pOL9+7Ur0jMnIa4jipU1xPjE8pwfR8H9k9TDQUlG0LMPHuxwmmR49B+ZEf74+
         CRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dV2HwutanGEMSVTHUYToK72cxw7X/GcO81aNccR4QPw=;
        b=bfWYyIheqsFPh5Rr4JTOKd+X8JGUr0zWfjSSVJzQSKthuiqt7aCE5dxjKHp9jsKbJ1
         4moqagsDZzAb2/lAAbNGpEwLF3gItpIbPM7tQjZ0mEmzaBKfNlAXbPnyUp4DR8LEhi8Y
         o/yrc70NjpFj2axAIxWqoMaVwqykFE2n/4xWFTF+RNUD1KSlexz+NpkXxYU2xuTcA0C8
         ewcoI8bepObwCimKF7+Fl5LVqa4xH5lj70EIlzy5/AnWu6Ym7osqJEbnpteuK/rwbPX6
         JR5r07jHQKA2shnL7tLiseMNrh+ZAS5xjhqhiaopVva9d20g2jvleW6y5RYnjRYAFpt+
         28bQ==
X-Gm-Message-State: AOAM531/JwMPcm3i9v6SLAKf3splHI7BZOgFsUyurY12D9LHftfat1yD
	roVPdgn+H5wzBKj6wUM1W+Dh5IHrGXAwIdjXeIHdOg==
X-Google-Smtp-Source: ABdhPJy+DLYO6OTaxf0RcnvBKHSGXpxxWYAoSxW3W2cKgQDk6nNLo91Jd1N006ED3qUtEDGro0cCfvrbp1EZ9B4HOLM=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr6727425pjq.217.1629842386524;
 Tue, 24 Aug 2021 14:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210823223751.25104-1-fmdefrancesco@gmail.com>
 <CAA=Fs0ki91VvBOd2Wd59KqeCN+BmF-eWv+r0sH+e3fUG61Zxsg@mail.gmail.com>
 <15825589.4VbMHeJK9p@localhost.localdomain> <1815496.OexNakQ7IY@localhost.localdomain>
In-Reply-To: <1815496.OexNakQ7IY@localhost.localdomain>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 24 Aug 2021 22:59:35 +0100
Message-ID: <CAA=Fs0k1RWbHqzW73rox+yN+rMiP0sDeMFdiVCjL92XFJ7=gZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Aug 2021 at 02:38, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> Dear Philip,
>
> I think that I've inadvertently switched the order by which usb_control_msg_send()
> and memcpy() are called. I'm very sorry for not doing my tests, but (as I had said
> before) at the moment I don't have my device with me.
>
> I'm about to send a v2 series.
>
> Thanks very much for testing on my behalf.
>
> Regards,
>
> Fabio
>
>
>

Dear Fabio,

Just going through my e-mails now after the work day, so sorry for not
replying sooner. Don't feel you have to apologise for things like this
honestly, we are all human and there is a huge amount of churn on this
driver at the moment. I know there are subsequent e-mails indicating
this was not the problem anyway, but in any case, I am happy to test
when I'm able to, and don't worry if it doesn't always work - my code
is guilty of the same thing constantly :-)

Regards,
Phil
