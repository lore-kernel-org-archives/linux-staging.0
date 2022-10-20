Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D43D60
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 15:57:49 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id bs14so27019398ljb.9
        for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=splVgPPovuMj/0pqMiwUjQyHzZlUZ73kse8Hlqe7Grw=;
        b=UG9KoiIT/Tr1KqL/+XRxu1YxmhRpmJHR8xcHSChjh+FQrCzOqXdagctSIldbaMKBnl
         fU8/j0xLiHEHj5VGh1XSJYNLVAw4lc+df81X1y1GvtTJVeLZ0GclrVoemj7iFbStuCpM
         n8robVgFN8geDl+ScyPWRCFy13a+t3Y5Tn2LuNbWkonvpsrIX5JznXDjLAbrYxEX9qc0
         IPR9yvCALtsXRUQkr8fASqZH8KrXyZouI/tM4ewlr38sAhdj6rGphmadFmciTmptWyCK
         A2sRt7ndMPA3brYm55+ljszZlQWZjs/b1DGuRWFs/6SDcyMh8B1tLPDv5Qx1vnHmI8/G
         eA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=splVgPPovuMj/0pqMiwUjQyHzZlUZ73kse8Hlqe7Grw=;
        b=iCGd4pJ9ZjpPTsT5aFLrEnG9HC+ade8tQCh5CDEnWs0BMx7b6Ll8ET72CIJO0TH6XC
         N7cWBdPHoKcuAbgItL9WWfeH5NCk2CTuBKVs2EYYbva3AYTNFj7cmZZfYJMSd0ntLFUB
         3I8M6ijmbGHncDuChfPN8f6r61St6As58hbx9VMzh4fDrCVQfHNCH98DcKgIHIyJmncs
         8czj2vmfwKSiqOEy1pHwsQ97ZWULRDqWyZ8QP3iSMhpgAp2kvtOy11HEfqRfgMRp2TcE
         NTCEoQz2W9rtLlQg6FVcaHv2W9wYECszCb7FaAWwBW0sS5bNplytkEECxs9q/36nn7ma
         TtAA==
X-Gm-Message-State: ACrzQf2+SHhlLkMHBUDJni0frCNFO6jrTGIw7zgWtqhNmuhsYqNSgIDo
	rNviV0LUGuTeQykJZVLBBz/3E5scpokUEnif0W0=
X-Google-Smtp-Source: AMsMyM6QXAp3mVJXVedCEd9YLjuOmPMMr7ikZkuPfyxnqOVwyj4kZ3SY2oDrLGKvIsBpoZXTZt4aZCQS4iRLPCH6UuY=
X-Received: by 2002:a2e:a591:0:b0:26f:c3c7:be64 with SMTP id
 m17-20020a2ea591000000b0026fc3c7be64mr4901059ljp.97.1666281467334; Thu, 20
 Oct 2022 08:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221016110743.1448067-1-pbrobinson@gmail.com> <Y1FuHoeNNcUhNSpB@kroah.com>
In-Reply-To: <Y1FuHoeNNcUhNSpB@kroah.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 20 Oct 2022 16:57:34 +0100
Message-ID: <CALeDE9Nqjx2gksT2AveGX84845foTnAhtFgunecJOB3EreW-FQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] staging: rtl8192u: Provide a TODO file for this driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 4:49 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Oct 16, 2022 at 12:07:40PM +0100, Peter Robinson wrote:
> > Provide a TODO file that lists the tasks that should be carried out in
> > order to move this driver off drivers/staging. It's missing from original
> > addition of this driver.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  drivers/staging/rtl8192u/TODO | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 drivers/staging/rtl8192u/TODO
> >
> > diff --git a/drivers/staging/rtl8192u/TODO b/drivers/staging/rtl8192u/TODO
> > new file mode 100644
> > index 000000000000..ab9d5d145b3b
> > --- /dev/null
> > +++ b/drivers/staging/rtl8192u/TODO
> > @@ -0,0 +1,16 @@
> > +To-do list:
> > +
> > +* Correct the coding style according to Linux guidelines; please read the document
> > +  at https://www.kernel.org/doc/html/latest/process/coding-style.html.
> > +* Remove unnecessary debugging/printing macros; for those that are still needed
> > +  use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
> > +* Remove dead code such as unusued functions, variables, fields, etc..
> > +* Use in-kernel API and remove unnecessary wrappers where possible.
> > +* Fix bugs due to code that sleeps in atomic context.
> > +* Remove the HAL layer and migrate its functionality into the relevant parts of
> > +  the driver.
> > +* Switch to use LIB80211.
> > +* Switch to use MAC80211.
> > +* Switch to use CFG80211.
> > +* Improve the error handling of various functions, particularly those that use
> > +  existing kernel APIs.
>
> Where did this list come from?
>
> How do you know they are all needed?

It was based on the other real tek drivers that has a todo and some grep.
