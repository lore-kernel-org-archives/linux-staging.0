Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA847B;
	Fri, 28 Oct 2022 06:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92064C433B5;
	Fri, 28 Oct 2022 06:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666938455;
	bh=rJJMlMZr+oaSjhuIxJDzTGpBIT5j3UlrV9qsu3WYFng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RL3iN8qOQNP9i5i8nLxebxHpWygeiKgwDrhx/S0vR1LhILrl2JWx1j7qFsUE2Y/ga
	 UhrxYPraVjcPHmjNsaf0zdTqpLbZw54N3RsghNIm942NbBJLuZo3KlnwOyLqJ5XOqg
	 iZR20sxsg7YI8A4qYNoiwCxPH7bVsGDVCuzEC21E=
Date: Fri, 28 Oct 2022 08:28:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: jovial umwari <umwarijovial@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] WARNING: Possible repeated word: 'very'
Message-ID: <Y1t2jffoLPxdOqJ3@kroah.com>
References: <20221028051420.GA30073@rdm>
 <Y1tx8XjmR5QKV9lQ@kroah.com>
 <CAMk1CBOdgwnt3E7ByZMASv+O1WAmgKvsvMv5Gy9UNgg=kMBRJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMk1CBOdgwnt3E7ByZMASv+O1WAmgKvsvMv5Gy9UNgg=kMBRJQ@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Fri, Oct 28, 2022 at 09:13:14AM +0300, jovial umwari wrote:
> Thank you
> working on it now
> 
> Best Regards
> Umwari Jovial

As you spell your name this way in emails, please use the same format
for your signed-off-by lines in your patches.

thanks,

greg k-h
