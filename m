Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8CC41D63F
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926236; cv=none; b=XyQtwixHhKtFhIdnFDPFiokH3Wg7CVjWztWji24ZFaWwN+YBkcKKprqErtxTCWRbHEaIfdt2kco18HqiUODWz1v86NE2R1m+09obRj3HDpaRBAkq+rF6jnLDln4FKC2S++J/9+DzdvCnPdzpnVkWVydx4WFsslL2HU9uk63tZ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926236; c=relaxed/simple;
	bh=5GAmtYJRjyXO7QNDSg0XRLjnCIHj2W2dwtcdfFCVFRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiwqwUg1fXIlLPky/z/vMFUWZDbijlyh/+UiYNZeM3oaDqBslVhgIGkri/stlGcec94d5+P1mmPLrgb94aPqKUjs/QWMJbi+lbphPG7T7JQF+9/e3giwRxHNy69peUwnBOqojJX7DMQtXIVphNBAClPytrSO1eLSBr0Qvods5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQdOhxRg; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQdOhxRg"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5d9004047fcso999989e0c.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790926234; x=1791531034; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3DhBRZUBEMxswOFupavtILwkZxnofD7tHbJ4YNRXjDY=;
        b=iQdOhxRguWPgv/b/60RjiOJMysoAU+QqDDNABNigvHXEFvyvP++YzRjepq9Oy8cZn1
         91HhbJpx5HFe3TeeNnVaE/vDC8fa8hLpWtiRRvGno8xAoaNkZUIz2P9Bp8UiHTZ1cTEU
         rHNutp4PuHAAcMjq7QWVvyJnppqDSo4+xApKd0aynU4S/4tARu11TxexHqgw6trzUQqB
         saWgik+lFgcDBzYab+0DQtoygr8sqpg92FUlFTu4ahXWhIdiRZgM0I6qD/JIiF1VMAej
         kMMk6tdpyTKPiuKOE2/0mzSDKV1hbu/FAPIr3hvGcUKXtiSoi4/drAP+y1HM4xTerGIp
         L+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926234; x=1791531034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DhBRZUBEMxswOFupavtILwkZxnofD7tHbJ4YNRXjDY=;
        b=V7rIfkLR1LuOBD+jeKiAMWPlwQrao34gydAQhquZ8pVrOdL72lAfrJi0731l9rXWMi
         xtRjUcDU8Ezd17vXpCYFsPfH876rswqAGdERFwOenPd2vFoihjrfyKzEvk5m+utClIpd
         uxzXnUruPKemsA7O5nNr+HHdO+W7fNXblSZDmgPbsAekPvaeIM3DZt0FQEMLoJilsb26
         pGdvwKeSqJYbuhxOCafMnt6jOyaTPHxGFxFOUptMIBOVWGYj3cCXe+pOa0NUzWcrArcB
         WRLsIvBVQsgxDxMQN62uwLEmys90CopbeaO5cx9abPPJWK7GYMsYUTMm51hmsPtOgH3T
         vzlA==
X-Gm-Message-State: AFq9FYLkfM0xCL0NDGxenK0fFht40SbmDM8iPwR63t8DmSox71sZ6Yjl
	HLNnHOD6naNvl9xKjfCtGWC7R0QGSYFd1CkGMJY1LSIWkjgbo+cOeeus
X-Gm-Gg: AYBFou1h8m5f2WiaXSNyaBDTBUfU6PO6owmgDCy0eZCmWcACETVagVs4cqKSpNnGnIq
	DBQcr5c/d83Escp+4qcYE0sLG6LlTTwglRCyi8CGeBkY/UiMU2tFrehAKNhCJTEGREru8LhZTSs
	dfftkcaei0UXSDXXhGRemo+9XOMeAJ4YbpysrFYGxYceJkw9i8ysdV8fINt5h0+tm7kei4CXOTe
	cwzxaEiQM5/2Rtdy55e2Epd5VSbcI9W35B+vI0oHpxZNnsk6PfMhBcIsSsTh02/u47zP7L7TbqP
	vRVh0fEad+aMjSHrm54Pych8eDPVoUGfA1FP/svDTUsBIev5U70ui+tEXuwAa6kEdWyMcFyJr89
	ea/uv4Vs0W+La0x116icx2UL71DcHGeao5mQ/5q3IEeZaC2+cAMol3LyAVhm9ESP5qagAfpjq72
	1n3J7IC6V1yMlABvU3G1o+2XDDAWwUd2TXP+Xd9hh/wOegX1krzxxwBPvBtunJgC4=
X-Received: by 2002:a05:6122:6b93:20b0:5c9:a60b:e5a3 with SMTP id 71dfb90a1353d-5dab1a52819mr421807e0c.14.1790926233732;
        Fri, 02 Oct 2026 00:30:33 -0700 (PDT)
Received: from debian ([2804:14d:9ea1:8718:c77c:8:a40d:84f2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da62d10534sm2647081e0c.13.2026.10.02.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:30:32 -0700 (PDT)
Date: Fri, 2 Oct 2026 04:30:27 -0300
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: rename local vars in
 phy_tx_power_limit_to_index()
Message-ID: <ar9dk-Ja8tqS7ufC@debian>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
 <20261002-rtl8723bs-tx-pwr-limit-v2-1-48b180fb6f7f@gmail.com>
 <2026100258-probing-reactive-1191@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100258-probing-reactive-1191@gregkh>

On Fri, Oct 02, 2026 at 08:09:28AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 02, 2026 at 01:07:35AM -0300, Leonardo Martins Martins wrote:
> > In phy_tx_power_limit_to_index(), there are many mixed-case local
> > variables, rename them to adhere to the linux kernel coding style.
> > 
> > Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
> > ---
> > Renamed Variables:
> > 	pHalData -> hal_data
> > 	Adapter -> adapter
> > 	BW40PwrBasedBm2_4G -> pwr_base
> 
> "power_base"?

Yeah power_base does seem better.

> 
> > 	rateSection -> rs
> 
> What's wrong with "rate_selection"?  We have lots of characters you can
> use :)

Here I used rs instead of rate_section because I saw it being used
like that in rtw88, and I also saw the "Naming" section of
Documentation/process/coding-style.rst where it says local variable
names should be short and to the point.

Regardless, I don't have any strong opinions on these variable names,
rate_section is also fine, so I'll just use that in v3.

> 
> > 	tempValue -> tmp
> > 	tempPwrLmt -> tmp_pwr_lmt
> > 	rfPath -> path
> 
> Why isn't this in the changelog text?

Oh it really should be, my bad.

Best Regards,
Leonardo Martins
