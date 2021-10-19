Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDE2C88
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 05:49:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57D9760F46;
	Tue, 19 Oct 2021 05:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634622586;
	bh=rQloIryMv0HhFIsTzvWz8cG6c81v5XbKulgqtGe5oMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMPCUCAfqUtw8rJmYCKZJsEOw/CMwHrfR7jC5+XbhE7KB0LB36e6+TaovvqdpoS8T
	 VPMKNCpJwVHr2vG+5ZNr73Y2GAbwyudwRer6u0AYUTIXQWP62ZNV9/Yr/5AXeMjw49
	 VprmGCxbuAcqFW39DWGkd6P7WskDKkWqSQC02z9E=
Date: Tue, 19 Oct 2021 07:49:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: fix camelcase byData in card.c
Message-ID: <YW5ceCLSIRl5zJIm@kroah.com>
References: <20211018192124.8738-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018192124.8738-1-tomm.merciai@gmail.com>

On Mon, Oct 18, 2021 at 09:21:22PM +0200, Tommaso Merciai wrote:
> Replace camelcase variable "byData" into linux kernel coding style
> equivalent variable "data" in card.c.
> "by" prefix in hungarian notation stands for byte or unsigned char
> 
> References:
>  - https://www.cse.iitk.ac.in/users/dsrkg/cs245/html/Guide.htm

Don't provide web links in a changelog text, they might not endure.

>  - https://www.kernel.org/doc/html/v4.10/process/coding-style.html

Why the old and obsolete 4.10 kernel document?

thanks,

greg k-h
