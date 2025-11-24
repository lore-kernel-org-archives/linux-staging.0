Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA5280331;
	Mon, 24 Nov 2025 16:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002568; cv=none; b=IFFGbbNhXkOTNbdOjbpKOFRjjTO37qc180Jpz35RCh2m8/rWrRK1E+zEWuPFfdgcazsskOYt10khNyQffaq74oyT7bo+38pW3MrjNxucBYGU187+2U+GKgU53H1E41lPuCYiXZm0n6styRLC6NbxB8utnzQjbqWAZ6Uf/YuKWbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002568; c=relaxed/simple;
	bh=kOQb8bBNHEsUZbN+OnmQqCs0CvZND6IsiVviLawrODI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/rODAnbL0eMZx+dx4tL84R/AMKfxG7Z/R/Yvn92r65AIzGyjus5UqWih8vzt0ZWmhxJlDZN0BmpuJrDwgQuWhNwN5L6z49JOZ9rDGAJ4ypW2+0GTvlIMebbvkBzrTBZwI6ptOoPVPJ1LhEkch2lMhRSw5ZlUc1ChdbHgLmi77U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p5oaS818; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p5oaS818"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2B0C4CEF1;
	Mon, 24 Nov 2025 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002567;
	bh=kOQb8bBNHEsUZbN+OnmQqCs0CvZND6IsiVviLawrODI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p5oaS818SDFpkO9Wgp9cc7NJf5xI7d9mshqZBW6ELFanZms0ZpcjOGWLeBm1UhyUM
	 1SYqw5OuovuVbdY7toDUw6LQDCT+zzUbnhcKU2jdsqHohylODORsH+WXaFRHDviVlp
	 4vzKWep531DIayQ65wh4DD5q4bD4JUNo2KbQvlvM=
Date: Mon, 24 Nov 2025 17:42:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	johan@kernel.org
Subject: Re: [PATCH V4 4/4] gpib: Destage gpib
Message-ID: <2025112416-driven-wages-9c7c@gregkh>
References: <20251117144021.23569-1-dpenkler@gmail.com>
 <20251117144021.23569-5-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117144021.23569-5-dpenkler@gmail.com>

On Mon, Nov 17, 2025 at 03:40:21PM +0100, Dave Penkler wrote:
> Remove the gpib Kconfig menu and Makefile build rule from staging.
> 
> Remove gpib/uapi from the header file search path in subdir-ccflags
> of the gpib Makefile
> 
> As part of the destaging process the gpib/uapi header files will be
> moved to the standard kernel uapi directory include/uapi/linux
> Change the include file path in the code for these files accordingly.
> 
> The gpib user space library needs the uapi header files in order to
> communicate with the drivers. Copy the common include files from
> staging/gpib/uapi to include/linux/uapi
> 
> Move the gpib tree out of staging to drivers.
> 
> Remove the word "Linux" from the gpib Kconfig file.
> 
> Add the gpib Kconfig menu and Makefile build rule to drivers
> The gpib Kconfig menu has been added just after the related comedi
> drivers.
> 
> MAINTAINERS: Change the gpib directory and add the uapi include files.
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>

Nit, I think you merged 2 patches here together and didn't notice the
MAINTAINERS: line :)

I'll go fix this up when applying it now, no worries.

thanks,

greg k-h
