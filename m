Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC08BE1;
	Tue,  8 Nov 2022 15:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAA1C433C1;
	Tue,  8 Nov 2022 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667920460;
	bh=UwGvGkskwck3rVTxWfnG1rG6Cix751U5AsQ6BVkQU8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L5N6NfxRtdPv3FT7DDBTuv8QquDWbDARFSRmIrIYeS6mksdEoDT7sT09fqlAXnA53
	 aKjnyO7pfTQYBJzeQvnIJYL5KfTn5nHV0VSRS532/51r3fvb9b8eQj+h69Kzs/WH9h
	 7tp+m3UJhtl/jgN52iqjYjSMm6gSSl6KjLPJdgag=
Date: Tue, 8 Nov 2022 16:14:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: rtl8192u: unused code cleanup
Message-ID: <Y2pySMu0kBgh3xFh@kroah.com>
References: <cover.1667398621.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667398621.git.drv@mailo.com>

On Wed, Nov 02, 2022 at 08:07:52PM +0530, Deepak R Varma wrote:
> Remove unnecessary or unused code.
> 
> Changes in v3:
>    Patch-1:
>       1. Already accepted and applied to the stating-testing tree. Hence not
>          included in this patch set now.
>    Patch-2:
>       1. The patch caused staging tree build to fail due to EXPORT_SYMBOL
>          conflict. Fixed the issue caused due to deletion of 2 macros.
>          Correction and re-submission asked by gregkh@linuxfoundation.org

But now this patch set looks like it is missing a patch, which confuses
everything.

Please just send a new patch, v4, 1/1, and all will be better.

thanks,

greg k-h
