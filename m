Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379AE3264F6;
	Wed,  1 Apr 2026 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039395; cv=none; b=Kc3o39vCY+L8gWEoN4FA/4UyAbIXlA0Gz+ZGR1a+JZEzzio4sKRad1h5Qo5KQAUDcCpOKm+q7zrwXGsgDEAbQgG/lPMeOEfGHjbrWWL83YC7Doffmn8LAxaISke6i1EZZSD87oBvxSmIY8AG7Veg19OAhpKVotKT0JFIjtYX+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039395; c=relaxed/simple;
	bh=T6QkkBlAG0+o83k6sc/aj0XeurTX7EffGa/QMDSF2rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI2cKA/FS7VIXTZS/7gfAQwC55wknpUN2ZFUsah7haM3znAuOdTxDY5OT1XSq+C8Ddl7/522OdiU8NmCQimqnfq9NOBPAlVEC0xbMC2ERHk9pCusj2mI/rFnhtpdZyYLduFu6AQQZGA4mzJYJmUpI5uPX+w2V5JzHBP71nXylu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WctKXox5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WctKXox5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B18C2BC9E;
	Wed,  1 Apr 2026 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775039394;
	bh=T6QkkBlAG0+o83k6sc/aj0XeurTX7EffGa/QMDSF2rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WctKXox5NdZcnuvquflbX07i64V6UjrZoU7CGY2TS0nidFBANtkshXylPITiMi02X
	 w5GazA+ws+y2SSFXgrYtjGDsuSmxzGxQaBmNZ8VRj61la+DNfukJzXt6pKP4RfybHs
	 ICNzaMnPeG7ng0HNyV4hOKZZxJU6BNE6HF3paV+E=
Date: Wed, 1 Apr 2026 12:29:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: omer.e.idrissi@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
Message-ID: <2026040159-bamboo-ended-620b@gregkh>
References: <272CEB11-DD9C-43BE-B47D-49F8BE1A0392@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <272CEB11-DD9C-43BE-B47D-49F8BE1A0392@linux.dev>

On Wed, Apr 01, 2026 at 12:17:41PM +0200, Luka Gejak wrote:
> Hi Omer,
> Thank you for submitting this patch series. I like the idea, however
> during my review I have found that there are several issues.

<snip>

Please review things "inline" like a human does.  With the code in
place, and the comments right below the code.

As you are using AI for this, PLEASE use an AI tool that actually works.
Use the ones that we have public, which DOES get this right and puts the
review comments in the correct places, and in the correct format.

If I were confronted with a review like this on patch 0/X, it would be
very hard for me to actually digest and handle it, given that the
context is not there at all.

I suggest you take some time off, work on your review workflow, and
then, if you still want to help out with reviews, do it in the proper
way that we all have been doing for decades.

thanks,

greg k-h
