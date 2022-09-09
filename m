Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E277D6105
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 18:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D705C433C1;
	Fri,  9 Sep 2022 18:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662746701;
	bh=SB63vNAL1R+g9tvTeeCGDa8vFYw6y1aMYgFf40E1evM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1LOuixCywhgUGLndynYxke7ydlHUD+38eMsaqzYoULbCRU6P38Tq8W87wJoNMqjn
	 EPr3CTug7D53WmZ/yN7cJiwgPw6xFh75xqb1dsqMWQwJN/1F4nqjFci402Ogagv0ib
	 2jLfRRd+8fo1QvAVscOX4AXphvXcMOxk+aVzoh04=
Date: Fri, 9 Sep 2022 20:04:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Burak Ozdemir <bozdemir@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: Fix string form declaration
Message-ID: <YxuASm/KA6iFrKu4@kroah.com>
References: <631b5aa8.170a0220.9378b.124a@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <631b5aa8.170a0220.9378b.124a@mx.google.com>

On Fri, Sep 09, 2022 at 06:24:13PM +0000, Burak Ozdemir wrote:
> From: Burak Ozdemir <bozdemir@gmail.com>
> 
> Use correct string form declaration, prevent extra variable
> declaration in final assembly output.

I am sorry, but I do not understand this text.  How is the original code
incorrect?

Please explain this a lot better when you resend a v2.

thanks,

greg k-h
