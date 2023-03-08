Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35079DA
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 16:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA810C4339B;
	Wed,  8 Mar 2023 16:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678291337;
	bh=fhveztIW2Scf9hHcIk/TT/UvSVnPAoZ6RauSy71m6fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vjDb7jsGDlF1i/Qn1FJ49JfIoWh6LIW5eiGSa7YmLLjkl0zhGorheuT3kpazsBlJb
	 07FVqLFOJkLWk6MfgR5BZrFo0NIu/qr+glkfck84RUI7RIqdKcOZVYPus1QyRVO5rr
	 tYlrpp3oRACc1FMzd9CkQdQVIAY6qvoC/Vu3WPlY=
Date: Wed, 8 Mar 2023 17:02:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shibo Li <zzutcyha@163.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8712: Fix some alignment matching open
 parenthesis issue
Message-ID: <ZAixhhkuQVeCIqJ2@kroah.com>
References: <20230226122820.194074-1-zzutcyha@163.com>
 <20230302050502.52356-1-zzutcyha@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302050502.52356-1-zzutcyha@163.com>

On Thu, Mar 02, 2023 at 05:05:02AM +0000, Shibo Li wrote:
> This patch fixes some alignment matching open parenthesis issue.
> 
> Signed-off-by: Shibo Li <zzutcyha@163.com>
> ---
> Changes since v2:
>  - Undo and fix some bracket misalignment issues.
> 
> Changes since v1:
>  - Fix some irregular indentation issues.
> ---
>  drivers/staging/rtl8712/rtl871x_mlme.c | 150 +++++++++++++------------
>  1 file changed, 76 insertions(+), 74 deletions(-)

Does not apply to my tree :(
