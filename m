Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9FD70
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 15:25:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01DD06136E;
	Thu,  1 Apr 2021 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617290750;
	bh=hSu9uPH/Hw+DB94jZx4GKfdEPdzNMr1RIWzL7XlHirQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zO7z16H+9N64eLC2bU+ASReX0/QjnbtEVOy2Yo8uvuMCmm7Kax84+fHsbRPt1enXB
	 Cye2XqDtzeiCzAn5MVf5cpDYxQoV7ayTe4WZzBwpIlBn5Y9Vtb8asIea9xpQ+Ekboa
	 DiLbSwN41mcAozYQpeezOnVy2dtRM7abhcg/L8dc=
Date: Thu, 1 Apr 2021 17:25:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH 0/2] staging: media: omap4iss: Patchsets cleans up in
 iss.c
Message-ID: <YGXl+0iLgnVL2jkt@kroah.com>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>

On Thu, Apr 01, 2021 at 04:07:37PM +0100, Beatriz Martins de Carvalho wrote:
> Clean up checks of "Alignment should match open parenthesis" and 
> "CHECK: Lines should not end with a '('" in iss.c
> 
> Beatriz Martins de Carvalho (2):
>   staging: media: omap4iss: Ending line with argument
>   staging: media: omap4iss: align arguments with open parenthesis
> 
>  drivers/staging/media/omap4iss/iss.c | 48 +++++++++++++---------------

Please read the outreachy introduction email again :(

thanks,

greg k-h
