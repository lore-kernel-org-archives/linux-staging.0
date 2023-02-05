Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1F2F43
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 13:13:52 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id k4so27302261eje.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 05:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aAV86lpCX+u26K5XZAjhYf5FiCuKhNuED87tlvkY6Tg=;
        b=b/vokj8lDb3c4dYSm34QdRQG2RPQZQjO0O1B5Qibthn028/GLvPdh3OAbqdFIxuCdp
         Oo5H7+oIRI3pNXZKTzNL2iOrLH2mWIAqPeFh9BAZg1VJf4ek9uecaYvrXFZM8ar6rwtB
         7ZfWvyAMjt+cmggSxVC4HFnbacYGQE07ggcjSoRomkHXzL8TBVBwfKUPRQRU/ozBFqzT
         lAAwa7tl8ryE1XnIQ9GEmjfay+fgo6y0hthL46Shp3FD1iEFvaIQ9Gtgcu3D05lAbMp0
         8JtpwhRVwDKJnOcA5nO4Qn5dRNedvzDHZFHOY6Sn0RSHCdWXj07EWcZWRJaggPu5+GZg
         joTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAV86lpCX+u26K5XZAjhYf5FiCuKhNuED87tlvkY6Tg=;
        b=Vtf4anv9FS1oGPc+1YQ3nh4SsAITk0AZpv2Q9RBehyG7Zf2gl0uCqhn9DA9EA37f2/
         ghz1vwqLoGRwA/bkPrUU8if0ge2uQrFhRgX7OFlFImxInpFTSqJ5rBVYuhTe/93rfWOz
         FHiKyMiNYOw1C8BaiFsHQZ5OdVrTXm/aLONTMzL3UWuljbosVRNEne/1j+MWwJVXGO4A
         dheYBIpLjrFAFJSmHMgOOShEu0VOleAcj7ao5fLIAj6gUnEDyxaMP5Okyoop8N2BlBsk
         1lj+JbvSuBFW0QUER+1hX6W/wdMJDCfQa/GLJuhNExwlDJvjQnwv/Dpfuq1t10Ttn/bO
         WzvQ==
X-Gm-Message-State: AO0yUKV07I5NlHFACmOYONXLMbP0tOvOVVfD2seO7xXAJoD1+6UHCTyi
	c3lptUl7ClO9034ubuspk44=
X-Google-Smtp-Source: AK7set8xhGaxIXS/MfoUZ2h0ybw9PMBFgrb5iXsBqeFtDZNMoa42se2Syk14SRIKcsmhMYg29fn+eQ==
X-Received: by 2002:a17:907:2c49:b0:887:2248:efd5 with SMTP id hf9-20020a1709072c4900b008872248efd5mr17932986ejc.77.1675602830806;
        Sun, 05 Feb 2023 05:13:50 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id t13-20020a170906268d00b00888fddc4eb2sm4054438ejc.164.2023.02.05.05.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 05:13:50 -0800 (PST)
Date: Sun, 5 Feb 2023 14:13:48 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Regarding checkpatch camelcase issues
Message-ID: <Y9+rjLfHsKvcUi5l@combine-ThinkPad-S1-Yoga>
References: <Y93eQqaYdL146Z65@combine-ThinkPad-S1-Yoga>
 <Y94L+WNGGfvrg6Mg@debian.me>
 <Y97uUeB6OfO469SY@combine-ThinkPad-S1-Yoga>
 <Y98wHhGMY1eSaWG1@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y98wHhGMY1eSaWG1@ubun2204.myguest.virtualbox.org>

On Sun, Feb 05, 2023 at 09:57:10AM +0530, Deepak R Varma wrote:
> On Sun, Feb 05, 2023 at 12:46:25AM +0100, Guru Mehar Rachaputi wrote:
> > On Sat, Feb 04, 2023 at 02:40:41PM +0700, Bagas Sanjaya wrote:
> > > On Sat, Feb 04, 2023 at 05:25:38AM +0100, Guru Mehar Rachaputi wrote:
> > > > Thanks for your support.
> > > > 
> > > > I wanted to confirm if each checkpatch encounter for camelcase issue should
> > > > be fixed in a new patch?
> > > > 
> > > > For example: If the issue is with same variable, then multiple
> > > > modifications can be made in one patch.
> > > > 
> > > >   -> above example is OK
> > > > 
> > > > 
> > > > For example: If the issue is with multiple variables, then multiple
> > > > modifications can be made in one patch.
> > > > 
> > > >   -> above example is NOT OK / NG
> > > > 
> > > > 
> > > > Please confirm me if my understanding is correct?
> > > > 
> > > 
> > > I guess you have generated a patch series, then check it through
> > > checkpatch.
> > > 
> > > Indeed, if checkpatch complains at a particular patch, you need to do
> > > interactive rebase. Make sure that rebase todo list contains "edit"
> > > lines on commit you want to fix up. After that, fix these complaints.
> > > 
> > > When you're done, regenerate the patch series and make sure that there
> > > are no checkpatch complains on it.
> > > 
> > > Thanks.
> > > 
> > > -- 
> > > An old man doll... just what I always wanted! - Clara
> > 
> > Thanks for the reply
> > I guess I was not clear. When I run checkpatch on a driver there
> > were so many camelcase issues in each file. So I wanted to know if I
> > proceed to fix them, should I submit each change as a patch or each file
> > as a patch?
> > Since each file has many camelcase issue and the driver has morethan one
> > such file.
> 
> Hi Guru,
> You can look at similar change proposals from other developers here[1]. That should help
> you understand how it was done previously. This resource is very useful to
> determine if the change you are proposing was already submit by another
> developer and the feedback on it. In general, it is a great resource to learn.
> 
> You should also look at the guidelines on how to design your patch, number of
> changes, when to use a patch set etc at this location[2]. This page has more
> additional links to resources that are useful to understand how to submit
> patches. Check these links [3] & [4].
> 
> 
> [1] https://lore.kernel.org/?q=&a=search+all+inboxes
> [2] https://kernelnewbies.org/Outreachyfirstpatch
> [3] https://kernelnewbies.org/PatchPhilosophy
> [4] https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst
> 
> Hope this helps.
> 
> Regards,
> deepak
> 
> > 
> > -- 
> > Thanks & Regards,
> > Guru
> > 
> 
> 

Thanks for the references deepak.
This should help.

-- 
Thanks & Regards,
Guru
