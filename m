Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2C20E8
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 07:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F460C433D2;
	Tue,  7 Feb 2023 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675755626;
	bh=ruNkRuymOOg0sWL/1aO3vcUdz3VrnPNH2mzfy2q55oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yMfOGPJu/yELE3msXQPqv23Mv6ClILKpgZksy+4PX+wz27823FLfcO1gVd5T4Q8fL
	 F8wq/WmgIAKdmtFgZA56NgszzohedD7qQoMSueWa3EjBXHOqMp8ZCO/ldtXIWdAeph
	 sIDHE465xQA4DS7RUtmze02nwukZTl6ar7vUnD9s=
Date: Tue, 7 Feb 2023 08:40:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: vt6655: Macro with braces issue changed
 to inline function
Message-ID: <Y+IAZxQTkZpgD1+I@kroah.com>
References: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675753094.git.gurumeharrachaputi@gmail.com>

On Tue, Feb 07, 2023 at 08:14:26AM +0100, Guru Mehar Rachaputi wrote:
> 
> This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> as '(iobase)' to avoid precedence issues" changed to inline function. In
> relation to this, names of the callers of macro are also modified to call
> this function.
> 
> 
> Changes in v4:
> 	- Modified commit message to be clear
> 
> Changes in v3:
> 	1. Whitespace error from checkpatch fixed
> 	2. Should be applied together with changes in v2 for testing
> 
> Changes in v2:
> 	- Macros with one statement that is to call 'iowrite8' function changed
> 	to inline function as reviewed by gregkh@linuxfoundation.org.
> 	In relation to this, names of the callers of macro are also modified
> 	to call this function.
> 
> 
> Guru Mehar Rachaputi (4):
>   staging: vt6655: Add braces to macro parameter 'iobase'
>   staging: vt6655: Macro with braces issue change to inline function
>   staging: vt6655: Macro with braces issue change to inline function
>   staging: vt6655: Macro with braces issue changed to inline function
> 
>  drivers/staging/vt6655/card.c        |  4 ++--
>  drivers/staging/vt6655/channel.c     |  4 ++--
>  drivers/staging/vt6655/device_main.c | 12 ++++++------
>  drivers/staging/vt6655/mac.c         |  8 ++++----
>  drivers/staging/vt6655/mac.h         | 12 +++++++++---
>  5 files changed, 23 insertions(+), 17 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
> -- 
> Thanks & Regards,
> Guru
> 

I only see this 0/4 message, no actual patch in the series was sent out.
Did something go wrong?

thanks,

greg k-h
