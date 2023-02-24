Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532363D8C
	for <linux-staging@lists.linux.dev>; Fri, 24 Feb 2023 11:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89EDC433D2;
	Fri, 24 Feb 2023 11:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677236837;
	bh=O30kRj2lIqSfwoN/J+lEBzBy09k/lR5mBjeTS/LvA3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXY0P5O3zK6HP0OhOmFyxriiGZycUOPXeMOT+jBX3dDFDaxqMdMaMAFhFWnm+/kOl
	 rYvoRxIpoOelb3jaEXoFFt8G6QHiwxPMpo+5p4VIXmlxG+zqEjMdhCjiq1/Nn0MB7b
	 4lIYBnoIergpji/lYKEgY1jd3cKeP6v8luGIF1eU=
Date: Fri, 24 Feb 2023 12:07:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rohit Chavan <roheetchavan@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme: remove unnecessary parentheses
Message-ID: <Y/iaYtKk4VSokAFz@kroah.com>
References: <20230224105048.758-1-roheetchavan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224105048.758-1-roheetchavan@gmail.com>

On Fri, Feb 24, 2023 at 04:20:48PM +0530, Rohit Chavan wrote:
> This patch removes unnecessary parentheses in order to fix a checkpatch issue.
> 
> Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
> ---
>  drivers/staging/vme_user/vme_user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
> index 4e533c0bfe6d..5027d91d7038 100644
> --- a/drivers/staging/vme_user/vme_user.c
> +++ b/drivers/staging/vme_user/vme_user.c
> @@ -506,7 +506,7 @@ static int vme_user_match(struct vme_dev *vdev)
>  	int cur_slot = vme_slot_num(vdev);
>  
>  	for (i = 0; i < bus_num; i++)
> -		if ((cur_bus == bus[i]) && (cur_slot == vdev->num))
> +		if (cur_bus == bus[i] && cur_slot == vdev->num)

Then checkpatch is wrong, the original code is better as it is explicit
about what to do here.

Do you want to look up the order-of-operations every time to see if "&&"
is before or after "==" or the same?

sorry, but I will not take this, we write code for people first,
compilers second, and the original code is more obvious and explicit and
better in the long run.

thanks,

greg k-h
