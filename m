Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2361CD26A
	for <linux-staging@lists.linux.dev>; Tue, 18 Jun 2024 01:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718673284; cv=none; b=D5U7zluCI6RZnz3HojP2lBPqP9Xy/eGNe0ZVF1C27a5wqN9s589+8fWkZyFGuFRl1n3z8s/fo76VyE2F57rzwQV8dH8JCG02OY359tHn8tpO2coXHampNJzjiwnU04PabxTwNshmO8u/vW4jC902vSwkabdSm5RvJYBqIz0y39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718673284; c=relaxed/simple;
	bh=LpKGdcyMCbqIMJ8dif2EM/QbCokrPjd/dBDjqDCknDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9xDy0RnVfiEQyL1yl+R/k44QY7CNwf2d1Xv2bl2utYM2UC4k8Jf0cEFKy77AcKOnR/AXh53t1XI0gY4wcULGpD6AsAULAOAuKne85Qdbvxidox5vbygiFFpOVrw0RQAfVpnm7mWQcDF0QJFDpaBdBIMrKPrq7qoJaz+AWoBpsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l8LeyYtK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l8LeyYtK"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBBFA7E1;
	Tue, 18 Jun 2024 03:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718673263;
	bh=LpKGdcyMCbqIMJ8dif2EM/QbCokrPjd/dBDjqDCknDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8LeyYtKBybPLH6+86JBl8RIYu4HBnuxcxBYDHtfd+UldnI+JivNZdDwSDHSkv1gV
	 hLqlbOG917G5mXS7eHsdfKXWAIZdIUXA1TducAyIPytn516Mdj/fi5kjH6JNyYoud+
	 F3Itr6rwK6MQHTd4p/Ypx4BtJYxvm9PL/jIRE5oY=
Date: Tue, 18 Jun 2024 04:14:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 07/10] staging: vchiq_arm: Reduce indentation of
 service_callback
Message-ID: <20240618011418.GF21998@pendragon.ideasonboard.com>
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-8-wahrenst@gmx.net>
 <01190bf2-c698-423a-b587-c80ce5d92bb8@moroto.mountain>
 <20240611212347.GG10397@pendragon.ideasonboard.com>
 <eaeb19b0-beff-4931-a6c1-102341ca3999@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eaeb19b0-beff-4931-a6c1-102341ca3999@gmx.net>

On Wed, Jun 12, 2024 at 07:16:16AM +0200, Stefan Wahren wrote:
> Hi,
> 
> Am 11.06.24 um 23:23 schrieb Laurent Pinchart:
> > On Tue, Jun 11, 2024 at 09:04:28AM +0300, Dan Carpenter wrote:
> >> On Mon, Jun 10, 2024 at 11:02:17PM +0200, Stefan Wahren wrote:
> >>> The service_callback has 5 levels of indentation, which makes it
> >>> hard to read. Reduce this by splitting the code in a new function
> >>> service_single_message() as suggested by Laurent Pinchart.
> >>>
> >>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> >> To be honest, I liked the version of this patch which Laurent didn't
> >> like.  Even after pulling this code into a separate function, I'd still
> >> support flipping the conditions around and adding the goto...
> >>
> >> Laurent, you really didn't like the goto?
> > I won't nack it, but I really think gotos seriously hinder readability,
> > with the exception of error paths.
> >
> so at least you both are fine with the split approach here (assuming the
> Dan's comment will be fixed in V3)?

Fine with me.

-- 
Regards,

Laurent Pinchart
