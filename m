Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FA410F0
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 05:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3DCC433B5;
	Fri,  2 Sep 2022 05:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662096842;
	bh=lYtl6Ualnpv5CvRP0gN02tu05BtshFAzUAyR5XSZwao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1CWpYcqjahwLYngXg2gbA4YUX2z7WSbjTMb3sYzrjEFW6uuOh7QrW2x8P2U7VPg5
	 VHEiGKOpxNjTQMbsji7XqeDkLQK5g/WwQnhp1bB4RD5FvSXlaDlSfriioRe2xipwXv
	 Ew4xiMp3kLpAp6l6990veb20FV44LAymD++yVFAM=
Date: Fri, 2 Sep 2022 07:33:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: cgel.zte@gmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	straube.linux@gmail.com, martin@kaiser.cx, lu.fengchang@zte.com.cn,
	makvihas@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zeal-Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] Driver: r8188eu: Remove the unneeded result
 variable Return 0 instead of storing it in another redundant variable.
Message-ID: <YxGVxtQgY2vhJBPh@kroah.com>
References: <20220902032628.316333-1-lu.fengchang@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902032628.316333-1-lu.fengchang@zte.com.cn>

On Fri, Sep 02, 2022 at 03:26:28AM +0000, cgel.zte@gmail.com wrote:
> From: lufengchang <lu.fengchang@zte.com.cn>
> 
> Reported-by: Zeal-Robot <zealci@zte.com.cn>

As stated in the past numerous times, I am no longer accepting patches
from this "tool" unless you provide the needed information that I have
asked for.  Please work with your managers to fix up your development
process, this is not acceptable.

greg k-h
