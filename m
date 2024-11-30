Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1219D8B4
	for <linux-staging@lists.linux.dev>; Sat, 30 Nov 2024 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732983059; cv=none; b=XVxh9RyoahQ5g3qMtepA2SHJc8BrY7XM3joiWZMHf+fDov9sIOswSutlLLj2A3YzFohvH9dt61I0L6flFUacPU2CcsDQcCW2l82+rJLt6ieL8decs8XtjBZjupXPNJoXr6B5UGqF8r0XhR7TSryYKPfJ5ijAmZau65mCi3SWAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732983059; c=relaxed/simple;
	bh=s8qx9ILdRY5/vfgXPpVIOc/3EfHIjHor4WptV4rTTVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1XuL+m9U90q0ZsUMF8drRvDtFwoxQ4+AuiEQWhdFa6DrE0iLF0QOfDbsqsqzGovEq8nrGRpCe2AAXWolrPOMYjOybnWGymtBCHlzQkIgU57uVoOK5ypP8HGQicHX5nHYuoPT+3x/g41jcGo8hNQvpqaJDpomqvX1jhViAM5EAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KugpHS70; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KugpHS70"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fc2b80c845so1389894a12.3
        for <linux-staging@lists.linux.dev>; Sat, 30 Nov 2024 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732983057; x=1733587857; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xjXS7iEwahwlb5IPuoLHGAtPhMN0/BfMaTXkvfmBJ0=;
        b=KugpHS70f0e9jUKeXWe48R0RcSNvuhwkwEcbEVszMaWRMBxroAHZPuIu297iQNvvU6
         whcURxyKBdWuNihLFEZbJJwcV3PlRcOZbOa23i7aHa5ha/3CTQs/dPfXShqQTiOcdOg+
         3nGUM/nHvjUO/O2MAmcP9u14fskjRCHGXWmxlWl7m1+p9zPQSjwORxtWRCZSFTZsemQc
         S2QJlhLBMuerbpYlEIRue55MdGDhhUurU5T33LQsMTloMxPwzuw/6s5l9jCZMJ6XwWYW
         8m4ZPoTXmlqxUivRPB6tqTmh1Q1dbAger1CUwn/YJqKKiMFg1ohsOJe8H2dGnzGGwBlP
         foEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732983057; x=1733587857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xjXS7iEwahwlb5IPuoLHGAtPhMN0/BfMaTXkvfmBJ0=;
        b=VgPdE+s0VJlJfWtP0kypOYJq2PZwhgIGMAPaBrudMHYv3qYrDrzZ8emtbkRnw/JZon
         3tzCiP6yWJmCzkBGFYkBxroFSNYu5+M3eCzfMJ1u7A92H4PuwDUIBYTfn/Pt1mctHVk2
         WjG/KVcnE6EsbX5zbtO+WU4fJWb44GLTP7FfDTaFmidvcyRrj0H+u1o9S0aWyFDmUvxM
         bOpLiVjoF/sKcBQZatjCFRaJoMK2xB0NLfJzyvGOpu+hgThHMdznaJJSYk8WjyJzbjrd
         KVYRsDp4QCtiQ9MxtosgTMwG864VJmc/8dASVScx4k0dSexHCV/Jj51ZMNOeof2Sk6ej
         boRA==
X-Forwarded-Encrypted: i=1; AJvYcCU2muAIxmsaNIAffu5bPX1cYFa9yTeMRRQ442HYMKVTMbVpH5fndS92gf1G5+WcoUJqes6avQRBn5dneqh4@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5LPskkz3JS9hPs5XWNm641+3/THRoAKff1yUIPnRVFpKREMM+
	hmqpIh86U+jT1X0zhlTI9X8qSFAS2E/P+ZbuntajOF92IBJzP4Ye
X-Gm-Gg: ASbGncu5CYxDkFkNenUknRCYDUiV/btfpcFCbNQSMxzikSVQ8JLjN2wpZ1DdkckNDdi
	Yh0LOOJgGYceDZIDcqsfYM9PHAvo9NPmiqDomeQx7J6axLWq0wQX9UTgTLZ9kPT6LMcW4o06NnR
	XLUVW1TNr9L89juJ+rpu0grHa8MNbQripYep/v06PsUE2JMbPdnznae8ugyqeoT5vYrdxqEw01m
	OoJ9DkV4/XBYvX65td0eKyTxX+OL47oB2aYAM7vP9z7h9MFkyUWF6qMRtDzhK4=
X-Google-Smtp-Source: AGHT+IEC7NOyX7RkAVIyiXEd/Ox+OL7dOTXyEFcJOwr8dcfOywrkExJL++U46w7GD51IizWO8nZCTQ==
X-Received: by 2002:a05:6a21:39a:b0:1e0:d8b2:1c9e with SMTP id adf61e73a8af0-1e0e0b7e3cbmr21613882637.30.1732983057436;
        Sat, 30 Nov 2024 08:10:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541814657sm5354319b3a.156.2024.11.30.08.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 08:10:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 30 Nov 2024 08:10:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Dave Penkler <dpenkler@gmail.com>
Subject: Re: [GIT PULL] Staging driver changes for 6.13-rc1
Message-ID: <f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net>
References: <Z0lCyXBV06VyH96s@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0lCyXBV06VyH96s@kroah.com>

Hi,

On Fri, Nov 29, 2024 at 05:27:53AM +0100, Greg KH wrote:
> The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:
> 
>   Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.13-rc1
> 
> for you to fetch changes up to 114eae3c9fde35220cca623840817a740a2eb7b3:
> 
>   Staging: gpib: gpib_os.c - Remove unnecessary OOM message (2024-11-10 08:04:18 +0100)
> 
> ----------------------------------------------------------------
[ ...]

> Dave Penkler (33):
>       staging: gpib: Add common include files for GPIB drivers
>       staging: gpib: Add user api include files
>       staging: gpib: Add GPIB common core driver
>       staging: gpib: Add tms9914 GPIB chip driver
>       staging: gpib: Add nec7210 GPIB chip driver
>       staging: gpib: Add HP/Agilent/Keysight 8235xx PCI GPIB driver
>       staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver
>       staging: gpib: Add Computer Boards GPIB driver

I seem to be unable to find the patch introducing the problem (the link
provided with the patch is invalid), so I report it here.

With i386 allmodconfig builds:

Building i386:allyesconfig ... failed
--------------
Error log:
drivers/staging/gpib/cec/cec_gpib.c: In function 'cec_pci_attach':
drivers/staging/gpib/cec/cec_gpib.c:300:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  300 |         nec_priv->iobase = (void *)(pci_resource_start(cec_priv->pci_device, 3));
      |                            ^
drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_common_pci_attach':
drivers/staging/gpib/ines/ines_gpib.c:783:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
      |                            ^

pci_resource_start() returns resource_size_t, which is not a pointer, and thus
can not be cast to one.

Guenter
