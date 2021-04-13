Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DF56D0D
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 11:00:39 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id w8so5672280plg.9
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 04:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=A2IPqO8My7+g2aQ2CPPds+GGz3tnCFkMYnx9rkmowbs=;
        b=IWXJy/3eCQ9wrYX4wDMDoBSXlvDioLUOwRwW7HXRuN1ud3h8dWb/emC2b40W9OXO3U
         OtZHUHJKchtl7d9x69X8CUtmtTNXIODznLcANtFZ9je3MAUKDZUecBxinXaYZ+HZZNK7
         PfOAcujMoMmuE4XK6v25mTbLBRgVmA/1xX50I62zyJzg08e3v6msgnCpzggX3slIdxA+
         P4YUrtCwlke6iGZonP+5QT61/P/4yzResTBBqY+y60b56y5jl+KP5E6h+jKjl84xIk3W
         fzAmRKwROABGsyR82AGOUKYengiTQSs4uChnIEasfpijnjhHI7P8u8OtYNtJkYNMI1eU
         pgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=A2IPqO8My7+g2aQ2CPPds+GGz3tnCFkMYnx9rkmowbs=;
        b=lkhTvyO0/GUz1QcaTA4qFl3SVIULHs80t+TY7HJnD5MFk5ZfFcnVay5mPazGQ9rxLW
         xsu9E4c/gYiqPYz0G7O1SV/pR6zSuZrJoHpSCCUsC8mUV9uYILjJ7fw3xRJJcuiXsG3w
         aXFROr7wARKOHIPxk9etYvF0WY4YCiVHwm3zOqezrrFn4KDTZ/mOvSdm+Kz9tIM9Dge8
         6FXtGdiC+8uGkqilgMRF8Trjl0aCqfFWpdeztNTbh6+Tl3q8zK+ca3h9Dr8RNwexc6KL
         HOAHNYJXaxjTWdj2lm8UD/41CpT6V4JXEeinRNtUNOu4mCD+CQHnHDQtffQGZyd08L91
         FaRA==
X-Gm-Message-State: AOAM531mR8x53RuLBT99MunO+beP/1IfMgopOHqtlpKcszMjmBa4X70U
	NwfmPyL9LSMWNFes0d218QE=
X-Google-Smtp-Source: ABdhPJwa3YAyS4HNh3it26S2hz0C3HLu6d8pMlgiT0mrr7RU8dAu2wVVZ2b6pOev0ymU96E7h3iKcg==
X-Received: by 2002:a17:902:b40e:b029:e6:837f:711 with SMTP id x14-20020a170902b40eb02900e6837f0711mr31093234plr.2.1618311638686;
        Tue, 13 Apr 2021 04:00:38 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id e1sm14299002pgl.25.2021.04.13.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 04:00:38 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:30:30 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 4/6] staging: rtl8192e: matched alignment with open
 parenthesis
Message-ID: <YHV5zikK8CUheULV@kali>
References: <YHEA2Te3Hik5J39t@kali>
 <f5fe04d62b22eb5e09c299e769d9b9d8917f119c.camel@perches.com>
 <YHEMrQdEFpXgmMh/@kali>
 <04fcc5ac37f750e335447aee57da5aad072e321d.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04fcc5ac37f750e335447aee57da5aad072e321d.camel@perches.com>

On Fri, Apr 09, 2021 at 07:31:53PM -0700, Joe Perches wrote:
> On Sat, 2021-04-10 at 07:55 +0530, Mitali Borkar wrote:
> > On Fri, Apr 09, 2021 at 07:07:09PM -0700, Joe Perches wrote:
> > > On Sat, 2021-04-10 at 07:05 +0530, Mitali Borkar wrote:
> > > > Matched the alignment with open parenthesis to meet linux kernel coding
> > > > style.
> > > > Reported by checkpatch.
> > > []
> > > > diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > > []
> > > > @@ -154,7 +154,7 @@ bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
> > > >  	    (net->ralink_cap_exist))
> > > >  		retValue = true;
> > > >  	else if (!memcmp(net->bssid, UNKNOWN_BORADCOM, 3) ||
> > > > -		!memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
> > > > +		 !memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
> > > >  		!memcmp(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM, 3) ||
> > > >  		(net->broadcom_cap_exist))
> > > 
> > > checkpatch is a stupid script.
> > > Look further at the code not just at what checkpatch reports.
> > > Align all the contination lines, not just the first one.
> > > 
> > Sir, I have aligned them in last patch of this patchset.
> 
> This sort of change should not require an additional patch.
>
So now should I compile this as a patchset of 5, removing the last patch
of alignment?
> 
