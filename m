Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759CC110C
	for <linux-staging@lists.linux.dev>; Tue, 16 Aug 2022 13:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77D1C433D6;
	Tue, 16 Aug 2022 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660656293;
	bh=HnM4pxjUtPvA70Cr3g+ceoTLOVrmwq33Kb8C1Uf60yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v/O+UdqMxG9H1YcwcqpB7mBuCSekiVH+WxSptSakOuDh4LLm3Yg4kwZxS7NGO1Ib5
	 mq+nDPAOhPrTqY/fOujjuaa6qqokG3Ksyedgq6ue3P1IPu2qz7K7r4ak0QEMBd0l0J
	 T5QBclds4ZRmb3koC6lEvWzzHUsuOHz2re7taFbk=
Date: Tue, 16 Aug 2022 15:24:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: r8188eu: Add Rosewill USB-N150 Nano to
 device tables
Message-ID: <Yvuaor2ppSiG9Sao@kroah.com>
References: <20220814175027.2689-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814175027.2689-1-Larry.Finger@lwfinger.net>

On Sun, Aug 14, 2022 at 12:50:27PM -0500, Larry Finger wrote:
> This device is reported as using the RTL8188EUS chip.
> 
> It has the improbable USB ID of 0bda:ffef, which normally would belong
> to Realtek, but this ID works for the reporter.
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 1 +
>  1 file changed, 1 insertion(+)

Where is patch 2/2?

thanks,

greg k-h
