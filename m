Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3903310E0
	for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 14:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6F7C341C0;
	Tue, 21 Jun 2022 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655822916;
	bh=Gwr+QyPB83NBVvE/p+NStVDucuI4XhibcTOhatHYCMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acuemdwiDFqqe9DwJANs1HBjVp9507bqKE0b6z1jOvk5N/RsystoicJlpZgu+S4Se
	 RsKidwCiZ9K0ixmveG3eS7t15WBuY3AN6WA+sZM5AxObD7Eaw4sdLbJujJ7fQkRMfb
	 wp7jXfiy4cQZOvJcQd5awP1YS39Ug17eBfV4mgrM=
Date: Tue, 21 Jun 2022 16:48:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: vireshk@kernel.org, Johan Hovold <johan@kernel.org>, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Unitialized Variable and Null Pointer Dereference bug in
 gb_bootrom_get_firmware
Message-ID: <YrHaQHGhdV0w0ot+@kroah.com>
References: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>

On Tue, Jun 21, 2022 at 10:36:04PM +0800, Dongliang Mu wrote:
> Hi maintainers,
> 
> I would like to send one bug report.
> 
> In gb_bootrom_get_firmware, if the first branch is satisfied, it will
> go to queue_work, leading to the dereference of uninitialized const
> variable "fw". If the second branch is satisfied, it will go to unlock
> with fw as NULL pointer, leading to a NULL Pointer Dereference.
> 
> The Fixes commit should be [1], introducing the dereference of "fw" in
> the error handling code.
> 
> I am not sure how to fix this bug. Any comment on removing the
> dereference of fw?

As Johan said, please fix up your tool that found this, it is not
working properly.

thanks,

greg k-h
