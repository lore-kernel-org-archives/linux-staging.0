Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9172419F
	for <linux-staging@lists.linux.dev>; Tue, 25 Jul 2023 06:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF098C433C8;
	Tue, 25 Jul 2023 06:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690267711;
	bh=Z1ePF1CcJDyjjKIMYcvnDkEkd0VGgmk3MTVBTkyJgKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhHDUFdJT6dxQSxCyXGrk+rUtD6MZqQs8OKcrPdHW0SVOn8MCAOtuLAgayl5arN/r
	 pku7exa9D4AZn1+xWceQpaQsXOzDKU/bZknTGBGty5myf2A1h67vWUITQ+9/PQTlmy
	 tJ4UnwSQTrHYYBwHe3cqTZLwKHrmQqvNIVV2nKsc=
Date: Tue, 25 Jul 2023 08:48:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, anjan@momi.ca, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Staging: rtl8192e: Function name cleanup series 1
Message-ID: <2023072548-unpledged-slacker-90b6@gregkh>
References: <ZL9tmaSHxKh2JCau@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZL9tmaSHxKh2JCau@basil>

On Mon, Jul 24, 2023 at 11:37:13PM -0700, Tree Davies wrote:
> Rename functions to fix checkpatch warning: Avoid CamelCase
> 
> Tree Davies (5):
>   Staging: rtl8192e: Rename function ActivateBAEntry
>   Staging: rtl8192e: Rename function DeActivateBAEntry
>   Staging: rtl8192e: Rename function TxTsDeleteBA
>   Staging: rtl8192e: Rename function RxTsDeleteBA
>   Staging: rtl8192e: Rename function ResetBaEntry
> 
>  drivers/staging/rtl8192e/rtl819x_BAProc.c | 44 +++++++++++------------
>  drivers/staging/rtl8192e/rtl819x_TSProc.c |  6 ++--
>  drivers/staging/rtl8192e/rtllib.h         |  2 +-
>  3 files changed, 26 insertions(+), 26 deletions(-)

Odd, how did you send these patches?  They are not properly "threaded"
or "connected" such that if you look them up on lore.kernel.org, or in
your email client, they show that they should be connected.

Here's what they look like in my inbox right now:


   1   T Jul 24 Tree Davies     (0.6K) [PATCH 0/5] Staging: rtl8192e: Function name cleanup series 1
   2 N T Jul 24 Tree Davies     (1.9K) [PATCH 3/5] Staging: rtl8192e: Rename function TxTsDeleteBA
   3   F Jul 25 To linux-kernel (  29) [PATCH v2] Documentation: embargoed-hardware-issues.rst: add AMD to the list
   4 N T Jul 24 Tree Davies     (2.5K) [PATCH 5/5] Staging: rtl8192e: Rename function ResetBaEntry
   5 N T Jul 24 Tree Davies     (1.8K) [PATCH 4/5] Staging: rtl8192e: Rename function RxTsDeleteBA
   6 N T Jul 24 Tree Davies     (3.1K) [PATCH 2/5] Staging: rtl8192e: Rename function DeActivateBAEntry
   7 N T Jul 24 Tree Davies     (1.7K) [PATCH 1/5] Staging: rtl8192e: Rename function ActivateBAEntry

While if I look at a different recent series sent for staging patches, send
correctly, they look like:

 372   T Jul 22 Franziska Naepe (0.9K) [PATCH 0/9] staging: rtl8723bs: ioctl_linux: Fix checkpatch issues
 373   C Jul 22 Franziska Naepe (0.8K) ├─>[PATCH 9/9] staging: rtl8723bs: ioctl_linux: Fix comparison to false
 374   C Jul 22 Franziska Naepe (7.2K) ├─>[PATCH 8/9] staging: rtl8723bs: ioctl_linux: Add preferred spaces
 375   C Jul 22 Franziska Naepe (2.2K) ├─>[PATCH 7/9] staging: rtl8723bs: ioctl_linux: Fix alignment on open parenthesis
 376   C Jul 22 Franziska Naepe ( 10K) ├─>[PATCH 6/9] staging: rtl8723bs: ioctl_linux: Remove unnecessary parentheses
 377   C Jul 22 Franziska Naepe (5.9K) ├─>[PATCH 5/9] staging: rtl8723bs: ioctl_linux: Remove unnecessary blank lines
 378   C Jul 22 Franziska Naepe (4.1K) ├─>[PATCH 4/9] staging: rtl8723bs: ioctl_linux: Remove multiple blank lines
 379   C Jul 22 Franziska Naepe (1.0K) ├─>[PATCH 3/9] staging: rtl8723bs: ioctl_linux: Fix block comment alignment
 380   C Jul 22 Franziska Naepe (0.9K) ├─>[PATCH 2/9] staging: rtl8723bs: ioctl_linux: Fix code indent
 381   C Jul 22 Franziska Naepe (0.9K) └─>[PATCH 1/9] staging: rtl8723bs: ioctl_linux: Fix else on next line


See the difference with the -> and such?  No other messages in the middle of
the thread, and they are all connected together so that our tools can handle
them as a series, not as individual patches.

If you use 'git send-email' to send the whole back of patches at once, they
will be properly connected together, so I do recommend using that if you are
starting out.

Please fix up and try again, thanks.

greg k-h
