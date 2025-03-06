Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC9269AF5
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284296; cv=none; b=ZtRXzVh+iv1VscTz38xDo8ZN/Ih2vszu1TGEWy8u9qsvJjLG5fJbVlFg60mkDpDf8gormlzB4PPA2kHM37m2ZDbMGC5aIj8qXR3jHb8HAGaa+dEWtyW/KdLgz26EbiZKAEULY9Y8Mx9Sysm6NDnfuYLapdZOjHRgDoPNTLiVMKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284296; c=relaxed/simple;
	bh=HnOiXdIEGgi0ajA46Ao4q0OHXUgw4cbdKL3Zt6BVsoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdOLI15+BJkNhopcWYZahL3nrvlR6FLiamKi39OVaHcHK40kZS8rnqG3Yr/RvttBZW3EqJOEVLdEJdZM57QC6wT/OepjuFIb9r2/ndAQxabaS5HRN/Jh7KKvY7x4Rq/zTI1SJeJzVrZOCrNH2nWmGU430IH5C+89XnE04yAB9YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-112-92.bstnma.fios.verizon.net [173.48.112.92])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 526I4Rql015568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 13:04:27 -0500
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 419262E010B; Thu, 06 Mar 2025 13:04:27 -0500 (EST)
Date: Thu, 6 Mar 2025 13:04:27 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Aditya Garg <gargaditya08@live.com>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
        Sven Peter <sven@svenpeter.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
        "ernesto@corellium.com" <ernesto@corellium.com>
Subject: Re: [RFC] apfs: thoughts on upstreaming an out-of-tree module
Message-ID: <20250306180427.GB279274@mit.edu>
References: <rxefeexzo2lol3qph7xo5tgnykp5c6wcepqewrze6cqfk22leu@wwkiu7yzkpvp>
 <d0be518b-3abf-497a-b342-ff862dd985a7@app.fastmail.com>
 <upqd7zp2cwg2nzfuc7spttzf44yr3ylkmti46d5udutme4cpgv@nbi3tpjsbx5e>
 <795A00D4-503C-4DCB-A84F-FACFB28FA159@live.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <795A00D4-503C-4DCB-A84F-FACFB28FA159@live.com>

On Wed, Mar 05, 2025 at 07:23:55AM +0000, Aditya Garg wrote:
> 
> This driver tbh will not ‘really’ be helpful as far as T2 Macs are
> concerned.
> 
> On these Macs, the T2 Security Chip encrypts all the APFS partitions
> on the internal SSD, and the key is in the T2 Chip. Even proprietary
> APFS drivers cannot read these partitions.  I dunno how it works in
> Apple Silicon Macs.

How this workings on Apple Silicon Macs is described in this article:

   https://eclecticlight.co/2022/04/23/explainer-filevault/

It appears such a driver will also be useful if there are external
SSD's using APFS.  (Although I suspect many external SSD's would end
up using some other file system that might be more portable like VFS.)

In terms of making it work with the internal SSD, it sounds like Linux
would need to talk to the secure enclave on the T2 Security Chip and
convince it to upload the encryption key into the hardware in-line
encryption engine.  I don't know if presenting the user's password is
sufficient, or if there is a requirement that the OS prove that it is
"approved" software that was loaded via a certified boot chain, which
various secure enclaves (such as TPM) are wont to do.

	       		      	      - Ted
