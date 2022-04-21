Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3750023A0
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 18:56:33 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id a10so6570384oif.9
        for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 11:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j9sL2H/ZOCgnGpcLG1QjlGRXlzPJ6+xsVS4xIVbj648=;
        b=U7gH6Y8/gtoBXxgZJPMG8CGv9KcR7ZrYZTq7+b3/nIpbx5kUC5y46QJc5psKZOjjnS
         lUFUGBRoARQfa0YNrcleaNr6peO/QEZyTMSlte1wpLCHf5DcdnT0sX/LTrOUkHNR12Pf
         reHzDhx6g6JMUfGk8bbgO0fJbV7QSFsrP6VbZcKeSk1Couwd0oPCmcwoN0sakIp32M/8
         VQ8EhE0a8O+1Pe0LdenvWdzVOjN/IpI0oTjgcRiVP5fnNGqzmuzR4dSoyizkE/pfMzEi
         Mrv4RuXQ1iFThF4qgPggmtXH29D2j2ZU1pcpT6Fe99K7oA04JPElztfRcharVx1Yyoun
         V0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j9sL2H/ZOCgnGpcLG1QjlGRXlzPJ6+xsVS4xIVbj648=;
        b=ypqei3eoCA1pJ4N9vfuCqu/v5NVvRqgZfiCDa1REVkig3M8t3swb7pViZTVsZjBkK1
         SgfSU6BWojchO71cQsL3UsRST8lebGVzYOoDzos/re7+6FX8Gaf8nUz8hREcBhiCarfK
         +XmgLtfT6ZMSQ79oKoqE/QwcH8D4qDrez1fzIREHAeTZDARdnn5gk+pVFaTvUmeP49CA
         CdNVkI+kZKXkOOkWaHugQOdoCINkRLTZHid2dAhKA3ipnVKRY3uGby43YWVmysVDAPJZ
         HUjLmu/LxoUb+X2No3LZr/WGPh77AjIoHvAQcmozZJJVwDStXBIqrfvA2KzOxTYZyMt0
         1gkA==
X-Gm-Message-State: AOAM532/Fevf224CrrdHZru9geHlzk+X+T+Yf7XlWhoVw67UeuKxNQpw
	KOBUIyz/Mgp/XS8wOel6fbs1aGBxfQi1cmf7z44=
X-Google-Smtp-Source: ABdhPJwLdWLO/LYGJwyf3cCJC09phqh2XODcHF9eMQtvVXcbdqxWLm16Xwe+1+u9QK7jzNKWtZKhwON2O2YpO4T0fgI=
X-Received: by 2002:aca:1306:0:b0:322:9104:6cf9 with SMTP id
 e6-20020aca1306000000b0032291046cf9mr560869oii.112.1650567392285; Thu, 21 Apr
 2022 11:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220411102136.14937-1-makvihas@gmail.com> <3484215.R56niFO833@leap>
 <20220412151529.GF3293@kadam> <3134226.AJdgDx1Vlc@leap> <20220413054252.GR12805@kadam>
In-Reply-To: <20220413054252.GR12805@kadam>
From: Vihas Makwana <makvihas@gmail.com>
Date: Fri, 22 Apr 2022 00:26:21 +0530
Message-ID: <CAH1kMwT0gyQNB1-j62-2ntJD9Lobsmr8-5h6n6-SJ44wykMyHQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] drop some unnecessary wrappers
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Did this patch series get lost?
just pinging :)

On Wed, Apr 13, 2022 at 11:13 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Apr 12, 2022 at 06:08:24PM +0200, Fabio M. De Francesco wrote:
> > On marted? 12 aprile 2022 17:15:29 CEST Dan Carpenter wrote:
> > > On Tue, Apr 12, 2022 at 11:53:42AM +0200, Fabio M. De Francesco wrote:
> > > > I didn't suggest a re-write of the commit messages.
> > >
> > > Yes.  That's the problem.  If you want to complain about a commit
> > > message then you *should* suggest how you would re-write it.  Otherwise
> > > how are we supposed to read your mind?
> >
> > Ah, sorry. I had missed that you were asking for a re-write (literally).
> >
> > Here it is a sort of diff on Vihas' patch:
> >
> > - [PATCH v2 1/7] staging: r8188eu: drop unnecessary wrapper _rtw_free_cmd_priv
> > + [PATCH v2 1/7] staging: r8188eu: drop unnecessary helper _rtw_free_cmd_priv()
> >
> > - Drop unnecessary wrapper _rtw_free_cmd_priv and move its logic to
> > - rtw_free_cmd_priv.
> > + Drop unnecessary helper (wrapped function) _rtw_free_cmd_priv() and
> > + move its code to the wrapper rtw_free_cmd_priv().
> >
>
> I kind of feel like the original is better.  Why would we want to remove
> helper functions?  Helper functions are ok.  What we don't like are
> pointless wrapper functions.  The whole motivation for the patch is to
> remove wrapper functions and that's what it does.
>
> regards,
> dan carpenter
>


-- 
Thanks,
Vihas
