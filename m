Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370E2C82
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 10:38:34 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id l25so113937764eda.11
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 02:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ehrJkM+CUHyrmfsopnJn0wAZnxmyyocrjM1q1kJwX8Y=;
        b=4VLkCG+dx7E1PduqHRximAmE4CE4XsvpcoGwk40OaUGmDIgAgtUYqiu9HGW45rgZAP
         vWig5fVNPVewTGflK6J+FZJYT12rlZIfs2WxqHGGnqOHbWxo9TPn143goxHaz3NNnewp
         dZ9WyQcDYqQG0WVIwm/QT34m81492gXUAFuCvdHAp70v0uOzWp1aZuXvfWBbDMOpqyGU
         D0jizlBvCN80AXlgbL3BvSQWJc1lSX84gQcQV9iJei8eQ6b3PogPOogxMIk0re6lJGJU
         GwVKPT8PQtyl+tqOhkJw8qjYrlaXoLgTCoakYy7AuAuQcJkZR3f5Ukza9gjjveT6TFcL
         tw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ehrJkM+CUHyrmfsopnJn0wAZnxmyyocrjM1q1kJwX8Y=;
        b=KQoiLmTjrHeGzEm50BCrp82EAwz5MzSeCSnd9a6t/ezqK+wGPYMNLa1sd4fWE3+J0Z
         T2o1QZ1T4BPKTBn8FLipdMy+DRbhufQtqkVlGPoHQOeDC5nO3u6/fMr0ggzFtZnKcFG1
         Hfw5sDGd61Oie4psRJ1aCreAfQjOgugO4A7zxYlQSZZLcLHnQd2cEv4BLz8sRBSdatjG
         pzwflIfSAydwseZJgohaIhsnXHly6LFzJqvM25Lt0muqZSityKgihXd7/EQFgSbftEdH
         fwj+Gnq842BYoEJbii4Up1NeUefW88CpK+Th3/ZFi7NtiGcGKEwpNNWf62I/ocoxS5Lg
         sqrQ==
X-Gm-Message-State: AOAM530rWIyEo0VEBwT76x0+QfVrx8U+puRlnV01b/FvYk7/XlT1HDiB
	LVhSu2WX7f6OwpsBkTPf2ZtWUfq7Kvc0yIhxIybEMQ==
X-Google-Smtp-Source: ABdhPJynjfOwGdomnFBHQfk0Yrez9pulbplqtsSoWO+V9YB8K5XokEPS3MPKhpOBfknmi+wqmilhplYP32bD4/X93uw=
X-Received: by 2002:aa7:d412:: with SMTP id z18mr16666950edq.315.1638441513077;
 Thu, 02 Dec 2021 02:38:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211125155001.622405-1-benjamin.gaignard@collabora.com>
 <Yae9BphwX9cGxhQf@eze-laptop> <cf0ba2fa2a166da6bb514c2aa997ceec680590a7.camel@ndufresne.ca>
 <862d4ee2-8a32-9bdb-ee01-b307660f78a1@collabora.com>
In-Reply-To: <862d4ee2-8a32-9bdb-ee01-b307660f78a1@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 2 Dec 2021 07:38:21 -0300
Message-ID: <CAAEAJfDJp_3Z7HO41j-PhU_Cb+=gj9KQ7JarMN=dky1DaJRyWw@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: Make G2/HEVC use hantro_postproc_ops
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-media <linux-media@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Dec 2021 at 06:26, Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 01/12/2021 =C3=A0 21:53, Nicolas Dufresne a =C3=A9crit :
> > Le mercredi 01 d=C3=A9cembre 2021 =C3=A0 15:20 -0300, Ezequiel Garcia a=
 =C3=A9crit :
> >> Hi Benjamin,
> >>
> >> On Thu, Nov 25, 2021 at 04:50:01PM +0100, Benjamin Gaignard wrote:
> >>> Use the postprocessor functions introduced by Hantro G2/VP9 codec ser=
ies
> >>> and remove duplicated buffer management.
> >>> This allow Hantro G12/HEVC to produce NV12_4L4 and NV12.
> >>>
> >> Can you add the fluster score for HEVC so we confirm there are no
> >> regressions?
> >>
> >> Also, please make sure to test with the UVG set http://ultravideo.fi/,
> >> as well as testing that NV12_4L4 output converted via GStreamer's
> >> videoconvert element.
> > This is a bit unfortunate for performance, but fluster will endup testi=
ng from
> > 4L4 with how the pipeline get negotiated. Will be good to add some env =
at some
> > point so folks can test their CSC.
>
> fluster score is still 77/147 so no regressions.
> NV12_4L4 is the first pixel format enumerated by the driver so it is the =
one used
> by fluster pipeline and it is well converted into I420 by GStreamer's vid=
eoconvert.
> Do not worry NV12 is also working fine :-)
>
> I have tested Beauty, Jockey and ShakeNDry from UVG set and I see no prob=
lems.
>

Awesome!

Since we don't have any form of CI (yet?), please add the above to the
commit description
and re-submit the patch.

These drivers are a bit fragile unfortunately, and without a better
way to keep track
of testing done on each change, I feel better having this information
on the commits
themselves, specially for somewhat invasive changes like this.

Thanks and great work!
Ezequiel
