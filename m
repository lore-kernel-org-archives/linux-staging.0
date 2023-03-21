Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7BC952;
	Tue, 21 Mar 2023 16:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E4FC433EF;
	Tue, 21 Mar 2023 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679415806;
	bh=uue6qiaQKVY5+wTP4innAWbKfaDTVoOx45k8f62iqtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIS7ALZMfufDYHYMJEOlXVh3eCo81uErof6GPYDZ54jKQsGsn+S/XrML0TzuqYXwz
	 v47Lqx8D1y13G7Ve8t+jcvvskRn0H7KXpji8becld/en3/zOutTkvf++aVamwfHzIp
	 VDoftoyJhMrLKoUFJmrWIixnb5MmkZ8LSYfg6obY=
Date: Tue, 21 Mar 2023 17:23:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix line ending with '('
Message-ID: <ZBnZ+xM0+59Lmvhi@kroah.com>
References: <ZBhNOkQbG4ygNF98@khadija-virtual-machine>
 <ZBnZD5alylOgjhYd@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBnZD5alylOgjhYd@khadija-virtual-machine>

On Tue, Mar 21, 2023 at 09:19:27PM +0500, Khadija Kamran wrote:

<snip>

> Hey Outreachy Mentors,
> 
> Kindly take a look at this patch and let me know if I should wait for
> the response on this patch or submit another patch.

Less than 1 day later?

Please relax and always keep working on new things, don't let my
response time be the gateway for you doing work, otherwise you are not
going to get very much done at all.

You normally have to wait about 2 weeks to get a patch reviewed,
sometimes I go much faster, sometimes slower.  Either way, it's
uncertian...

thanks,

greg k-h
