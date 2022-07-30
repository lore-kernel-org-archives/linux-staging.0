Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE22574
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 18:37:02 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id l22so9450260wrz.7
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TRAXgV5+4KFo44IYj7c1ZkfqvHrarfrCB5sK/JIenvU=;
        b=UPqwM+d5w4Le3G5E+AEXJSI90MPvhs76FZf1qFDxO7qZvDmkRHAjpKh7EawIWlqbGM
         DQCSLMycVYoKeIvA33wp79RyjnRPjICTx9hcyB80W/vvdpNgSznRpeRU7cUqSxLdIM92
         8LP365WKYif8yz60XIJyJIqC8tWDfvcQaZk6O+FHCIpgPa4nOusW/TbicD/lntKttpFt
         65Ozhy2dLvkc9c8hh85BO8PcYp/mT5f1L6S56j7uHxLelSb0ERf+lANDSEfffhmZZe/u
         MfJEajZIIQzCI6CrlYfT31M3tK2QjgQH3m+iAc+aF0F6cIopVhDy97m9U/zB0PcGAwFQ
         zONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TRAXgV5+4KFo44IYj7c1ZkfqvHrarfrCB5sK/JIenvU=;
        b=52b7QnU0jDBUsYEm8exQjqBCugisVySUrmGDzmGno/v2ntFZW8qo9Pf+aAv5Mu6qKa
         O3AuilpgIULxXgGQL5txL3zcM5OOIFF9X83gfRBvz/aOT0VKCZVf7HjZgOQ6uHLwBAWa
         mN1CJU1ZElCmSr/eUzTDuIElxyd088HkF3tzYgbQoyG+ssR3hLlYhHbWt4Y6899ufZrf
         9FGsx68q5dcZaTlhEzFBEU+herah8BXJyBp2+4vgmmO3jpOUMZkE7vl92jP1B4L5+Rx2
         8J4cGHdqmL6B0c7uQzfPE8kd0Ew6L+1cktZP5BSMEZtyQ4DEgIFwf+WDAW4oCtQ6PE2X
         lZZA==
X-Gm-Message-State: ACgBeo102VgCQjgMgE5fsHhf+yAOAjtkvqwVNjPKTtmNpTGsyHJt4IKt
	NFYm+d9Vzv0v12LU1JNymPHanw==
X-Google-Smtp-Source: AA6agR4M59kJ8HR5FMOzBlEVjI9/veKY7t6DeP4amjMm2D277J07XnvQ/W3llUD989xngZo3JKwl9A==
X-Received: by 2002:adf:f109:0:b0:21f:14df:42d2 with SMTP id r9-20020adff109000000b0021f14df42d2mr4524624wro.45.1659206221120;
        Sat, 30 Jul 2022 11:37:01 -0700 (PDT)
Received: from OEMBP14.local (82-132-226-84.dab.02.net. [82.132.226.84])
        by smtp.gmail.com with ESMTPSA id l3-20020a1ced03000000b003a046549a85sm13621645wmh.37.2022.07.30.11.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 11:37:00 -0700 (PDT)
Date: Sat, 30 Jul 2022 19:36:57 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	paskripkin@gmail.com, martin@kaiser.cx, straube.linux@gmail.com,
	fmdefrancesco@gmail.com, abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: r8188eu: convert rtw_set_802_11_add_wep
 error code semantics
Message-ID: <YuV452xuR1S0WyJi@OEMBP14.local>
References: <20220728231150.972-1-phil@philpotter.co.uk>
 <20220728231150.972-3-phil@philpotter.co.uk>
 <20220729064803.GT2338@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729064803.GT2338@kadam>

On Fri, Jul 29, 2022 at 09:48:03AM +0300, Dan Carpenter wrote:
> On Fri, Jul 29, 2022 at 12:11:50AM +0100, Phillip Potter wrote:
> > -u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
> > +int rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
> >  {
> >  	int		keyid, res;
> >  	struct security_priv *psecuritypriv = &padapter->securitypriv;
> > -	u8		ret = _SUCCESS;
> > +	int		ret = 0;
> >  
> >  	keyid = wep->KeyIndex & 0x3fffffff;
> >  
> >  	if (keyid >= 4) {
> > -		ret = false;
> > +		ret = -EOPNOTSUPP;
> >  		goto exit;
> >  	}
> >  
> > @@ -424,7 +424,7 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
> >  	res = rtw_set_key(padapter, psecuritypriv, keyid, 1);
> >  
> >  	if (res == _FAIL)
> > -		ret = false;
> > +		ret = -ENOMEM;
> >  exit:
> >  
> >  	return ret;
> 
> No, this isn't right.  This now returns 1 on success and negative
> error codes on error.
> 
> There are a couple anti-patterns here:
> 
> 1) Do nothing gotos
> 2) Mixing error paths and success paths.
> 
> If you avoid mixing error paths and success paths then you get a pattern
> called: "Solid return zero."  This is where the end of the function has
> a very chunky "return 0;" to mark that it is successful.  You want that.
> Some people do a "if (ret == 0) return ret;".  Nope.  "return ret;" is
> not chunky.
> 
> regards,
> dan carpenter
> 

Hi Dan,

Thank you for the review firstly, much appreciated.

I'm happy of course to rewrite this to address any concerns, but
I was hoping I could clarify what you've said though? Apologies if I've
missed it, but how is this function now returning 1 on success? It sets
ret to 0 (success) at the start and then sets it to one of two negative
error codes depending on what happens. Am I missing something here?
(Perfectly possible that I am).

In terms of do nothing gotos, do you mean gotos that just set an error
code then jump to the end? If you'd prefer, as the function just returns
right after the exit label, I can just return the codes directly and have
a 'return 0;' like you say above?

Thanks as always for your insight.

Regards,
Phil
