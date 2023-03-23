Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CEEA93A;
	Thu, 23 Mar 2023 15:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62D2C433EF;
	Thu, 23 Mar 2023 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679583861;
	bh=WAcjZojhhSuQUCzIIJ3hb3ljjDgbnopqWnjYc0qdEH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9X0mulMB60vHScvVYPKS7jOMrD2c64JL/ug6hCmrR5G4pQLoIPxFqws9brvl3TeO
	 lnBaRFOKdYX3QtSUjkk6tuyR77IZlR/0/tkBltWnPrN0W+GVFe9SvK8FjuHeuVWL+6
	 I69ikSm6TC6Cr3M/oxl4sHlKVrxFGju6k3GjTebU=
Date: Thu, 23 Mar 2023 16:04:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] staging: most: fix line ending with '(' in video
Message-ID: <ZBxqcgj9U9tAnlIa@kroah.com>
References: <ZBxL/yqLU1dEQlta@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxL/yqLU1dEQlta@khadija-virtual-machine>

On Thu, Mar 23, 2023 at 05:54:23PM +0500, Khadija Kamran wrote:
> Splitting function header to multiple lines because of 80 characters per
> line limit, results in ending the function call line with '('.
> This leads to CHECK reported by checkpatch.pl
> 
> Move the function parameters right after the '(' in the function call
> line.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Why is this a RESEND?
