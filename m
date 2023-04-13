Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7EEAD28
	for <linux-staging@lists.linux.dev>; Thu, 13 Apr 2023 16:10:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id o29so3664091wro.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Apr 2023 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681402251; x=1683994251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxhfaeVmSMj1ooJ+GI5JYtziwZS5hnJz5+YIfhecAsY=;
        b=JZGS3Cx9dJu4XC/Z2tGHpQhSaw4QPoqfih9/B5HS4OW/nWd5q4b1LQsavW/EG1VKTK
         P0/5/utyOkzKjMKz0ry5WoJKUrMbj7T0EAZUqqmzFQ3EkNav2dQUf2fCAggccYt6Np1g
         gvFyaIzDa/Shb0tRlWshEcoUxQN0p/2OPcZjaLkAORwPJ0ZWqm/GobyuU0YKSYNB6+rA
         Nqo/9QEVcqDM5EczCK0vLsGOWfzkRTvygNyERGSE904FW1xZfXejqIoT+D5TfdDK78/K
         XF+4NhPpx7OnACQDNCtP1fxVcSZPQaq1/lz5sBIHXuoVNp3Y+XlFQxNaari3xVSoqxgH
         aSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402251; x=1683994251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxhfaeVmSMj1ooJ+GI5JYtziwZS5hnJz5+YIfhecAsY=;
        b=HT54ONVyymP+w1RaKrgPhAlGn/yeCEOBZsZ2OMwCOhEnuDOl16L6vhK/tW5bcMQWES
         gipxy51GI0rmzg/isAcnyK2EKH4bwZTH8T5qJenM37rOgO4BZ3+PKJ2+K5b6qHmr0rOX
         Rz/uZRkwSzRndVSUa/dJMDx66UPdYgdFZ+u1M0BRZnAk/cj7HJBS1qQER/KY8aL3UPsR
         c6gbDGei+Bl0d4IEaOkgcO8GFuzxmJFF1X4tn2Dw4pnV4BM12FK5TVyr/EOWNLoINZwF
         nx8S2FaSPaxLNOJbyqY+O22aIzlxK0czzvXLOfhydgKp6ltdCFLFczpqV52uSWGF3Biz
         LTKg==
X-Gm-Message-State: AAQBX9fY33rU8XNyBwejws8y4Um12qksLpoVf7hIARaTgdcjIfsHVAZD
	vvVCGiimPOaZqKcm1ARW7PQ=
X-Google-Smtp-Source: AKy350ZmL0jv9Fv0h834EwT/L4/OH9X+H2tpoq3EcZanDBDsPudFnSBoOEgKQrERrEaFMWdGIfwBYg==
X-Received: by 2002:a5d:6450:0:b0:2f0:15b8:d2a3 with SMTP id d16-20020a5d6450000000b002f015b8d2a3mr2047445wrw.29.1681402250871;
        Thu, 13 Apr 2023 09:10:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z1-20020a5d4d01000000b002e5f6f8fc4fsm1563370wrt.100.2023.04.13.09.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:10:50 -0700 (PDT)
Date: Thu, 13 Apr 2023 19:10:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ladislav Michl <oss-lists@triops.cz>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [RFC 3/3] staging: octeon: convert to use phylink
Message-ID: <4ba4bab4-c9ab-468f-ac35-510612529b89@kili.mountain>
References: <ZDgNexVTEfyGo77d@lenoch>
 <ZDgOZZb2LrlFEEbv@lenoch>
 <0af60abb-d599-4fdd-9bf6-ccf14524fe44@kili.mountain>
 <ZDgoH0KQ/Q0ydxn3@lenoch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDgoH0KQ/Q0ydxn3@lenoch>

On Thu, Apr 13, 2023 at 06:04:47PM +0200, Ladislav Michl wrote:
> > > diff --git a/drivers/staging/octeon/ethernet-rgmii.c b/drivers/staging/octeon/ethernet-rgmii.c
> > > index 0c4fac31540a..8c6eb0b87254 100644
> > > --- a/drivers/staging/octeon/ethernet-rgmii.c
> > > +++ b/drivers/staging/octeon/ethernet-rgmii.c
> > > @@ -115,17 +115,8 @@ static void cvm_oct_rgmii_poll(struct net_device *dev)
> > >  
> > >  	cvm_oct_check_preamble_errors(dev);
> > >  
> > > -	if (likely(!status_change))
> >                    ^
> > Negated.
> 
> On purpose.
> 
> > > -		return;
> > > -
> > > -	/* Tell core. */
> > > -	if (link_info.s.link_up) {
> > > -		if (!netif_carrier_ok(dev))
> > > -			netif_carrier_on(dev);
> > > -	} else if (netif_carrier_ok(dev)) {
> > > -		netif_carrier_off(dev);
> > > -	}
> > > -	cvm_oct_note_carrier(priv, link_info);
> > > +	if (likely(status_change))
> > 
> > Originally a status_change was unlikely but now it is likely.
> 
> Yes, but originally it returned after condition and now it executes
> phylink_mac_change. This is just to emulate current bahaviour.
> Later mac interrupts should be used to drive link change.

I don't think you have seen the (minor) issue.  Originally it was
likely that status_change was NOT set.  But now it is likely that is
*IS* set.

regards,
dan carpenter

