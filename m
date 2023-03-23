Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3052A93A;
	Thu, 23 Mar 2023 15:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F454C4339E;
	Thu, 23 Mar 2023 15:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679583853;
	bh=dLFf4T6HvZ08GrQjZsEXffYgZBZrQ3VXEINg99DXYIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PS+eRgyatl5AIbGikoplQ7sIVJyxupc3wThHNhcACIqu0s/x6u8P0vOnZxX1Z6WGQ
	 Mku8F8RpfXLc4iwOHreWxZBJMpBRG0CW3T3d3QHl4afbj0xJ3kJ03RS+g78ZPJezdY
	 3KV5fi6IuhPELsMBAO9dSdo9g+x2ZNMg1TX5oK3A=
Date: Thu, 23 Mar 2023 16:04:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] staging: most: fix line ending with '(' in dim2
Message-ID: <ZBxqapCbi8shWUyL@kroah.com>
References: <ZBxLT4w0cKZ/aOZo@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxLT4w0cKZ/aOZo@khadija-virtual-machine>

On Thu, Mar 23, 2023 at 05:51:27PM +0500, Khadija Kamran wrote:
> Splitting function header to multiple lines because of 80 characters per
> line limit, results in ending the function call line with '('.
> This leads to CHECK reported by checkpatch.pl
> 
> Move the function parameters right after the '(' in the function call
> line. Align the rest of the parameters to the opening parenthesis.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/most/dim2/hal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Why is this a RESEND?
