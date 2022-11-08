Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F208BE7
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 15:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF55FC433D6;
	Tue,  8 Nov 2022 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667921076;
	bh=7Kkj3s9i5Z3CtrQ+nXP5RA1Np+Wvq8MyJU9cemugTEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fD2YSI7O2qwUJGbHPHHSMQHTt5Vpu0qapuUYN/LKnPtQyJL9ECij74X6Os9eTiR1q
	 UXr6EfMwQBZCCLQrDEA8sZ0aWynlowrGffGSdsukC/bSDrckBan6kxYQpBNeKmSOTH
	 ERW+IamIdPYnITLIEnaMq6kopR8poUXpys/A6n9g=
Date: Tue, 8 Nov 2022 16:24:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacob Bai <jacob.bai.au@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] staging: rtl8192e: replace macro defines with
 ARRAY_SIZE
Message-ID: <Y2p0sAPrglrmIAGb@kroah.com>
References: <cover.1667723306.git.jacob.bai.au@gmail.com>
 <13fddf4affd15a58c191be717ddee75772849f4e.1667723306.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13fddf4affd15a58c191be717ddee75772849f4e.1667723306.git.jacob.bai.au@gmail.com>

On Sun, Nov 06, 2022 at 07:31:18PM +1100, Jacob Bai wrote:
> use ARRAY_SIZE() to replace  macro defines

Odd extra " " character here.

Please write better changelog text, this is not very descriptive at all.

thanks,

greg k-h
