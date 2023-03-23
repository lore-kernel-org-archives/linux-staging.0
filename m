Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75117FA;
	Thu, 23 Mar 2023 04:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B259DC433D2;
	Thu, 23 Mar 2023 04:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679547202;
	bh=uzFB9x1Hyc+9dE/aF2h2WsJuyCGoBehuwnjCIfIgx9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJH1K80Ut1jTFOeSeJ0oczI8vlBDCcDlz733wVGgqktOQpPcvaiz8r2ACB6i+CLuR
	 B4uHzC9C6OEBiicvIQj8lVg1/OyXjbRKTRFqA+613Dw4PRwe+9olkSAp65nOAYD/nv
	 r4R3lV4RYgvPOERBee8IfTOsnUlON7hI+p9T4Zh0=
Date: Thu, 23 Mar 2023 05:53:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: fix line ending with '('
Message-ID: <ZBvbP8ugDFjSoVp/@kroah.com>
References: <ZBsSOlPbaGZcAaSY@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBsSOlPbaGZcAaSY@khadija-virtual-machine>

On Wed, Mar 22, 2023 at 07:35:38PM +0500, Khadija Kamran wrote:
> Splitting function header to multiple lines because of 80 characters per
> line limit, results in ending the function call line with '('.
> This leads to CHECK reported by checkpatch.pl
> 
> Move the first parameter right after the '(' in the function call line.
> Align the rest of the parameters to the opening parenthesis.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/most/dim2/hal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

You have 2 patches here with identical subject lines, yet they do
different things :(

I've dropped all of your pending patches now for the most driver as I'm
totally confused.  Please resend them all as a proper patch series with
updated subject lines.

thanks,

greg k-h
