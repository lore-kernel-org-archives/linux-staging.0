Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F247A
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 06:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C70C385A4;
	Fri, 22 Apr 2022 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650607826;
	bh=9TNW3wYfSuM9PlmQpT0Zdgu2dFVulayRiQeg+hNcdms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/M/Zm/veiGwzAWnsYAbWZ3EsXL+XD8/eHzt08OYdJD29uDbKhsYtw+nFcn1MEwcI
	 b1gB7rkoz2VswVmnSSnxucsw/DrmoZXjxDvFdTmjNOejpfsCMyULCaPwAAhsE9vUuk
	 lCeX8xp9FxfYDOxIDW902QAVIHTwnPo+ucxrHk3o=
Date: Fri, 22 Apr 2022 08:10:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vihas Makwana <makvihas@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v2 0/7] drop some unnecessary wrappers
Message-ID: <YmJGzwA0kD+lFtfN@kroah.com>
References: <20220411102136.14937-1-makvihas@gmail.com>
 <3484215.R56niFO833@leap>
 <20220412151529.GF3293@kadam>
 <3134226.AJdgDx1Vlc@leap>
 <20220413054252.GR12805@kadam>
 <CAH1kMwT0gyQNB1-j62-2ntJD9Lobsmr8-5h6n6-SJ44wykMyHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH1kMwT0gyQNB1-j62-2ntJD9Lobsmr8-5h6n6-SJ44wykMyHQ@mail.gmail.com>

On Fri, Apr 22, 2022 at 12:26:21AM +0530, Vihas Makwana wrote:
> Did this patch series get lost?

What series?  (hint, do not top post).

My queue of staging patches was empty as of a few days ago (it's filled
up since then), so if they were not applied, please resend.

thanks,

greg k-h
