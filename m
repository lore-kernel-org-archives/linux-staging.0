Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9B823AD;
	Wed, 22 Mar 2023 09:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516BDC433D2;
	Wed, 22 Mar 2023 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679476140;
	bh=G5b3E38x/jL73QIWqA904ByX2RljZo34BWnDHuIWST4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1OisgQ3kA6KZO2NMncX4J+In0DzpHNsGCPNh8uInjTrCbM6+WJvPdxB+99AZCREW
	 YnldyxxnzkOq8U0coa5vLdhtUOFv6Wugf3lKzUe5TGYzGKJXD7Dft247h52Q2Gx5hc
	 5gpeAWuz84EQaecvfSVanCIiklw+ir/OEoXmZSmk=
Date: Wed, 22 Mar 2023 10:08:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: merge split lines
Message-ID: <ZBrFqtyY/HydnBdT@kroah.com>
References: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>

On Mon, Mar 20, 2023 at 01:26:26PM +0500, Khadija Kamran wrote:
> If condition and spin_unlock_...() call is split into two lines, merge
> them to form a single line.
> 
> Suggested-by: Deepak R Varma drv@mailo.com

You need to properly quote email addresses for our tools to handle them,
put a <> around them like you did here:

> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>

See?

Please fix up and resend.

thanks,

greg k-h
