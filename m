Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F54499F2A
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786641820; cv=none; b=QSfhTxFxG/pO9anA5w3WEaLxok8wTGOrMnuND0tQtL26CyJ8WcBiu4z+igfh70OC0iFuZaDG6l51O9aVMKifsD1+MBU9kuVwMcWnLGHnU01DoDSX6pLN3KHVuvtQ+ibVkspfWIRaIUCNJCn8mWfVw+jafHcI9cqFiivDKjynQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786641820; c=relaxed/simple;
	bh=uG0tHnepocVnkylL8AFXFuZuw+YH0IhFJtcA46V/1EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVT11ToQXwhO+lfIn0iE+IICKk7Nfy0Z4uktTlF8RPhHUUslEiybWJJZ22w+v0s5Yf4/R3Z5/E4ruDJWR/W6jwi1SgkIxOln4n8/qgJhlCCd6F+Qn70DzPHSMYTmZYP0rzL5o2i0N3KZUc02beicQNOAa7Sr3XoQli6S8qHWR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVnn2AEC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVnn2AEC"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeba09900bso23509e87.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786641817; x=1787246617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbA8z1rdNkDHr3lYrwN4B7BO4VGGhl6jzy9WNKUTJ/c=;
        b=TVnn2AECbGD6eIJU8UmwumQ8cFDeAioGpsl4oToB3WSnQSHLIw+mxAzkkC6/qNibfc
         ExNjPFVEtlNpupLjB2uiyb5+aaljDLvCd5j4leGqdLElbmqJK6pnoQf/UVChixceonqf
         Usv97YzKTq5qIAK44ngbEvrlhKT7rp0EQNxjQ6bClYoJPN+Knnn13uoZbx2GuyV0hfFi
         StgNDlixej21raTkrzD2BVqyuNqI51t86LMRhVaSVI5SQRtL451hJQfn1Ryepeqgh6+M
         KynlwjYFSh54KS9cvl6nNsIXDzg22Heu828d+bOvTJJGU/lVS984eiB/PEu/YzOxwe93
         UCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786641817; x=1787246617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbA8z1rdNkDHr3lYrwN4B7BO4VGGhl6jzy9WNKUTJ/c=;
        b=IjXpW6jcKwk4r5jhoSKCeeU5OohKhsshMiGUgnrtT7F84PF93Xj8qQqw1g00KTkpLH
         HoenUr6iJwTmMfWlFfKqUfDze9ElUk2rEM2lfgEME1bM+ZLoaVF5IMPZsFna/BPintqM
         YmFFs8FYTLXe/ZBNDCW/Cs/Siod9zGOuE0LxH3mP60xGScxI6Q/PY+gY6rLbBQd8RymQ
         z+DfkqCRDKeAShAJy0nTuEKOIp83e6eAsPjUdiDPix4gWh1N/zWxu7PUZXdmakGF4nGJ
         L1SAmELxVSj4wLQFCjQqy628kgMrtB/l3xjejx9UHFn9fK7+BeT/s8UbqINaWeQ/yApx
         /Lkg==
X-Forwarded-Encrypted: i=1; AHgh+Rqn4iVRqRWpFOO5/wDGo6nOYWEBaZOz6D+MX1Ua/JT06jHqlm1r6wtyxeAiERkE2vkhzRWf/hqkuzWV+wGS@lists.linux.dev
X-Gm-Message-State: AOJu0YxYtR9uIwV1MdNZXZVcLYG6It2JUFZt/Q3nx0NAB+S9+Ebm6i5z
	rLJQrQy8rX+QuRneCddvVlOb7yojg7+mO+vUfvfa4aUFexwBcqBFqidW
X-Gm-Gg: AR+sD12oC2ZEaDCDH93TzxsaNzFpn4iLvoBdLJMv36kCzGA590KRjmo0y8n8Rg00udS
	2KmcdG4M5CYwO5jvY2ywNzleohYN445NlUA/QIBty1Yhp+IhzzuQcPQ2FH6z/Af6XfsJUKeFkXZ
	Adyjooqk/CmVvUjWznIaNgoTVDKISK8m/sZf4pzzyRe5yUPxxsYRiOIxNK9N5QLH6E1z068NFim
	GLcqCqZDwyw6caY/CwNJe7QBQ0LADUzY1qNpyV6OWelP4LjiNs5J1cuTpjx8gWRzXD3N8vkrwTi
	6b1CRvPdK8sbIFV/7qBELo/bUrJM8O5FehoZAneH1vkaYbvLF0j8FS7tD9EUEKinVtIP8SSA9WG
	YUN/NNlUb1BgehqqvvZ7C2UyImThAbaRlIoWVKkOw/VNtnIc9Whh06FBSUow8EKiw4C6Nxz+Blc
	NAwN0NzDXGb5fhqHC5jAsxT3+HlS1dky1Vqvm2alKXufnzpumnYvvexWX4Y7Q=
X-Received: by 2002:a05:6512:1444:10b0:5ae:bfd6:1bc1 with SMTP id 2adb3069b0e04-5b453f47e75mr997626e87.14.1786641816655;
        Thu, 13 Aug 2026 10:23:36 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c00945sm15213e87.63.2026.08.13.10.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:23:36 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:23:32 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Message-ID: <an39lHmSRfuEzU4b@archlinux>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
 <an2KI4rsL9tkA_4M@ashevche-desk.local>
 <an2KlPmaXYxyVMEX@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an2KlPmaXYxyVMEX@ashevche-desk.local>

On Thu, Aug 13, 2026 at 12:12:52PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 13, 2026 at 12:11:04PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 12, 2026 at 11:51:33PM +0300, Nikolay Kulikov wrote:
> > > This series removes unused functions and replaces obscure
> > > variable-checking macros with clear conditional statements.
> > 
> > I believe I gave tags to some patches in v2. I don't see either.
> > What's going on?
> 
> For _this_ time, please reply yourself to the patches I already tagged with my
> Rb tags placed on a dedicated line.
> 
> > > Changes in v3:
> > > 	- Split the last patch into two (inlining macros and removing
> > > 	  the file).
> > > 	- Replace variable initialization with assignment, followed
> > > 	  immediately by a check.
> > > Changes in v2:
> > > 	- Squashed the function removals in pci/hmm/hmm.c and
> > > 	  pci/hmm/hmm_bo.c into a single commit.
> > > 	- Add commits to cleanup macros from include/hmm/hmm_common.h,
> > > 	  as suggested by Andy Shevchenko.
> > 
> > Also two process hints:
> > - add --base when prepare patches
> > - add links (URLs to lore.kernel.org) for the previous versions.
> 
> Same here, just reply to your cover letter with these URLs, and for this time
> just refer what the base was in a free form.

Sorry, I think I should have used b4 from the start.
I will send the new version with all the fixes.


Thanks,
Nikolay
