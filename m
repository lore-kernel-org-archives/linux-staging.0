Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3245C72
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:29:34 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id e14so2203998plh.8
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 00:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VChO2omdBa6xBgyLh+TiNRJBuShA8yMRkym4wucTZ+U=;
        b=bIka9d35xriT8BASCxSqAQ/fwBpHL+tc3JRmwQAwzFAcZ1wO/uqV+SY2melq59GRL4
         FMoLujsWglvOZZVG89dq06LuO/Ln3PUrUK/vVciP3Ur6xk9hbPX9GUglSbBw4cDYB1Fq
         t4cp557idlsREaf3Zc62BSykTtp0ZEv1N77V21UT6m1EoXx9AdiDkC3hoen4IgvUOqNi
         yjDNjBQc+e9XXvw5CRazomKKlRUWoTawYPOQNTWwQRbFpxFhE3pK15Ud2PU6Aes4ewy4
         m2nVfmtoLG+sLaa+JfoRzVK3cx6l3JfHRyJW+3GEPacs2JSoD0MMTvSf/CAxGd30dHB/
         O4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VChO2omdBa6xBgyLh+TiNRJBuShA8yMRkym4wucTZ+U=;
        b=q5ciS5xqtug8QVkGUqRJNpHX8Ryee4PpkKI2ZFlwcd5RIeHuzThkFSn2Iqo7l5F7Hk
         1W/hRDb8FTnFsS0is4ZzzOp1WmognnWB8BKoY2XCd6dr6vEPvJgBOEyMEIm8NWVFGqrr
         5W2qK78ysNjE73C8vdLHIqUvvUqvFcOwH/Tlz/IbeW9jQB2exlnTYi4+55bgL56m2ISt
         865rB6uPyL/cYoA2haCGeQeiQiNKLVA007jAPADueP02aX1xg7POKswYjlJKre6hVlzb
         RsDjhXXs3zAvJBJpF2j8NBFt2IH5Z1ALh4OtGyJv7aYBjS8B3dEXLTDvSOOeUxM1a6Oj
         wU5A==
X-Gm-Message-State: AOAM532CMWxSviOfdEuh//U2Y5AM2CxgLLtU9Pr0RdRWH6cMwYSg99GH
	epoX/sBUiF58/t8JigdRBbFk/oQpLWaP+ruWr7r2ZCWeJ/Q=
X-Google-Smtp-Source: ABdhPJyyIiBT26wWo5YKktkUlF+hQhlBTD8cptsVoIIWiyN31bUFz3Cx0Zn7hnxl+WqrI082dPPPk1R9Nb6MuVwbwwI=
X-Received: by 2002:a17:90a:1f49:: with SMTP id y9mr12540527pjy.225.1627025373613;
 Fri, 23 Jul 2021 00:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723004214.912295-1-phil@philpotter.co.uk> <630e139c-85e5-f006-6b64-e368847251fc@lwfinger.net>
In-Reply-To: <630e139c-85e5-f006-6b64-e368847251fc@lwfinger.net>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Fri, 23 Jul 2021 08:29:22 +0100
Message-ID: <CAA=Fs0k0eQUpDgpxEcLAnZ-d87TM3LgPwPt9ydXO_hf39f_9ig@mail.gmail.com>
Subject: Re: [PATCH 0/7] staging: rtl8188eu: replace driver with better version
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jul 2021 at 02:56, Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> On 7/22/21 7:42 PM, Phillip Potter wrote:
> > I had to break this patchset up a bit to get around the file size limits
> > on the mailing list, and also I removed the hostapd stuff which is
> > userspace related and therefore not required.
> >
> > The driver currently in staging is older and less functional than the
> > version on Larry Finger's GitHub account, branch v5.2.2.4. This series
> > of patches therefore:
> >
> > (1) Removes the current driver from staging.
> > (2) Imports the GitHub version mentioned above in its place.
> >
> > There is plenty of work to do to this driver, including to its Makefile,
> > but it is at least buildable/usable for now.
> >
> > Phillip Potter (7):
> >    staging: rtl8188eu: remove existing staging driver
> >    staging: rtl8188eu: introduce new core dir for RTL8188eu driver
> >    staging: rtl8188eu: introduce new hal dir for RTL8188eu driver
> >    staging: rtl8188eu: introduce new os_dep dir for RTL8188eu driver
> >    staging: rtl8188eu: introduce new include dir for RTL8188eu driver
> >    staging: rtl8188eu: introduce new supporting files for RTL8188eu
> >      driver
> >    staging: rtl8188eu: attach newly imported driver to build system
>
> Phillip,
>
> Patch 3/7 fails with a
> drivers/staging/rtl8188eu/hal/phydm_precomp.h: already exists in error:
> working directory. When I deleted the file, the patch applied.
>
> Patch 5/7 fails with a drivers/staging/rtl8188eu/include/hal_data.h: already
> exists in working directory. Again it applied when I manually deleted that file.
>
> Patches 2-6 all have trailing whitespace warnings.
>
> I have started testing. Unfortunately, my GitHub version has a fault in that it
> runs systemd-udevd at 100% of a CPU. So far, I have found that an older commit
> works fine. As soon as I find the fault, I will let you know.
>
> Larry
>
>
>
Dear Larry,

I obviously screwed up here somewhere as there should be no whitespace
or conflicts, so apologies for that. I will do the patch set again
after work when I've heard back from you about the relevant commit,
and send out again.

Regards,
Phil
