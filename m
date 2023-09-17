Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A42F3FFB
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 18:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F16C433C7;
	Sun, 17 Sep 2023 18:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694975636;
	bh=cg+PdpBnP+iX58Kwp6lIkOY1AYHCnGOtuzyehGr02Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z7lZS68M0ARWGaJ52tS95qC+tR7IQKi268X0kHXrn6shsT5ocnjZ0KbBN5cGSdJ0p
	 uxCzEa7dudO4VlIqQV2j7o7p+2F3v0ake9iwBxH+SQ7N3Sef5DpDV3026pAvLBAVBj
	 KjvjNrth05J1vF2k/L53U8C9eCkf7Xy+1Mq7QgCc=
Date: Sun, 17 Sep 2023 20:33:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Piro Yang <piroyangg@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] staging: vme_user: Fixed prink formatting issues
Message-ID: <2023091744-suds-decree-377d@gregkh>
References: <20230917171824.76702-1-piroyangg@gmail.com>
 <20230917181149.77514-1-piroyangg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917181149.77514-1-piroyangg@gmail.com>

On Mon, Sep 18, 2023 at 02:11:49AM +0800, Piro Yang wrote:
> Fixed issues relating to prink message including:
> 
> a. using __func__ to replace function's name
> b. using pr_warn to replace "printk(KERN_ERR"
> 
> Issue found by checkpatch
> 
> Signed-off-by: Piro Yang <piroyangg@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Why is this a RESEND?
