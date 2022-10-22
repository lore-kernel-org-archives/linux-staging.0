Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF428F3;
	Sat, 22 Oct 2022 08:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CA4C433C1;
	Sat, 22 Oct 2022 08:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666426654;
	bh=z4L3/xqSCV2K+C5GIeeIyFqzJyigHhSodzy2OE9hNEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scIuEuHGtr9qqEV6GCawIaX9Nava8adi6RASKh1Tuyo2Au7fNt+O2UxcIBN8bN384
	 t5iFBDBRpLxjuMH665qtFZtdCdBnjvYhspq3uJEzxd5zw6Ppl9eE8JKowqTdNlQQog
	 o4pegTBb5PP8QANNK8LZcA/STt59GsUZKT0v47ag=
Date: Sat, 22 Oct 2022 10:07:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Emily Peri <eperi1024@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] clean up driver code in rtw_ioctl_set
Message-ID: <Y1OkzrA5Z9u8llPN@kroah.com>
References: <cover.1666380274.git.eperi1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666380274.git.eperi1024@gmail.com>

On Fri, Oct 21, 2022 at 12:54:54PM -0700, Emily Peri wrote:
> Created patchset to fix all checkpatch warnings in rtw_ioctl_set
> 
> Changes since v1:

In the future, please use the proper prefix ("staging: rtl8723bs:" in
this case) for your 0/X emails.

thanks,

greg k-h
