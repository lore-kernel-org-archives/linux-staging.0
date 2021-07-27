Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EC872
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 13:06:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74C0C610D0;
	Tue, 27 Jul 2021 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627391192;
	bh=dSkirkfsI++z38mvXCgqd7NzcPR7nNLQlgLTI+XvctU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZDhYmb9bbXeiMbNBWfPk/4kt753Kwdf1mjnRSTO8Rd8sPHYwDcp8VbIpQMFSG6rI
	 6QvGp13tgXAw46qpKBl8DhgozhimcgA4BrjoAyqe3R7JMT44eTj+gOmfGWzzvV4oNP
	 xXZsnpsOLIVyYV+quvCiFY64Noo+hJy8k8za2RGk=
Date: Tue, 27 Jul 2021 15:06:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	fabioaiuto83@gmail.com
Subject: Re: [PATCH v3 0/7] staging: rtl8188eu: replace driver with better
 version
Message-ID: <YQAE1q9ZWRPHqfK5@kroah.com>
References: <20210724001055.1613840-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001055.1613840-1-phil@philpotter.co.uk>

On Sat, Jul 24, 2021 at 01:10:48AM +0100, Phillip Potter wrote:
> I had to break this patchset up a bit to get around the file size limits
> on the mailing list, and also I removed the hostapd stuff which is
> userspace related and therefore not required.
> 
> The driver currently in staging is older and less functional than the
> version on Larry Finger's GitHub account, based upon v4.1.4_6773.20130222.
> This series of patches therefore:
> 
> (1) Removes the current driver from staging.
> (2) Imports the GitHub version mentioned above in its place.

Let's do (2) first before worrying about (1), given that we can't get a
version of (2) that actually builds yet :)

thanks,

greg k-h
