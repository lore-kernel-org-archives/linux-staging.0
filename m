Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEBE7B;
	Thu, 20 Oct 2022 12:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BD5C433D6;
	Thu, 20 Oct 2022 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666267819;
	bh=GSMUH/eKqQMbqK1l7nYp1UCGLQtEoTNiAh7Rlt1uY9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5A1jK4BQ42KagOR/wKCbGOQlubNCVinPE6Za8e4Bw3EN2DiPX+hcwycpArEZOaZ9
	 Fz/PJuEp+b1hq2oi4E1LyAdnZVca234Daq2g5oiyEUkx3K9rnf6xESVp+0NP3fy28V
	 L8Y9Uky6xYlkePWpxBPY4E6wFZwdaVxp0kSxlM2k=
Date: Thu, 20 Oct 2022 14:10:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanju Brunostar <tanjubrunostar0@gmail.com>
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: Request for assistance
Message-ID: <Y1E6qYkzkRxlloNp@kroah.com>
References: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <CAOkYk0iU0B98JsH77avky--AS19V=GhQox2f_b4PAG3ZBB+SVQ@mail.gmail.com>
 <CAHJEyKX=yyuyYFajs880CuPdc019dBOm_LCkgXHzjFaA-Jgt2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHJEyKX=yyuyYFajs880CuPdc019dBOm_LCkgXHzjFaA-Jgt2A@mail.gmail.com>

On Thu, Oct 20, 2022 at 12:34:02PM +0100, Tanju Brunostar wrote:
> On Thu, Oct 20, 2022 at 12:27 PM Bhaskar Chowdhury
> <unixbhaskar@gmail.com> wrote:
> >
> > Use forward slash at the end every single chunk or piece of that line.
> >
> > Example :
> >
> > Veryyyyyyylooooooong. Linerrrrrrrrrrrrrrr
> >
> > Veryyyyyyyyyyyyy /
> >
> > Looooonggggggggg /
> >
> >
> > Linerrrrrrrrrrr /

No, please do not do that in normal C code.  That's only for rare cases,
like in a #define, that this style would be needed.

thanks,

greg k-h
