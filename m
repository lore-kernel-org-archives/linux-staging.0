Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5075071
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:34:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81C4561245;
	Mon, 12 Apr 2021 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618220098;
	bh=Y1sxCfWweWwRbvZLgkMHw1bDp73dV7VYdbFVdmmmtZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqNT/d3q3utn3eCtUo+AWp7O5ZIu1JPCfGXQXXVDgvA2aU99E6Yr/AqIo+waPyj06
	 UlyyECWQssAp17huOiKlVSG06T5Mbyy9CwTR6MnzgMlSKzMc9q5yrUdGuyyYmPD7xg
	 mM/w2EwHmqdkgPtD9Q3XzFDbCPhv0dXBTIQD/a0Q=
Date: Mon, 12 Apr 2021 11:34:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v3 0/3] Modify subject description and rectify spelling
 mistake.
Message-ID: <YHQUP/zq1vGwram/@kroah.com>
References: <cover.1618133351.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618133351.git.mitaliborkar810@gmail.com>

On Sun, Apr 11, 2021 at 03:25:05PM +0530, Mitali Borkar wrote:
> This patch fixes style issues

"this" is not a patch :(

And the subject line here also needs fixed up.

thanks,

greg k-h
