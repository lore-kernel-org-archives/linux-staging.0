Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBBE1F2BAD;
	Fri,  1 May 2026 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777645418; cv=none; b=O9H80fdaltqAoGdU8J8VWr5HZf7NqN5OLUTzCRt48XWmZ9MCQrUg6wzzURR0dU2Z2wGnXykUStLp7JrG5aKXdJUUSkpojFiQEIPPmssOX/TuJmj2f4fyfjSqCpIBfrDgNhZHdoCUql1lfESpJgmd4+WFP7EwA4LkzDp2XmDWyB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777645418; c=relaxed/simple;
	bh=C38Er74XKF4RgZEEadR7CSfurscBgx/4MvgfZolh7JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdZok0s8+UOvUwRoAsK3LcAuRxNgZWqeeD4bqRlrw8WOGf98tWkw0ldxFJnlDUQ7BmCTQIajWe8/0la/QK9hZhOZW4Hw1wiq7q2/hRTiQjW3IBgran2X+jA2ELolW21yT5ikaSjavjh6oxFJ33Pev7F+nZ1hysKjFZGSsgvcOKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xwZn88Qd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xwZn88Qd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7C1C2BCB4;
	Fri,  1 May 2026 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777645418;
	bh=C38Er74XKF4RgZEEadR7CSfurscBgx/4MvgfZolh7JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xwZn88Qd8gfu6gt8S8L+6ac9NrLAfwpz+Pa6rH+vz+pYZL6hOmY+iIYkySAvJMZTo
	 0JZ00waj296/EFTO+M7UrnFBVkZbaL6+DaFfj7Q9HW70wu27SxXy2Dg8G2c/d8B7yt
	 wGVRP8PXBgcQdRK737RAc/aV20v08IpWkkBMzoHU=
Date: Fri, 1 May 2026 16:23:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus:add missing newline in sysfs show()
 output
Message-ID: <2026050120-statistic-absinthe-b3ab@gregkh>
References: <20260501141620.24411-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501141620.24411-1-shyamsunderreddypadira@gmail.com>

On Fri, May 01, 2026 at 07:46:17PM +0530, Shyam Sunder Reddy Padira wrote:
> Sysfs show() functions should return newline-terminated
> strings.Add missing newline to sysfs_emit() format string.
> 
> No functional changes.

that is a very functional change :(
