Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BD533D9
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 16:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DC4C433D2;
	Sat, 15 Apr 2023 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681574520;
	bh=2lxNx7dI1f2VCmdKpHS7oTJtbs5wANZA9fpjkO9Vgx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0XP0174xStEWXWeFFPe0+WirBJj6nldDTsyDpJPIZ5unZQIOfSQX+eKgWRrgsirW
	 /s73QAKT9u5oPNOuCeaO9Y91ZCGhcR7kjTkU24RGPIqE/QNGKlG0lR5NwwLSM57qOZ
	 1v/xXWwZGtiGQjRYPT3tQCdQJR/ajuNea1Ok/baU=
Date: Sat, 15 Apr 2023 18:01:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: remove typedef declaration
Message-ID: <2023041533-idealness-stand-8909@gregkh>
References: <20230415120141.GA6585@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415120141.GA6585@koolguy>

On Sat, Apr 15, 2023 at 02:01:41PM +0200, Dalvin-Ehinoma Noah Aiguobas wrote:
> Fix checkpatch.pl warning for enums.
> 
> Change typedef cvmx_helper_interface_mode_t to
> enum cvmx_helper_interface_mode in ethernet.c

You did much more than that here in this patch, so obviously we can't
take this as-is, right?

thanks,

greg k-h
