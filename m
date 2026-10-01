Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57150376A09
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855333; cv=none; b=ZoVQuo6NcOy+OcrnqAg9lb8AqiXXkWkTx/KLOWODvufrKv1TR4GVR5Sd+w1350Sh8IL7YhU2kr97oYjKDP+4pq5KJ+UHsOECal/TaY5nmR59baAOKGiIxSEGa8je/nYKoFjWVf3Sw4z5QoXS+U4jPe3kYGFhQsLTtO3AsAeV4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855333; c=relaxed/simple;
	bh=6o5vSm/8pzZoyowGaIOIKg6RgZJZiQbgtGxUIogZD6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGpJVKa+OdF8xYyZM498CNOTnU/EkRpgma+zZHrlkEJwMiGUmugLxobFNAi9C7g93dNqh3HeeseQ7M+NwaHK8Spf9TfDM7aPjXSHuMkpFfDkzCT8gRwiKRQevUeUO7WgNg/0yXWy9UL1i0Tbp1edV6I1YAGmGEjsjwNN/5QctHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYSApeny; arc=none smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYSApeny"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so904399066b.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 04:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855327; x=1791460127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zXoR/6CL8/yByPleCpxlRvTcX6CZ8c+uvh9L4CbDvI4=;
        b=BYSApenyny+6kp6Zwo6kKVE35pi6wfGRHOS4mA0NsiD8z8fpR1bdjsLDzxl8l/FYtF
         8G+PGanGt9QML/Spmxna1iOBxSp9f+7E6WwhLqeJAaJti5/mxiAsdJYu32TeQcVIx0o8
         JU6zpgaKs4kRBu7aeQalXNEfMN/FuzGnWuW57x4nGLTtXRceIQ5AeNDJh+dkSLW+N+/y
         4Aj5lpDUGO7ZphCcJSsk4IR7IqZWODnZb/YJl17nRByzDrZQHjc/imaox3HQIAmKZPg0
         rau2p4wcMTFVEZWEgIIO2T0sim0Wcp1oXO8XHuZxW7qJ/1p/sDPPHeb2cIXi8pUireb2
         rP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855327; x=1791460127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXoR/6CL8/yByPleCpxlRvTcX6CZ8c+uvh9L4CbDvI4=;
        b=wYlM8SbjMzKEhwkHbg6gzmc5Qjj/UPFIsZRky/p84f10BcE6VNFMX2WPLj+MEM7D0j
         xc11bKx7NwqJDipTeamCpqZ8jobv2NZULZ0wOYW3AAcVOGU3yJTQLMUJCMmPB2C8RZEX
         ObrDuVKXd1AOzi2ycaUydtECQUdAAuJ9Ne7eLgxU1TT7ABYhCfba3c2/zXPjGNvwOUp3
         o+XKzuM4QQhZ7/hw2yr/i2altxxUePlVOvamUyBhUbN4YMGEVcvKW+5ORh/3u2tXG7dl
         N5VuWsjMzgtaD5E7o+WFJ6KdZ49xxTUNID+Zce8L8QLYB+GtXF1RXRlibEoCmWqcNQ0P
         pDkA==
X-Forwarded-Encrypted: i=1; AKwUvBwWH5QitcBOTgWh5kELWGcvWott6RF9jyf8ltIKPWBfegMD9mDNjJyaIpOnIO3JKmBZ+0wp2ZqV7DCVn3GS@lists.linux.dev
X-Gm-Message-State: AFuF++k4dycMwAOZPYxEKC9Mguu+QM98fAQQ7ouyHs9FRlUzs2qk9Zhd
	cEgpZxbiZci1bVA70Wev/FgPbDD00ucRMo83HJWplIi36FHB+/oJg8Ga
X-Gm-Gg: AYBFou3o9/ccl+ge9vCH2rg9liB+84J1mn4myaea9gyjTxNA31wAo8WodC+rAe8/6Vv
	EwX+eLekPRYWGAheTUk1nsbHNnDyjjJcO0hR+TKAtUVIUEIsv1b8UPV/WvhKrvm0owRAPcVIyUp
	pDh00E5fGbndFPEmN9Gunu6o9B/I5hhtJMuA2AW3ufRk6rIBl6e2XzsxPs8g91P9oKDFx6x2c27
	EjzaAewQUq+aSu7RrJYtmqYbHN1KqApR1It5xhSKt79zl4I9RsUO0hzCdOWJNDHV6X1qlQYUyfc
	PeErtk05yQl/La2kOplflPxNRaJRPPOSld3dRX1FoV5sP5IKBsn14TYXap+GQGWbNo+beCCI8yQ
	MWehXvnVKFzhREW58jZ88VzxB769Xewiji67l03tCN/f6DqbD758gO5XzGpHhbiyPI324oyAC2p
	OCyF9h7NJgMz6TuWyc1PJEjAafYgFK4G5w1CeIEFnCJcmt3xSL6Nhqll8pjQZgrvi3LEU=
X-Received: by 2002:a17:907:6ea4:b0:c2d:c0d8:6027 with SMTP id a640c23a62f3a-c2e23ca1616mr399206766b.8.1790855326536;
        Thu, 01 Oct 2026 04:48:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d45065sm141341066b.49.2026.10.01.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:48:45 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:48:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Prud'homme <t+linux@prudhomme.li>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix lines over 100 characters in
 hal_intf.c
Message-ID: <ar5ImtTs5L-p9rwD@stanley.mountain>
References: <20260909174152.16934-1-t+linux@prudhomme.li>
 <2026100148-elixir-depose-a7df@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100148-elixir-depose-a7df@gregkh>

On Thu, Oct 01, 2026 at 07:41:13AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 09, 2026 at 07:41:52PM +0200, Thomas Prud'homme wrote:
> > Wrap the parameter list of rtw_hal_set_odm_var() across two lines,
> > and move the comment on the rtl8723b_HalDmWatchDog_in_LPS() call
> > above the call instead of trailing it, so both lines fit within the
> > checkpatch.pl line length limit. No functional change.
> > 
> > Signed-off-by: Thomas Prud'homme <t+linux@prudhomme.li>
> > ---
> >  drivers/staging/rtl8723bs/hal/hal_intf.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
> > index 2caade1a8..1096f5441 100644
> > --- a/drivers/staging/rtl8723bs/hal/hal_intf.c
> > +++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
> > @@ -89,7 +89,8 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
> >  	return GetHalDefVar8723BSDIO(padapter, eVariable, pValue);
> >  }
> >  
> > -void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
> > +void rtw_hal_set_odm_var(struct adapter *padapter,
> > +			 enum hal_odm_variable eVariable, void *pValue1, bool bSet)
> >  {
> >  	SetHalODMVar(padapter, eVariable, pValue1, bSet);
> >  }
> > @@ -216,7 +217,8 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
> >  void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
> >  {
> >  	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode)
> > -		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
> > +		/* this function caller is in interrupt context */
> > +		rtl8723b_HalDmWatchDog_in_LPS(padapter);
> 
> Doesn't this break a different checkpatch issue?
> 

No, it doesn't.  But, of course, yes, multi-line if statements should
get curly braces.  It's an unwritten rule.

Also I feel like loop macros should get curly braces as well but that
might just be me...

regards,
dan carpenter

