Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8B2363
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 02:48:24 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id n8so29033087plh.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 19:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k6kRcGJz9dVpsAtnzdLvYmb6duk9K6l9ThccGQ9GQn4=;
        b=B6naSCDpsluc76Xy2g0jxTZ034VrK5FMtXEhko1UHokT2hVLLZCpnxR6XfFT/jmssM
         HoszvWjdBsQZJhHL4V8pMU1iLPalmP6xmbJb9mLeW+JFYWJja5OBMbpP8IamDATue/jw
         q137NY9U/VgPA7GaM1CrxKpaRBIIToNhoC9okbwImTKaYTOWmpcNCKIAqAW30QMjNGLy
         yNiHH1MdJVDnM9dOIYDGp9aMH5AvXwEhGYs4YUA7+O9ZQnMEGRz/2FMiumfnZUNMaL+i
         bk9Uh+dncqN7+4aH7BNDyC0J+79BGPqsQmZS0DfKmkS3722IrRmRSqXKvFilVwOHBn/l
         roGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k6kRcGJz9dVpsAtnzdLvYmb6duk9K6l9ThccGQ9GQn4=;
        b=prrZ7B6k2P6RV9f73i+MYn0o6CCvFn3YuUX77KUlpAe3TIz/SVvvzhTia9E0qoe3tc
         nnvemraexLVsLmUwqv/qin9I4MVSC3E/A3z4Y1qW2ecwrLwDzyamb14pcTuqs2WgLGrS
         OnxZ0eEAPACULMlnZ/kysHb8wnuyEsROZNcXuVq3TS68F6TFghg8b4KtMbfjFB6Y47WO
         NNv94ssCA7dElcVhrwWl3ZcVPzEx75XECJLdBmC/PkXgvC5cZ0dK+vVw7pOTAHd0W6pV
         dw2Wqz67s7d2gBoBim6IzA8hHQlXIel5ynCZYdlvoBS2BiPI9B3T4c87qvPypnTCWOzv
         TCkw==
X-Gm-Message-State: AOAM531fKnk5Due972JVjWVb94MI7fAh6Jf5DuBJu9DJKHHHIdbriqU0
	qLdx9EB7YJ5dYl2YlQwRn70=
X-Google-Smtp-Source: ABdhPJyTxQNYKaBR17QTALDZ+wo1JPimr81AGXXZMYx5ahZPsXK9A2h6r3K5hW1ffy4GTnMV/5LUxw==
X-Received: by 2002:a17:90b:1b52:b0:1d2:8d55:ad6d with SMTP id nv18-20020a17090b1b5200b001d28d55ad6dmr24502351pjb.223.1650941304365;
        Mon, 25 Apr 2022 19:48:24 -0700 (PDT)
Received: from ArchDesktop ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id f63-20020a62db42000000b0050d35bcdbc0sm6602551pfg.181.2022.04.25.19.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 19:48:23 -0700 (PDT)
Date: Tue, 26 Apr 2022 10:48:20 +0800
From: Solomon Tan <wjsota@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] staging: r8188eu: KASAN: slab-out-of-bounds in
 rtw_cmd_thread
Message-ID: <YmdddDRsHM9lNX7h@ArchDesktop>
References: <67e2d10b-7f0f-9c5a-ce31-376b83ffba9e@gmail.com>
 <YmU+cqEZfrGz5XsT@ArchDesktop>
 <c2296090-2e9b-fafb-35da-e01b025b53b7@gmail.com>
 <20220425154138.GQ2462@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425154138.GQ2462@kadam>

