Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D6173
	for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 06:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DB6C36AE2;
	Tue, 21 Dec 2021 06:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640067638;
	bh=75EcQm5F1ixHXA9iN5o/mzXlI2TASqOMhCOBQksqZgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubWJgiA0CLZZy4zwhAwGeRz1DojRQ9opUodMXkzxq5cm0nP8ELXRrZxcbCHk5Y6ZW
	 LHkuSU9JVT84zjFgQX+WAhksSjlpad5/evKLv4FWrTKJUGfaPEvSM8/wj1M1WI/4OI
	 vptMZ1rTGBLZ/fU3ePZlKQG1hkgp785GkaAQvRIE=
Date: Tue, 21 Dec 2021 07:20:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: linux-staging@lists.linux.dev, nsaenz@kernel.org, f.fainelli@gmail.com,
	rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	juerg.haefliger@canonical.com, rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com, stefan.wahren@i2se.com,
	unixbhaskar@gmail.com, mitaliborkar810@gmail.com,
	phil@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: vc04_services: avoid the use of typedef for
 function pointers
Message-ID: <YcFyNFR66Ii2tos+@kroah.com>
References: <cover.1639858361.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1639858361.git.gascoar@gmail.com>

On Mon, Dec 20, 2021 at 06:29:10PM -0300, Gaston Gonzalez wrote:
> This patch set removes some typedefs for function pointers in vc04_services.
> 
> After patches 01 to 03, there are no remaining typedef under vc04_services.
> Hence, the patch 04/04 updates the TODO file removing the 'remove typedefs'
> task.
> 
> Gaston Gonzalez (4):
>   staging: bcm2835-audio: replace function typedefs with equivalent
>     declaration
>   staging: vc04_services: replace function typedef with equivalent
>     declaration
>   staging: vc04_services: avoid the use of typedef for function pointers
>   staging: vc04_services: update TODO file

These are not the name of the patches that you sent out at all :(

Are you sure you created this properly?

Something went wrong.

greg k-h
