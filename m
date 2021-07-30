Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222163481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 13:32:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D78C60F4A;
	Fri, 30 Jul 2021 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627651958;
	bh=//8EMTGFQ3PsCVJ81sYjLhSRQwEHnCX3gMHEDdNpyF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+huX1v/9z7Ir1aZYG0MK+RpWoGVPv3NU1T7RSMq71gSuh9sdV/NuDMiCHUiO9q4d
	 rIL27Y5G2NU6NAaBwiqEhAPi8Z76H1V0bhRs9NMldILzP6/TWwuGqVO7ej/JUbHKns
	 FsLOSOZ31VqJfRS0eXVNfzOVWs1VWxhvYNUk9438=
Date: Fri, 30 Jul 2021 15:32:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.cz>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused BIT macros definitions
Message-ID: <YQP/dFZJiEcOb3yH@kroah.com>
References: <20210730132103.4996-1-fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730132103.4996-1-fabioaiuto83@gmail.com>

On Fri, Jul 30, 2021 at 03:21:03PM +0200, Fabio Aiuto wrote:
> BIT(x) macro used all over the driver is defined in
> include/vsdo/bit.h as
> 
> - #define BIT(nr)	(UL(1) << (nr))
> 
> which is safer than the local BIT macros declared.
> Local macros shift a signed integer which brings
> unespected results. For example:
> 
> (unsigned long)(1 << 31) => 0xffffffff80000000
> 
> shift.c:
> 
> int main() {
>         printf("%lx\n", (unsigned long)(1 << 31));
>         printf("%lx\n", (unsigned long)(1U << 31));
>         return 0;
> }
> ---
> 
> $ ./shift
> ffffffff80000000
> 80000000
> ---

Don't put "---" in a changelog text, otherwise the signed-off-by will be
cut off.  Can you resend it with that changed to something else like
"---------------" or anything else?

thanks,

greg k-h
