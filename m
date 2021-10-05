Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDDC2C80
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 14:28:35 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id f2so23016347vsj.4
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FHV4wEBlv7+E/N0x33DBUWEcPcy+owxk4b6zOW0s8mY=;
        b=DWFIyP/fMFUE/Pw1MHAQYZsHoFjjhBvbbvAnwCZHVGigC0zPAinHEJGNfN0lV/U93X
         7qi0bb86drJ1QWEXISKt9ijjXKBt7n8O1MH02WhKfEqKMT9wHbZmbokug/uJQ58LEOSD
         omGTCm5dRYapRT37O4hJ29gQhI7UPJ/z/AIGRVHz0ifz/b5Tlit7s/7p0TvAFXMLwcDS
         l2+m976ElO6u17QUsfK7CoP9w1x6cQmqQ+2lovPnrlxDkXvQdUZ1eNVxYV2s3HcGBaYD
         6psV0YWTXcrm+NYL6bYGhyKRlq+MMequFsj3rIJsonqQB9hf8p0WB+c+fk3VPZFjrSe1
         G4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FHV4wEBlv7+E/N0x33DBUWEcPcy+owxk4b6zOW0s8mY=;
        b=ZQD1RcQUMROM2OT1WLr7aaEKsKcIsmhDjIOPVY5EG0FmjwQaUqggly36IArpUIqiTH
         7+tQyxSC2wBBCMg8GtfyY7QXILVagif0e/L2rpoC3uZkpIIOq6aXmcGEdQpiDBYJcr4P
         DWJ3xqzmXu4OnWuZ11+OAqdIgz/PYiREEdgDLD0KPUSK7AnfsCkCqZI2WyQifoZnCUVM
         Q3pP5zICKZS4rvn79f0+T9kmId+U3iDaz7QOowgvm4GLBTOtv+XT/aEg2e88RKYo3I00
         7QgcKxBAFBO+rkh3ClTm1R1cY459ETGKdyTkgR0oMei+E2M1kv/EKvFhQHuBWF7+kWsW
         c/CA==
X-Gm-Message-State: AOAM530CCa3nGNPS8wh4Qgs4Y/nVKRtOfsCKigsif637U4boH0NS261S
	NBhK1Eg3Rz6PU1EvgtUZDx9ozsvlrilPDb8kPYpPjrXu
X-Google-Smtp-Source: ABdhPJyDspRSkVvnHra04Mdcv65U+ePR6LZLk+ZBDg7fjiU36TrhUY+gkTAU9tJkNDuXTomF077bobUuAnPzogs9syM=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr5822870vsj.28.1633444114448;
 Tue, 05 Oct 2021 07:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
 <20210926145931.14603-2-sergio.paracuellos@gmail.com> <YVtBsrmCDk/sLsRJ@robh.at.kernel.org>
 <CAMhs-H_qBkQhzwvcVyFbegf412ecvweOBOYq8NW2hBNYUUCE-w@mail.gmail.com> <CAL_Jsq+Nj_=kmGNEbmN4DxJquVdd1BRJnuK43ROvNp-hQM4POw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Nj_=kmGNEbmN4DxJquVdd1BRJnuK43ROvNp-hQM4POw@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 5 Oct 2021 16:28:23 +0200
Message-ID: <CAMhs-H_FqjSkQBxhgMLySO4U5_Gc2aPUkPEX7u3zfb+MQmTw_g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: add dt binding header for ralink
 RT2880 resets
To: Rob Herring <robh@kernel.org>
Cc: linux-staging@lists.linux.dev, John Crispin <john@phrozen.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 3:29 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 4, 2021 at 1:26 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > On Mon, Oct 4, 2021 at 8:02 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sun, Sep 26, 2021 at 04:59:29PM +0200, Sergio Paracuellos wrote:
> > > > Adds dt binding header for 'ralink,rt2880-reset' resets.
> > > >
> > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > ---
> > > >  include/dt-bindings/reset/ralink-rt2880.h | 40 +++++++++++++++++++++++
> > > >  1 file changed, 40 insertions(+)
> > > >  create mode 100644 include/dt-bindings/reset/ralink-rt2880.h
> > > >
> > > > diff --git a/include/dt-bindings/reset/ralink-rt2880.h b/include/dt-bindings/reset/ralink-rt2880.h
> > > > new file mode 100644
> > > > index 000000000000..266ef521a584
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/reset/ralink-rt2880.h
> > > > @@ -0,0 +1,40 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > >
> > > Dual license please.
> >
> > Ah, ok. I thought the dual license was only for binding yaml files but
> > not for headers since there are a lot of already mainlined files with
> > only GPL-2.0. I will take into account from now that binding headers
> > also need dual license.
>
> If you want your dts files used by other projects such as *BSD, then
> they and their include files need to be licensed for that.

Ok, it is clear now. Thanks for clarification.

Best regards,
    Sergio Paracuellos
>
> Rob
