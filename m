Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19776322E
	for <linux-staging@lists.linux.dev>; Wed, 28 Jun 2023 16:38:15 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-44360717659so860270137.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jun 2023 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687970295; x=1690562295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rn3u0ULRq3S4nohWqNLCsgwds6G/tMj1KjrgHd3RE7k=;
        b=m/za4tWDIYnI2zMaoIm+KspBwG08+McjjOvGNux9yOFaSd2K2FNh3j897DjpYvolI2
         4QuKFFK4wY1P5HKSh8lI2eVj9W1mtX860faimjaMhaEhSba1RukzmnLy8CgdeOYjLDKH
         UZ04avTcID9QXuO3a6bNDGDIzjO1Hwl25y5DSiF+ez0ScXdT4XGTS3xIxl2l8UnNSIq2
         QbTnWr0awRrUMPOvcrpsWa5+1FLo/UpRxRDUshyZiJGhWfncm8V7LCAnUIsfjs+7SK1v
         rKPiT5w48Twh6go9C2tk9R6Rg4ptfnN5ToTm01CDtbDQVDeV9Zw6tS/FqyMlGDjSieSC
         If6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687970295; x=1690562295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rn3u0ULRq3S4nohWqNLCsgwds6G/tMj1KjrgHd3RE7k=;
        b=Qh9EHTMA87FmMGViQCRKGTNuXvtPE2F/9H3iAfgCDeAMDmeK8r6ytezG5/ftpsYusf
         pO60C8dDVx7jF+rElmd8UC7RkLWrvvNUevqg1CTAKUpypQLhFOY/AiZmpYn936L0Ymsc
         NDYKCLR059Ju6Gv3lSOIXY+D4frmUTz4XMaP12S/1v46G0Xw4PAew6wj9qQuObsIGBD1
         uZSQNuYozd8hsshdIVR3DIib0G2TxjsTqsFnfK53toWn8qVquimry1/h1tOtWmTCqy7r
         wxeiMNt2VhbdFcMOO/aDio8E4afvhhfKoKPEyyJsqIt+Ht5GwVuCrNhSaPlgZNo7ji5x
         gLFg==
X-Gm-Message-State: AC+VfDxk9PS/dUGohlN7frSnvmZHLzOEIBVmK5BQuA66yxeu+UeWSSFu
	/SOJFCHD0nfLY8W6L/wO8NTgw6kK3yFnlko/vHI=
X-Google-Smtp-Source: ACHHUZ5WOSszSUtM7ee8J6Hjl5/gPi+ToBpeawbfMHl4UHDUxikQBhuXzAoFEtx+jyvpV6XiBzOisEYI1GgSB85h0F4=
X-Received: by 2002:a67:f487:0:b0:440:b564:bc37 with SMTP id
 o7-20020a67f487000000b00440b564bc37mr810987vsn.3.1687970294736; Wed, 28 Jun
 2023 09:38:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230625155632.32403-1-franziska.naepelt@gmail.com> <7caa96fb-4fb6-fb87-5d0c-fa6985fa127b@gmail.com>
In-Reply-To: <7caa96fb-4fb6-fb87-5d0c-fa6985fa127b@gmail.com>
From: =?UTF-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@googlemail.com>
Date: Wed, 28 Jun 2023 18:38:03 +0200
Message-ID: <CAAUT3iM7eAYH5AcN=Ko9jDstEUGqXxG7Q6qjp4O9qF_e2WkUVQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix some checkpatch issues
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	eperi1024@gmail.com, hdegoede@redhat.com, quic_vjakkam@quicinc.com, 
	johannes.berg@intel.com, tegongkang@gmail.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

Am Mo., 26. Juni 2023 um 19:09 Uhr schrieb Philipp Hortmann
<philipp.g.hortmann@gmail.com>:
>
> On 6/25/23 17:56, Franziska Naepelt wrote:
> > This is a series of patches to fix some trivial checkpatch issues. Not all
> > issues have been fixed. I intend to submit another series to fix more stuff.
> >
> > Testing:
> >
> > ---
> > v3: Series to contain only remaining patches.
> >
> > Franziska Naepelt (3):
> >    staging: rtl8723bs: Fix space issues
> >    staging: rtl8723bs: Fix alignment open parenthesis
> >    staging: rtl8723bs: Fix remaining blank line issue
> >
> >   .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 164 +++++++++---------
> >   1 file changed, 85 insertions(+), 79 deletions(-)
> >
> > --
> > 2.39.2 (Apple Git-143)
> >
> >
>
> checkpatch prints the following warning:
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Franziska
> Naepelt <franziska.naepelt@googlemail.com>' != 'Signed-off-by: Franziska
> Naepelt <franziska.naepelt@gmail.com>'
>
> I propose you change the git email matching the one that you use to send.
>
> When testing you can compile the driver with this command:
> make -C . M=drivers/staging/rtl8723bs
> Typically a compile of the entire kernel is not required.
>
> Please use the subsystem and driver also for the Subject line of the
> cover letter.
>
> Bye Philipp

Do you want me to submit v4 to fix the email address as well as the subject of
the cover letter or are you ok with me promising to make it properly the next
time? ;)

Thanks,
Franziska
