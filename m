Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039223A1;
	Sun, 16 Oct 2022 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1665936886; bh=k7eZsNlGVlvO2VDbpSBucEFrK36MwH154duVUBvK8x0=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=HQjdOqqeaFuCEca083gHOlSrEW/lyCsdmVL/tgUpcvdPjmv7DVp6i9ChfPMPfPaPU
	 UdNIguLV8k2I+pi9ZiHRaQJP/tTjLURfzVGX2RexDOOmpAjI17T+cS9kDnAw5cHN5k
	 4Gz/VnP2iLIMA8TbTB0hJnjY400B/4F4Pc4GTuK4=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Sun, 16 Oct 2022 18:14:46 +0200 (CEST)
X-EA-Auth: sNU6v2HgPd/0Fcsr21SK5atgGpH3OBohSAR6FjYO9KVWIVf+/Sfsxa0j1XwEmheIBaRPDpjFLRch5JIAFRveCQRtOdm60T8H
Date: Sun, 16 Oct 2022 12:14:42 -0400
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: enclose macro statements in
 do-while loop
Message-ID: <Y0wt8pa0CI+Y9BzR@debian-BULLSEYE-live-builder-AMD64>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
 <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210161649400.2876@hadrien>

On Sun, Oct 16, 2022 at 04:51:09PM +0200, Julia Lawall wrote:
>
>
> On Sun, 16 Oct 2022, Deepak R Varma wrote:
>
> > Include multiple statements of macro definition inside do-while{0} loop
> > to avoid possible partial program execution. Issue reported by
> > checkpatch script:
> >
> > ERROR: Macros with multiple statements should be enclosed in a do - while loop
>
> I don't think this change will compile.  See if you can figure out why
> not.

After trying a direct compile of the loopback.c file, it did not compile. The
kernel build ran did not compile the loopback.c file due to missing
configuration.

About this change, the macro expands to function declarations at compile time
and those can't be enclosed in do/while loop as these are not logical execution
instructions. So it won't compile.

I initially looked for "greybus driver" under the "main menu > drivers >
staging drivers" path, but not find any configurations for the driver. While
retuning back, I found "greybus support" config under "menu-menu > device
drivers" itself. I set it to "M" and build the module. I did not realise that
setting this parameter to "M" actually results in adding several configurations
under "staging drivers" path. I now understand that.

Thank you for your help. I will look for another sensible change and send my new
first patch.

./drv

>
> julia
>
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/greybus/loopback.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > index 1a61fce98056..37214cb43937 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
> >  static DEVICE_ATTR_RO(name##_avg)
> >
> >  #define gb_loopback_stats_attrs(field)				\
> > +do {								\
> >  	gb_loopback_ro_stats_attr(field, min, u);		\
> >  	gb_loopback_ro_stats_attr(field, max, u);		\
> > -	gb_loopback_ro_avg_attr(field)
> > +	gb_loopback_ro_avg_attr(field);				\
> > +} while (0)
> >
> >  #define gb_loopback_attr(field, type)					\
> >  static ssize_t field##_show(struct device *dev,				\
> > --
> > 2.30.2
> >
> >
> >
> >
> >


