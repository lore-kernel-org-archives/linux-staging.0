Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2318572
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 18:16:55 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id c6so13455789qtc.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 11:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SzVy8JflJE6VXT5JeDWyenyHzsFPZ9nxiTnDoe1PycE=;
        b=LqgS+qC27bKzUmYEgRQ5yMm3F3XmxxNCDijrZCPNYEoEGyZXG+vzDb/Cp/Sbx3z+Lh
         n3u1Obm/P/L0hfs8hxUUfWPM7t//qb1yjFZ4iUmtg8rW5lITwm8qfATgPIQFk5d3NoG0
         3mak+heq+gIhbWDGuvFlNRr8/qB+EjkxiWXYF+zeyCyi7wkQeICw/5yo8btW6no9HcDq
         HJ/SG5i7/iZZ8UTncNkM9wK/dLhvmbD6vSwC2rnC594lWUZEGPTYy4/BNiVW1ffN4OlJ
         nwlpqF5Tw6Jc6ztvkIDTwjbB48XPFEBJ86hr5huFxdoHXjhpqE0JTOXqsvn5oKEqjGzi
         utvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SzVy8JflJE6VXT5JeDWyenyHzsFPZ9nxiTnDoe1PycE=;
        b=Ykaf726wbnMsb8QzuqCAPREubB2mZBQtNTHPrwyJJyZFA2vo7qL2+xTKDYR4inah9b
         syzTmAzisWFjbJMfZb8Pf4UjEHeqL4h7rUmNkDDrHwpCfaCh6jwUZ/GRTD2cSP8CzxHy
         zNulCmYwiwzgxGKZs4EWNYfwhroIwf0ESfKVLd2mvN4bH7F3taSfH4ZB9G3Uhz/NhNpr
         5zNksEulIvPeTHRozxlLU8NiIKm+94p6ZqkL/TTJK49Dwav2Z/RKikdZZDVFizgybwyV
         gjcjsLsEULxxxHS/7J4bAA03O/2qArX/EcjBRcLonY+oz77QnxwpfH7RVG824wxGTzQ1
         bthw==
X-Gm-Message-State: AOAM530eXKUw8/WtzyQD3KWAqB0WqYnYi0m6VtSSTT8a2ehvso8DOwnI
	a+e6/aB+DdKIGmE+QpAFb64=
X-Google-Smtp-Source: ABdhPJx2wnxqvzZi0DBl9jtQWB/nhV4e+Vx0EYaVs6BOtoKl1Bp1v4tBAvw0qWSdjHXw3Wwx1wA/jw==
X-Received: by 2002:ac8:1e0f:: with SMTP id n15mr17632906qtl.9.1618337814282;
        Tue, 13 Apr 2021 11:16:54 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:83a0:18ef:c76d:6086? ([2001:1284:f016:a037:83a0:18ef:c76d:6086])
        by smtp.gmail.com with ESMTPSA id k18sm10697750qkg.53.2021.04.13.11.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 11:16:53 -0700 (PDT)
Message-ID: <68c7a01df0d71708d63f66c7d40b64f7041faeee.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH 1/2] staging: media: omap4iss: Align
 line break to the open parenthesis in file iss.c
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date: Tue, 13 Apr 2021 15:16:50 -0300
In-Reply-To: <6823f86b-843f-1abf-e8b7-7be1044b7150@xs4all.nl>
References: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
	 <aed4449f7f054eee329a808527c2a08d79076c78.1617994571.git.alinesantanacordeiro@gmail.com>
	 <6823f86b-843f-1abf-e8b7-7be1044b7150@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em ter, 2021-04-13 às 16:32 +0200, Hans Verkuil escreveu:
> On 09/04/2021 21:01, Aline Santana Cordeiro wrote:
> > Aligns line break with the remaining function arguments
> > to the open parenthesis. Issue found by checkpatch.
> > 
> > Signed-off-by: Aline Santana Cordeiro <  
> > alinesantanacordeiro@gmail.com>
> 
> Obsolete, a similar patch from Beatriz Martins de Carvalho <  
> martinsdecarvalhobeatriz@gmail.com>
> has already been applied in the media subsystem tree.
> 
> Regards,
> 
>         Hans
> 

Okay, thank you for letting me know.

Aline

> > ---
> >  drivers/staging/media/omap4iss/iss.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/omap4iss/iss.c
> > b/drivers/staging/media/omap4iss/iss.c
> > index dae9073..c89f268a 100644
> > --- a/drivers/staging/media/omap4iss/iss.c
> > +++ b/drivers/staging/media/omap4iss/iss.c
> > @@ -960,7 +960,7 @@ iss_register_subdev_group(struct iss_device
> > *iss,
> >                 }
> >  
> >                 subdev = v4l2_i2c_new_subdev_board(&iss->v4l2_dev,
> > adapter,
> > -                               board_info->board_info, NULL);
> > +                                                  board_info-
> > >board_info, NULL);
> >                 if (!subdev) {
> >                         dev_err(iss->dev, "Unable to register
> > subdev %s\n",
> >                                 board_info->board_info->type);
> > 
> 


