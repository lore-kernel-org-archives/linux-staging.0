Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A80156F36
	for <linux-staging@lists.linux.dev>; Tue, 23 Jul 2024 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721756047; cv=none; b=Ag39CjgbMJX51BSj0ItZKxCO+4QWGoo2LWtvmsBuNXs2nb8SJABSQzH8ARQUx6wWcraBvnPBMp+OqEkDI95Sqyt7XdEPXU3XwvJn1IC0rRjZfrefuI1084pQYsCkYGOqKlx18eRrFgmg8F+x8jhav6FZMnXCx7HansjyFLytB3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721756047; c=relaxed/simple;
	bh=9abKOcV6VIqGZHw+rM5MSbf5j962dNipPq+nDY6sSCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/eDUtTS7LN1U7I81kwGpoH7ClOFQX1x+pLJLIwOhosmQTHjfGd5cYui1CWCD3qT4BnIy9m36Ec1cb6opouI6mnr3qopFXM3kPdzK3TTgx7rYEbTLLn3pk5Vfvz69QpOnDplebONp3lhX1wFxUky/kM/4D2hrz0lmx0rvoOKMpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xo3iFwWJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xo3iFwWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706B1C4AF09;
	Tue, 23 Jul 2024 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721756046;
	bh=9abKOcV6VIqGZHw+rM5MSbf5j962dNipPq+nDY6sSCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xo3iFwWJtgbDfdvdfbQL/T6B2fMm3u614kJwwJaxKqdS8jy9bSXF4De1Hp+IES2We
	 GT9eSfAMk1ca4NpXXuY/hEHtnie3/iD6cGAD8pLezVLBf1HGK6jnHsiRMb2mMG21E5
	 kRQRzJDYsVKP67UxtaqJtZOPV2A7cggpQYkyFeC4=
Date: Tue, 23 Jul 2024 19:34:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cruzer-S <yyyynoom@gmail.com>, linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com
Subject: Re: [PATCH v3] staging: rtl8712: style fix multiple line dereference
Message-ID: <2024072356-showman-stegosaur-160b@gregkh>
References: <20240721040504.1483-1-yyyynoom@gmail.com>
 <5005ffef-0ac1-4481-a139-fbf3b456069a@suswa.mountain>
 <1894df62-f632-4f7d-904b-65e7d517cf0c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1894df62-f632-4f7d-904b-65e7d517cf0c@suswa.mountain>

On Tue, Jul 23, 2024 at 11:02:15AM -0500, Dan Carpenter wrote:
> On Tue, Jul 23, 2024 at 10:22:32AM -0500, Dan Carpenter wrote:
> > The patch still doesn't apply.  Sorry.
> > 
> > cat ~/tmp/yyyynoom | patch -p1
> > patching file drivers/staging/rtl8712/rtl871x_cmd.c
> > patch: **** malformed patch at line 132: 2.43.5
> > 
> > The 2.43.5 thing is the git version.  Not sure what went wrong there.
> > 
> 
> It must have applied for Greg because he applied it.  I don't know why
> it didn't work for me.  I tried using patch to apply it and I tried
> git am as well and neither worked.  But it must be something on my end
> if it works for Greg.

I edited it by hand :(
