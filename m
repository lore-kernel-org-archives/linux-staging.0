Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9E2F43
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 13:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C817C433D2;
	Sun,  5 Feb 2023 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675602971;
	bh=GAoViPlV0DElkM/IIZUXBqHgjdhbnm/i6oHg5gCEOBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YujcZpKQMKvRihl79OF1uXyJLnMzVFZgtUc0FK/yGOCIaXSxR7OeYhqptmbpqqzZN
	 wRjw7qBr/1WCsO3xGA8dwJKWsV/kOcNfmg+vY+G02vTNa435Kvuw84D48U2bxCo1HG
	 m6Perjx3BjK0Lalr7g8b9G9I9xyfcS4l9+s1N8+4=
Date: Sun, 5 Feb 2023 14:16:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y9+sFw0rviTAJNMf@kroah.com>
References: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>

On Sun, Feb 05, 2023 at 02:08:02PM +0100, Guru Mehar Rachaputi wrote:
> This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> as '(iobase)' to avoid precedence issues"
> 
> ---
> Changes in v3:
> 	- Whitespace error from checkpatch fixed
> 
> Changes in v2:
> 	- Macros with one statement that is to call 'iowrite8' function changed
> 	to inline function as reviewed by gregkh@linuxfoundation.org.
> 	In relation to this, names of the callers of macro are also modified
> 	to call this function.
> 
> Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>

Try to take this patch and apply it to a tree, and see that everything
below the --- line is thrown away, including your signed-off-by: line :(

