Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BE113B5B3
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776147347; cv=none; b=q9m3tQdKEolFMOLcp59SA2KLdEjx/Ek7pV70wdDTTW1yivpYoCJgPutDjL0i8Oxs/WNfg5dhH7/j1tSsBVYPYIsfkzRxOC9ofCflGJMGZDdibaWrR8TKbLl365Xj/183KYBAerOeAufGELK+4JIv0ofPydfuxC9HOjsnYC6rt7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776147347; c=relaxed/simple;
	bh=UB6igvCFPBsEsTpwZZL1dQgZvlFXY9qh1IJBhfoBaKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2pPYeJ8Z7iUCJSLzyLbt/Pgj6GWlImPD+Qund21VdorLDLV2cM2YWDhBgeUlEDlNMmT9JIJOGGFCqpywsjwB9iCrep1nUZBB+9QgMVK0p2kLqJ1l9EWjwJ8H6AfKvnGPpUgFursYPtHMXgK1qfWh8Z/S2g0HfgyZmUUyuNcSHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfmK/3ZF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfmK/3ZF"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f138a6d5aso1560900b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 23:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776147344; x=1776752144; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kep5pupCMO+SdCzjkbNvuCXzJJsxubzVF6JFzj92rXI=;
        b=gfmK/3ZFL6x4OFhlPBLCWehL0h/EsVEQvJdcDlIGFbA6QH78B/ZWdS9Naht/eiDsb3
         d2t3g+XidZTFq4vBTIaOJOXxHT3uoiCejIoloU3xbj8aC15elrFqKZRxHmacmcuPZtdT
         mZdTnTk75CuSh6m7tyUUDF/07ZZc+jfIBjjQJrBhDI8ZbxwdQWEom2H/HgEZPLdAR1k0
         lewCRGsaWH9lFrl6ZPfGcPwXUCk4d4aCF088Wgi+9r6KEGERd4a2Q/lHJLIhtxH0tb5+
         huuFjPV1oGvqgt3t9PnGEgQGWN3rPNK2EHUlD/l1V7aOTUR6shPuBrHD6RyqUYEvG8p2
         wimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776147344; x=1776752144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kep5pupCMO+SdCzjkbNvuCXzJJsxubzVF6JFzj92rXI=;
        b=KxI7AQrgi+h12JabWIqANJy+xPZghpm7T+lxx2RnOcJP2+Lj80wGVO9nvZhRgWx78S
         iqXdlWLc8r4C2kvUGt0g8Ym7gVScCaoAWFHQqM7WIENSW1kyN6gLpuPR9rySpjjXecHY
         PTo2LTZrONrDPowLPW6Ixl3dkpgs5JRMnXQF4SLZMfviJs8C2dQuG/rOy70ZbZRO8kY3
         MBZz0cOnfVERXNSh4Eo/UlXTSo4FUe+9vPGBpky/kO4+EP1D4l+h9HlvTjccEZ8iJEls
         M91E54R4D4/MIbOUWUC9ctN1cfizJSwFNWp6BLg3XiYQJdgGgw1kJ2vc25U88WfsDBDz
         kxmg==
X-Forwarded-Encrypted: i=1; AFNElJ9NlW7qM9A8PELSb3jl16Em6hODt3abMV4XDhxXvzl1sqavZazzi8ZMGlYkJ8Tlsc3pAd23WCcjDbPoodPG@lists.linux.dev
X-Gm-Message-State: AOJu0YyqDQPAnGuoocjRgMIbsHpvaIY0PSBhvvyaGUXTAkjINc0wTjBJ
	gKzsNYQqvq6Bl1oJaYmBSxpxzu6rrI7KJp2FM6SUiys7YRejTpTSv/aU
X-Gm-Gg: AeBDievtkHUyDBF1Zb+iFpg+yvJ6rk+D2feeUgiZCdCsZJ+0gd9cdfx111F0s8WLgKg
	l2EHC85GN7l2ZTBsnXBtG/dZ+tjSax3HC18u5+C8+Fyc4uyYQ2/Y7nHBeVUXTN/oSMUyKbyY0dM
	2dDmNCdFYwVlwyzpHUS1KXiBtpj3rpRa+X+tyANeMCUnEI4rvYsOS/e8GiLJTSuKkt6WJFHeTA5
	Zg5Tt+d+lvO2gRKIhAjDTJ7qezbKLNwvuUg7flZwm6FCdOujHh0rY4kxnOx63lLoo5f3c3cLtb+
	Dk/zbzVbMSPx62cvoGq099coMZJtTzJorZBM87udwk2431PwPLDlXtAvCexoc/ShEq3cKxtHxdo
	+X17b/26NyErFR12nY68Zc3N/8pfzLGSKn6A8j0NJIgTq6qwiKhH/qVnDG2dH0fjnWQcg3q6hm/
	4sNnQF0JJR1jyrt7uRTlTIDSY1UrMKCNg=
X-Received: by 2002:a05:6a00:4b01:b0:82c:ebbd:9eca with SMTP id d2e1a72fcca58-82f0c26b435mr15986383b3a.11.1776147344460;
        Mon, 13 Apr 2026 23:15:44 -0700 (PDT)
Received: from inspiron ([114.79.178.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b5a79sm14016412b3a.30.2026.04.13.23.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:15:44 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:45:31 +0530
From: Prithvi <activprithvi@gmail.com>
To: andriy.shevchenko@linux.intel.com, luka.gejak@linux.dev
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com, tmimiharoen@gmail.com,
	filippo.muschera@gmail.com, ethantidmore06@gmail.com,
	rayfraytech@gmail.com, david@cardinalsystem.net, weibu@redadmin.org,
	dharanitharan725@gmail.com, ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org, karanja99erick@gmail.com,
	khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, bryant.boatright@proton.me,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260414061531.ftq43mqv7evyduc3@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
 <20260409145045.44r4f5bleklkk4ha@inspiron>
 <2026040942-slicer-rake-4056@gregkh>
 <20260409153958.6wmjiu4jcghtyeom@inspiron>
 <D767F902-D249-4F93-A230-D432DB0423F9@linux.dev>
 <adfL8CHDT6UdKppU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfL8CHDT6UdKppU@ashevche-desk.local>

On Thu, Apr 09, 2026 at 06:55:28PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 09, 2026 at 05:44:24PM +0200, Luka Gejak wrote:
> > On April 9, 2026 5:39:58 PM GMT+02:00, Prithvi <activprithvi@gmail.com> wrote:
> > >On Thu, Apr 09, 2026 at 05:02:16PM +0200, Greg KH wrote:
> > >> On Thu, Apr 09, 2026 at 08:20:45PM +0530, Prithvi wrote:
> 
> ...
> 
> > >> But next time, trim your "who do I cc:" list, as it is _way_ too big,
> > >> how did you generate it?
> > >
> > >Understood...here I used all the email addresses generated from the 
> > >get_maintainer.pl script. Next time, I'll be sure to trim it down just to 
> > >maintainers and reviewers.
> > 
> > Upon testing myself, get_maintainer.pl doesn't list all of those 
> > people when ran on a directory or a file in staging.
> 
> Also you may check my script [1] that I use on everyday basis to send patches
> to Linux kernel. It has some heuristics that showed to be almost suitable.
> 
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 

Yes I directly ran the get_maintainer.pl script on the patches, without any 
flags due to which I got a very long 'to' and 'cc' list for the patches.

Thanks Andy for sharing the script - it is indeed optimized for this purpose :)

Best Regards,
Prithvi
