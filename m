Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D395129CA
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 14:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA240C36AE7;
	Mon, 27 Dec 2021 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640616326;
	bh=D2NoGDaN6evIIcU0Jn7b6sazFlijN8oWpKx4uhS4VIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCZ7q1LKsSY6Dy/L/Uoo2SIgLSJQtwxlDSYIYJAafsyrrCRNHm5Forh7Fz9lOMoiM
	 KoCgb6vJ/WFZ5DZxQ0AC4mnjUjpL+/OJZOE/9Q+aCNXCrrFHxID+lLUd23xrOPHgyI
	 hle5y8jOLFyEjSOudI/kndaMsZPYs4t+QS/gvxis=
Date: Mon, 27 Dec 2021 15:45:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Slade Watkins <slade@sladewatkins.com>
Cc: Adam Kandur <sys.arch.adam@gmail.com>, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] qlge: rewrite qlge_change_rx_buffers()
Message-ID: <YcnRg9AYfSgC1pBE@kroah.com>
References: <CAE28pkNNsUnp4UiaKX-OjAQHPGjSNY6+hn-oK39m8w=ybXSO6Q@mail.gmail.com>
 <YcnA8LBwH1X/xqKt@kroah.com>
 <152c8d76-af2b-2ea3-4f15-faf2670d8e73@sladewatkins.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152c8d76-af2b-2ea3-4f15-faf2670d8e73@sladewatkins.com>

On Mon, Dec 27, 2021 at 09:15:36AM -0500, Slade Watkins wrote:
> --
> This email message may contain sensitive or otherwise confidential
> information and is intended for the addressee(s) only. If you believe
> to have received this message in error, please let the sender know
> *immediately* and delete the message. Thank you for your cooperation!
> 

Now deleted.
