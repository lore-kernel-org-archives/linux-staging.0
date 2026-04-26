Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A423ABBF;
	Mon, 27 Apr 2026 03:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261856; cv=none; b=vFOD21bKiVj9zhnNpqKcILMQG2qeT46FmR51T3isxSqzgyMBRfC3sSOTFljZuw5+xo72CrdJnx2MD1oFjoCXA+/liz5uOu1MQKa0K4HZaGaM7t6+CXq7tNHARkKBaUuCyuub5av7ZHefaKGVzTExb/MDzIlIZyVnzpB1XSGcgtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261856; c=relaxed/simple;
	bh=EUZ0ETSxw33blgie7njA3AcnCo0yyRHCKfTRZbrJyBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MH8h+dLB0GQUEiDfePb9IT9fqES2RYltPGipFtqsm1IY+SdrfzXVsvzawcdqePPu5nnOzg3aoeLPerB99f6vCBrpTY+sw11lTQxtGHisfC1brKygCyl1WCiROB52Fae86qrob5luQaFj4LGr+BTswyc3HSITwLYRe2j/zvmAhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gf2B/Ci0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gf2B/Ci0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BE9C19425;
	Mon, 27 Apr 2026 03:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261856;
	bh=EUZ0ETSxw33blgie7njA3AcnCo0yyRHCKfTRZbrJyBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gf2B/Ci0j21jJeFLq6QdFvT/goiti6ejIv9s77ZMw+dLLlGMs2ifJxj/8L+f6FleS
	 ftmU6T4/sHxGEqMpnrXg9c52NI6vVPFvPtdBtLVXPrR2npMKHq4E2Y3yNuBuajOwLK
	 +aPphumYK8WKPJ5EnnQfKHaBwezf0N0M3an/xVMc=
Date: Sun, 26 Apr 2026 21:40:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lettice up <minecraftwemmne@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length in rtw_cmd.c
Message-ID: <2026042654-countable-boxlike-fbed@gregkh>
References: <CAJYuYVk5NYQd4h3pUjiFYfthmPNo3k6n2DF-Of70n0cFqg1OWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJYuYVk5NYQd4h3pUjiFYfthmPNo3k6n2DF-Of70n0cFqg1OWQ@mail.gmail.com>

On Sun, Apr 26, 2026 at 06:20:26PM +0800, Lettice up wrote:
> 嗨，Greg，
> 
> 这个补丁修复了 rtw_cmd.c 文件中关于行长度的 checkpatch.pl 警告。我把它作为附件发送，以避免我的邮件客户端出现格式问题。
> 
> 谢谢，Lettice Jimmy


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
