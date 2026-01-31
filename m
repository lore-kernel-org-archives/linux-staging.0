Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB2E34E76A
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 22:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769897422; cv=none; b=i+DyJj+C0EWpK9kAY4jMWhUwszSouGfpZjxQyOauavXX2DJ0Psql26x8F9l3EqKkUP0LEmnBsSvgFWz/4aag0FtD0y4VphiXGFFCpfE/1AQO/yHmmREqU/sMc9BxFAtUxuQgXQXbmd04i8kMDpZODF8vMNxZ9tEpRBDJFBG/bp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769897422; c=relaxed/simple;
	bh=hXZNMmHvaM3/bJNv+N499aML1DIIKFxCtIUVStP8vHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeLRiLcx7crOdJViLegk8UYJ5763fubIHy3yldg2Kowar25fhuf15Uu0ENT1XsVnKZoN7GpuqBSDMZEj9k2ot371eUkGYs+0KegUT0v9kCu7TRDbpBYOKDynJfARbTcN0rnPYsQ5YC4a5Lg4tpGzK0GS8Bd8KzobR1bluEEATA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qf0AQiA2; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qf0AQiA2"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-505a1789a27so13697341cf.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 14:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769897420; x=1770502220; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O4e5J/AiG0+ew3WaOLmVTd+HTXzb2nikwAnJUxaUq6o=;
        b=Qf0AQiA2B0mG2OfgSaIjwwo+DB9ZOZoxRqhqmTWjSRnZypr/1fGYNctQvymvzAdOYA
         3OFc1IYl4PUsbQ6gRddXSj6rDU5f6p4ArGscIR0kE0Bk+/k0XkOJBjZX3t6dfLzhaR7w
         Vl974RNH5weWX53CPrQb3CfJxu3M1oCApVbPvrmIUL0J5RyVc/yhlmAKjDGaf/X28FLW
         xcHEwmCOI5eKoz5sxMIJxCliTFL0mPz8V2Ckuuf55AX58BOyT+R21YXfwo9lirMJ1aI/
         TKZ3aJQHLrlVL7Y5+SGPkkiJVM9o8jBlYe5jDDNXO2PHkuOmIyLr63eo5VZ8t81Op3jh
         xslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769897420; x=1770502220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4e5J/AiG0+ew3WaOLmVTd+HTXzb2nikwAnJUxaUq6o=;
        b=fIgoXOqwTaHlBPBKJ6LYRcLvQlbtLDfMUzH+bPikLXxEA3vngYqPhb23KGJuTk3gc3
         sr07RnLSgeSMo/oHDrM4Qa0jNICGnzgoIxpSC3xi5Gw85logfiodatCpt38dmHLoK28Y
         TeBwRmrML2Ols5qirEzJXL2hXNe/15mcP4uFqLozEMzIM1Lkustyns+zmemP9UNrzs24
         Q7idWwJtfW+MqQzjR60easGODJblO3o6k4q6QEI13EJ+F3LqWjtYUw+OW5NuSMELwjdi
         AdqQ2x0lUo1kCdR0db2a3+D491Ol+hxiUSDswjhPvzyNEGKjOfZyPfJ0OCfHIaGjHqAN
         AkmQ==
X-Gm-Message-State: AOJu0YyE0VU2AgdccPc9vxDDS7PYidIEQ6oANvmQACIIID5wjmwhQpcX
	YPwpxo0qvbtUMvZ6dRjNNNNB5ETb4SDwsTxJnrBODYfVpbRObMf1pW/D
X-Gm-Gg: AZuq6aJ9uBNj82K6aZStiKFaXB1tXgroTSSOm8dHvDxCA3RzhH0l8hxhMYgvhVxPy9o
	DUsHgcGXyMp4WTNo2AkUl+ntTQOwdA1Hb1+ecXtG7PyJJg0PvCbQ4/qpYioqeh+HGZFHrtEgzUM
	jkjz8HTTCHZvDqbYq4fv3Gu+Z0SDkn+jPSs7s73LkRHQE732BlDgJLf1n4IiCsCsFHLai3ZE7eq
	SZ9LAhgHYiHDsTAaPYmbZu5oJNIQ2rk6bw5KTOLWMMCzYzYqZ5A1wB+Z6vMR6D5JWF9fGhPKTnz
	5vMmyDcfVdg/Vo8FlDCToMfrrZx4RpFFSfjsHnIAiZRazbGKF4mXKJwgyF988z1Bdf5P/zkfO8J
	bMiblHaEqT9lP4owYVtu57vLe/hOjMWpm7323A3YV8gsbdNhg3V8uCHgxjTWtqI45c4R5z/NW4R
	WTXpjHlilz2Tq2yOjDl61L8vOdljIBE4apkUg=
X-Received: by 2002:ac8:5801:0:b0:501:4b67:1210 with SMTP id d75a77b69052e-505d2291118mr103070941cf.56.1769897419852;
        Sat, 31 Jan 2026 14:10:19 -0800 (PST)
Received: from localhost ([132.216.195.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5033745d7a9sm78278421cf.5.2026.01.31.14.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 14:10:19 -0800 (PST)
Date: Sat, 31 Jan 2026 17:10:18 -0500
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: rtl8723bs: core/rtw_mlme_ext.c: initialize
 copy_len, clearing later control-flow.
Message-ID: <aX59ynNjw_Q6yaqm@william-fedora>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
 <20260116160914.88069-5-william.hansen.baird@gmail.com>
 <2026012720-ending-obsessive-3555@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026012720-ending-obsessive-3555@gregkh>

On Tue, Jan 27, 2026 at 03:38:29PM +0100, Greg KH wrote:
> On Fri, Jan 16, 2026 at 11:08:51AM -0500, William Hansen-Baird wrote:
> > Initialize copy_len to 0 in rtw_parse_assoc_security_ies function.
> > This allows later if-statement to not have to explicitly set copy_len to 0.
> > Thus we can make the if statement single-lined, and remove the braces
> > from the if-else branch.
> > The change is purely cosmetic and changes no logic.
> > 
> > Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > index 842e95e1eaec..d470725a033f 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > @@ -946,6 +946,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
> >  	pstat->wpa_pairwise_cipher = 0;
> >  	pstat->wpa2_pairwise_cipher = 0;
> >  	memset(pstat->wpa_ie, 0, sizeof(pstat->wpa_ie));
> > +
> >  	if ((psecuritypriv->wpa_psk & BIT(1)) && elems->rsn_ie) {
> >  
> >  		int group_cipher = 0, pairwise_cipher = 0;
> 
> Why this line added?
> 
> > @@ -1016,17 +1017,15 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
> >  		}
> >  
> >  	} else {
> > -		int copy_len;
> > +		int copy_len = 0;
> >  
> >  		if (psecuritypriv->wpa_psk == 0) 
> >  			return WLAN_STATUS_INVALID_IE;
> >  
> > -		if (elems->wps_ie) {
> > +		if (elems->wps_ie)
> >  			pstat->flags |= WLAN_STA_WPS;
> > -			copy_len = 0;
> > -		} else {
> > +		else
> >  			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len+2);
> > -		}
> >  
> >  		if (copy_len > 0)
> >  			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
> 
> I feel like this is just polishing the code for no reason at all.  Why
> make this change at all?  What asked for it?
> 

The change was really only polishing. There wasn't an issue to solve and
it was mainly a stylistic choice on my part.

If you prefer, I can drop this patch and keep the original style.

Thanks,
William
