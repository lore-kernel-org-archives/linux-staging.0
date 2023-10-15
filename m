Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB38C1C;
	Sun, 15 Oct 2023 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FmrTE11J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74986C433C7;
	Sun, 15 Oct 2023 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697386312;
	bh=kh47zeV8BevKahv3TvF3zc8GSSoYvtunS04s+XptG+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmrTE11JvzkGEHH8D9HCrXo6+6l4J6TSv61ATDuI2iQ2ggeYFL0+9576JHa698+tf
	 8jimV6zmDDG+Sj8ogQYn0lA8yt6uiRN9WfWbj0SgGO5HnpK0jfuluQcgDX6OfhNDRu
	 FqIE+rcgWmK+A3Lx3pvk+H0hWqPvZPfJY2WrrwNA=
Date: Sun, 15 Oct 2023 18:11:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: wlan-ng: remove helper function
 prism2sta_inf_handover()
Message-ID: <2023101537-repair-natural-3218@gregkh>
References: <ZSkg7y2Y2T3midXB@lab-ubuntu>
 <67d90726-15b9-4d64-87c6-bfbf662cbe81@kadam.mountain>
 <CADFX3ORVXcEBzovdbPawW2SLxcMoraKBmmLuOFkMpnHj=T48qQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADFX3ORVXcEBzovdbPawW2SLxcMoraKBmmLuOFkMpnHj=T48qQ@mail.gmail.com>

On Fri, Oct 13, 2023 at 07:04:56PM +0300, Calvince Otieno wrote:
> On Fri, Oct 13, 2023 at 3:12 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Fri, Oct 13, 2023 at 01:50:23PM +0300, Calvince Otieno wrote:
> > > prism2sta_inf_handover() function basically calls pr_debug() to print
> > > a literal string. This can be done by the parent function directly.
> > >
> > > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > > ---
> > > Patch version v2:
> > >       - Replace pr_debug() utility function with the module specific netdev_dbg()
> >
> > This isn't a v2 patch, right?  This patch assumes that we applied the
> > v1 patch...
> >
> > This patch is not white space damaged though so that's good.
> >
> > regards,
> > dan carpenter
> >
> >
> 
> Hello Dan,
> Does this response mean that the patch was accepted?

No, sorry.
