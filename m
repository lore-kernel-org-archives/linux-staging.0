Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4BD5EBB
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 17:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70F9C340F1;
	Mon, 21 Feb 2022 17:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645463639;
	bh=9RKcPbXHhUVKJ2kqLtrL8qTir0JYgo1zSrHEZWkk8bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+l1N9HbfKWkOV6tQSGG+kyw1FkvT9FWUNSrZvz3YWbev6q6F+wNfdU5+Vd5swQ0y
	 xzBExfATjDxe0DtKYQphNFxCGvs4gxzeSGHqIvD4kiDfkVFeJ/JW6pRtIDjb7qT61T
	 /+3RDW3X7nl5iM/sAx49ch2zqkjxa1zZtqfVJ6jo=
Date: Mon, 21 Feb 2022 18:13:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: r8188eu: remove 5 GHz channels from
 ch_freq_map
Message-ID: <YhPIVFmStJOMI0QZ@kroah.com>
References: <20220220154847.7521-1-straube.linux@gmail.com>
 <20220220154847.7521-2-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220220154847.7521-2-straube.linux@gmail.com>

On Sun, Feb 20, 2022 at 04:48:45PM +0100, Michael Straube wrote:
> This driver is for chips that operate only in the 2.4 GHz band.

How do we know that?

thanks,

greg k-h
