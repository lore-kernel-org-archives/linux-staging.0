Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C033EAF7
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429304; cv=none; b=tLC73iqLIBAJebQPLiO5qspu6RBsdxOkUIzOdFtaYvQzO5QbEbll4LBR4yDiL/m0MN2AzRAuMw6i1Jq9nRr99NuJYYr84j4+AlKKVvKz5xkfLpk8rQ5r777aiG7gChEjsitxwyWo3DkBz7xDpgE2ump11Go443JOON6IV6pP0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429304; c=relaxed/simple;
	bh=qeFBiCCMd0NN/EaY4Oj44Sbt1RY3NQlb4g0NqAuemFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZooWBRshTCfU2KLQy0GO64YrX40rilx2N2eZlWD9TOyoAV6rHehaTQIcCxhNUVjgy/Z38UEVhtLMdY/OCO1iDSVy6ZM7SP3UmOsRsdjX6eZ8LRzhhEapbaxEVOzUIVCo3pav1Qz4DkYi/kzI8NbJ31Bln2VCWw2ZpXbo+lR8gyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgssnALq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgssnALq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so40905545e9.3
        for <linux-staging@lists.linux.dev>; Tue, 09 Sep 2025 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757429300; x=1758034100; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zbI93laRlNgIRcKRGecsho/v9toZeJCEiFVnSaQwrVA=;
        b=KgssnALqc0u3z4tAM4N5i/3LPXluHft6sGbqLuO37POtRTUY8XyQFrxOWDGd4Qzw3K
         8TqeY0n2+QiKvFVXWdUOGjpeyUp2QOA9/Ghhy1GIBrwZXXK2DBWdSENqkRwa7ZdkAZtz
         FkDVcNw67GKy9+8ZwUFBGhnDUB3BDERdLSUNe6HwQadLjLv6kJ36japuLLS3rDNYKIhh
         CAxH3q4K09ecil0Pg5lI93cPS5RPiTxYTxwKfKRVOVxGaQJb28HgqefCyPVOJ3aEs2Jl
         kdogYY2WMTVm8+UFuQGdGu56Q7ycJoH9oI4VdMGL3h2Ztk9npgc3glw1CQWUi2xRreEX
         LmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429300; x=1758034100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbI93laRlNgIRcKRGecsho/v9toZeJCEiFVnSaQwrVA=;
        b=HXbyXyzuRqXd2tDI3pnjS4j5h8n8KoK8sAOe88yxkeB7SVmf9oFBpOss8+e5CGd5kg
         kBjjTq3R/UEe6dB/HsNbAMf3C71F3k7gaLLG26LKmpBn4+y99zQs+Er8phAPGhsYRFKH
         Duost7j34nKTz1iJ1Tn+2oDBJ+FEeeh0m22zhtY49eg1HePoNEysm/Sz1JHqd1S2x0iX
         ZaplPzhWT8mtXKyPL3hZ3oPgMXhrl74YxHAQJTfYW2s0x/nNMBpo+q+9DWIUD2rNWtc7
         74CyL3DM5iIpxHR2jfYD14nCXZ3H3OBphaMwlCEaDppTjeJ9pCYpInZHOeRdb8oqrjKi
         zmAA==
X-Forwarded-Encrypted: i=1; AJvYcCUNfUrxkFkvCMXlo8Sd7HuGF4X6/ABkV+B4p3muEgxviibLe6BgxJk7+o+Nrnh1nmQkbrS4fBuUJB5ofHNf@lists.linux.dev
X-Gm-Message-State: AOJu0YxTzJbSzWqtOFmYRCW0Ymdd1VTuAe430Wr2+ZsLWlkDhBZ7ifAs
	o2MSvEr94DgA4bcGKZUYrbbQw5EsjDLgeJphtvR6YXFmlAuVcD8rR/rP/IkoisRC
X-Gm-Gg: ASbGnctErMxdS4V4ZiOq6//7Riauena2ri9BmJTSqVUxcikZ2450IF5Q6hk83O7ueNB
	wm4XPH4hi1M7w0K8FNWHhF6GgEpiHayN61Q82IW4rZH3YBvW3y3ALe+wlfLtRNt37FRNTan221z
	Hkl3awyUAEifxgtv77BNn54seS+28hK6kijj+ig86aWBRkOvY28QNLFGkd2+s/J/LigQmhnWIm1
	dULwsUnwAw8E+LghzkCU0pNtWwgwrDwrrSNsxd0aCLYIU8pyhpynBWda/1gVp4X/FfEyZ/nECAj
	Du6DAmzzwwCAgXSE70rx9RhF0Oi+SctMbM++2Nqul9L8EusazyTZzXhBh7yQKunUmvIiy743jw9
	TZ/6FSB5BRj4Eg1RDfQjvTVk35/AwSxcbqW17RQ==
X-Google-Smtp-Source: AGHT+IEdh8354eQN9A5Sng+jnPw+cbisVt6PO5x7gvAVRbMfR/z03XAWKcqmiMVY1oeoI3wzWdTYSg==
X-Received: by 2002:a05:600c:1991:b0:45b:5f3d:aa3d with SMTP id 5b1f17b1804b1-45dddeee57cmr95952195e9.21.1757429300065;
        Tue, 09 Sep 2025 07:48:20 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df14dc4e7sm12217285e9.1.2025.09.09.07.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:48:19 -0700 (PDT)
Date: Tue, 9 Sep 2025 16:48:17 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: GOPI JEGANATHAN <ggopijeganathan@gmail.com>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Declare processor directive as
 CONFIG_TNT4882
Message-ID: <aMA-MelgO2yaxnUs@egonzo>
References: <20250909041707.3001-1-ggopijeganathan@gmail.com>
 <2025090940-backyard-mud-253a@gregkh>
 <CAGt2Sa+MriEYjPOFGmKWuHXabwkJeWn7q9o8U14B7o3QY4xmyg@mail.gmail.com>
 <2025090945-ecologist-gravel-d028@gregkh>
 <CAGt2Sa+tKAmxspYX=iyihmZYxWg0=xOJPW+J0h=9rTG8E99AAg@mail.gmail.com>
 <2025090945-yearbook-busboy-2b28@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025090945-yearbook-busboy-2b28@gregkh>

On Tue, Sep 09, 2025 at 04:40:08PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Sep 09, 2025 at 07:56:07PM +0530, GOPI JEGANATHAN wrote:
> > Hi Greg
> > 
> > I just saw the warning message in Checkpatch.pl file. It's says #if 0 is
> > something wrong so I just change the processor directives properly using
> > #ifdef CONFIG_TNT4882, Is that change is wrong!?
> 
> #if 0 is a way to comment out code, you just enabled that code to now be
> present.  That's probably not the correct thing for this driver, right?
> The whole thing is already using CONFIG_TNT4882, so declaring it again
> would be the same as just removing the #if 0 line.
> 
> In short, only change this type of thing either by removing the code
> entirely, or figuring out why it's still present and then fixing it up
> to actually be used and remove the #if 0 lines.
> 
> thanks,
> 
> greg k-h

The code in the #if 0 scope in question can be removed entirely.
There is no call to make the driver it into a pnp driver.
cheers,
-dave
