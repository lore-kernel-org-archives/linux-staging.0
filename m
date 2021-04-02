Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091DA70
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 13:04:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F18FB61152;
	Fri,  2 Apr 2021 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617368645;
	bh=uTN7GP5Y8DqpShutxxOZR+o6yoQl//v/6cvvpP11nVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuV6IrYg5owX37hvdQ3GDhli6J7grV8XxceW0qLbZNTUg+/u8NZIwSSwacl3qPLQ3
	 zLUR9Zs1xeopBv9IW9LGAV8L74VKugKQWoIxBFpG4pqPxqye/g2CSnZJlxn0twTMnk
	 DD/pKdTaCPk6nnvb7gGmON8Vqfo2zEq9DTdjktOI=
Date: Fri, 2 Apr 2021 15:04:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ivan Safonov <insafonov@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Michael Straube <straube.linux@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peilin Ye <yepeilin.cs@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging:r8188eu: refactor OnAction(): use switch
 instead table lookup
Message-ID: <YGcWQrFMWhx6Zb8T@kroah.com>
References: <20210328163323.53163-1-insafonov@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328163323.53163-1-insafonov@gmail.com>

On Sun, Mar 28, 2021 at 07:33:23PM +0300, Ivan Safonov wrote:
> The switch is easier to read and refactor.

Your subject line is incorrect :(

