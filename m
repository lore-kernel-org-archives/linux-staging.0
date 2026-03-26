Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E89347537;
	Thu, 26 Mar 2026 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536605; cv=none; b=fGf1b839twLagg2hX07TwG+wFmsq4NrVn8aQ9gb2WyZFsytgqOrYQ/uBnZeUFFiQIv2hzRqo632KdBjofts/KiGJA9C3qQC11SiDss0Iq0RkWEiOdQyvTVnNGA8xgXjY8nEbYvHDDx9rrbPn7qDWy7eEybyuaycOb1vMJ9bJbkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536605; c=relaxed/simple;
	bh=/ycSJm8mf3utlGs6M7ejV4OT6DOjw0Yh9eFgTUvwRww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwmHPWCqQNuXCQe44EWCbpWwJ8hCq5dV5yLJJe1jpr+/ktYRzfcP8qEDIMhaNiJ/DqRyPAR/SwU4g3TkU/RPiQoHFcN65UnwYsgHchAnMc/ddq2a+R92E+bpQS79d0E/f4tjm8w2JBWJWUf3Lvav5PQDnFg0d3bg19gu3QvAauM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FKdZvDM9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FKdZvDM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B306C116C6;
	Thu, 26 Mar 2026 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774536605;
	bh=/ycSJm8mf3utlGs6M7ejV4OT6DOjw0Yh9eFgTUvwRww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKdZvDM9JHlU2W5tAJHPtFdm4Yg8ksrTzTO06t+ZfuR/QeVL0E1AOmNBTzToVyZ6Z
	 AojDmtxUzMYgBTyD98BBJKqS5VratfNMJtpj5m0XYYBZOH3cD11tzJXYg/ESRItSvn
	 gdVczVoHrmGL3YWnt/0gUzXEipzShZ8Wr8kGRTuE=
Date: Thu, 26 Mar 2026 15:49:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Omer <omer.e.idrissi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idriss@gmail.com>
Subject: Re: [PATCH v3 0/4] clean up error handling
Message-ID: <2026032644-depress-unrented-7453@gregkh>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081627.5841-1-omer.e.idrissi@gmail.com>
 <2026032638-spinach-spirited-48f6@gregkh>
 <CACx49NdOyb6cCEC-T2yNrv2aABtBbv1Yhxj6+EoxAJE59GHh6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACx49NdOyb6cCEC-T2yNrv2aABtBbv1Yhxj6+EoxAJE59GHh6Q@mail.gmail.com>

On Thu, Mar 26, 2026 at 12:10:36PM +0100, Omer wrote:
> Nope.

Please do not top-post :(

> The signed-off-by tag was off by one letter. so i fixed that and resent it.

Then that would be a new version, not the same version twice, otherwise
how would we know which to pick?

Please remember, some of us get 1000+ emails a day to deal with, and
when reviewing patches for a subsystem, have to handle hundreds of them
at the same time.  Think about what you would want the messages to look
like if you were on the recieving end.

As a bit of help, why not take some time to review other patches on the
staging list to reduce the overall load and to get more familiar with
how the process works?

thanks,

greg k-h
