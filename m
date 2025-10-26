Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C74288505
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761471870; cv=none; b=mu8TfKKg3melq2e1kbvnhszZEI3uE6mFAV/RJFBsTOQUWTda+ckMBFd8BTEkr+MKFAF0iuLflqqgbXgTyi6mkCIV0OaZKdVD9aGCgKhYs2gvOwDFeRzQ9vLpEhXBAZXbB1zNDisABVqUM0G2WqweL16Uq3bjmyW6HpK2yAjjwFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761471870; c=relaxed/simple;
	bh=D2QyevBTk1mvw2jNeOIbrBk+vlYfOPzSEdmo1co0hdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCDiLItGqAdx0rpE2IvfuCY23cNY0eIKpBRTDCQ1mdotlo3FOggMJ054ZjMD3Tpp0TPjeqkaAP02XCf1+XLJr6aTE8t79DR6DBQktKgs13icxCeH4snf3wr/0HbvijiURxdMVCgJI/AJz/JrLuqvrPmg2p82LfJ54Do5uXwP+1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rXlmU280; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rXlmU280"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A19FC4CEE7;
	Sun, 26 Oct 2025 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761471869;
	bh=D2QyevBTk1mvw2jNeOIbrBk+vlYfOPzSEdmo1co0hdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXlmU280jZ7l7krEn2fKvFakvRTFkDFzxvRmV80myi+Ay2KFam52oh0ZXy5hJAtmW
	 qvQB8f2tn4FSnHBPfh2ECjL4M6zKQ0i5BTEep+lZDw+lpg5YSt5xcKNftb4Ahuu91t
	 OTanlzcApfzDte+O1vh04GebyCoffSRuc66QDAaM=
Date: Sun, 26 Oct 2025 10:44:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: rafiqul713 <rafiqul713@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] [PATCH v2] staging: rtl8723bs: remove unused rtw_sprintf
 macro
Message-ID: <2025102613-amendable-humming-6d36@gregkh>
References: <20251026093241.150826-1-rafiqul713@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026093241.150826-1-rafiqul713@gmail.com>

On Sun, Oct 26, 2025 at 10:32:41AM +0100, rafiqul713 wrote:
> From: Rafiqul Islam <rafiqul713@gmail.com>
> 
> The rtw_sprintf macro is defined but never used anywhere in
> drivers/staging/rtl8723bs. Remove it to clean up the code.
> 
> Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index 8b1634f4091e..12369ee2ce1d 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -115,10 +115,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
>  void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
>  struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
>  
> -/*  String handler */
> -/*
> - * Write formatted output to sized buffer
> - */
> -#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
> -
>  #endif
> -- 
> 2.34.1
> 
> 

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
