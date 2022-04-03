Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D210EE;
	Sun,  3 Apr 2022 04:55:35 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j21so5388315qta.0;
        Sat, 02 Apr 2022 21:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kUho+lhvmxV7brTbWyWD6YBAbxEiznMLxM2RG/qNbi0=;
        b=C/VjivnMQ7u3WrE2jMPbSdDZ66Apq6t9jTvxgevpelL7gFXesHnmMuBMTb423wzHZe
         T9um4G9m00c+tBGrArgCttnBudMADQj/hBR/B37yqyaU0JCDuuFebOmJBvNx25FxDDCQ
         4386gXqEeSTAV+LFXYg3XIb8D3xVDpOjIxIDJKs0B70kLyU80C3P3fJJ++ChZMkAkXZn
         1CopDq3PBX0rUDeexfzKFSEDP3buvWAvB18vn7RWtxz6wNRj5TtuaEGrAK2myYaLXS8u
         RrRWugvGI33g6gdecB+X0/ulbHJnsH+xXJB2YGZr5BYqYk1B/M/MhbEHxEPJ/8D/h48N
         cPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kUho+lhvmxV7brTbWyWD6YBAbxEiznMLxM2RG/qNbi0=;
        b=aJp+97S4ZWgBBgmI5uDuEy0mSAnGxqzdbVsJk4ferl/qQ0airtXtY4b9IublsfM4Iw
         PidRva9dafzCCkHaNezlWd7ilqY1xAW0kV7W1en7VnTtSnYT2rrv2fONfH0PdFEiOO0G
         uaX4GICfiz7VR9Cqsfk5eqet4Z0Ujh1tI+afkAexKmvhbHzdnfc3ygcQskaqW1WUgiiB
         CyXfnZs3KZ8emlSjMWKZuwvv3umEQl/8LgPQmWHY9N0RXLroyue2+6P0m7T51xR/XkPF
         0rlW3lNU7zYAc6BE4N492H9mx/TduQaDHPF/qHEh/YH0OjTOeKUoIEBOrwdtQSrfvN+G
         JCNw==
X-Gm-Message-State: AOAM532T/DWw4eIyqm/TformixDaahKMYhY9+xh/vzCjObYHMcPQIU5R
	EBjXRxc3/uRCsF4gg/d2RxM=
X-Google-Smtp-Source: ABdhPJyjS3PusZ7wLVd4SqsMjD6uPEcBYYEPhF4QBQ+xq7Dt8koQL+u681oR/qxGQVCBHyeEL5dP5A==
X-Received: by 2002:a05:622a:1646:b0:2e0:6fe2:9f7d with SMTP id y6-20020a05622a164600b002e06fe29f7dmr13477824qtj.174.1648961734509;
        Sat, 02 Apr 2022 21:55:34 -0700 (PDT)
Received: from sophie ([45.134.140.181])
        by smtp.gmail.com with ESMTPSA id s5-20020a37a905000000b0067d35f2fdb1sm3990931qke.37.2022.04.02.21.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 21:55:34 -0700 (PDT)
Date: Sat, 2 Apr 2022 23:55:32 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: outreachy@lists.linux.dev, Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] staging: r8188eu: format block comments
Message-ID: <20220403045532.GA12084@sophie>
References: <cover.1648888461.git.remckee0@gmail.com>
 <0387f3df49d89c17acf96cf072e70c98e81e58f7.1648888462.git.remckee0@gmail.com>
 <563ddd2d-b8b2-dde6-a0de-c7bbebcc834e@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <563ddd2d-b8b2-dde6-a0de-c7bbebcc834e@lwfinger.net>

Hi Larry,

On Sat, Apr 02, 2022 at 11:37:27AM -0500, Larry Finger wrote:
> On 4/2/22 03:50, Rebecca Mckeever wrote:
> > Add ' * ' or ' ' to beginning of block comment lines
> > to conform to Linux kernel coding style.
> > 
> > Reported by checkpatch:
> > 
> > WARNING: Block comments use * on subsequent lines
> > 
> > Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> > ---
> >   drivers/staging/r8188eu/core/rtw_cmd.c | 29 +++++++++++++-------------
> >   1 file changed, 14 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> > index 2e135bbd836a..0c659b40aa1c 100644
> > --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> > +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> > @@ -12,9 +12,9 @@
> >   #include "../include/rtl8188e_dm.h"
> >   /*
> > -Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
> > -No irqsave is necessary.
> > -*/
> > + * Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
> > + * No irqsave is necessary.
> > + */
> >   static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
> >   {
> > @@ -97,14 +97,13 @@ static void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
> >   }
> >   /*
> > -Calling Context:
> > -
> > -rtw_enqueue_cmd can only be called between kernel thread,
> > -since only spin_lock is used.
> > -
> > -ISR/Call-Back functions can't call this sub-function.
> > -
> > -*/
> > + * Calling Context:
> > + *
> > + * rtw_enqueue_cmd can only be called between kernel thread,
> > + * since only spin_lock is used.
> > + *
> > + * ISR/Call-Back functions can't call this sub-function.
> > + */
> >   static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
> >   {
> > @@ -319,10 +318,10 @@ int rtw_cmd_thread(void *context)
> >   }
> >   /*
> > -rtw_sitesurvey_cmd(~)
> > -	### NOTE:#### (!!!!)
> > -	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
> > -*/
> > + * rtw_sitesurvey_cmd(~)
> > + *	### NOTE:#### (!!!!)
> > + *	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
> > + */
> >   u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
> >   	struct rtw_ieee80211_channel *ch, int ch_num)
> >   {
> 
> These changes are OK, but the rules in drivers/net/wireless specify using
> 
> /* abcd
> 
> rather than
> 
> /*
>  * abcd
> 
> Thus, if and when this driver is accepted into the drivers/net/wireless
> tree, another change will be needed. I suggest doing that now.
> 
> Larry

To clarify, I should make that change in this file?
And would it be better to make a new patch for it, or make a revision to this patch?

Thanks,
Rebecca

