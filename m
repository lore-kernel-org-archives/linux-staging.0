Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EE21E522
	for <linux-staging@lists.linux.dev>; Wed, 19 Feb 2025 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739984695; cv=none; b=ZgUS59tt7UsND5lTWybmMV61AG7y9ZqRVp4dtKYKkZAuZkFN9vz3fkTppOB43sOLrqSCz4Kp0Q6OE4Ccu8k7K9Vd7TlUzwrY8duyui3BZRx8k7KpU2/f0FrY4+HwA1htFdrak2k+FbI/Z3uPu5bwYKifiSeFM6cIK3p1/suEQgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739984695; c=relaxed/simple;
	bh=cracGUo1zCzzxkaCNPosd6J3mpz2+hNZ2bFnIvrArOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKkGSGRrs+gfR2G0A883Kap6bqMMVTwB1PwwlQUKJUBNcfyvH014nEJQ8rkLzK3P6+AWOUgA7McB9IMnhV9U7oz8+pwdOOxLQ8hu+SbpKFDkjDYmN1MkWgo08scpfDkkJ2WoizTOMnodDymfvZigyLe6sPuFMKwNUqludn9tvrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvkHJ9YI; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvkHJ9YI"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso105751a91.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Feb 2025 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739984692; x=1740589492; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwbHG79zVjrfg8l2dT+ak8dJ+hn3Pam7eFOYuymMrKw=;
        b=CvkHJ9YIy9QrvZbkevh/bO5evorBnIWeq6V13/5UxP1W3EYNtoF/HrZ5XEjkOfsqkp
         4xVM1SCQkKjsWLuTmMPMetjY6BQvrynl1L+h3OZ+cNzVJktOYWDOEVdOsoG5v9EVPeOu
         4LurywwniPqqws479nfzUvEJ+PVM97lGzPh1+03Tq5zf7YU7qFl27yWcmi4DMsNqXL/Y
         rqFI9VznIg2qWQmTAeCkfJNjOkY/r+qWvSgXyzZdI89oLQ0X0Kr9jwg69s3o961800Z1
         +lsOQMUEW3VHhD+deGvKe7mnJGpXUSLkt4tAfhPDTDjgmohSVvA+cmCJs5FTnMGkU001
         TX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739984692; x=1740589492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwbHG79zVjrfg8l2dT+ak8dJ+hn3Pam7eFOYuymMrKw=;
        b=BCnND9MaFJF2LmBss2B4C1sEoSaG/BMF3NHkiPN5t1+9/8JSTu5wLWsaSTVt4jWXRw
         aCg3rB/EEufPhdPkQL7V/s4v6kd6nbfNkXQcKHS2eAJXYuplkLSm2tecGzwyGAQjoEQR
         FRxTaTb/0o7A+hCpVccxmm4A8xuXHmjaiCMyBGoN2OerywAlWrKIhR7pHM/ke46HAuKO
         a31PlPLuli1CtW4zeWnHX7YJX9BXBSZPVzj4K4O+Qt3Y4HNwTNOFYEtUbVwSwKKICk1h
         d1fkwMVDB9C/e0jLvS/q/frmAq3XQC5OPhLrKRua3TbEJnRqh377I1KaF/9ejPixDfFv
         82cg==
X-Forwarded-Encrypted: i=1; AJvYcCWFTLH4Q8IFhW+LAoXQfA40NCZDl/dpnRcQRC+l/qBNVxVS4OgU3AhkRWZAzMwKLtHUdB02pGYOKZgpAgHP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7n5EgTxVbAA/AlA2e0IvOFeZC4U5eDfCOK67PxfBgC+l39uHv
	+gK3WypiiouO4bAOe5Cg5kT3c5BKdMCM5DCJzCVpAhhN1sMI7OMU
X-Gm-Gg: ASbGncsHQWItULHANofiyAhHc/YN9CYVvB+8qi2F9/U8HF0aChCP0R058f8wHdZgSae
	y/g/Nk8twd3TaE86ORH1qsk3Uf++G0x3Mu5McST3voq02jUG5uS8njZZXd9LHSgazPpR51aHHrB
	vQTiPBqm+alWwHmcoVYDG7jmNO5OAZ3d6RRzziyaAWHy4anFfbvJsi7dffHolHo+W2Xzni+bgQy
	+HT4ZZzi74NrpiMRLAC69uU+JybRhBwkcEA73YWJl3Wcc893fRCXFmaAEaMkmtXw0yS2eOwAFXG
	1yTZSDgm+kLRaVwRcTE8
X-Google-Smtp-Source: AGHT+IHix6sPuQU1s1oq8du0esyShMVQM4JFrJLLIzRNRkZSxsMrw8z9/PBeS/Wshodv16NtVTbIeQ==
X-Received: by 2002:a17:90b:4fc7:b0:2fa:30e9:2051 with SMTP id 98e67ed59e1d1-2fcb4cf0c9emr7104913a91.5.1739984691795;
        Wed, 19 Feb 2025 09:04:51 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:e1bd:18fd:9875:3b67])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fc13b9140esm12246906a91.30.2025.02.19.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 09:04:51 -0800 (PST)
Date: Wed, 19 Feb 2025 22:34:47 +0530
From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, kuba@kernel.org, rmk+kernel@armlinux.org.uk,
	broonie@kernel.org, arnd@arndb.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging:gpib: Fix error message formatting and
 adjust memory allocation style
Message-ID: <Z7YPL19NcVG7loqt@pronto>
References: <cover.1739794938.git.kumarkairiravi@gmail.com>
 <2025021908-fraction-impulse-7bcb@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021908-fraction-impulse-7bcb@gregkh>

On Wed, Feb 19, 2025 at 04:52:13PM +0100, Greg KH wrote:
> On Mon, Feb 17, 2025 at 06:26:15PM +0530, Ravi Kumar kairi wrote:
> > From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> > 
> > This patch series includes two minor improvements:
> > 1. Updates the error message format for invalid base I/O addresses to use hexadecimal notation.
> > 2. Changes the memory allocation style for `private_data` to use pointer dereference rather than hardcoding the struct type.
> >    which is perfered by checkpatch.
> > 
> > Ravi Kumar Kairi (2):
> >   staging:gpib:hp_82335: Fix error message format for invalid base IO
> >     address
> >   staging:glib:hp_82335: Refactor kzalloc size calculation to use
> >     pointer dereference
> > 
> >  drivers/staging/gpib/hp_82335/hp82335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > -- 
> > 2.48.1
> > 
> > 
> 
> No longer applies to my tree :(

yeah, I you applied another patch that fixes same issues, I just noticed
it, guess I was late. anyway have a great night/day.

regards,
Ravi
