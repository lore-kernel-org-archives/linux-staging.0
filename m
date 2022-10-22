Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C528F3;
	Sat, 22 Oct 2022 08:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069A9C433B5;
	Sat, 22 Oct 2022 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666426517;
	bh=1Cp/fjx4amMZ7ek9vvrsoP+2LxXCc7uxPybF4OWmXhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=15jIaMIbY09CqIrUtlNETXK715urmFxI8ZH7wD+VevjS+ZQhPcoixGLEm7lEHAKMY
	 b1XlJJONJ5ibqUQCBt5hnVuqv+AjXQO2dWUkd8RnmYUxr0YOHRoxOMb+/UuV76QEcN
	 z55OxnlTIlMiFKWHgr4RSjrfZmeYkPa1nCmmvWAE=
Date: Sat, 22 Oct 2022 09:35:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 0/6] a series of checkpatch fixes on the file: rxtx.c
Message-ID: <Y1OdSYH45MNbp03k@kroah.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022070612.13009-1-tanjubrunostar0@gmail.com>

On Sat, Oct 22, 2022 at 07:06:06AM +0000, Tanjuate Brunostar wrote:
> The fixes are similar, mostly long lines splitting. I had to make
> serveral patches to ease the work of inspectors
> 
> v2: fixed a compilation error found by the kernel test robot and
> recompiled the code
> 
> v3: tends out the error persisted in the second version. this version is
> a correction of that
> 
> Tanjuate Brunostar (6):
>   staging: vt6655: fix lines ending in a '('
>   staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
>   staging: vt6655: refactor long lines of code in s_uFillDataHead
>   staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
>   staging: vt6655: refactor long lines of code in the rest of the file
>   staging: vt6655: refactor code to avoid a line ending in '('
> 
>  drivers/staging/vt6655/rxtx.c | 532 ++++++++++++++++++++--------------
>  1 file changed, 321 insertions(+), 211 deletions(-)
> 
> -- 
> 2.34.1
> 
> 

Any reason you do not have "staging: vt6655:" as the prefix for this 0/X
email subject line?

thanks,

greg k-h
