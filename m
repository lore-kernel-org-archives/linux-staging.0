Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849063FC2
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 23:52:46 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id j4-20020a17090a734400b0018f6dd1ec97so136502pjs.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FG/pYWFsSA3T+3BAA+Wi6BNUREpJHMlJfeblR+ZnRZM=;
        b=zWvc1RTFuWYM96/bFVx2WLla7i/6r7p88rCrraKkRFBBcqIbc5m3jBbOZznEQHX6Ut
         jWQFMbDrwflZxka36wa3Tq7QkkYrKfDo6LWsyuR/yIMT7whCq9jajlqo6vWPmAGCkHJ+
         rC1SIrzXeA9GWARGx2wNLhlaKymPAdJquRnbsjFMt01nyR882rcdpO0UXRCXpq7HktNF
         DXVrkjd6mpC+OWGQ3QWcUJWDYi6GmRKlqIjBnhldB8+S8rvqVCH8YYgwoxaIDVDHB40U
         qtdRk9vGu7GiCnnNKwsDIsRpFVfEUlUULq6f5naT8AB2qogWTTjA5f+RvD+FvgsIWSJB
         wlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FG/pYWFsSA3T+3BAA+Wi6BNUREpJHMlJfeblR+ZnRZM=;
        b=KToMxw/p1RjpWBMCNDuk7Q97PFGQSm/k+bfhmNHxloS+OoOW7F5bcNh7RZj8eiTGjt
         JKDdd6KfOqBUwwgq761y6NmowI3uX1DlUOChSyO2HC+OEyMG7a4Qu+mLQeRLlsK3Mp4l
         LEvV0ZHfARpq4PvRU0K5RawtKF5hqTKRv3lopu+OlKGBg1ZoQ6LuYcqgMcAgAU89NbL7
         sveDNhl3pk4dv6YdHXLDirRYb9qVo14PPSBfzisLOlTJlm1J+FEEHx3XEm2SZC9efUNj
         BY0lMJ+Y3M8S2WdInaemw9nxdkFDxcpFuiOSsAUdzZq7yi6ycQt7S0RasWHPpXLKUsVC
         f34w==
X-Gm-Message-State: AOAM530yXBLN2Hh1DzlCbc85zCjxiMdRzZFYGQseE7nfUybuQGOaT3ii
	FzXATgaJyGb7E/V4IgozQ2VGSnlfew09WfBpG+pCbA==
X-Google-Smtp-Source: ABdhPJywXbBUt7zvlfpA7+S6NUqcWiiUKoapfd/G7jUZCaCqb3Z4dq5QRQr8npJdhbsD0+MGGfUZzi60eydB81vrk2w=
X-Received: by 2002:a17:902:6ac6:b0:133:230b:e8bc with SMTP id
 i6-20020a1709026ac600b00133230be8bcmr5461582plt.22.1629676366155; Sun, 22 Aug
 2021 16:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
 <cover.1629642658.git.paskripkin@gmail.com> <44fc34ec-6bbe-9cd0-0c51-78836bad7e0c@gmail.com>
 <d479bf75-f031-136c-3967-16127ed26868@gmail.com> <9809a91e-c524-9c6b-67e3-8a9c9b91628e@gmail.com>
In-Reply-To: <9809a91e-c524-9c6b-67e3-8a9c9b91628e@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 23 Aug 2021 00:52:35 +0100
Message-ID: <CAA=Fs0kW3hU_O-fe6qjrWLTUsDFqs6TgWF8zEqZv2t7jPw0DYw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/6] staging: r8188eu: avoid uninit value bugs
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Michael Straube <straube.linux@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Aug 2021 at 17:26, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 8/22/21 7:05 PM, Michael Straube wrote:
>
> > Hi Pavel,
> >
> > My one is a TP-LINK WN725N (not sure, but I guess v2).
>
> Wow! I found this one in my city, thank you!
>
> > You could also have a look at the device table in os_dep/usb_intf.c
> >
>
> Yep, but I wanted to hear from driver reviewers/maintainers about what
> they use to test. I guess, some devices could be broken or not unwieldy
> to use. Thank you for recommendation, will buy one in few days :)
>
>
>
> With regards,
> Pavel Skripkin

Dear Pavel,

Glad you found one :-) Mine is the N10-Nano as that was all I could
find at the time.

Regards,
Phil