On Mon, Apr 25, 2022 at 06:41:38PM +0300, Dan Carpenter wrote:
> On Sun, Apr 24, 2022 at 06:06:32PM +0300, Pavel Skripkin wrote:
> > Hi Solomon,
> > 
> > On 4/24/22 15:11, Solomon Tan wrote:
> > > On Sun, Apr 24, 2022 at 12:00:12PM +0200, Michael Straube wrote:
> > > > Hi,
> > > > 
> > > > It looks like
> > > > commit 0afaa121813e ("staging: r8188eu: use in-kernel ieee channel")
> > > > intoduced a. See KASAN output below.
> > > > 
> > > > That commit replaced the use of struct rtw_ieee80211_channel with struct
> > > > ieee80211_channel.
> > > > 
> > > > There are several calls to memcpy that used sizeof(struct
> > > > rtw_ieee80211_channel)
> > > > and now use sizeof(struct ieee80211_channel) but the sizes of these two
> > > > structures are not equal.
> > > > 
> > > 
> > > Oh no. When does this issue get triggered?
> > > 
> > > > regards,
> > > > Michael
> > > > 
> > > > dmesg:
> > > > 
> > > >  ==================================================================
> > > > [  422.214237] BUG: KASAN: slab-out-of-bounds in rtw_cmd_thread+0x1e8/0x430
> > > > [r8188eu]
> > > > [  422.214277] Write of size 3600 at addr ffff8881e149d200 by task
> > > > RTW_CMD_THREAD/2563
> > > > 
> > > > [  422.214289] CPU: 11 PID: 2563 Comm: RTW_CMD_THREAD Tainted: G C OE
> > > > 5.18.0-rc2-staging+ #47 94e3ca73bebf5b7fec506721475e4fff2a023bb9
> > > > [  422.214301] Hardware name: Gigabyte Technology Co., Ltd. B550M S2H/B550M
> > > > S2H, BIOS F15a 02/16/2022
> > > > [  422.214309] Call Trace:
> > > > [  422.214313]  <TASK>
> > > > [  422.214317]  dump_stack_lvl+0x45/0x5b
> > > > [  422.214327]  print_report.cold+0x5e/0x5dc
> > > > [  422.214335]  ? kasan_set_track+0x21/0x30
> > > > [  422.214342]  ? kasan_set_free_info+0x20/0x40
> > > > [  422.214349]  ? rtw_cmd_thread+0x1e8/0x430 [r8188eu
> > > > 91924fe1575bf49b9b37985ffde2c585d847446d]
> > > > [  422.214386]  kasan_report+0xab/0x120
> > > > [  422.214394]  ? rtw_cmd_thread+0x1e8/0x430 [r8188eu
> > > > 91924fe1575bf49b9b37985ffde2c585d847446d]
> > > > [  422.214430]  kasan_check_range+0xf6/0x1d0
> > > > [  422.214436]  memcpy+0x39/0x60
> > > > [  422.214442]  rtw_cmd_thread+0x1e8/0x430 [r8188eu
> > > > 91924fe1575bf49b9b37985ffde2c585d847446d]
> > > > [  422.214479]  ? rtw_setassocsta_cmdrsp_callback+0xd0/0xd0 [r8188eu
> > > > 91924fe1575bf49b9b37985ffde2c585d847446d]
> > > > [  422.214516]  kthread+0x15d/0x190
> > > > [  422.214523]  ? kthread_complete_and_exit+0x20/0x20
> > > > [  422.214531]  ret_from_fork+0x22/0x30
> > > > [  422.214540]  </TASK>
> > > 
> > > Sorry, I am not familiar with KASAN. How should I interpret this output?
> > > I see the paragraph above has references to rtw_cmd_thread. I assume
> > > that is its way of indicating that rtw_cmd_thread is the cause of the
> > > problem, but the one below refers to other functions. I'm not sure where
> > > I should start looking. I would start looking at `rtw_sitesurvey_cmd` and
> > > `rtw_scan_ch_decision`, which call the memcpy on the
> > > rtw_ieee80211_channel structure, but they are not on the call trace.
> > > 
> > 
> > drivers/staging/r8188eu/core/rtw_cmd.c:276: memcpy() call.
> > 
> 
> What git hash are you on?  Is that the line:
> 
> 	memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct ieee80211_channel));
> 
> Are you sure that's the line which crashes?  According to Smatch and my
> simple grep that's dead code because "ch" is always NULL.
>

I don't think Pavel is referring to that line as it belongs to the
`rtw_sitesurvey_cmd` function. That func didnt appear in the dmesg output.
Rather I think Pavel refers to line 267, which is
`memcpy(pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);` from function
`rtw_cmd_thread`. Changing rtw_ieee80211_channel to ieee80211_channel
must have messed up that line somewhere but I just can't figure out what
or why.
 
> > As Michael said the sizes of structures do not mach and the memcpy writes
> > below allocated buffer.
> 
> I feel a bit bad for not spotting this in review because I was looking
> for that kind of bug.  I still don't immediately spot where the bug is.

Sorry I put you in this position, Dan.

> 
> regards,
> dan carpenter
