Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2D3803DE;
	Thu, 29 Jan 2026 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696091; cv=none; b=Z+/QlYKH3C82C/P3KyoAnCYyIPmpKy53ZltjMI1ySJQwFldOO5XUKe0kDUIQcAH/mpSzJESVn0ivOFSL/dkf3hofdMZEWRLP6/LKqTHt0myWoR6ftWBLbYVLEIHiAIJWODDOmGZKnJQ295kKIKN1/Hy5x3ct2uiKWnLGS+PKQ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696091; c=relaxed/simple;
	bh=8K1Bp/HP5tUPjyUPiCToihZmUJx8CTldwV7w6bt3/HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EITjVpWpfRY3rcEBIHgR3/jbBKPsKMz3IlKFVMeVc++H5lpZaaKKqb2hOd1opbUIMBVpsiBqWYNY8RopKT7iE5rPAGZaS661RWXThaACgnydKYt1nCbc9yIieqKwyC6eDeAZkFOPqq0UAlzCmpflUfH2BnHNpiSv48MWTf3t8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mJXcSIpv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mJXcSIpv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E82C4CEF7;
	Thu, 29 Jan 2026 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769696091;
	bh=8K1Bp/HP5tUPjyUPiCToihZmUJx8CTldwV7w6bt3/HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJXcSIpvGPsZAor8wOoT8gD/S5UQeGXy14pObht46CTqxMYsu+1rYWlwaxA/fJoq9
	 VdKlqbp5uaFQ5fP1zWNBAcIp0m0fTvHdGoYFtbS98917uLga8yFEHrZ5P3ieeGljv3
	 mUHnPtCy3oHhFbBNoMZAbs2vUrg6s3Fmu6T1cDXw=
Date: Thu, 29 Jan 2026 15:14:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Te-Hsiu Huang <tehsiu.huang@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Joe Perches <joe@perches.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: refactor BSS Coexistence channel
 report logic
Message-ID: <2026012949-scorpion-handgun-433d@gregkh>
References: <aXsEd2bzf35y8i_E@stanley.mountain>
 <20260129080110.73884-1-tehsiu.huang@gmail.com>
 <2026012943-danger-tweed-8f81@gregkh>
 <CAMbZB6NhWzPhNB2fiyxyNoqd+=y93JYp0NdQykyEgsL9=qT7-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMbZB6NhWzPhNB2fiyxyNoqd+=y93JYp0NdQykyEgsL9=qT7-Q@mail.gmail.com>

On Thu, Jan 29, 2026 at 01:54:37AM -0800, Te-Hsiu Huang wrote:
> On Thu, Jan 29, 2026 at 12:54 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> 
> > That's a lot of different things all in one single patch.  SHouldn't
> > this be split up into different ones?
> I kept these changes in one patch because they all work together to
> replace the old ICS logic and remove the magic numbers. Splitting them
> might break the build or make the code inconsistent halfway through.
> I was suggested renaming and using a bool array structure in the
> earlier patch here:
> https://lore.kernel.org/all/e87acd109ea5eb4e3f8fc233788cd0dbd128407d.camel@perches.com/
> I kept the 2D structure to maintain parity with the IEEE 802.11 spec
> as original implementation. It makes the code semantically correct and
> easier to extend for other Operating Classes in the future.
> 
> > And did you use AI to generate this patch?
> I used AI tools to polish the language of my commit message and to
> perform a parity check, ensuring the refactored boolean logic is
> functionally identical to the original code.

Then as per our development rules, you must document this properly.
Please read and follow them for when you resubmit this.

> 
> > Also, how was this tested?  What prompted you to want to make this
> > change in the first place?
> The patch was tested by:
> 1. Cross-compile the module for the rtl8723bs driver (make
> M=drivers/staging/rtl8723bs) to ensure no build regressions.
> 2. Ran it through scripts/checkpatch.pl to confirm it meets kernel
> coding standards.
> 3. Since I do not have the physical hardware, I performed a manual
> check (by AI verification) to ensure the logic remains identical.

AI can not "verify" anything, you must always check that, sorry.

greg k-h
