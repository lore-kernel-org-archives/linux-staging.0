Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F693B52E0;
	Wed, 18 Mar 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833962; cv=none; b=uiPlJXRl1XUt3hAl8P2NrCkBY6DPIwQbLnZC39PQpucExv3WCKCDsXqB8Dj48sIOWvWtV1mRejC9gALyr/+NK6VRXY1uSUAN4j7HgEg7vc/NwZ0D/erSehCkrpKxyiU+GicV2eKhYRzCxwPoMTHb5G+sBRA+KDP16rw5oY0+zKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833962; c=relaxed/simple;
	bh=w8qWdrV72T/a4iMSugOLdJX8oS3mqDT3YHSmlZrK9yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzERfbR8O3yWgt5AvUmvIcIT0KbmdnFs21g+IH5EEc2+twLu5ovWlrMIs9FYbNq1twNsnjq7dbp9dmdNdQuYFwQn85oYWZBjKhC0nRG09nLFRwcC3YWopacSfZM5NvrKvNge4QWpbqxTPSCkL9F2MwRB5SHNxJLyegAp5qlzFX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=quf8gmAN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="quf8gmAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C270EC19421;
	Wed, 18 Mar 2026 11:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773833962;
	bh=w8qWdrV72T/a4iMSugOLdJX8oS3mqDT3YHSmlZrK9yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=quf8gmAN3YzKCC/lHMdD+qYTAwLRhmSVjdiDl2rPlwVYEJE4cEDVeeo8T6adD4aMn
	 HSOjC7dd9ib8yyU+qyQswEt/MV0de6nNGRNAql9d9JaLKnrrJrxDdFbOejyhvZ5kmw
	 jE2e9CYUc77Nelo7skz7dwt+rjfnHl1cM0QxDWW4=
Date: Wed, 18 Mar 2026 11:11:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Aadarsh Mandal <aadarshmandal9354@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	ethantidmore06@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fixed the trailing
 whitespaces/commented code
Message-ID: <2026031841-turban-sludge-c8c8@gregkh>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>

On Wed, Mar 18, 2026 at 07:59:28AM +0100, Luka Gejak wrote:
> Hi Aadarsh,
> 
> Thanks for submitting this patch, and good luck with your GSoC application!

Wait, what?  Is GSoC doing staging patches for "entrance" into the
program?  If so, SOMEONE needs to tell me this, otherwise I will have to
treat all of these as an abuse of the community review process and just
flat out reject all staging patches until the GSoC application process
is over.

This isn't ok, you all know better than to do this.

Who is in charge of the kernel GSoC project this year?

greg k-h
