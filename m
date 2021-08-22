Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551A3FC1
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 13:50:17 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id mf2so12438489ejb.9
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQIUFuaVnDeSqO5NxIP0mR+YO1SRXJL+8IshgCg+5aI=;
        b=TvnjKkmP8IaRHcpgeQ1T1hA7eRiZUfz23jqoMrjw2VX9wHqcdzxPC1V8lMu7onSv/s
         JN0EoUEGmpDCHPDonPwYROz2zSc7MbeGMl4HtsZpUygEF6cElVBBl65UkrxUd9N6/56V
         5BFEKi9n1+lhDHNU5DMKckfCGkmzzY2vB6djZUXgBIO6ZMFkjKSw8vwCDnciruiN/3Aq
         nzPgH30jLWre3KPLW6DY/zZXtsla/XLp+mqieS/sji0oVQWaaWn4XwI3Y9JwIc9bxUVF
         KTIQvqeW+6MKe6cNUcFZom2N7k0Tot7p7OFUXxD7plUR1pXsKiFDSndRD9ycI71vWx/2
         74vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQIUFuaVnDeSqO5NxIP0mR+YO1SRXJL+8IshgCg+5aI=;
        b=L2tci3JUs1tL4zdfylEk1ukRWR54lOTirq2mhlAEeGQuwD83lq3cuLMrEbRl/QNbee
         b+oeXXhwltq4sf0aW+oquc24HloWHvkdEx3QrwZVPxaU/2ncQABRSTc4ITDt2BtQOKko
         m7gATQ/O2/Q0DQtZbTdPrnRxqML/G18zssSms+O7o89WB5F5X+R1TxZrEHzUWCHdbB0Y
         TttKJJwnBJ79zBKNpxLmS1qPTX7Zt8b1wdFqXBOU2g3DjKKNxA3XDx6zQhapc+5DCfaF
         G0WDLoBwffABh6Bcoj8c70U+9m9EWB2QoW/n0Vi9svDU1NZm0jejzKYfKGLoDwW4N22p
         Zsmg==
X-Gm-Message-State: AOAM533woly6r1GJtWbNRSlhFxQW04X/0MShUxE/apuQz9E49ZTfoTM6
	zwZt6TEhm63LtoNs91xqIAk=
X-Google-Smtp-Source: ABdhPJyizlZ8ZfPmcwFhcRXR0KO/lufiQd0oKfblYOYqFB8aFAWm/dbIQsEWRhBFvNgWAwwW4DtsYg==
X-Received: by 2002:a17:906:70b:: with SMTP id y11mr8123986ejb.274.1629640215918;
        Sun, 22 Aug 2021 06:50:15 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id n16sm7283360edv.73.2021.08.22.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 06:50:15 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Subject: Re: TODO list for staging/r8188eu
Date: Sun, 22 Aug 2021 15:50:14 +0200
Message-ID: <2099975.VbY6Rib6K3@localhost.localdomain>
In-Reply-To: <YSJE6aoH96kh777R@kroah.com>
References: <1897566.d8lQ4HMSh1@localhost.localdomain> <YSJE6aoH96kh777R@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, August 22, 2021 2:36:57 PM CEST Greg Kroah-Hartman wrote:
> On Sun, Aug 22, 2021 at 09:41:20AM +0200, Fabio M. De Francesco wrote:
> > Dear Larry, Philip,
> > 
> > >From what I understand how the development process works, drivers in 
staging
> > 
> > should have a to-do list in the TODO file. Please read https://
www.kernel.org/
> > doc/html/latest/process/2.Process.html?highlight=todo#staging-trees.
> > 
> > Could you (as the maintainers of the r8188eu driver) please compile and
> > provide the above mentioned list?
> 
> Why don't you provide an initial list for people to work off of if you
> feel it is needed here?
> 
> thanks,
> 
> greg k-h

Unfortunately I'm not able to tell what is needed to do to have a driver 
improved so that it can be moved off staging. This work should be better 
addressed by someone who is much more experienced.

For example, I read from other drivers TODO lists that cfg80211 and lib80211 
are required but I don't know what they are.

Regards,

Fabio



