Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F13E8C6E;
	Mon,  9 Mar 2026 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075397; cv=none; b=Ampc658Knlc4Q5wqZYwYaDfdHOqghg7gn2c5dWP/P8g7XtKxcvWwYr5gX8sT/Rni+AoYHpoBOFPCeOgFB/H7jeoeOdtw8D3jymgw5vAiyUIDFdmKHrhK8GrPjcZTbw3nBAQzeNUj4RMiQgPyJ53Waw2pTxz0yEPaQPQNUywshbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075397; c=relaxed/simple;
	bh=/+Ki5qgMsfSD3UbKL/sG5vFStLon0FM9Y8Wg4QOYE+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmOXXZG2nU+FkX//765f1G9LhLdYvlpRmxohJlDlda4TdFUCHV/LQ8QjNoW3VIfaYKakK+7q39fn5pBt/MFudG/+Tbg5kqdir5VnKdC/8XKB2xx/0MdFNMEmTYvb2K4mMTddJOAcVpWTx3PXgh9XPK39sRvn9YBR3YpTJKjqNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sSqQWgH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sSqQWgH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01325C4CEF7;
	Mon,  9 Mar 2026 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075397;
	bh=/+Ki5qgMsfSD3UbKL/sG5vFStLon0FM9Y8Wg4QOYE+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSqQWgH7NO14ldbpRGl1yNrNcxsCfm6GDvh3CXFF2GwEPWBhB46b4Yl6wJDkzVgnC
	 n0TTtswglugoVhOh86ynhhUCPmvlmTKZo/cuzRjqbGYYucqPaQC0Mm0L1f4NIa7NU3
	 9xDM7egjARzGuoZxfPXL6z2gDYpqmUAvDr5yi8+4=
Date: Mon, 9 Mar 2026 17:56:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: minimize lock duration in write
Message-ID: <2026030903-although-gratitude-49a6@gregkh>
References: <20260301005836.2513391-1-objecting@objecting.org>
 <2026030914-task-stunned-21e0@gregkh>
 <07e2ae8e-e6e9-4def-9eb2-2c48ce6669b8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07e2ae8e-e6e9-4def-9eb2-2c48ce6669b8@gmail.com>

On Mon, Mar 09, 2026 at 04:11:25PM +0000, Josh Law wrote:
> 9 Mar 2026 16:07:50 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
> 
> > On Sun, Mar 01, 2026 at 12:58:36AM +0000, Josh Law wrote:
> >> Memory allocation and copy from user space with vmemdup_user() is relatively slow and can sleep. Move it outside the lock to minimize the time the mutex is held, reducing contention for concurrent accesses.
> >
> > Something happened with your line wrapping :(
> >
> > And are you sure that your change works?  What is wrong with grabbing
> > the lock this way?
> >
> > thanks,
> >
> > greg k-h
> 
> The issue with grabbing the lock before vmemdup_user() is that the allocation and user-space copy can take a significant amount of time and can sleep.

But what is wrong with that?

> Also, it's just to be more efficient haha, and yes I'm sure this change works, I own the hardware, and it operates better...

Great, please put the performance numbers in the patch, that will show
the need for this change.

thanks,

greg k-h
