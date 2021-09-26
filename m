Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8B72
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 11:21:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5CDC60F9C;
	Sun, 26 Sep 2021 11:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632655280;
	bh=NptKLdeEqDH9nk0HlIl8uKxYjQE7PKvj6BWjb9UXVVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eotD7olQUgQkaCR35Ux/UxSbrk3M+Br1IwGUhFN9hzcAX8nr8Ev8gwbpiaYfFf5Bh
	 iHiInBDHItYWg86YOxsxLKfa5BwkcdAvD2fKhIZAx5PR5FmPol9WqxXlU2rrl3iNQ9
	 /hvf243qFpBN855u5lLnomlygQ3pmP4drk8CK33M=
Date: Sun, 26 Sep 2021 13:21:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: guolongji <guolongji@uniontech.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove meaningless pstat->passoc_req
 check in OnAssocReq()
Message-ID: <YVBXrQ2+cb3Tq8d7@kroah.com>
References: <20210926103014.30088-1-guolongji@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926103014.30088-1-guolongji@uniontech.com>

On Sun, Sep 26, 2021 at 06:30:14PM +0800, guolongji wrote:
> kfree(NULL) is safe and the check 'if (pstat->passoc_req)' before kfree
> is not possible.
> 
> Signed-off-by: guolongji <guolongji@uniontech.com>

We need a "full" or "real" name here.  Do you really sign documents with
a lower-case "g" like this?  If so, great, just have to check.

thanks,

greg k-h
