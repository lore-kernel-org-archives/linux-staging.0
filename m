Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00FD15A6;
	Thu, 20 Oct 2022 04:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4000AC433D6;
	Thu, 20 Oct 2022 04:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666241826;
	bh=Ni4r2wMFH0K6x/UKO1tZ8E4iMWvcsU87QJi7cnK12BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrLjh0yhAZ5zE3jnwCwfCq45IvFU167umi6Bn41dUmXPpRtTMDX7DqQC9XgsNjBxi
	 tXjn2atJNeClii/ysuCTmXrktwS1IGlEx/91yGDsr0mJQYmS5odoEIXeACAukFL9Qa
	 bOzZPyXz4YUFh8bYceke5YD3k2ozzi/L6P1jR4rM=
Date: Thu, 20 Oct 2022 06:57:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Emily Peri <eperi1024@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: fix white space warnings
Message-ID: <Y1DVH+UatalfjDN5@kroah.com>
References: <cover.1666230736.git.eperi1024@gmail.com>
 <45558673b486808e7978e2e4838c6ce5a2485b8b.1666230736.git.eperi1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45558673b486808e7978e2e4838c6ce5a2485b8b.1666230736.git.eperi1024@gmail.com>

On Wed, Oct 19, 2022 at 07:10:51PM -0700, Emily Peri wrote:
> Fix the following checkpatch warnings in rtw_ioctl_set:
> 1) Add missing blankline after declaration
> 2) Replace spaces used for indent with tab
> 3) Remove space before tab

When you have to list the different things you do, you should really
break that up into individual patches.  This should be 3.

thanks,

greg k-h
