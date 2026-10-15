Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A253DFC80
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078336; cv=none; b=b3iIw18enUbnRVJ9ZCdIQFcArMcf1exc/xAu9lw6ftS4krma0wZgdrFoXMMnEAqArAgc2TqOVYj00kewlqwLySp/oBgvwmMvH6/rEc8mr8j9gwORt5Blt9nQAyh6rgKpnJ3zSC//g7iw3tFofqruzE1MUu41y6tF9urMsoWishk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078336; c=relaxed/simple;
	bh=e0sIXOKR0xs1k00jTBjY8M4GueDsJ90MJVOQ7kmfR9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5TkKXaBmnciwUGyvXkNpPPrjH7hHiQZ61sblykoUMdoSNBwc/tjZFReNs8Bzx8KraOiFaND9rVAReBpKTsUJoegh0lsEM7E3JbhHhqKVgW1jui2zRblxKWTh3vbThF/AyozcsM1zFJTflF/Poy1GalRx/uSPCrg19HXS92TSxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZJN3tBE; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZJN3tBE"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so3209541c88.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792078324; x=1792683124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/PW3Wn5OQKVEn/pyyX/DchOj7A4//pr+AwRdQo+Qcw=;
        b=IZJN3tBEU6eQcgRhPmYcj+eWYjPuP9LMr0Khy0s88Yo6tiJFyWt3c2KDIbEorhdcCl
         r5Bn2zgqj20+9vIPG3EJa7Hfkqy2HcBmIxuid7ILPD/33j//Igb8Fmp2qCZNFVzeY+FE
         OMh8JX3GIcqnYaAjzBbpLu9V2/ZG+kzhH+aIPZ5F/+it3BVEJBSo2OyWTSD1cmkBrsTT
         Dp/JZq96cc7DFShaXeN2DyBHUEFqFRYDCiXXz1tRR/lNeuxqFWd+HDt4Aqmo3hltJ899
         Zrkm6zKex4BSF1lpwMNncBtymigYeyMzUfD3choA/eYHMG5dfEmvJEcNTjwUGpke0ry2
         UgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078324; x=1792683124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/PW3Wn5OQKVEn/pyyX/DchOj7A4//pr+AwRdQo+Qcw=;
        b=j/832/c/sg6ijExayuUAw0bx16I7fem5KYxpQuZC83CVXLnOpeVXsu0uq4HYzOcNPO
         YN2vZihhm98y3xXInaig07KLSxzZrtgfYqjLANi6e2xmZGM2jHHnGdyJkStfxJPUKsVW
         3PJEJ8zI8UmdaTMzDhKTjt1F5SxCVammRFm/M8KSDTqEzFh0uZNmFfWcSGPyBBv0+wt4
         KVgz+9D/zxJ/USgR89ZeC/2K1qHYWTi0tyv2PKxHI5/FmZHxhiVAg4XH1qU/Lsyre3Ub
         EHyAUSCAq+sR37i25Oq2tQryStePM16wsxw3Ft8YC4guvdBZRfXpPGmOV3QmjzM4zgGv
         9BuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqxa4vo7QGtwFXpRoCAsCnc/qcPjrMZ1Mm4ekmxPpsDWox6j+GK4NmgldGlev8FLuhxtDde7maX+qIn+3f@lists.linux.dev
X-Gm-Message-State: AFq9FYIQtytAYslvNcThWcVIlg5+q/2qY1EiiF8pWD4aY9gw4fTvvvCp
	8o3V8XG0Wz7KUr9LNdBjFljtPIqeXgJm2JxLcAD3jT90Fg4kfzUSfoMq
X-Gm-Gg: AYBFou0TqrPdybbA5/j7PT1hrqz2j+7saREmgIZxihr7r6BcMbwhKQj0P9oXAmoXVxe
	d/9O2Vv0lsv7G0GNIpVA1bbaPFC+Vdy0bQ7/hZNYhFBHs8p22QTD7rwyV5J7+iBkkT9dVialdsG
	jamrBmTWmNHaCPfg+xx/dH5dileLCGZkxqzidMzjcL2iZe6Cl+6OEqlWIpIpSoaa+ia7e2bNWHe
	dq+BMEhAP1h8EhGPGsUE6am9KYACD+WP8ZB5GEX5928MhvtZkeaNEPNTjJfSSH3jHsjOOWUnnp6
	clQkHZM+D27gSna4Pnxf+8W5d1JvdBRLueEt+DSFoejAd3L3SlK/NCLNYIqXXLgUbEJdoCiNsft
	XDsYpDxDHVIeIBTOsOaGwe4Pnxuh/abt0vIWHeeLKoJ60ltYGurZ2zNqUWofbfQw0W7ysZnsi5k
	cFRvZqVHGPeFuOdx1pLvK+0CUk2yGORBGV8Tl0lz4YPCop6SrhhZeqzQqmojlpoT8mm+Wpdc8cK
	sCO
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr24329739c88.12.1792078324288;
        Thu, 15 Oct 2026 08:32:04 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:a490:42fc:1e02:1d0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm56081603c88.2.2026.10.15.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:32:03 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:01:49 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	error27@gmail.com, ethantidmore06@gmail.com, dennylin0707@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atDx5dH81s87HInI@user>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>

On Thu, Oct 15, 2026 at 02:11:19PM +0000, Luka Gejak wrote:
> October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
> 
> 
> > 
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Remove redundant parentheses around the address-of operator to
> > follow kernel coding style.
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> 
> Hi Yalagada,

Hi Luka,
> 
> I'm just letting you know that this change is no longer needed as the
> entire staging/rtl8723bs driver is being deprecated and removed.
> Support for RTL8723BS has been ported to rtw88 subsystem.
> 

Thank you for letting me know.

Pavan

> Best regards,
> Luka Gejak
