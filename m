Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF114428
	for <linux-staging@lists.linux.dev>; Tue,  9 Aug 2022 15:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6BCC433D6;
	Tue,  9 Aug 2022 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660060714;
	bh=BUuiGJQJ+4x9pC3fv3ORCJp3j2Y5CtBRj3fEisBvXrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AniPZ1ZD62FXbF9VXUeajJeBjY3Q+TbRCekB0EVb2T2r97xBGWVQTUZVITZwEl1vj
	 XyQadcLce/TZsPLpTNnZV20mu0ha7M+EGEyEvY/UYMpUqIwtk7qa9anRpOfGaviduJ
	 b1tGiXdvuN+v3gDiTCbn+SmkE3XofUQXCbuWHPT0=
Date: Tue, 9 Aug 2022 17:58:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Simone Serra <serrazimone@gmail.com>
Cc: fabioaiuto83@gmail.com, soumya.negi97@gmail.com, hdegoede@redhat.com,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixes compilation errors after checkpatch warnings
Message-ID: <YvKEJ+kvcQhRNW7I@kroah.com>
References: <20220809143743.742636-1-serrazimone@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809143743.742636-1-serrazimone@gmail.com>

On Tue, Aug 09, 2022 at 04:37:43PM +0200, Simone Serra wrote:
> This patch fixes compilation errors produced by the previous commit that resolved a number of checkpatch warnings and errors
> 
> Signed-off-by: Simone Serra <serrazimone@gmail.com>

Sorry, but as you have ignored the previous recommendations on how to
correctly submit patches like this, I'm going to have to reject and
ignore this as well.

best of luck,

greg k-h
