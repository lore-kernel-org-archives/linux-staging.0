Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C35D532
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 18:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55EFC433EF;
	Tue, 17 Jan 2023 18:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673980800;
	bh=a1MHuq+rXdFJAg8ViD9GH750rnK1Tf4dQGy+Wa8H6Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgIHVbiNlW3pTaDVtilAbjof1JEEGYVZUSegSVnadGlQt1G15QrhVyWwMcyeBlbNf
	 kOkxb9bVvZGG+o6AuogrZfL6Qa2r/Z+pmJqj+MX9qKNdu0GDcFkHItF5y9IIrCSg0C
	 lQZxMrhiMBzhqvH6uMsB7INb1jG7qf/Sakyl5D9A=
Date: Tue, 17 Jan 2023 19:39:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Saurabh Singh Sengar <ssengar@microsoft.com>,
	Praveen Kumar <kumarpraveen@linux.microsoft.com>
Subject: Re: [PATCH] staging: wlan-ng: Remove unused code
Message-ID: <Y8brfTFpeOnPl5S/@kroah.com>
References: <Y73bhE1VwQ5IfFyt@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y73bhE1VwQ5IfFyt@ubun2204.myguest.virtualbox.org>

On Wed, Jan 11, 2023 at 03:11:24AM +0530, Deepak R Varma wrote:
> Several structs are defined but never used. Remove such dead code.

Which structs are not needed?  Be specific here, otherwise it is hard to
find changes in the future.

thanks,

greg k-h
