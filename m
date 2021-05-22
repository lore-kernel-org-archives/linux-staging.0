Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B22FAD
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 09:26:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81EE561090;
	Sat, 22 May 2021 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621675613;
	bh=aQAR0Z09kZdoFhigfeEe2x7py2pznctlRs5s0ni7rNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7GbLNORGpuqK4qWlDz6laompMVTHbiTjvCAe385F5iPeytRPS/trYpp6Qz2UYd8s
	 sqlYRZNXg400R+flvyLeii6CcvdUDTf1faRvrAWZzG1Va+o7Qn2hCen7k+uJ0UevP3
	 K9XUrtA/fiTAecXLpTDlmWTwLw9NO1qvq2ynUGCU=
Date: Sat, 22 May 2021 11:26:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Resend] [PATCH 1/2] [RFC] staging: rtl8723bs: refactor to
 reduce indents
Message-ID: <YKjOWtwarhM99dXc@kroah.com>
References: <20210522092024.65018-1-chouhan.shreyansh630@gmail.com>
 <20210522092024.65018-2-chouhan.shreyansh630@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522092024.65018-2-chouhan.shreyansh630@gmail.com>

On Sat, May 22, 2021 at 02:50:23PM +0530, Shreyansh Chouhan wrote:
> Reduce the number of indents in rtw_wlan_util.c file by refactoring the
> code.
> 
> Moved the part of code that rearranged ac paramaters in the function
> WMMOnAssocResp to a separate function named sort_wmm_ac_params. It takes
> both the array of ac params and their indexes as arguments and sorts them.
> Has return type void.
> 
> Moved the part of code that checked for the realtek vendor in the
> function check_assoc_AP to a separate function named
> get_realtek_assoc_AP_vender. It takes a pointer to struct
> ndis_80211_var_ie as an argument and returns a u32 realtek vendor.
> 
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> ---
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 108 +++++++++---------
>  1 file changed, 56 insertions(+), 52 deletions(-)

Why is [RFC] in the subject line?  Do you not want these merged?

confused,

greg k-h
