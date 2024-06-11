Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBB7101E2
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718141049; cv=none; b=gwtm7qy4QO9DTHqbRV39ZrUnnPiP8MlGHCdg9D7S+4g+OepYQscPV6UeeiAy4AvsEk+0d5Vh1W0GF8m/d+92Bz+dccbrlzTQSU8t1+nJXZ7Zp4tvLxtmPU1c5KzqBHLcMj3Ow4wkyW816AZKkhd6/G8Xz55KtMo5zm9D3oa4q+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718141049; c=relaxed/simple;
	bh=lu7lClR9KWRTI2nX+R6kZClhinE3tAQOfyYA/krpgeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnShaGWwB/gDcBnqEc5oIn63OdWCFiGGIAqRN57z1LlPqxEuL56SHjYQAcgCqQbHr/eNSZY+AoPHLDmXjtYgoMbjX/4ZJaASJ0B+y+q0k8mxsR9shpev6R1o6BSLbdW2jWuOTqUI/tMxe6H28ThxEJFNVEuv3NyAgIDIu2DMPQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p0NG1hjh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p0NG1hjh"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B388512;
	Tue, 11 Jun 2024 23:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718141034;
	bh=lu7lClR9KWRTI2nX+R6kZClhinE3tAQOfyYA/krpgeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0NG1hjhn9fzYGOSIIV7y8bu/ypesq6oP8OQRAV2lHOVTEpdybfjQ8Rto6dnOThY9
	 ROdjY+E8TIZ0Du+39WLtcJyaXDH3VUnTl/v3mQzwVDHIvxDUESX8ee7anOMywRC/YE
	 YObsf+ejpWok04H0MrtTtZ0GyDv8lQMipOxgokA0=
Date: Wed, 12 Jun 2024 00:23:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 07/10] staging: vchiq_arm: Reduce indentation of
 service_callback
Message-ID: <20240611212347.GG10397@pendragon.ideasonboard.com>
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-8-wahrenst@gmx.net>
 <01190bf2-c698-423a-b587-c80ce5d92bb8@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01190bf2-c698-423a-b587-c80ce5d92bb8@moroto.mountain>

On Tue, Jun 11, 2024 at 09:04:28AM +0300, Dan Carpenter wrote:
> On Mon, Jun 10, 2024 at 11:02:17PM +0200, Stefan Wahren wrote:
> > The service_callback has 5 levels of indentation, which makes it
> > hard to read. Reduce this by splitting the code in a new function
> > service_single_message() as suggested by Laurent Pinchart.
> > 
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> 
> To be honest, I liked the version of this patch which Laurent didn't
> like.  Even after pulling this code into a separate function, I'd still
> support flipping the conditions around and adding the goto...
> 
> Laurent, you really didn't like the goto?

I won't nack it, but I really think gotos seriously hinder readability,
with the exception of error paths.

-- 
Regards,

Laurent Pinchart
