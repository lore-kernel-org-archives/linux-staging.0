Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370415B141
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839308; cv=none; b=tJkos/gHUdLsC0DGFMLWcQmgrh2nyYxwd8ufUEH/jDeOdiSWhDKYW0Dc4InIZSsCR3TtNpRfH9GHNIoejIJgR7uBRO9Gq3VeoP59BSCwFDiTg6ceckTSqpOXJfF5pB/R4cm7NVHQWdvOn6xadqgT236MNxgrhQG7pPp21JPDVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839308; c=relaxed/simple;
	bh=/7MURJkSBPRxvFV2K/o6yQ4iEcMvcArJy/YsuJZSYlk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqA96iOUFEcba5oVe1E5awt2CIT5gemhtsbMkQwx1/U9jGXOHxzY9kv3+xkBm9MZ5FnWI4JU/r1dvVkzEWUlMPfovmt5ufNlVKGsmnZm0h9s/avuKTtXHPaU7xup6TRjZvxcIspsndBrUgMNYgywLjqlwWrXAaWyMKaPV8PzOj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxMcOnid; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxMcOnid"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-201fbd0d7c2so54207255ad.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724839306; x=1725444106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ILQ333BDFlU5S5fyU2L5G2VIKc+hOKagrbroJak6mWg=;
        b=YxMcOnidlb1KPkcpVW5ZhrrHyuYCSZ1lA/1vAdNFZZNwEUX9JOFXVGw/f21qEqchAX
         MOW2DIzS/R2Zrfe/lrqXIwvJ+0nu8am+Ov6GocJvO3KkENmxvwsTtlnugrRr78B6SnaS
         tJ0Z7AcwRjhFIhCdqiBnOofDW7cqgL/eG876YUuINtqsCPCQz3D3LDmpezOQSUIYNtOY
         debc87FtBDHoPrgGmZCOy/GLx2AUxtcDhI/fMiJTzqxMoX40r25lpZhcOOUWtCv6zMin
         7S862rmIH0dNZBPdeIQkzd/xgg4mo+pv4TkXqJrusFPc64ZEOa4UEOoteaSWrdJbAYYb
         qUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724839306; x=1725444106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILQ333BDFlU5S5fyU2L5G2VIKc+hOKagrbroJak6mWg=;
        b=hdsEccjM3yjAmd6pe+DgMTvf+zk4zPa0EV1Ii5GciYj7o46K6bbcy3plVu7z60oNYy
         n5eQ5IjiWtbyspiR74x1EZWHrroVL4BIeSbEvds/GtU8vidEkhqfOkLatjaImJTWG9En
         hEEUXw/fhgJ2ie0HCbJEdSIp/n9LDvH1j9edB2SJpxRJCVEAp5ljK6n3KTCD8TmrlR/s
         EQffd1tN6KM5o7YxD3xRJAEQMnnJQ20FLXqcKiIZEQb71h6V6OfUphwWqmfAPz6QCeI7
         vsga5hTuVEpfexi25DosRgZSwtO5njRomxO0g89hC8kLzuY4/iDpVk8s0uh3b577BEkX
         wEYg==
X-Gm-Message-State: AOJu0YwKZRuqGC16wBhiIHxtzD5ge1ikBQlf0tB+JkvSvxkzb9+NQrdC
	YRR0hX6VP7E1GL3zlXbeFKGDYaCrG6jzzmiBwByaXsZGaMtUzkSl
X-Google-Smtp-Source: AGHT+IFXwWv0Svgce9lob7cKs0SAQGG+i+XSbJVD7qmDdNe3kJdMmO8lgf/9SvJkUmZ6kPkTyj0a9g==
X-Received: by 2002:a17:902:d512:b0:203:a0ea:62a3 with SMTP id d9443c01a7336-204f9a3eca5mr13492065ad.1.1724839306246;
        Wed, 28 Aug 2024 03:01:46 -0700 (PDT)
Received: from victor-IdeaPad-Gaming-3-16IAH7 ([116.68.77.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385bdca67sm95440285ad.251.2024.08.28.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 03:01:45 -0700 (PDT)
From: YOUR NAME <vivek6429.ts@gmail.com>
X-Google-Original-From: YOUR NAME <username@gmail.com>
Date: Wed, 28 Aug 2024 15:31:41 +0530
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs: Rename function SelectChannel()
Message-ID: <Zs71hc9-p0vST-7Y@victor-IdeaPad-Gaming-3-16IAH7>
References: <Zs7vQXhcYRCxCDaH@victor-IdeaPad-Gaming-3-16IAH7>
 <2024082848-ice-unfixable-6a09@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024082848-ice-unfixable-6a09@gregkh>

On Wed, Aug 28, 2024 at 11:38:18AM +0200, Greg KH wrote:
> On Wed, Aug 28, 2024 at 03:04:57PM +0530, vivek t s wrote:
> > --- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> > @@ -455,7 +455,7 @@ u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
> >  unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter);
> >  
> >  void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode);
> > -void SelectChannel(struct adapter *padapter, unsigned char channel);
> > +void select_channel(struct adapter *padapter, unsigned char channel);
> 
> This is a pretty horrible name for a symbol in the global namespace, can
> you rename it to be more sane for this driver (i.e. put a prefix on it?)
> 
> thanks,
> 
> greg k-h
okay, will change and submit again.

thanks,
vivek

