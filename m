Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D645F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 10:04:04 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id u21so1977283ejo.13
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OCvNknNouVcT+J3VJsfOETcTV0+YmRxhcYvHLVChqKc=;
        b=XBE4cC1UNniT+xkqPdJRM7QYfO182EBTnhzzd6w9FiaXPLl7l+YkokWnm+RKYuoms8
         4WmrDRNvqDhTAnNV9yppCl7ZeggFQuGd1T9J284BoPWJ5GBE8i5jQsEPHoVcjnQO1isr
         jEXfNztj15bZvgYX77exj828UPQy/YdhtXj7tKzBhzZMM0PRwRFIOPyavY7i7tpjfZBc
         zisug5RLWNYJP7Msdgu60euWT15cZzlbYRwIk2T696cFUWjwtyaxpjKrau3tIREXzVYS
         XlZ9tnb7+wg9fTd2XyRaQBPMVSapkNNmiVP9UH8D/xVQ9fmeESsTSgoIwe7KUewNS1bG
         bf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OCvNknNouVcT+J3VJsfOETcTV0+YmRxhcYvHLVChqKc=;
        b=f/HZ9OnHO419bpPJuBqlhO+j51SEpwpL9ws6PvQR9QJk+BgM7plkTvoF3RD2UBcANc
         Vk8OX25iXG3ADhyRWOb2wYGHPJRJzVsKudrSQv2Y4D7ZlKWKYwoOX9EKXkrrTIj/bq6i
         zbNnf7iYbzZX8np4uWADOq9tDtqyYKsi5ClhcoGqXgM13+dRbgaMD4nOeq6Z0KNERaKY
         CfIICso9JuUC3aX5kWfwOJ/TW2Iv3UBR7T5LnxS123uKixSTypEogVWT/LH1nFmdWVU3
         NLJaJEYp83quKqfZhP7+9EG8aLWF+erWrTKBypNJrYpwG7b//deXKKVtVJUIoJ3vA+GF
         B1Dw==
X-Gm-Message-State: AOAM532QyICpxLlu0z3vO0dJ5LB8GgUCzZv9TEUS/Lk1yBGQ4myHDmbL
	76qx6uV3z34fBl+hZX+t23M=
X-Google-Smtp-Source: ABdhPJzSV13oS0rfd6pUKeJfUfFWjxsfwYB/9uqQBxAwpzTAKkmZZIkehx0q/1kUDRqwka5sp4ZEEw==
X-Received: by 2002:a17:907:2d9f:: with SMTP id gt31mr8125991ejc.233.1617271442653;
        Thu, 01 Apr 2021 03:04:02 -0700 (PDT)
Received: from agape.jhs ([5.171.72.75])
        by smtp.gmail.com with ESMTPSA id l10sm3327014edr.87.2021.04.01.03.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 03:04:02 -0700 (PDT)
Date: Thu, 1 Apr 2021 12:03:59 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/49] staging: rtl8723bs: remove RT_TRACE logs in
 core/rtw_cmd.c
Message-ID: <20210401100359.GA32563@agape.jhs>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
 <7f51432d99459d79742639341f107115f0c224c5.1617268327.git.fabioaiuto83@gmail.com>
 <20210401095017.GR2065@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401095017.GR2065@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 01, 2021 at 12:50:18PM +0300, Dan Carpenter wrote:
> On Thu, Apr 01, 2021 at 11:20:38AM +0200, Fabio Aiuto wrote:
> > @@ -677,9 +663,8 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
> >  	u8 res = _SUCCESS;
> >  
> >  	if (pmlmepriv->assoc_ssid.SsidLength == 0)
> > -		RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_, (" createbss for Any SSid:%s\n", pmlmepriv->assoc_ssid.Ssid));
> > +		;
> >  	else
> > -		RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_, (" createbss for SSid:%s\n", pmlmepriv->assoc_ssid.Ssid));
> >  
> >  	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
> 
> This is a bug.  Smatch has a check for this which hopefully would have
> detected it (I haven't tested).
> 
> There are some more similar issues below as well.  So generally the rule
> is don't adjust the indenting if it's not related to your patch.  In
> some cases you have been fixing the indenting but it should be done in
> a separate patch.  But the other rule is that if your patch introduces
> a checkpatch warning then you need to fix it in the same patch.  In
> this block the whole if statement should be removed.  But also if you
> have something like:
> 
> 	if (foo) {
> 		RT_TRACE(blha blah blah);
> 		return;
> 	}
> 
> Then checkpatch will complain that the the curly braces are not
> required.  (Checkpatch might not complain for your patch but it will
> complain when we re-run it with the -f option over the whole file).  So
> you should update this to:
> 
> 	if (foo)
> 		return;
> 
> That's all considered part of deleting the RT_TRACE().  Also if there
> are empty curly braces then delete those in the same patch.
> 
> I have looked over patches 1-7 and those seem basically fine.  I'm not
> going to review any further into this patchset because you're going to
> have to redo them and I will be reviewing the v2 set later anyway.  So
> just look it over yourself and check for any similar issues.
> 
> regards,
> dan carpenter
> 

thank you Dan, I had a lot of trouble thinking what was best,
and sure I will install smatch on my box :-D

fabio
