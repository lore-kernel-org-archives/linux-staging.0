Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D71186A;
	Thu, 27 Oct 2022 09:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5E9C433C1;
	Thu, 27 Oct 2022 09:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666862375;
	bh=im+XU/mgani7pOFdGDjd1Gw/FnAy4a4DtoQPGlW2bRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8mBdx9gPcbUfEKkYnxSi1QlegWqSBGPhE8Vor2kLZ1z4n5D795B5TIY6dZXTsePE
	 Qgdbg9v5tX5zfYsz/+hpCsJYWQUDPtMvIC/aVRi37/fYEFREvdWcIzCX+ugoZjizxm
	 +fA4jl13KeIuwR356COCRAJA3A/WnQRwY8xIZ9TM=
Date: Thu, 27 Oct 2022 11:19:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v5 2/6] staging: vt6655: refactor code in
 s_uGetRTSCTSDuration
Message-ID: <Y1pNJMvl89jgq9qz@kroah.com>
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
 <0e6a307052d3a354a850a502e509f46baccdbe1e.1666849707.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e6a307052d3a354a850a502e509f46baccdbe1e.1666849707.git.tanjubrunostar0@gmail.com>

On Thu, Oct 27, 2022 at 08:59:04AM +0000, Tanjuate Brunostar wrote:
> refactor long lines of code in the function: s_uGetRTSCTSDuration

Please write full sentences.

Also please read the in-kernel documentation for how to write good
changelog text.  Specifically look at the section entitled "The
canonical patch format" in the kernel file,
Documentation/SubmittingPatches for a description of how to do this
properly.

Do this for all of the patches in this series.

thanks,

greg k-h
