Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D07672
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 13:25:46 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso4826154pjo.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sj4gJifOrkoU7DlVhCp3UPFxcARtLuS9gmjuHOue86Y=;
        b=HAS/GrGXG8YGN51qv56OFvXHWpZ5qSPcXAR8IBDBZDCKCVuNzhA5r/E/HDm6phKrNf
         uXG/tGwPAp70UueB76jpYhWu5grbQFG1p7MXwp4cRSvoAAdvwKQSQyvZjCzZ0pewkM+6
         7D5t+CggV0rrbN5UlCk1RMdIj6LIxSvOyZ+pCsIuqwFLvDS35DfqJzbBDD6ook9maEKR
         th8XTWo3pa4vpLrYE6wSLpTszkN0cL16ESwhSthFn8nAqftvOqMQnmy+LXmpSmCyTe8G
         DaK9OypY38rNo+9ioV0we98b9HIHUhlhmmhI/gVtIFV1USaLm0ZYrKaF0PewlDMMAw3R
         yFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sj4gJifOrkoU7DlVhCp3UPFxcARtLuS9gmjuHOue86Y=;
        b=qmJQ2VNowx7MwMSVySshCZD8jqpsO0/+NsAlLJrKFoYkX+Fc5TGKnWT2PkKQDCi363
         Ox9NFqyafrMt48SV80gbcHFP1vlewWdNNXdmOHk9yPc559bi00RCyQoECqhwRDOtHPgD
         ZN9RvEB/KqL7tilSV/3IYXJJ0kBcg1Zi40aDZvQZYsVtH4arMgbRFanU6PijqAjbZdeZ
         J00APzjpDykI9FiBudRWwtoSJ82DKNCM9yu63BPOEpE1SMdvTFrj/Mme+SfWY+hNrfZ9
         6uNqkFk5fRi+S0iY1J+kYdP5FXWoXNzP+VDUT4On9AYXLRDoGBwMLi/VGVuDvxgOqpuU
         Pz/A==
X-Gm-Message-State: AOAM5308UxDqT0/Irel8Bc/oaESyNtXkr2T8jVwczPhv3ltXwtH+sUU8
	bhGH/N3EwpmlNIIBcuqRsMTFwpJJ2ILVrGBlalR4tw==
X-Google-Smtp-Source: ABdhPJxL31vUFNVWIYkybbAcA7zXMuTQU1STyLSzbL123qPq4ghFjZHP2LBaD+BBmR1Qie1oflrkXeMv9QhUWIHPAJc=
X-Received: by 2002:a65:6181:: with SMTP id c1mr204980pgv.208.1627392345677;
 Tue, 27 Jul 2021 06:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210724001055.1613840-1-phil@philpotter.co.uk> <YQAE1q9ZWRPHqfK5@kroah.com>
In-Reply-To: <YQAE1q9ZWRPHqfK5@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 27 Jul 2021 14:25:34 +0100
Message-ID: <CAA=Fs0nwOBUoCSbwzaE7TTQab_BZcCy2SL1RJby+Hmo=URw_Pg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] staging: rtl8188eu: replace driver with better version
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jul 2021 at 14:06, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jul 24, 2021 at 01:10:48AM +0100, Phillip Potter wrote:
> > I had to break this patchset up a bit to get around the file size limits
> > on the mailing list, and also I removed the hostapd stuff which is
> > userspace related and therefore not required.
> >
> > The driver currently in staging is older and less functional than the
> > version on Larry Finger's GitHub account, based upon v4.1.4_6773.20130222.
> > This series of patches therefore:
> >
> > (1) Removes the current driver from staging.
> > (2) Imports the GitHub version mentioned above in its place.
>
> Let's do (2) first before worrying about (1), given that we can't get a
> version of (2) that actually builds yet :)
>
> thanks,
>
> greg k-h

Dear Greg,

I'm confused - v3 patchset builds fine for me after applying in
sequence from 1 to 7?

Regards,
Phil
