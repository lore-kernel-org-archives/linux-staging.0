Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591FE7A;
	Tue,  5 Apr 2022 15:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB01DC385A0;
	Tue,  5 Apr 2022 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649171821;
	bh=Cich/PHVbJy1g1hE9OTZvkfzNrroc5Eii9MGYzlSdHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZbw2bh9MUvLP8PBamL48xqQ7M4cBuV7W4wP62eLOLQscc8DjUWE9F7laPxmuXEC2
	 d4osBx2IPKfWCkjLtwFNEr+5h7TW+Lbi3bajiQd8InKVAYuaf/nHPst2jZRtiWfGFt
	 bJfRaXeg7ye3vzYDPsRmdQ+UTbiOm6PZwy5C1hTc=
Date: Tue, 5 Apr 2022 17:16:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: fix indentation
Message-ID: <YkxdasBGZ3m2Yu66@kroah.com>
References: <20220405150912.GA625670@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405150912.GA625670@euclid>

On Tue, Apr 05, 2022 at 11:09:12AM -0400, Sevinj Aghayeva wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> WARNING: suspect code indent for conditional statements

You are also removing unneeded comments, right?  Please explain that as
the documentation link the bot pointed you to showed.

thanks,

greg k-h
