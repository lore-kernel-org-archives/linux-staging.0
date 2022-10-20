Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4FD7E;
	Thu, 20 Oct 2022 10:15:51 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id a5so12443721qkl.6;
        Thu, 20 Oct 2022 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QwJgtBGQmZdLQupX+ESzBTFLWc6n9kUQz57Nvp54uJo=;
        b=WjJRlkVwDhD5PSVz1u9sMYo53DGbNpPiqdwbF8DP2N2sVl5DeBvNoQBiho7Izg6l/y
         fz579yHz2NjGfna2wVbnnV4B91fz3VnH30TwNqwi+QsSbYqI+eX11Tm2n+dPKEKhvoPI
         b0MVjjPLaZIUHETpAHDw4v1MSBInxw5YbCwYzHsOimSoVQsoVBXMvCKZ2E8/B5FCckzE
         aaX11127bsTkYVoNJj33z4B0KEEAXrNGdBBvINDmjGiRwcFFRjWFI3fSTfpW1W/suU7h
         ejZ9tEhCcozNmh0c1bq6uAS7bTnpKs+6yYTj1SqRKLJk7vqN7c0MI0nb2tozCUExRHen
         6zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwJgtBGQmZdLQupX+ESzBTFLWc6n9kUQz57Nvp54uJo=;
        b=o3TNedzcKSxxbIGTSH+kv9oYdnNBFKOLjdDM8ClUpty8JaNPGh8H+UZmX6IX+35vXM
         ZvtWO9CatFCI1Upqhjr6g/Q5vqOzU8Imh0ukqGrET73sgzXHOhYE1Og8qT45uHNdij6B
         jVpVm0yF4Nh9rFHwSGQ8fvFRB6expjEusyUFdwJe/U42KjZQSkJGdoJ8jgUtDyBrdHOt
         T/B3l8EuKKXpaDLQAdX7LOb+TtoomTOCfAbxtmHS2Qa/JO3aYS3ER9jO0vXp/t/pOBOD
         lP6PTt6YIMcCzrJrRe/oCVOKXGhtbrFTOgWLN70ChN/2KKEN34HbDwF+3sChb2gWKfYX
         QedQ==
X-Gm-Message-State: ACrzQf2v82gmSPURR35o41X5zxW7uIuZmPrQUql+ZSVRMZuxMYMWa2/I
	tRItozRiu6wYXm6Tgsth43QVSveaCfxDlPgmrNzF/XikJWU9HiHAc3r4/A==
X-Google-Smtp-Source: AMsMyM678yzTbhZ6Wi35yGYH3+/dUCyMJ2QqvzaXS5CMEpyZXZK9eRLCliTGMAJ7WaDpOQE+ec0KBqq7mWEi2x1gKi0=
X-Received: by 2002:a05:620a:22c3:b0:6ec:53bb:d296 with SMTP id
 o3-20020a05620a22c300b006ec53bbd296mr8532799qki.158.1666260950158; Thu, 20
 Oct 2022 03:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1BN6wPMrpxPB3qP@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <20221019223446.GA154747@nam-dell>
In-Reply-To: <20221019223446.GA154747@nam-dell>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 20 Oct 2022 11:15:38 +0100
Message-ID: <CAHJEyKUsZ-V0waEwBEy67g+MNMR29MGJbBx3qCA4axKyPk9RGQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: vt6655: Fix Lines should not end with a '('
To: Nam Cao <namcaov@gmail.com>
Cc: greg@kroah.com, forest@alittletooquiet.net, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 11:35 PM Nam Cao <namcaov@gmail.com> wrote:
>
> On Wed, Oct 19, 2022 at 07:20:11PM +0000, Tanjuate Brunostar wrote:
> > Code style warnings reported by checkpatch.
> > Improve the layout of a function header:
> > Put the first parameter immediately after the '(' and align the other
> > parameters underneath it.
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> >
> > ---
> > v2: put static and void on the same line and adjusted the indentation as
> > suggested by Greg KH
>
> I think he meant putting "static" and "void" and also function name on
> the same line.
>
Oh I will do this now. thanks

> Additionally, I think your patch introduces new checkpatch problems. Did
> you run checkpatch.pl on your patch?
>
> Best regards,
> Nam
>
Yes I did. the checkpatch says this:
Alignment should match open parenthesis
#89: FILE: drivers/staging/vt6655/rxtx.c:89:
+static void s_vFillRTSHead(struct vnt_private *pDevice,
+               unsigned char byPktType,

The only way to resolve this would be to add white space which would
generate another checkpatch problem. how do i fix this please?
