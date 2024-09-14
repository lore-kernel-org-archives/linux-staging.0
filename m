Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5D1D12E9
	for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726332304; cv=none; b=nMeumSNbkqI7xEzUpuypFeeyr12W6cYU7tPXNl2b/jKbcO+IV92sqnocz0pNU3wA3KTIrCK4uDAMZewcFMaO/K3rCIF5oMq5T2QXUO+Gu8ZSIiu/sQJvCNoDiIKG0ZxCt8rl4OaPTjYvAGA6hLhi6qPv68Ggt/Ju09CNsC67YtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726332304; c=relaxed/simple;
	bh=VMBG2Dh3Zw7faqlpcqUYMWLfsHTm5HJFrtJVUFbwLYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI9HnkBzxU4v0L3Yc/r6HU1aRCocB7S2TLwHxo2VtT74F4NP+3YP3Wo8yiNHm/nrw0Y4bNxsL44yhHITOFkB/IVd9nHfZx1j0ryXcZ4LBB2Dq2r59SCOgfTgKCYS8UCcWuivYe6rl+CvII8U2wLLM/2UfBPc+itH/E4dTfuGkJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnGVSA1s; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnGVSA1s"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db233cef22so1404911a12.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726332302; x=1726937102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jho1JF+P59lkbzGdVgYwLqxMLIAumaTqEKGdD7HjJX0=;
        b=cnGVSA1si93UqbVvBbLqG3+H8yION7WdyAR/l8EPm2NLUvJtIA3JCgmGORcJwzjIJy
         6uECdi3ynLzp+e8uKwBVQ4NyQxoDXWLkA8RhWi3nuxWaCn+OPurIq+nxKc5kAIrE/ibl
         9qI3Za1kpVZ7gjUoAEud8SWg1/UHpgSVIuDURO8NjDrYHRnxi4xMZHrkgp9kC68Sm9uM
         P01GI4SjLFql7x3NtGFSx52pZ3ixlf7CtgiyiCHKAX/DBIb5uNKrKAuSsCkJlsGOG0K/
         Bkhp6VhKVwvru341C+BG1DgRq1OeAa8ievPVKJJMC5pitKc9b992yC0Mv9ZSqu1g28BN
         0M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726332302; x=1726937102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jho1JF+P59lkbzGdVgYwLqxMLIAumaTqEKGdD7HjJX0=;
        b=C1IRbo9RSPtyqrf23038MvHmRyS8AE4pB9MZbuiZ4itx/mkifqhm30K1A7SYsNHKTQ
         IJFamVuMi+r9aNmtCnWRVYJ0d1A8u5efFUlzAZdnBF9UqUwtosngeLfWf4VKRdRo4s9Q
         tKbtvBZJJrvu3/hhoiODGBUakmHRCZP9hojAAgqt3SOBsqE7fGE2Xv7adtWDSpfc8ykJ
         GaAXX0hx4tY5o+lBmOo9ZMgpShLUxqm22ufZySZrZFhXu25ss9beLz5HONH8efu2luMO
         SKHRcGc0ZYo2aQJ5bSsYZd9MSQUo24u0YPkhgJ2ZuZDfvnSnTb9UBpXJe3ZihSDoMm8w
         0GBA==
X-Forwarded-Encrypted: i=1; AJvYcCWQdNRnaVcQeekBAcI3JunKzNj0UIdfE4GX1hDLRoy1HfviEhqaNb3VrLmrze15qlglfszUrMeUBeUyCuGZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwqAlwC/ztou4E/SZ0/Bs0ABEEluXO7zuz9dMeEA5MxlH4gFrRB
	fw8XL4Eqz2PLvaUGoSs5MnICAOzx8x7M9Wx8xq91y9islVIwxh/k
X-Google-Smtp-Source: AGHT+IGlu9u+g3BPmkH/baJXqXWvTrZtLsscYZ70k87KumegUKrIqkB8liTQ2W23TEeaRKBwr286pA==
X-Received: by 2002:a17:90b:1c92:b0:2d3:bc5f:715f with SMTP id 98e67ed59e1d1-2dbb9df9afbmr8375713a91.10.1726332301803;
        Sat, 14 Sep 2024 09:45:01 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.229.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfdc0ac3sm1737304a91.53.2024.09.14.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 09:45:01 -0700 (PDT)
Date: Sat, 14 Sep 2024 22:14:56 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: Use new initialization api for
 tasklet
Message-ID: <ZuW9iInzizGypLRt@embed-PC.myguest.virtualbox.org>
References: <20240913191734.805815-1-abhishektamboli9@gmail.com>
 <2024091424-glisten-unmanned-bb8f@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024091424-glisten-unmanned-bb8f@gregkh>

Hi Greg,

On Sat, Sep 14, 2024 at 10:20:02AM +0200, Greg KH wrote:
> On Sat, Sep 14, 2024 at 12:47:34AM +0530, Abhishek Tamboli wrote:
> > Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
> > introduced in commit 12cc923f1ccc ("tasklet: Introduce new
> > initialization API").
> 
> This says what you are doing, but not why you are doing this.
> 
> Why is this needed?  What bug does this fix?  The code is the exact same
> afterward so why should this be accepted?
> 
 While this patch doesn't fix any functional bug, it ensures that the 
 code is kept up to date with the new Initialization API for tasklets.

 Regards,
 Abhishek
