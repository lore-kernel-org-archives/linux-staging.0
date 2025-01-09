Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B9215059;
	Thu,  9 Jan 2025 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409085; cv=none; b=G3MmvuEc+BBCOPzEI53tG1M8S+UZzn381WTmHqcQyDrz7QWfR8xwv36Ny+ZdVmka81cLfZLHeE166JN9Q6izRc4P4LBqTqnnUKTDKnRihCRDFOCN464YGtLCjEWR6D12/aG+vUJaLByvGLCabmsSWs6au4yBGVmN3xRdC597gIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409085; c=relaxed/simple;
	bh=UlShvnJ7Q8ZrM0G1xT/2I0HRmWo28fwE3T9IQ2VJHV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQTUrZeheIWGeYYqZEwUSprIbT9Fhi6TW8ZwLYYfQqf6irwlpta5nhKDUPg/IV6iP9pQHf1eEWYb6bkOBgjC/r6Z+pa4crklCnkGtXVEDUwaRScpkiSh2w+PZd6CkDJ1VX+rXWDqotKslY6lBVfW4WJMvjMw+t3Ze/BQZdH6WNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d1WERcU9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d1WERcU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC6AC4CEE6;
	Thu,  9 Jan 2025 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736409084;
	bh=UlShvnJ7Q8ZrM0G1xT/2I0HRmWo28fwE3T9IQ2VJHV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1WERcU9v272umJZcNJOmKab2QMk+PAEox8kGbUE/uDyWmVFh0zZ+ee/x5fBkwiLL
	 Xnn7wnbAv5QzYczp0esETjzv11/soLzvpTD2S/oddSwb6NDEVdnstCE/2MU46ThH9E
	 wuaqsUs8tOVcmWsZaZTro1/Q3aQCzpTIB/mXf4YM=
Date: Thu, 9 Jan 2025 08:50:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Elder <elder@ieee.org>, Will Walsh <iron.will.walsh@gmail.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: remove unnecessary parentheses
Message-ID: <2025010932-rice-landed-2b96@gregkh>
References: <20250109003624.37323-1-iron.will.walsh@gmail.com>
 <ed70a5d5-8e85-495b-9e56-eae472ba3046@ieee.org>
 <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>

On Thu, Jan 09, 2025 at 10:45:50AM +0300, Dan Carpenter wrote:
> On Wed, Jan 08, 2025 at 08:56:50PM -0600, Alex Elder wrote:
> > On 1/8/25 6:36 PM, Will Walsh wrote:
> > > Unnecessary parentheses in boolean comparisons make it harder to read.
> > > 
> > > Removed the extra parentheses on line 305 for code readability.
> > > 
> > > Signed-off-by: Will Walsh <iron.will.walsh@gmail.com>
> > 
> > I'm not sure this makes a big difference in readability but I
> > personally avoid extra parentheses unless adding them makes a
> > compiler warning go away.
> 
> It's not a compiler warning, it checkpatch.

And it is a checkpatch warning that I HATE and keep rejecting, here's
where I did so yesterday:
	https://lore.kernel.org/r/2025010738-gong-rewind-2583@gregkh

Will, sorry, but I don't want to take this.

greg k-h
