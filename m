Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C413D646B
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898693; cv=none; b=o6xmWS71z0PMr43ziB3vUENPw2mznuctgAXUkyStA5y1lFRlNsZaeFnPmuzlKYgr7H0tBT/8wfc5+nd2brC7G9sY0RvJ52k5CkSN5wAp9V7X5BrWE8jw0KEG5B9eMXZTWtSr6hEvfVxFdbmaFjEqtL+0Ed37dhelvsNerLJuZsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898693; c=relaxed/simple;
	bh=oM24je9Poee3D9Uz2W74hGkbi/3tqTcdi6OEfmzPcs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcEvWt1QZp6v8q3Syz9O7a15qNHtiF5MEJBvPemgaU/9Yz7q7/3DaiREMP24Lyt0t5+xXaxTnWM3tRaK2/tDn2+p1vx3ADb+9RNyk1WOaKYcB1z9LW32m1oa9M4AplcET+9Qm20kB3xsyOUBvC7n7ApXyENuX6SV6dbtlmcKSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRBHZmsE; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRBHZmsE"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so4423327e87.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898685; x=1778503485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tr8yCoKWDZeFgocKCbcvByhcL4YIhXGxM0QCyRyeLgM=;
        b=NRBHZmsErh+/E8xuG46UAYec5K2loaN7lS/mCp+jg9MtSFRER/7lOHryR4p8KctmxY
         YHUcP3aHi/LgoV8OYLsseX8wR5OHD3UIssJ7abFziEKd75tyNRewF/cbYslvS4F0ShN7
         fWbD3ssbFpcJutE9MzLZigwirmaBF46qI2kHggGWjGZGDjTiH85kGdM5kt7irUPVZT0q
         ZRlL3hXwKSdvPGaIDEmIPZ4/3SabqibYINU/Crr+pYecZKdav1DU7fiKvMUE1f8CYiI1
         cItmQCx2UhTQ3oHtYH+VsLYhhn5LtEtfqobbbABAHe/ZBzIPLULhGDNsurSUcB7cr4HB
         5N9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898685; x=1778503485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tr8yCoKWDZeFgocKCbcvByhcL4YIhXGxM0QCyRyeLgM=;
        b=X8G9mz/RkqhXT3C5KggAwJ/rzuQCN7tn4h7yPWErb8sZqbVF7IxQ82aJwXFSWKEIui
         uRSf/QV7llUx1YV0WekJ/Y95X6RfvDSIPzKuPyuWTmVzBWKEBJ8PAK9uF6R2IAPrRfUG
         c2xo8omVyq21RolVg5NF6py+aYa92PfTnoZiWeepnaDTmy/kpLDqaK8VuK1e/db440yP
         KxzLB4M6o/sTVwe+0ckc09KMZWVRPv/0z9JC5cTslFULpJ7kPQqhcclL0GCH3WznHFWT
         O0Vs1hBo/3wrjr77uUKWUQ65Epkc00gBowwr/VkLtQZpkzuDH6JUFEav9p0A6yhmSsVO
         Pj4w==
X-Forwarded-Encrypted: i=1; AFNElJ/i/0UvtA4SgMkMRj9jcLT/YngUGsIoKGdGgE2iWpROT6X6kc+tRZo6/qRLjBWTJ9/H984QMgPh+vgeJ2T7@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2L8Y6BoLgT6WroBJFbNRd1Zbx3ll8E5Nj//B0oNVMV4PYUnJ7
	IJikz8eGypiQnsNky/Y9KFY6q62I99uq2YsiwwRJXQyN/SEuVBnDwkG4
X-Gm-Gg: AeBDies2WhYAaWJFowBAyfn6pdUqIvI6ZLVmG94vzhCxXZmV/bdjJNrPZ8HYgS1Kq2b
	Bii9HKVzX3uMUHKaR9P8TaV+TdIuX8Set6aF7dtzE2usO1gNoJEqMXAz121h3PmwUFupx/6qSQT
	nG9Xj731Vgfcoh46uAFOPcpHVzozikaA9E8uOL8GAXnmfaXyuyFI8QIePf8lJwZezjTS8oh3BnY
	fkadeATbVp7euZ8gpPD0o5Zw39qjec6HcKFfPaIPMWOuXQFGV9z206uRpixP2gQT7mG+innNfku
	jIebnuaIq6fV0skQ1smUvXfIZDzcPtzouuHUhaDp6u36Xa6YaSJtX6MXwVrNmNAa+gnWxleHxzf
	k/DkyHC2xNbw+yfgWrramKYC5UqDUaroeGEwo+rHXMbzL+BPSdN/NtP1Klep8bLqokLJkNTse0h
	ZIW27xehmdUW+I8NCJVL7lxflqGBdwrvmWmOKasAGhlA9wvg==
X-Received: by 2002:a05:6512:1395:b0:5a4:8b:a075 with SMTP id 2adb3069b0e04-5a862fbd7b3mr2755927e87.16.1777898684697;
        Mon, 04 May 2026 05:44:44 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a87791b4bdsm331341e87.39.2026.05.04.05.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:44:44 -0700 (PDT)
Date: Mon, 4 May 2026 15:44:41 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary blank lines in
 rtw_ioctl_set.c
Message-ID: <afiUuSKLYW8oLkxd@archlinux>
References: <20260501163815.759-1-sozdayvek@gmail.com>
 <20260502084930.857-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502084930.857-1-sozdayvek@gmail.com>

On Sat, May 02, 2026 at 01:49:30PM +0500, Stepan Ionichev wrote:
> Drop blank lines flagged by checkpatch.pl in rtw_ioctl_set.c:
> 
>   CHECK: Blank lines aren't necessary before a close brace '}'
>   CHECK: Blank lines aren't necessary after an open brace '{'
> 
> No functional change.
> 
> Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>

Looks good to me.

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>


Thanks,
Nikolay
