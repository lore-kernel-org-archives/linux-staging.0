Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB7EA9
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 06:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346AAC385A1;
	Sun, 10 Apr 2022 06:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649571751;
	bh=62ZM2k+nlOZ6MmyQlNkdqC5FBtCMerHAYg0IffedikM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iV5I24j6Pe6TIdDBCUkZY3gbpWdcZUHR1BLoBjCSGFTjN1mjVHZQZsgKJJ7bbvkgd
	 IyExQYf1YfZ52ssbWqCYxs/w3wof3pTGhme5bZXOagRIdEPnz0ebrQX3jXP7TNfZt+
	 JfCAsx4ZyPerlSASyEdR+ZluL/gOC+ev//Q7c05I=
Date: Sun, 10 Apr 2022 08:22:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Liu Junqi <liujunqi@pku.edu.cn>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Leonardo Araujo <leonardo.aa88@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove D. Kershner from Unisys S-PAR
 maintainers
Message-ID: <YlJ3ot74ZwfGx53i@kroah.com>
References: <20220409205857.32083-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220409205857.32083-1-fmdefrancesco@gmail.com>

On Sat, Apr 09, 2022 at 10:58:57PM +0200, Fabio M. De Francesco wrote:
> The email address of David Kershner is no more reachable. Remove his
> entry from the MAINTAINERS file for UNISYS S-PAR DRIVERS.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba405f6ec31a..3b7497359c2b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20188,7 +20188,6 @@ F:	include/linux/cdrom.h
>  F:	include/uapi/linux/cdrom.h
>  
>  UNISYS S-PAR DRIVERS
> -M:	David Kershner <david.kershner@unisys.com>
>  L:	sparmaintainer@unisys.com (Unisys internal)
>  S:	Supported

If so, then that means this list needs to be dropped and the entry
changed to orphaned :(

thanks,

greg k-h
