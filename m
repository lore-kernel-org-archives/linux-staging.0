Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEE18F65
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 17:26:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id f27so14750115eje.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 09:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NV08U6xHPyg0UaSVwP6PfcZOSsUP/5GZvrfcRdYDLS0=;
        b=lBa8PRc7BGxEmXsVGVuHecMAlZ41oysW90dh3ZlB7//RXOu2DJs4spnom3Xm3vTprH
         bYzodfr5s3w/II3G1U+jgtsT9sijkICX0s8eRo7+PUzUUMdC52ZhqGW3AiqLGpLwal/l
         DVyEiHmt4YVmhV3FGR0RtDgyHlUDCMVLnNZO0Db61ToiIhnnncZv1YizGPRs3OUjOP/D
         Sc+0zuRhA8ODeCMcN8IMEw+y3E6railg7P6pOLsLBcAJsAFGxtgPsmtOlVablo09Vc5G
         psBaR7DdyISjAXlScHRJsu321ygf7zPq3n3VI7Xmls0Wq0xylE3y0RlwLW3qmrl9QHX5
         Q+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NV08U6xHPyg0UaSVwP6PfcZOSsUP/5GZvrfcRdYDLS0=;
        b=VkShP34hLG6BS4HM48rZzw5EdnzxFHjgxGfKq9LHtz04RJjEvod90KMoqf3pMsyToL
         +haaOrX+VZ3nXXF840oX/Ud4gNDlAyW+yvTcDJcQilFWRCY7wk78hYSS5p5jbq6Zkqzz
         8Q2Cu00C9o4BBmVgAToFKjUv66H5o4LjxFLoYEOtdbfCJZTvSH54UTsSHZ2FzFZaA0Oc
         tqaOztECPtmMD/eXnf7NjVnC0KzUOVQFp/YYgnVDXdm55fr3WrgZFovUHCnhur0RoFxd
         3ZXDBFFx2N0QhkwOFRdHAkjhwwJP2qcmvnu1hmoz59q4W44H4Xyjb8M2q3Ck9qImmbij
         KI6w==
X-Gm-Message-State: ANoB5pnez/oVodbDh4rC1GRxlsxkecoe91N6zPCtiTkwjYQOMtWd5JQP
	xKnsfjd1xFu94Rkgeox1ZnMJvHabHJdUOuJQDJGuDw==
X-Google-Smtp-Source: AA0mqf5aD7hFWVL+UyV9oM42wn1EyVwXowkgyqanrBYNAi9JFhTpJCrA59g3ARNLkMBmxP9WaaQK+1JuwEpkydtHdZ4=
X-Received: by 2002:a17:907:378:b0:7ad:db82:d071 with SMTP id
 rs24-20020a170907037800b007addb82d071mr7124611ejb.200.1668792367597; Fri, 18
 Nov 2022 09:26:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117160015.344528-1-umang.jain@ideasonboard.com> <dd05ca8a-c60c-a56f-66e6-9892cb933315@i2se.com>
In-Reply-To: <dd05ca8a-c60c-a56f-66e6-9892cb933315@i2se.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Nov 2022 17:25:52 +0000
Message-ID: <CAPY8ntBDkme2nuYMAsMtkycbjnQ8CR2CU70EWPiS_R4KyoQySw@mail.gmail.com>
Subject: Re: [PATCH 0/3] vc04_services: Promote bool usage
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: kieran.bingham@ideasonboard.com, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Umang Jain <umang.jain@ideasonboard.com>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dan Carpenter <error27@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Stefan

On Thu, 17 Nov 2022 at 18:11, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi Dave,
>
> Am 17.11.22 um 17:00 schrieb Umang Jain:
> > In commit 7967656ffbfa ("coding-style: Clarify the expectations around
> > bool") the check to dis-allow bool structure members was removed from
> > checkpatch.pl. It promotes bool structure members to store boolean
> > values. This enhances code readability.
> >
> > Umang Jain (3):
> >    Revert "staging: mmal-vchiq: Avoid use of bool in structures"
> >    vc04_services: mmal-vchiq: Use bool for vchiq_mmal_component.in_use
> >    vc04_services: bcm2835-camera: Use bool values for
> >      mmal_fmt.remove_padding
> >
> >   .../bcm2835-camera/bcm2835-camera.c           | 30 +++++++++----------
> >   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 18 +++++------
> >   .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  6 ++--
> could you please check these changes to be safe? I'm not sure that the
> affected declarations are really internal. I'm afraid this might affect
> firmware or userspace.

No problem. These are totally safe.
As I've commented on the v2 patch, if it were in the mmal-msg*.h files
then I'd be more concerned as those are matching the firmware
structures, but these are just internal state.

  Dave

> >   3 files changed, 27 insertions(+), 27 deletions(-)
> >
