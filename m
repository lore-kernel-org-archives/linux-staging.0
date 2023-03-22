Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C5F23AD
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 09:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39D7C433EF;
	Wed, 22 Mar 2023 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679476508;
	bh=D8DRK+QZE59dhFQsf9xzQhrYLsVzAAAWenD0VA+bkEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8ixtqtdTFeK0aVNTLd3B0RRs7Jm8MCJUWaI2ZxnyaAo/aPNGWKT7jxfv4F2ej3wt
	 mTUNQRMY9c1W4+AQEMuFtxUf/7/4vrHSVI3sNzu27COv+XYho6wiDIoBa+eG3PfxBR
	 XWLPAOTNYUjRnVyGADJWOExrCZPo14oedpZ5qAQg=
Date: Wed, 22 Mar 2023 10:15:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] staging: rtl8192e: Remove unused macro
 queue_delayed_work_rsl and queu..
Message-ID: <ZBrHGTQakbMDbAX8@kroah.com>
References: <cover.1679077522.git.philipp.g.hortmann@gmail.com>
 <4f08897d188c61fc2e611afbf9f2de2ba18cffef.1679077522.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f08897d188c61fc2e611afbf9f2de2ba18cffef.1679077522.git.philipp.g.hortmann@gmail.com>

On Fri, Mar 17, 2023 at 08:13:32PM +0100, Philipp Hortmann wrote:
> Remove unused macro queue_delayed_work_rsl and queue_work_rsl.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Your subject line here looks odd, with the abbreviation.  Same for the
other commits in this series, please spell the last word out, it's fine
to be a little bit longer to make things more obvious what is going on
(i.e. I have no idea what "f." is in a subject line...)

thanks,

greg k-h
