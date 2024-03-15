Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478811B270
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500408; cv=none; b=af+b1CGjlPkjG7fWma0YiuwKX6HZBsN3U857kwdYZuMN76nJQauhR9UcdOCne1pw83R+dzwJYuZo6bEMEl9e/Ih7F+5YPf3Cj7G/tsr4kG0g93IxEy29rSDMI4X18cvqqyqtVy9+Kv3pM1S18awoMMn/zwW0i7YJPnc+uP3vDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500408; c=relaxed/simple;
	bh=QEUtsoXiEhtfzW53mQ1aBpkudskXqRsLdUh6VeNq1Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEUECGwpWYIcAEpnGAu17OIzXN++bBwtgdsANWUEjw+xmzzVrjbU9NehVvPLV3d5UqLehN9f8kanY7wdNp/RtMLtNrJY9cLZfjR8ce4/IzU93TOq1nbrsBqnJNr9F7CyXJov2LbEIA6O+ozxT0KLJaidB7W6m7JL8LaLjOG0Pzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QslX1y09; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QslX1y09"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09378B3;
	Fri, 15 Mar 2024 11:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710500381;
	bh=QEUtsoXiEhtfzW53mQ1aBpkudskXqRsLdUh6VeNq1Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QslX1y09LGFkeOa37z8z5vO3oLu8QCxCIHcJDgfDZ2xXnQ5S3a1m+trfJgtctZjac
	 Z8K/XaamP3qmsQBi3yKcOor4o/GuO6JsoBC5nKIUcN29+OxLfPEa/85vDBH/CHVbnC
	 CMs1q4a4CGpnAOgDkXVxfsaI+njA6c1NlrWUR8Tk=
Date: Fri, 15 Mar 2024 13:00:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>
Subject: Re: [PATCH 1/5] staging: vc04_services: Remove unused function
 declarations
Message-ID: <20240315110003.GH2441@pendragon.ideasonboard.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com>
 <20240315105659.111544-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240315105659.111544-2-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Fri, Mar 15, 2024 at 04:26:55PM +0530, Umang Jain wrote:
> vchiq_loud_error-* are unused hence, remove their declarations.

I'd write "not implemented" instead of "unused".

> This seem to be remnants of custom logging helpers which were
> removed earlier.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h  | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index c8527551b58c..5fbf173d9c56 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -470,12 +470,6 @@ vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *
>  extern void
>  vchiq_dump_state(struct seq_file *f, struct vchiq_state *state);
>  
> -extern void
> -vchiq_loud_error_header(void);
> -
> -extern void
> -vchiq_loud_error_footer(void);
> -
>  extern void
>  request_poll(struct vchiq_state *state, struct vchiq_service *service,
>  	     int poll_type);

-- 
Regards,

Laurent Pinchart
