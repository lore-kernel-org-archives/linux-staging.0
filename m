Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC526535BD;
	Fri,  8 Mar 2024 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891558; cv=none; b=Asw26h/mhPo89DCU+W979D5YjQtXtiy8cdU50EgPDHE8SQ0bRvosU3nRNnSneVgPfi8JFwctmbEkG0FAqsB2mQvxQexo8DgfwNqmDI6XTAO4Na6AT4xa+nN/h1AtwbveKjsyrzYEhvrG5oK2ihsXGAoDTNRyMLZMn0jB7xhtjXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891558; c=relaxed/simple;
	bh=zAmi1uC8mO960rWAQfKAIULiv4MepnYwdsDKClyhOFc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ngNhXerFFWGo+3gD66fTFs0xSGBRH1Q22Knmpn5aWJqj8bf0qJfcUu1y9Q/NJfHOkJpTbAouoppaJ4Pak/nDfgNZahnCAVQD1ZuhUPMXUHVDgOMONG5girFYXB3/o0Oa8NTs07x5U86LYsNu1IK9iqfHljMujU1ELWWn5QE+W24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=LHt16mah; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="LHt16mah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FxAnDnL2sYUr3DdqJhoyU9BKNkBz/XDdDhiSSpbKax0=;
  b=LHt16mahiZ9aeQPrlxwYQxn0ikcBjq6BRlL1ehYpGa2iIJPDINd4+8Sr
   3KNjScF4oSjSDqWaabzvSVMHDgzReb2i/CAuWP6NvB7DhPhyWeTfy+mgS
   ozC5M38rizqLhEWZpm0+PtFBtvPGDCfHXa5fUvA4+BWb+1ceP/7NLzFqA
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,109,1708383600"; 
   d="scan'208";a="81617110"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 10:52:32 +0100
Date: Fri, 8 Mar 2024 10:52:32 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    outreachy@lists.linux.dev
Subject: Re: Apology and Request for Resubmitting Patch
In-Reply-To: <20240308091000.36978-1-dorine.a.tipo@gmail.com>
Message-ID: <ca7439a1-966c-8b37-ea5b-d3de38a6d563@inria.fr>
References: <20240306054458.102288-2-dorine.a.tipo@gmail.com> <20240308091000.36978-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 8 Mar 2024, Dorine Tipo wrote:

> Dear maintainers,
>
> I hope this message finds you well. I am writing to offer my sincere apologies
> for the frustration and disappointment caused by my recent submissions of
> patches with unresolved issues.
>
> Upon careful investigation into the issue to debug the problem, I realize
> that my approach to addressing checkpatch warnings in the code was incomplete.
> While I corrected the assignments of variables to resolve the warnings, I neglected
> to rectify the corresponding declarations of these variables.
> I understand that this oversight not only failed to meet the standards expected of
> contributions but also created unnecessary work for you as maintainers.
>
> I take full responsibility for my actions and the impact they have had on the project and
> your workload. Please accept my heartfelt apologies for any inconvenience and frustration caused.
>
> In light of this, I would like to request the opportunity to resubmit a new patch that addresses
> both the assignment and declaration of the variables to resolve the issue effectively.
> To ensure that such oversights are not repeated in the future, I am committed to implementing
> stricter review processes and improving my attention to detail.

No need to apologize.  The point is to learn.  Compiling Linux kernel code
is also complex, due to the intervention of ifdefs.

I would suggest to just throw away what you have done so far, pull Greg's
tree again, and start over.  You can also be a bit less ambitious, and
just do one thing.  When that is accepted, you can go on from there.

Good luck!

julia
