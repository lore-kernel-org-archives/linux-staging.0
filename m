Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5F72FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 16:57:51 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso14885069pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tu7497B1vudv4lRmDQxN1ly5NrWEwmYjdP9mT2Cvgv0=;
        b=DKPz5wKcMz1mCz5OVjtfc9sW+oS8xoy01mPR0Y/zUtgc6CvvLTP7SAdV+9ka5SpYUb
         ZY0C6tDMFiWofLJMFBlnyRnqPWfL98sGKkyzSPasrOZ7h8QhpP7RccWbsC5v2qe0N6fo
         11nRj6MAJt7gGjiz7ldDeLnjuqG19zjdd7JvyFSofBhhl6c1k1gTNTYLxWP2dM+t+uke
         64Cf09sGRIKXSsprdbPDgxQLQIHnmYiwl8o30uXc8EQfGfwR4Q0XhBZsLxYKNqw2mniI
         7M6qrnHegNCXvIIz9CLH0QrbTYXk+kKfwy4WCxCcpIPLCalTUj6Wheo6v2WowAE+Kj85
         L9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tu7497B1vudv4lRmDQxN1ly5NrWEwmYjdP9mT2Cvgv0=;
        b=ZMv0s13ulVSrLziv7E5dF3agZHPuqHqljy0CLL2qSYkSTx6SQ9RDYR6FUbwBJLenkN
         f5bXSbKjEMjcmCCmyNNa5k28Oe+MJA+kEw7OjVAArnbWKS+b2U4n7KDR0Zqyvhk36SZP
         /C/nxhLgEqg2lYuf0HlA3ag1hmxKT1HDh8vRBV0+VfAHrWZfOlRQDcIxJrID535Buqpi
         Wbq4Y7XkWm2lkdjg2edKw3vdXt4wm+c8YmMKv567gc7mYpO4AbtxwzpfT4/cxD9VbKy4
         FJQq/EOjU97OSVFDceKDF2oub6N2oQI1Ilt58Cp+aOeRld4Uzj+MtloVBmAnicOU8Hei
         o3vA==
X-Gm-Message-State: AOAM530dd10i18HsMKg+qQpDBUHtfw+1cq4olQ9PABV00KUkE2W/JpZt
	96VfAmUaM8mc9PlmTsig7YO6AS59xkYSpzx9bBZCWw==
X-Google-Smtp-Source: ABdhPJwQuIkSGIO6VHBqWxbOrKA+S04JhZ0uPErL8a1doj3dR1ZbgxLauvSBaG0iDoX2GY8u3d4JJACLIAPRrfPoztY=
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id
 189-20020a6205c60000b0290341e0b1a72cmr7779314pff.71.1628960271470; Sat, 14
 Aug 2021 09:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210812132725.18404-1-fabioaiuto83@gmail.com>
 <c2abe840-98b4-cddd-e427-2243d456ec19@lwfinger.net> <YRYS+4I58YRnAepF@kroah.com>
 <CAP71bdXD-AY985fFzjCFFt2NLr7Jsd+Ucow2D_EE-renCVXP6A@mail.gmail.com>
In-Reply-To: <CAP71bdXD-AY985fFzjCFFt2NLr7Jsd+Ucow2D_EE-renCVXP6A@mail.gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 17:57:40 +0100
Message-ID: <CAA=Fs0mY6f-r8j=H-aQ80Krw_q4=50iM0+26X=PZj-ze0-hgNA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove cfg80211 residuals
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Martin Kaiser <martin@kaiser.cx>, 
	Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Aug 2021 at 19:42, Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
>
>
> On Fri, Aug 13, 2021 at 2:36 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > That's odd, I'll drop this from my queue, we should be using cfg80211
>
> I will be going dark for a while as I add the cfg80211 bits back in.
>
> One piece of good news. I dug out my PowerBook G4 with a PowerPC CPU and tested. Even with all the changes, the driver still works on a big-endian CPU.
>
> Larry
>
>

Thanks Larry, and awesome news - a PowerBook G4 - one machine I'm sad
I never owned back in the day :-)

Regards,
Phil
