Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD80185E;
	Sun, 15 Oct 2023 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0XtUOTO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31377C433C8;
	Sun, 15 Oct 2023 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697374184;
	bh=bGX5EnSl1r3ECoQfvfw2yVx4w/Y8jsMe3eiwHmVPzx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0XtUOTO9n4ATh6p19eqhQ4kxhdL8h42A8tzk6YArSem6/Nuxz3Gn6b9nzl5P+UB12
	 7XJijNZNS+ilqmjhijOkaRsJgOxpTj2F4uxDFyc1JYtOLnm1AQpT/VTYIi6XjEghLh
	 AQvsyFns0nTj1KgUyOvpyc29JZa15pr+esWgJ3ow=
Date: Sun, 15 Oct 2023 14:49:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] staging: rtl8192u: Mute checkpatch error
Message-ID: <2023101503-trial-move-4597@gregkh>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>

On Sun, Oct 15, 2023 at 12:06:46PM +0100, Gilbert Adikankwu wrote:
> Align descendant arguments to the open parenthesis as per the "Linux
> Kernel coding style" in Documentation/process/coding-style.rst
> 
> Mute the following checkpatch error:
> 
> CHECK: Alignment should match open parenthesis
> 
> Gilbert Adikankwu (6):
>   staging: rtl8192u: Align descendant arguments
>   staging: rtl8192u: Align descendant arguments
>   staging: rtl8192u: Align descendant arguments
>   staging: rtl8192u: Align descendant arguments
>   staging: rtl8192u: Align descendant arguments
>   staging: rtl8192u: Align descendant arguments

You have 6 patches here, with identical subject lines, yet obviously
they do different things.  Please fix that up to have unique subjects.

thanks,

greg k-h
