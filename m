Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEA6D50E;
	Fri, 28 Oct 2022 18:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PWiV8j5n/RdXGJuppn6+le1V0xVgkNZA349ibTs5MvQ=;
  b=nE/yAeICbF56Vj0acAgXSQsqQc/EJrv5ychSxlNWEjnl7FAYBxlyeKiI
   R4j464tWvtg2SC3ayXBhhVf1YPy/BlrMrMaeuoXX2DZ363YxUOfaMv+Pp
   PfgPR7BWBTPYtZ2Yw0OSwS2xKp4e6z4fnxkldSompK8qj33TPbcnHHLQH
   o=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,221,1661810400"; 
   d="scan'208";a="35863678"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 20:39:14 +0200
Date: Fri, 28 Oct 2022 20:39:12 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Emily Peri <eperi1024@gmail.com>
cc: Dan Carpenter <dan.carpenter@oracle.com>, gregkh@linuxfoundation.org, 
    outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace ternary statement with min
 function
In-Reply-To: <Y1wWwZdlXNil/lug@marshmallow>
Message-ID: <alpine.DEB.2.22.394.2210282038450.2987@hadrien>
References: <Y1neXqVYZ8mq8jH+@marshmallow> <Y1oz/w9qfwQ+8gWt@kadam> <Y1wWwZdlXNil/lug@marshmallow>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 28 Oct 2022, Emily Peri wrote:

> On Thu, Oct 27, 2022 at 10:32:15AM +0300, Dan Carpenter wrote:
> > On Wed, Oct 26, 2022 at 06:26:54PM -0700, Emily Peri wrote:
> > > Ternary statements that pick the min of two values can be replaced by
> > > the built-in min() function. This improves readability, since its quicker
> > > to understand min(x, y) than x < y ? x : y. Issue found by coccicheck.
> > >
> > > Signed-off-by: Emily Peri <eperi1024@gmail.com>
> >
> > This breaks the build.  Use min_t(uint, wps_ielen, MAX_WPS_IE_LEN);
> >
> > regards,
> > dan carpenter
>
> Oh! Thanks for the feedback, that makes sense! When you say 'breaks the
> build,' do you mean it didn't compile, or the module didn't load (or
> something else)? I'm trying to figure out what I did wrong when testing
> it.

Normally it means that it didn't compile.  Check that you actually have a
.o file for the affected file.

julia
