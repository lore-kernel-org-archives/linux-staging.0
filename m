Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B16659
	for <linux-staging@lists.linux.dev>; Mon, 27 Feb 2023 07:18:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l25so5096136wrb.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 23:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=29wL3HKgURgZ3ob7ytBSMNuF/dn8Tv5qAnlCpB6BYXE=;
        b=lGYrDYcmtYaWQg10siJHp+l0o9Vbywn3xDOrC7vcUwf19Bm/MCtmia8MoAm+ryl11C
         XRlvOSgIUifmjwUE7SB9n28I7CAjYpuO4rN3dJWVuvgXZdlSQ5T8FSn9nX6Wfltw/YVO
         78X/OPlusNJPkkXOLzUhD6jOr6nKBQHzxyLZKkVJZgwcEewZwD+CmhwEXjayAhp2wxp+
         OXZQSPrVuupy+iNzz0rd1cD6KpT0h120YCSLEKvGTzQSlVQYFGgjSecmA7wLgvkI2v6l
         /T5RQJp42xtVOLHs3s6WiJCxkGyEWZYew9xmMz9bjQcRq34XWADpTAShSiEQ5jyfSk+L
         PBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29wL3HKgURgZ3ob7ytBSMNuF/dn8Tv5qAnlCpB6BYXE=;
        b=bYlhkEx0oqjo4BvVhVSRepLFtvGlmBFer+eSNQpCLp6Xd9yaxYlVuYixnybX01MT7g
         XYRQXp0N74+FAEyaO7Oo92tWVut/ttqLgY3cw5bjkkl6gA/TtKFdDG3tJfQ5xmpo0+2e
         viETV8qEVuvgToe9TeWV29NWMylRZ37Hpk0H8YkxsXtB6VedQ7s2CYDhhT+xdMxpdiXp
         AwqTyeBVmUl6Y3u5NRyvWd1aUu0TwB4D+MS8it3IPnWpccZQzo6f07QrUBDhp1WD5FtD
         SuaKw/nwXHiIUAEeK525U5nd1yA5/E/3KqarnEx6ca6PQhTIqfZYi4KNs4eANwYD/gtB
         prag==
X-Gm-Message-State: AO0yUKXfFVO61JxfGG7n48w8XpqtJGSKE441a5qXCMNmkY18us+2iIIF
	5/6+VEfcJKhsgaMMEeT11Ak=
X-Google-Smtp-Source: AK7set9VyfiPh1k+U50RIxKxInrvrmyJAzA6rdcN3lcnQYZdj1nEtoCsZzUrsEsuApdGoEYjKPq9zg==
X-Received: by 2002:adf:dcc5:0:b0:2c7:ce2:6479 with SMTP id x5-20020adfdcc5000000b002c70ce26479mr15191977wrm.40.1677482298677;
        Sun, 26 Feb 2023 23:18:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u4-20020adff884000000b002c70851bfcasm6230104wrp.28.2023.02.26.23.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 23:18:18 -0800 (PST)
Date: Mon, 27 Feb 2023 10:18:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kang Chen <void0red@gmail.com>
Cc: paskripkin@gmail.com, Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: add a null check of kzalloc in
 go_add_group_info_attr
Message-ID: <Y/xZNgonbcVSK/+u@kadam>
References: <20230226132500.3933232-1-void0red@gmail.com>
 <Y/w16PI4klfJaeXA@kadam>
 <CANE+tVpqZusCq4EXi7UV+jY0XBG+9x6UWh_JGCWKs3pZRMFBXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANE+tVpqZusCq4EXi7UV+jY0XBG+9x6UWh_JGCWKs3pZRMFBXA@mail.gmail.com>

On Mon, Feb 27, 2023 at 03:11:21PM +0800, Kang Chen wrote:
> Hi, Dan,
> 
> Thanks for your review.
> I noticed there is no error handling in the origin design (this call chain).
> go_add_group_info_attr returns a len-like value indicating the length
> of pbuf.
> I don't think throwing an error to the caller is a good idea, the caller
> doesn't seem to care about it.
> So inserting a netdev_dbg or pr_debug here might be enough.
> Do you have a better idea?

As I mentioned in my email, we need to fix the caller to care about it.

regards,
dan carpenter

> 
> Best regards,
> Kang Chen
> 
> 
> On Mon, Feb 27, 2023 at 12:47 PM Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Sun, Feb 26, 2023 at 09:25:00PM +0800, Kang Chen wrote:
> > > kzalloc may fails, pdata_attr might be null and will cause
> > > illegal address access later.
> > >
> > > Signed-off-by: Kang Chen <void0red@gmail.com>
> > > ---
> > >  drivers/staging/r8188eu/core/rtw_p2p.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
> > > index 93d3c9c43..802e1170a 100644
> > > --- a/drivers/staging/r8188eu/core/rtw_p2p.c
> > > +++ b/drivers/staging/r8188eu/core/rtw_p2p.c
> > > @@ -31,6 +31,8 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
> > >       struct sta_priv *pstapriv = &padapter->stapriv;
> > >
> > >       pdata_attr = kzalloc(MAX_P2P_IE_LEN, GFP_KERNEL);
> > > +     if (!pdata_attr)
> > > +             return 0;
> >
> > Return success here is not a good thing.  We have to fix the caller to
> > check for errors.  (Fixing a bug half way just makes it harder to find
> > the bug so it makes the situation worse).
> >
> > regards,
> > dan carpenter
> >
