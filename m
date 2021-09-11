Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A513FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 10:50:18 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id h9so9678688ejs.4
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s2Y3phh03w3iRLb0/7Vq/tzxOC9memZK2T90WvxR2nQ=;
        b=fify17R/MnNeLrBfrQO6PIZos/02vGN4spF3jkC5+crxApQr3LYKMN+0mNpfJ9tktx
         40rhDy8wrctIr9+OyHMABWAgCs2wFHxEiIP0KEyISNGGBJuqQsbfin5R0AdoWY17tRUQ
         ssyCwr643v+MejXpIkI/pQacKs3f2F0get0EFOUL9jzSVv4Sf/1Ql2lu6jHAtnJZtXKd
         /732usDH6/GqpMBT6Jn8XVsiGhoGH4LDeTNb6KuFDW1G3WTTge2xZJwv/ju+TzTsXzr5
         Nsv6LxHsnnunmK03O317Ja6YCAqeNK2b58Zii6wKzHAVyGt5T81+BBbMvIQml7hqtHx2
         bxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s2Y3phh03w3iRLb0/7Vq/tzxOC9memZK2T90WvxR2nQ=;
        b=jgxonBTMmGMzsWd8kCjdJI4wD5Cq4/8izJp0neece5iz4Ap+7rcDVjdw7utNc+sYYn
         nG87v1+Tuib0NNKbTPXxJu520JCDlOoixi0iWhCxxN0ifI7nsBZuInxpVZZ4zVK4yXD1
         vJ4Msms2yjSPuF37gPVSvHs/rFb80bEJBDBgzHwBAZ/3iqwoC4ub56Aupnee0g0iK+I7
         XLfuyQTrzzE1kny79AyFTR/Nw9hjuqnHexAkVRBXNc6xC8Zms2K+wbcu5IAmueFWw73T
         uZVXbiiKvLfnNGD/uYGwSrR5MqTOIoi7p4G4lMxvT73wH8KdgMesBKzBw34xptBwevn1
         uq0g==
X-Gm-Message-State: AOAM532QQsOIjfSau0P8KDDRjma307rQXhu0sa7OzDnBOTkfDqtbEq3C
	DNVHaLUdOppYDOR29/iFLpM=
X-Google-Smtp-Source: ABdhPJwb7nclu2LG1b6eNFK/XRQdhssBAA5X7h+PK+Q54yEPVYRbElGOfFcEJXDBGnlm2zOzh5O2Mw==
X-Received: by 2002:a17:906:95d7:: with SMTP id n23mr2187912ejy.479.1631357416896;
        Sat, 11 Sep 2021 03:50:16 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s7sm753717edu.23.2021.09.11.03.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 03:50:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] remove pointers from struct hal_ops
Date: Sat, 11 Sep 2021 12:50:15 +0200
Message-ID: <23645260.HGxgaUW6W8@localhost.localdomain>
In-Reply-To: <296aa357-1bba-4136-c651-a18d04c8d32a@gmail.com>
References: <20210910205033.3778-1-straube.linux@gmail.com> <1858319.rr7sHpn3up@localhost.localdomain> <296aa357-1bba-4136-c651-a18d04c8d32a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Saturday, September 11, 2021 12:24:09 PM CEST Michael Straube wrote:
> On 9/11/21 11:38, Fabio M. De Francesco wrote:
> > [...]
> > Hi Michael,
> > 
> > This series is good.
> > 
> > Furthermore, I compiled the whole series with gcc version 11.2.1 2020816
> > [revision 056e324ce46a7924b5cf10f61010cf9dd2ca10e9] (SUSE Linux) one
> > patch at a time. There are no errors or warnings at any time in any of 
the
> > seven builds.
> > 
> > But, unfortunately, I have no time to test. So the whole series is...
> > 
> > Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > 
> > Thanks,
> > 
> > Fabio
> 
> Hi Fabio,
> 
> thank you for the review. I have tested it on x86_64 with
> Inter-Tech DMG-02 connected to a CCMP network without any
> issues.
> 
> Perhaps I should have mentioned that in the cover letter. ;)
> 

I see Greg sometimes asks "how did you test it?" when he notices that the 
developers don't say so explicitly. I guess he wants to know this whenever 
changes have the potential to interrupt or alter the proper functioning of 
drivers in ways that aren't clearly identifiable by just reading the code.

I think not all changes require testing. However, I guess it's best to play 
it safe and say if and how you did the tests.

Thanks,

Fabio

> Thanks,
> 
> Michael
> 



