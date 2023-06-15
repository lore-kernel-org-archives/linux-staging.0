Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9561625
	for <linux-staging@lists.linux.dev>; Thu, 15 Jun 2023 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A471C433C0;
	Thu, 15 Jun 2023 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686825322;
	bh=shIlOxwxvaQGKkHw6CsO21QcNEeP8WomegofO5hSK+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cII6FzgK7l0z612WVICkr0VTo0nP1XCcILvmoYIG93L5QUm0AdsFDCH/WbFJ5R2HM
	 gBD+OAq7zrOreHqj8saZrHH6/+DOqll8DN+PH5FK/lAurRAg5jxlOwuM5KJ56yIQBq
	 iWvoZD2H66d2wpMfSDWB6F6RHZoRljOuqhEUdXKY=
Date: Thu, 15 Jun 2023 12:35:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neel Chakraborty <neelchakrabortykernelwork@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 001/001] drivers/staging/vme_user/vme.c: Fixed alignment
 issues
Message-ID: <2023061555-posting-purple-9cfc@gregkh>
References: <20230606112321.1022783-1-neelchakrabortykernelwork@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606112321.1022783-1-neelchakrabortykernelwork@gmail.com>

On Tue, Jun 06, 2023 at 04:53:22PM +0530, Neel Chakraborty wrote:
> Made alignment match open parenthesis.

Your subject says "issues" yet you only changed one thing here.  Please
be more specific and fix this up.

thanks,

greg k-h
