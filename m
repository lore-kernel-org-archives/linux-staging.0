Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E428E1
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 15:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C311BC433D2;
	Sat, 15 Apr 2023 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681574067;
	bh=TiEk8Zq0uD9Lcbe3ZuS8X3Zf++JSvVSRSdv/Q9bRL64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aM4KnnUe8irAUfoqIrbwUluZ0pyin9cYB9eTh5EgXCHnhF70PDboQkOFUwh7BPWBG
	 r61dwPlFC9M/m9rxsPlwzjO0FLTARO9q9qi76w85LpLMpprNn5uVq/udtaAhtVNZVK
	 IslBAqBzFbWkg2//EYBG1smrdlKbv4G3SepAgGfs=
Date: Sat, 15 Apr 2023 17:54:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Fix alignment to match open
 parenthesis
Message-ID: <2023041516-lushness-neurology-a728@gregkh>
References: <20230408165151.GA261885@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408165151.GA261885@sumitra.com>

On Sat, Apr 08, 2023 at 09:51:51AM -0700, Sumitra Sharma wrote:
> Fix alignment to match opening parenthesis as suggested by Linux kernel
> coding-style. This issue is reported by checkpatch.
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)

You have sent a lot of different patches for the same driver, with the
same subject line, but yet doing different things.  I am totally
confused as to what is, and is not, the latest versions, so I am
dropping all of these from my review queue.

Please resend them all, as a numbered patch series, so that we have a
clue as to what to review here.

thanks,

greg k-h
