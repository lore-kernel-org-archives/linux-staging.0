Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4763017E6
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p2acUzWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B50FC433C7;
	Sun, 22 Oct 2023 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697973549;
	bh=EXt8EcTFEazDq8eq1sKNYxzGnzJ+KnJFV+nIJv+Njoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2acUzWshbqhEQ7/ciMiGIRqt0h5Iyc0mPC6SBCVBND72JFnFKmPLFLIG4oRu4ds0
	 VAv1bH89ywDR2x4ITHg1MYtPlYl3cMWZUAwwbZ93xjOuHfop3b7RqxdduEvVJSTAOa
	 9B0J1gksT+pcQlQSZMXInTQLSFMHtiaVp/qp5o+o=
Date: Sun, 22 Oct 2023 13:19:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH 2/3] staging: greybus: Alignment should match open
 parenthesis
Message-ID: <2023102241-unloader-finalize-c3c5@gregkh>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
 <57d7aa177d58384bcc178f6722a8f7f6af78a536.1697969950.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57d7aa177d58384bcc178f6722a8f7f6af78a536.1697969950.git.nandhakumar.singaram@gmail.com>

On Sun, Oct 22, 2023 at 03:40:57AM -0700, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>  drivers/staging/greybus/camera.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Same subject line problem :(

