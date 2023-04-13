Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61769626
	for <linux-staging@lists.linux.dev>; Thu, 13 Apr 2023 17:51:25 +0000 (UTC)
Received: from lenoch ([91.218.190.200])
	by cmgsmtp with ESMTPSA
	id n16OpG71YPm6Cn16PpL1GB; Thu, 13 Apr 2023 19:51:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1681408281; bh=+M55RhzimdGlvhG2v0FUhuXlIiFHLzcmsDSW7A4RngA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=CoOtyzT9gLiSw0+G/Jn89SFqwUPRlRDY+ENtSxa0VoCkTYZEXos9P0nPKdAwuqbRd
	 vEnCNMLsgpU6HhG97Jh8v8joj9SL7r3R/tEFpPISCmi6rl5BhlojyB+wngpoIm8eUO
	 4601XTsgqXXNTxe3Yy5OpQLgnslcSONqxqJN3e7LsipRgPEeFxxRcbWoSwin6qnpOx
	 vjttTEqy+wN6S3qHXV/tYmWmn+gWfom21EME6iQ2mMMegxkdhLOG9xzQqQr8813nHb
	 dtE1TLtMVL90fAh/GRvKi9LLBMdZ++a0zitviUn4oyI3bkPxIYk0/SU/ZaS/oRwKbD
	 vZLdbpaJ+bINQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1681408281; bh=+M55RhzimdGlvhG2v0FUhuXlIiFHLzcmsDSW7A4RngA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=CoOtyzT9gLiSw0+G/Jn89SFqwUPRlRDY+ENtSxa0VoCkTYZEXos9P0nPKdAwuqbRd
	 vEnCNMLsgpU6HhG97Jh8v8joj9SL7r3R/tEFpPISCmi6rl5BhlojyB+wngpoIm8eUO
	 4601XTsgqXXNTxe3Yy5OpQLgnslcSONqxqJN3e7LsipRgPEeFxxRcbWoSwin6qnpOx
	 vjttTEqy+wN6S3qHXV/tYmWmn+gWfom21EME6iQ2mMMegxkdhLOG9xzQqQr8813nHb
	 dtE1TLtMVL90fAh/GRvKi9LLBMdZ++a0zitviUn4oyI3bkPxIYk0/SU/ZaS/oRwKbD
	 vZLdbpaJ+bINQ==
Date: Thu, 13 Apr 2023 19:51:19 +0200
From: Ladislav Michl <oss-lists@triops.cz>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/3] staging: octeon: avoid needless device allocation
Message-ID: <ZDhBFzRr7tsCVRPd@lenoch>
References: <ZDgNexVTEfyGo77d@lenoch>
 <ZDgOLHw1IkmWVU79@lenoch>
 <543bfbb6-af60-4b5d-abf8-0274ab0b713f@lunn.ch>
 <ZDgxPet9RIDC9Oz1@lenoch>
 <e2f5462d-5573-483c-9428-5f2b052cf939@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2f5462d-5573-483c-9428-5f2b052cf939@lunn.ch>
X-CMAE-Envelope: MS4wfMaZQ0Ggd85BQYsC1HXf1jU4yQBbbLL+fZtWemE4sg59r/Ene4Xn4kQI24CKD6BmXxfw9P4/tqWd004j97wjGszLQWZEGxY800p5cJ4dnArChc18FMY4
 ncapD+/GhrC3N34NCtNjvaRE4kTss3F5EwBOXGsjm6iXy53D2NQSoGsd+2xb+iu23ki5/HfhZ5/9wkcEfzBBkzseao7aMTC1G4dXcKiNbN3qyjr8WYfogdIU
 2Xx2mFWCyDP/2VUrAJPItGo+59OVcVEhnstaLwKUo9MhTcRFTe2xM/EeSfl926Rbbf6jA0Fj/MJ4GW5w1TCR5Q==

On Thu, Apr 13, 2023 at 07:20:08PM +0200, Andrew Lunn wrote:
> > I was asking this question myself and then came to this:
> > Converting driver to phylink makes separating different macs easier as
> > this driver is splitted between staging and arch/mips/cavium-octeon/executive/
> > However I'll provide changes spotted previously as separate preparational
> > patches. Would that work for you?
> 
> Is you end goal to get this out of staging? phylib vs phylink is not a
> reason to keep it in staging.

I agree. However it is a way to move it out as once phylink_mac_ops
for each mac gets implemented, most code from
arch/mips/cavium-octeon/executive could then be moved into respective
phylink_mac_op, so driver become self contained.

> It just seems odd to be adding new features to a staging driver. As a
> bit of a "carrot and stick" maybe we should say you cannot add new
> features until it is ready to move out of staging?

Ok. I will continue to add cleanup patches before phylink support and
we'll see how far we can get. That oddity has pretty simple reasoning:
mainline kernel should be useable instead of vendor's solution (which
does dirty SFP tricks from userpace and also supports AGL interface
which is missing in staging driver). Without this, it will end as a
spare time activity with a low priority. See this thread for context:
https://lore.kernel.org/linux-mips/Y6rsbaT0l5cNBGbu@lenoch/

> But staging is not my usual domain.

Network drivers are not my usual domain, but I'll try to deal
with that :)

> 	 Andrew

Thanks for the patience,
	ladis
