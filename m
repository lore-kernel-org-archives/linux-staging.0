Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651412C99
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 06:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8FEC53FC1;
	Tue, 30 Nov 2021 06:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638254562;
	bh=XS24QSgj3S1yKkpuEAeM1BU2EG8scdAhuyihTBR3Cqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9o5sIRNQlWv2rjjrrSPuSPh5CrjLruyhkPBnbaPYNnjt5w0a8M1zJtNypl+5ADu6
	 FYq6ytV0jH3Xg38wadRqdB1d3BNrTVMMMwb1PJ/6wB6OxmgUJx+93GlNtqAv/WbIHc
	 yS3WT0y+kvc0l8O0IgQ3vbAaLjij4EUWRN8Go9WY=
Date: Tue, 30 Nov 2021 07:42:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: davidcomponentone@gmail.com
Cc: TheSven73@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yang Guang <yang.guang5@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] staging: replace snprintf with sysfs_emit
Message-ID: <YaXH3oUxMsoJLD65@kroah.com>
References: <21e2111f6c2590ac24ad15d39e87160f9425045b.1638186054.git.yang.guang5@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21e2111f6c2590ac24ad15d39e87160f9425045b.1638186054.git.yang.guang5@zte.com.cn>

On Tue, Nov 30, 2021 at 08:07:21AM +0800, davidcomponentone@gmail.com wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>
> 
> coccinelle report:
> ./drivers/staging/fieldbus/dev_core.c:73:8-16:
> WARNING: use scnprintf or sprintf
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

No, the coccinelle scripts reported this.

> Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>

None of these email addresses match up with the address you sent this
patch from, please fix.

thanks,

greg k-h
