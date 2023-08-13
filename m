Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7431FCC
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA074C433C8;
	Sun, 13 Aug 2023 06:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691908205;
	bh=j9TSfaWajljMvQked6TwES+bMYP3ru7cMQypLv6FfF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zUF7en1ZJ3RUk/JqUi3ebekGNDuG6ayQgNC1jbkjyTtsmdk3B0nwUpJHW2bTS4i5i
	 Q0/NkL59TiblYv3MmgAHHrBZRtP8evJdXzCO19YmCP7UzaG+/2itq1kFBnQwaOqc/d
	 FH+RJCSHwZbU9gCUW4r4CmXtBT4S2AtsnSgPfLNY=
Date: Sun, 13 Aug 2023 08:30:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: Nam Cao <namcaov@gmail.com>, philipp.g.hortmann@gmail.com,
	anjan@momi.ca, error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] Staging: rtl8192e: Rename struct rx_ts_record
 references
Message-ID: <2023081310-unearth-buddhist-4caf@gregkh>
References: <20230812201702.83421-1-tdavies@darkphysics.net>
 <ZNf2FJNPF6A4jwcX@nam-dell>
 <ZNgRub125FKvIPXa@basil>
 <ZNggk9M5Xbg27Uq6@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNggk9M5Xbg27Uq6@basil>

On Sat, Aug 12, 2023 at 05:15:15PM -0700, Tree Davies wrote:
> On Sat, Aug 12, 2023 at 04:11:53PM -0700, Tree Davies wrote:
> > On Sat, Aug 12, 2023 at 11:13:56PM +0200, Nam Cao wrote:
> > > On Sat, Aug 12, 2023 at 01:16:46PM -0700, Tree Davies wrote:
> > > > This patch series fixes checkpatch warning Avoid CamelCase, for all references
> > > > of struct rx_ts_record, and renames them to rx_ts for consistency and 
> > > > readability. Each patch renames references for a single function.
> > > > 
> > > > Thank you in advance to the reviewers
> > > > ~ Tree 
> > > > 
> > > > Tree Davies (16):
> > > 
> > > Here it says there are 16 patches, but you have only sent 6 patches. Are some
> > > of them missing?
> > > 
> > > Best regards,
> > > Nam
> > > 
> > Thanks Nam,
> > 
> > Yes they are missing. git send-email errored during submition. 
> > I will resend. 
> > Question: In this case do I need to send it as a v2?
> > 
> > Tree
> > 
> 
> OK, I know what happened. I was rate limited by my email provider.
> I've requested a limit increase.

Your email provider does not allow you to send more than 7 emails at
once?  You might want to switch companies if that's the case.

> I suppose I could break up the patch-set into multiple series and label
> them as series A, B, and C?

No, series are not labeled that way, sorry.

greg k-h
