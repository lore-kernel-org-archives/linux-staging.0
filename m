Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914B06D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 19:45:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id e14so10405661ejz.11
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vT8V0pxZKkWGNrSwjIst4xZQ3JRTUytna9sd7X+Ifc=;
        b=r3ByeAfRml5P26RhY7xVUnS3OQO7CWqiSfKHe32BZm209A6l5zDfBc3l7fq3bMrjDq
         UFI9RA/eNo3CR59j7sm7LxPTp3afskPf9WtLFb1cuImdAFZWDIMaN1CGOo1gI1Yq/G4X
         0FR92g62s4g7YZenz9mJTGIG2Fx+JfPA2Jo8EPXbW63K5UgK+a0QOLX2DDXEF0wjsET4
         Qcw16HpipocVMkYsSi3cJdjNe3a3MZNN+B0ODDBynmuSzNkEBWloooekGc0ZSkhniwo6
         TsBlxk3muPPQu3Ps42z0mY1l4DNxUJbjklzsqdrRw4fttPoPvamWafiCka4zVlKKJIMM
         cO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vT8V0pxZKkWGNrSwjIst4xZQ3JRTUytna9sd7X+Ifc=;
        b=EP9O1owuxnK9ZSOjK1i/bTqUg3bGoHQkL9sLjxgW7aGv+xZMasHlSND05TW1iMuBwd
         iWFqyr0CfG0vee4WT2l2L2IHl5VVDYKKFwxXXF1LqaJCCX4JC5dU/7x/32sN5SLFBw9i
         +v1OgiEk5p6oQ76MV+q6xL7IxgfOpps2QP0hPIngmG9BVVxC7kRpLf0IjeFt6istNzpY
         kAvbG888WhHGqZ7IhFKoYUDGVYpWTKyg+C7m4RunVBi1USBqm9Yk55DcZAMdecbPeofs
         4mAYwSaMh+aAMCnSrW2BtJB8SeIxZJvB2ZYqYf9+gJwhwOedbYI3giHvCPGrpWAkCiAh
         eZqQ==
X-Gm-Message-State: AOAM530ZaJZZSWxewE5YWXQX8ivY0NLIf+jyM8TCGfDElbNm3hTf/sjz
	NQkXeyfa8E1AzK2E2A22mvksf/Gcz14XV+wZV/s=
X-Google-Smtp-Source: ABdhPJyb6M/jI8IjgD7u+OnkLiMX84rxCMexdaX3dMEISRPagxLNMDNTlnZ1PVAyGjloCdXyZsVHE+fUwgit1uwqdRw=
X-Received: by 2002:a17:907:e87:: with SMTP id ho7mr17221105ejc.2.1617997527137;
 Fri, 09 Apr 2021 12:45:27 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YG+Bcqxetfj98l6V@kali> <479be6a4-2e6f-98a6-045f-d7c2132137c4@xs4all.nl>
 <05802da66d3751611b85eb63d566220e09ef4bb7.camel@perches.com> <CAHWmKdgj67+T=tWKPMDRt1fbLm7_VLiOmgKcrzBj6oCd5Xv8sw@mail.gmail.com>
In-Reply-To: <CAHWmKdgj67+T=tWKPMDRt1fbLm7_VLiOmgKcrzBj6oCd5Xv8sw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 Apr 2021 21:45:16 +0200
Message-ID: <CAFBinCBOf9U41r2oVOA-b+m3H=iQvjn6qYxLDLTH8LBhAwjyEw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: meson: vdec: matched alignment with parenthesis
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: Joe Perches <joe@perches.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-media <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, 
	MITALI SUNIL <mitali_s@me.iitr.ac.in>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 9, 2021 at 7:00 PM Mitali Borkar <mitaliborkar810@gmail.com> wrote:
>
> Looks good, will try this.
if you re-send this patch then please include our mailing list:
linux-amlogic@lists.infradead.org


Thank you!
Martin
