Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EB23217
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 18:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFBCC433EF;
	Thu,  8 Dec 2022 18:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670523606;
	bh=LjIY1Ttg9HywGnlTWGvWTLRjJQbCt+ROrm3V95k0884=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgtKzbMgaYSdreUHxzmktHTUD3qjKxNR1addUi7Gn4pUX+mieKMhhvDROFnlkYLMj
	 Hls58/uCE4lw80zzMVbqeq2rHrAEJho3EWywJMUHsNbs4+JJaz9QmGhFPMKfOOyeXf
	 n04FTSLeMm8nov+WmTfLptbD7EEKpMGa7zoNddS0=
Date: Thu, 8 Dec 2022 19:20:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?6Km55pWs5bmz?= <zoo868e@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/3] staging: vme_user: add the spaces around the "*"
Message-ID: <Y5Iq0vpqw/RzJTob@kroah.com>
References: <20221208140531.3840-1-zoo868e@gmail.com>
 <Y5IKUMH+mq++Kx9s@kroah.com>
 <CAB9pA+-2tZQDXxQ4JPrXb6K0HH=gv_9SAPKp1DSrk_M6OxL06g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB9pA+-2tZQDXxQ4JPrXb6K0HH=gv_9SAPKp1DSrk_M6OxL06g@mail.gmail.com>

On Fri, Dec 09, 2022 at 12:55:41AM +0800, 詹敬平 wrote:
> That's weird. The email send by command 'git send-mail' not appear in my
> '[Gmail]/Sent mail' folder, but the email send by mutt does. Maybe I need
> configure the .gitconfog?
> 
> Here is my .gitconfog
> 
> [user]
> email = zoo868e@gmail.com
> name = Matt Jan
> [core]
> autocrlf = input

No idea, sorry but do realize that when you send email, gmail will not
show mail that you sent, that's a common issue.

Also you just sent this in html format, which is rejected by the mailing
lists :(

thanks,

greg k-h
