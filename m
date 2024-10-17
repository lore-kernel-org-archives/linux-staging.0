Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3252713AA2A
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729189451; cv=none; b=n0PeaJUKyDZWpKdDcTankB+MoQ2asscZrE68HxWP2Bt4FD9s2310KKZktQPge2iIYoORfKZF+/aOtQuKyZm/unZSOPBFZJ3/EiiZTu/a4F1E9vQFWbScE65sgPjT2lu3A+D+NQRBm4XH7x9rz1mjgWiGVKOP5ZLaYtcI43MwHKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729189451; c=relaxed/simple;
	bh=4T8AfikHkRso+OpAVPwDuBB5OQQ765niWo1KACBHsVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYd5XfFxWJgbWjp3RoxTfBkmupbuxGsdf4RulkeNS4c7nYY6w5+WsOUaHVnhsnUy8qtumMkfcpZjQOcZI/jF58PRnHbvLvYynqVwRjUxjOof40y3Q1Pvl/olWmBzp589lSFM41yRSg1DK+8TuZS2wIrfu3JfYgIbmIJH+NV5hAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CHh5tj7m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CHh5tj7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC20C4CEC3;
	Thu, 17 Oct 2024 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729189450;
	bh=4T8AfikHkRso+OpAVPwDuBB5OQQ765niWo1KACBHsVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHh5tj7mjx9E3tpSf8ajcSrfcjz9uH30crOjFuiUOBK11jkeVl342t2e7uiOGKXOu
	 bu2XYmc6S+sVLFniyI11pKKAsZMArbF3j0yhWOxrwMyX3YsUlR/2G3Xzqj65DY+Unv
	 Lbg7Ucdd5etyoiA3RUPrEbOlgL47WZwPMtrD3lAA=
Date: Thu, 17 Oct 2024 20:24:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: avoid buffer overflow
Message-ID: <2024101756-eldercare-boat-11d9@gregkh>
References: <20241017181435.70D2B18DAF2@bout3.ijzerbout.nl>
 <2024101759-petticoat-prone-52ad@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024101759-petticoat-prone-52ad@gregkh>

On Thu, Oct 17, 2024 at 08:23:25PM +0200, Greg KH wrote:
> On Tue, Oct 15, 2024 at 08:38:13PM +0200, Kees Bakker wrote:
> > The remaining buffer size for snprintf also depends on `pos`.
> > 
> > Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> > ---
> >  drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > index 1da263676f2a..4df1ceaa138f 100644
> > --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > @@ -364,7 +364,7 @@ static void ni_usb_dump_raw_block(const u8 *raw_data, int length)
> >  			pr_info("%s\n", print_buf);
> >  			pos = 0;
> >  		}
> > -		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE, " %02x", raw_data[i]);
> > +		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE - pos, " %02x", raw_data[i]);
> >  	}
> >  	if (pos)
> >  		pr_info("%s\n", print_buf);
> 
> The better thing to do would be to delete this whole function and just
> use the in-kernel hex_dump_to_buffer() function instead, which handles
> all of this logic properly.
> 
> Can you do that instead?

Oops, I mean print_hex_dump().

thanks,

greg k-h
