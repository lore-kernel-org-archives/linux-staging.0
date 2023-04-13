Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701DE626
	for <linux-staging@lists.linux.dev>; Thu, 13 Apr 2023 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fNOeiHpE9GuUd/CgeBnmqsgNJaFNj045OFJkweHv/lI=; b=AHZOT0sVyYYUIArFlnDLgxcsfk
	XudFvfVO3XnBIamADUvocCTBqjqZHcLwQK3zYPMZg4Iapi8ekvqZCP6Fl3XujHpDztUV2ExCVEQvF
	8R0hnr2ny5wR7mwiR+dcxy7H6y/Y9tllYfABG5lepEgugV5mGCfDhZTk4R0FbNo8hy3c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pn0cC-00ADL9-3L; Thu, 13 Apr 2023 19:20:08 +0200
Date: Thu, 13 Apr 2023 19:20:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ladislav Michl <oss-lists@triops.cz>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/3] staging: octeon: avoid needless device allocation
Message-ID: <e2f5462d-5573-483c-9428-5f2b052cf939@lunn.ch>
References: <ZDgNexVTEfyGo77d@lenoch>
 <ZDgOLHw1IkmWVU79@lenoch>
 <543bfbb6-af60-4b5d-abf8-0274ab0b713f@lunn.ch>
 <ZDgxPet9RIDC9Oz1@lenoch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDgxPet9RIDC9Oz1@lenoch>

> I was asking this question myself and then came to this:
> Converting driver to phylink makes separating different macs easier as
> this driver is splitted between staging and arch/mips/cavium-octeon/executive/
> However I'll provide changes spotted previously as separate preparational
> patches. Would that work for you?

Is you end goal to get this out of staging? phylib vs phylink is not a
reason to keep it in staging.

It just seems odd to be adding new features to a staging driver. As a
bit of a "carrot and stick" maybe we should say you cannot add new
features until it is ready to move out of staging?

But staging is not my usual domain.

	 Andrew
