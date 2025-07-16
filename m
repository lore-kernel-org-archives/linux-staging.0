Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC420110B
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667302; cv=none; b=DLua6VG47uA0hin18vgia/t53TBOqbJF4DFkhdfKIUqq/e3pz5PAuo4QjDYfOSt4R6/g5Ugk09uzoawwY6yk4wIVWe8h5pGRH+Pg15Z0mO4k+ZQIYoc0A8aWEjlCf35YIyelH4NnQKRdb0DnS4xJFv3uRHwqMGSxfIbaHKUQvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667302; c=relaxed/simple;
	bh=LvtvImxYnRAKHNo3yfHe5m8zC5SQGoKrzzwiV5Bi3d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgBj+WWa/Zjkm9bc4Fyb8KlA4/+/clIlNQQUYXXdsAe4u7jbrECA8CQNvsvyQRIhPCyqQYJm5U0z+V51ZXzGTmMOc5xjV1CrgVNN+8qHPhrMRWg7V00iM2jldyH22t1UObI4WsuNI/AJhtSa+pYy2c+aVesKIRvv/69wAdKK7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xh09FVhI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xh09FVhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E046C4CEF0;
	Wed, 16 Jul 2025 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752667301;
	bh=LvtvImxYnRAKHNo3yfHe5m8zC5SQGoKrzzwiV5Bi3d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xh09FVhIJ+R9Ag8l2OOQlAY2n1t8nHZ6CANgNTqgofmaZCPF18eVXf7zaJGPZIZ0L
	 r6+KTztuVSz4TiUUshrHVNXd/IHZXfwO1t/ESp+pzkkYkrBJ5ZUk6mfIRohrVJSBN9
	 Hb9inUTNJoBYCyBQPg8gE4QiUoxK3VL3/0GhmlLw=
Date: Wed, 16 Jul 2025 14:01:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/4] staging: rtl8723bs: fix tab spacing in rtl8723b_cmd
Message-ID: <2025071628-bunion-skedaddle-dded@gregkh>
References: <20250716113808.73115-1-ignacio.pena87@gmail.com>
 <20250716113808.73115-4-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113808.73115-4-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:38:08AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Fix checkpatch warning about space before tab in commented code.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index 789abc123..012def345 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -77,7 +77,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
>  		else {
>  			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
>  			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
> -/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
> +/*			*(u8 *)(&h2c_cmd) |= BIT(7); */

Why is this line even still needed?

