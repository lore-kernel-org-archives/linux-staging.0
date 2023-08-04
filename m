Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681CBE6E
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 13:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93E9C433C8;
	Fri,  4 Aug 2023 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691155400;
	bh=mHvtUgTV+sL0E6Wpk6D+SmtTx6hmt2jVkrZBdiW+48A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ab0VHma4hqH9xJgAdStKiDFGpZpwOuCoGXp68Nh/ljiTG4KWscNcsapYA4S6P+1Gz
	 fXI01DrE3SKTudGG7aARlzEXgIPZXygjjLOO4gkyqKvAfGi4vMs8nybQqdf9JaXI1V
	 RR0kVN1lGj5yRAPUcMMyLbcVfLPrnRx6iT3oTVCc=
Date: Fri, 4 Aug 2023 15:23:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v2] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <2023080424-mantra-stagnant-a912@gregkh>
References: <ZMkwA8TnMBAgPRgR@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMkwA8TnMBAgPRgR@alolivei-thinkpadt480s.gru.csb>

On Tue, Aug 01, 2023 at 01:17:07PM -0300, Alexon Oliveira wrote:
> First patch was intended to fix all "CHECK: Alignment should match open parenthesis",
> but added new warnings in the process. This patch is intended to fixed them all,
> on lines 133, 142, 144, 145 and 173.

Patches are stand-alone, we have no idea what "First patch" is.

Please look at the commit log for this file, or for all of
drivers/staging:
	git log drivers/staging/
and get an idea of what changelog text should look like.


thanks,

greg k-h
