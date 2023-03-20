Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74F1383;
	Mon, 20 Mar 2023 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GBv7ohh4eAd8VZ4Smlvg1i1r1lXvCYRK2nqEANMOmNk=;
  b=igZsDkb1a3gPK3dUvg2b1a69grlfkLqTQJ80JcWVMscQzDUnxVvG0hf7
   8N2mDx6uVcZWKUtLOg2VYevsjRB1D8bvOFZSkuQLS9n8mg7el+aKfac50
   rB3hGltj07KQIwWgb9muDmqcPFeHJVSD3m/DIRl8ZjUrI6yqWey9kgwOQ
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,274,1673910000"; 
   d="scan'208";a="98018589"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 10:07:03 +0100
Date: Mon, 20 Mar 2023 10:07:04 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sumitra Sharma <sumitraartsy@gmail.com>
cc: Dan Carpenter <error27@gmail.com>, Marc Dietrich <marvin24@gmx.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, 
    linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] Staging: nvec: Convert to_nvec_led from a macro to
 an inline function
In-Reply-To: <20230320084422.GA126429@sumitra.com>
Message-ID: <f9274ae0-2279-4a5b-5350-12ea5da3872a@inria.fr>
References: <20230318175250.GA49618@sumitra.com> <417e944c-4653-43ef-b492-c82c536e4d87@kili.mountain> <20230320084422.GA126429@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 20 Mar 2023, Sumitra Sharma wrote:

> On Mon, Mar 20, 2023 at 08:39:49AM +0300, Dan Carpenter wrote:
> > On Sat, Mar 18, 2023 at 10:52:50AM -0700, Sumitra Sharma wrote:
> > > Convert to_nvec_led from a macro to a static inline function, to make the
> > > relevant types apparent in the definition and to benefit from the type
> > > checking performed by the compiler at call sites.
> > >
> > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > > ---
> >
> > You need to compile test your changes.
> >
>
> Hi dan,
>
> I am facing problems in creating modules and in compiling them.

Note that unless the code is under an ifdef for a module, you don't
specifically need the driver to be configured as for a module either.
Since you don't have the device, you aren't going to be able to test it
anyway.  So 'y' is fine.

julia

>
> Any help in this would be appreciated. Here is the link to the thread https://lore.kernel.org/outreachy/alpine.DEB.2.22.394.2303191336090.2867@hadrien/T/#t
>
> Regards,
>
> Sumitra
>
> > regards,
> > dan carpenter
> >
>
>
