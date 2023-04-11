Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A626420F0
	for <linux-staging@lists.linux.dev>; Tue, 11 Apr 2023 05:32:20 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id h24so6942365plr.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681191140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3iisXOwnW30rx/icPEO9C3iesK5xJm+Bm4Sb697nfw=;
        b=J3l2SMAICYB7v1q28i3RFC+ooRtjGJi0QAACX2G8OeI/usTLeirCQa4vgZ+tpYBoQC
         Xex2IyjR1DENvhHbvtFD8W69RfUSdryq5mi8UK8qsJEVXSZry3VW32Dslrwn8B20keW+
         yO+KQRhrnT+lbQXYyytDZHVkI8x5/bc21NQp6sVnIMFT0ZYWI/P4PJgf2kLAgjC4Pvuc
         AyoAeAsRkzHkJcJc4mmNOkBa3+eLmauFHKarxkY7DN5xU9BgvycpEUMM3Fa9Rp7HgBcB
         MEHSdBdLQkJLTdFDnXhNwf266SePCXzrWTe5qKXXfQxlqnB9pGwwpJMIruWEpPhzhdXv
         diYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681191140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3iisXOwnW30rx/icPEO9C3iesK5xJm+Bm4Sb697nfw=;
        b=qC/dIs3F1UeXoTu8L5wKJH3kcwuWzm0I6lRk0c4O/SnLEN2HeWba4UtmxmldkA5Yxq
         FS57tAH9t0CasLCTDw37c0K4y4JG1hetVywcyLjKcHhkz2edA1w+mFT7fFT4rWCVtQfT
         nzqNApwvo3RWjGN2s9knX2AX3XMwxvfs2P07ZruQmH1dpXKKIcVztc5KOZrECeF9AcNu
         kMqlHSxSSf2KAlOivw8DCiZGnBodWB+LgIY6xlTZ0dxutBuQnrDfcZx4u6CMWHpQjhsJ
         Uu803gst0N6IZPtxtLRbVg/ybTtGgsvuV7hMNty8/cDYn/9XYOJ49cjEQVEU5GhvJnO7
         tKFg==
X-Gm-Message-State: AAQBX9cHMax1DpRzu/ZFi+hpaWkZ2Ykz6DZ8IwVqMVjbMAOn1JiiSpxx
	rgmR/Rxpu7zFs3Kymp7KyMk=
X-Google-Smtp-Source: AKy350YWU1FeN5xKtAzXQu/m0zO5LpTxMjlXqA0xlFLDYLlz/x3LSBcYovPGoy7rrOUDYxE8l+KdfA==
X-Received: by 2002:a05:6a20:4a1e:b0:d9:c3f5:2933 with SMTP id fr30-20020a056a204a1e00b000d9c3f52933mr13424365pzb.20.1681191139912;
        Mon, 10 Apr 2023 22:32:19 -0700 (PDT)
Received: from sumitra.com ([59.95.151.140])
        by smtp.gmail.com with ESMTPSA id n21-20020aa78a55000000b00638f5b2d34fsm2375178pfa.32.2023.04.10.22.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 22:32:19 -0700 (PDT)
Date: Mon, 10 Apr 2023 22:32:15 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Fix logical operator continuations
Message-ID: <20230411053215.GA265224@sumitra.com>
References: <20230408171803.GA262580@sumitra.com>
 <ZDSksGyxnu5eIo+1@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDSksGyxnu5eIo+1@aschofie-mobl2>

On Mon, Apr 10, 2023 at 05:07:12PM -0700, Alison Schofield wrote:
> On Sat, Apr 08, 2023 at 10:18:03AM -0700, Sumitra Sharma wrote:
> > Fix logical operator continuation as suggested by Linux kernel
> > coding-style. Check reported by checkpatch:
> > 
> > CHECK: Logical continuations should be on the previous line
> > 
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> 
> Hi Sumitra,
> 
> That commit message can be explicit, like "Move logical operator
> to previous line"
>

Hi Alison

Okay I will change it. Thank you.

Regards
Sumitra

> Alison
> 
> 
> > ---
> >  drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> > index 5a1cd22f5e25..58ed394202ae 100644
> > --- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> > +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> > @@ -209,8 +209,8 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
> >  					&priv->rtllib->pwr_save_ctrl;
> >  
> >  	if (!((priv->rtllib->iw_mode == IW_MODE_INFRA) &&
> > -	    (priv->rtllib->state == RTLLIB_LINKED))
> > -	    || (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
> > +	    (priv->rtllib->state == RTLLIB_LINKED)) ||
> > +	    (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
> >  	    (priv->rtllib->iw_mode == IW_MODE_MASTER))
> >  		return;
> >  
> > -- 
> > 2.25.1
> > 
