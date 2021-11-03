Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3042C85
	for <linux-staging@lists.linux.dev>; Wed,  3 Nov 2021 14:35:34 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id f4so9872118edx.12
        for <linux-staging@lists.linux.dev>; Wed, 03 Nov 2021 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CByJ2uWF6xZdqY/Jyt0Y0rDuvjgikIkxQadq3PJ48O0=;
        b=dQvabTYVGPVKpaBRsU5ZArappxUZv1uP7hFP0poaqFaon4o++HOqzaJ2l3Aq+LDSaH
         cjkjlSdDTuCDfz7YJ3fk6OSLPTDp22nMO12ilF/0tFPiAFx3BLAtbKe/jEjmmlR0DsZ3
         vIa+Gti119IsH9bDtwTnw6NM27rUsyJLrjgR9Hk1Y04rWj093463cnaGv2bwfFJN6n8/
         I/StKulMIQZNRCIcOVu2/YDMNaEqaQCWCtFaxVsc5/PkKXI4e72fEfGvI5hELW/Armyj
         +ZnKZv3ffc0gvsu4n2NlCIyQJrWpxuBQ1HvA4qYO9TqqVAVJBZpmKYNCchkHyA9rV4/h
         d1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CByJ2uWF6xZdqY/Jyt0Y0rDuvjgikIkxQadq3PJ48O0=;
        b=KiKOw4kPRWUtQvTFCYDRaNbgl9VoPocK/2CXY9B5xMJfPB0Uz7cLGuQlVe4CNWJfrw
         ETPtCiAvGLgg7CvkX5mlDCtD7FSh1m5sECxgUIaXj+4ungKL4IzteeXHTc2R58kpSseC
         ASv/RfSWbBvkhIUPaWN5rTqm+ChwY1sd8F3BBFzSxF8rUsutXhrKarFbNDjcVo8iB+EE
         BkarrS2PvaYU/yi45WuEeKh/ljNHzP/VNumQZd+59KBr4GYwj2OhAfKWw96IGsfv0rmN
         bV6jzjOr6DLS30FRtbHurZOADkAbKukYqLdj6E0nhzI6dJ3ySliMG/l4PxL1U2EJHUrO
         l/zQ==
X-Gm-Message-State: AOAM5335xI6ixmhPfDLwGHKGv/aPwK6lff0pD0bmJ2dakBPLiMWH8CTf
	zy0kdlCh+/udu8kcaGgmVdfP90cQALDjfPHXQRg=
X-Google-Smtp-Source: ABdhPJzq9+wLGi9ITQa0cEXGEipuMzevr5v2gchEoOPbk3TiU5aGmIfc2OL8lygajTbjcfLuPWykgMiSRdPk4KsIr30=
X-Received: by 2002:a17:906:9f21:: with SMTP id fy33mr54543559ejc.567.1635950129415;
 Wed, 03 Nov 2021 07:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211103135418.496f75d5@sal.lan>
In-Reply-To: <20211103135418.496f75d5@sal.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 3 Nov 2021 16:34:39 +0200
Message-ID: <CAHp75VehnnD7VPYCH0YaB43_UvWL=FzfgDkYJ3PhgrK8PhQKtQ@mail.gmail.com>
Subject: Re: atomisp current issues
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller <patrik.gfeller@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Kaixu Xia <kaixuxia@tencent.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Yang Li <abaci-bugfix@linux.alibaba.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alex Dewar <alex.dewar90@gmail.com>, 
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alan <alan@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 3, 2021 at 3:54 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

...

> Currently, 10 video? devices are created:
>
>         $ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
>         /dev/video0:    Name             : ATOMISP ISP CAPTURE output
>         /dev/video1:    Name             : ATOMISP ISP VIEWFINDER output
>         /dev/video2:    Name             : ATOMISP ISP PREVIEW output
>         /dev/video3:    Name             : ATOMISP ISP VIDEO output
>         /dev/video4:    Name             : ATOMISP ISP ACC
>         /dev/video5:    Name             : ATOMISP ISP MEMORY input
>         /dev/video6:    Name             : ATOMISP ISP CAPTURE output
>         /dev/video7:    Name             : ATOMISP ISP VIEWFINDER output
>         /dev/video8:    Name             : ATOMISP ISP PREVIEW output
>         /dev/video9:    Name             : ATOMISP ISP VIDEO output
>         /dev/video10:   Name             : ATOMISP ISP ACC
>
> That seems to be written to satisfy some Android-based app, but we don't
> really need all of those.
>
> I'm thinking to comment out the part of the code which creates all of those,
> keeping just "ATOMISP ISP PREVIEW output", as I don't think we need all
> of those.

Are they using the same microprograms (named routines) in the firmware?

-- 
With Best Regards,
Andy Shevchenko
