Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3A31B73
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 15:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E078C340E9;
	Mon, 14 Mar 2022 15:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647270225;
	bh=TOCa2Y+srhzXpGyLE0cjs/+WyeybMthKurMeliCpKbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFb+nfJccPcZTK+rrovHHIol8KNikO/3HCWQPdrIy54REM/I9aeoI3ppdx3BVrYDP
	 JfLsuKNNziHrIm9ajtjN0XoIBgoGmBPDvMeiKS3q/srl1ny0LJlnJSTHe7r6x+Ameq
	 ipyW/YkV2OUq17PtPpZatHzddaMHMpMv/Oaipkn8=
Date: Mon, 14 Mar 2022 16:03:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Song Chen <chensong_2000@189.cn>
Cc: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	elder@ieee.org
Subject: Re: [PATCH v4] staging: greybus: introduce pwm_ops::apply
Message-ID: <Yi9ZTdcZsdDjecC3@kroah.com>
References: <1646791174-30557-1-git-send-email-chensong_2000@189.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646791174-30557-1-git-send-email-chensong_2000@189.cn>

On Wed, Mar 09, 2022 at 09:59:34AM +0800, Song Chen wrote:
> Introduce newer .apply function in pwm_ops to
> replace legacy operations,like enable, disable,
> config and set_polarity.

You can use the full 72 columns please.

> This guarantees atomic changes of the pwm
> controller configuration and also reduces the
> size of the driver.

The driver is bigger (more lines) with this change, so why do you say it
is smaller?

thanks,

greg k-h
