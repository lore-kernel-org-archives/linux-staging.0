Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16552C80
	for <linux-staging@lists.linux.dev>; Fri,  3 Dec 2021 07:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B43C53FAD;
	Fri,  3 Dec 2021 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638515939;
	bh=QmeH0cSAwndwQ/gNv727qvVaI4uFqZ8k3R0fK10THR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vK9xGNrCTxFIfoi6vCbd+vgK7cJN0ljmTuLpob0DiT8WhC74lwTJacqt/7JJX1OcZ
	 9zPCLIKvy7KcCHXWi6NxkQRAVy6v8OM1b2JJmZ2V7DTGz05MXWjowG5KElg6WxTrVU
	 EsB5hVRl5k97RQ/YtuT8EKD68YjUJD+tBEw4W7L8=
Date: Fri, 3 Dec 2021 08:18:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: davidcomponentone@gmail.com
Cc: TheSven73@gmail.com, dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yang Guang <yang.guang5@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH v3] staging: fieldbus: replace snprintf with sysfs_emit
Message-ID: <YanE3wbiQ3iiEe7s@kroah.com>
References: <36a8d3be94d3575656d08204228eaa921db64c03.1638493815.git.yang.guang5@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36a8d3be94d3575656d08204228eaa921db64c03.1638493815.git.yang.guang5@zte.com.cn>

On Fri, Dec 03, 2021 at 09:17:32AM +0800, davidcomponentone@gmail.com wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>

Does not match the address you send this email from as reported many
times to you.

> 
> coccinelle report:
> ./drivers/staging/fieldbus/dev_core.c:73:8-16:
> WARNING: use scnprintf or sprintf
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

Again, I have commented on the use of this many times already.  I will
not take this change until you at least discuss it with us.

sorry,

greg k-h
