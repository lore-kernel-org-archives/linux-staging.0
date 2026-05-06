Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE5012B94;
	Wed,  6 May 2026 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043667; cv=none; b=nUyP6EkbR1aY0VYAqWYpiKqFP8uqoCBisoz+NTs8OC2tMDeKAa3IfaOsIbkKTvF3ZJmMqQvDwbkzZ0VmB6XJosCIT2Oqef6O905LNSShCStSR/VeEydmMEORRV0eCKAGDiM4ITq4i9L8CRGN7mDMbpTej8kPJ51TQQBxOg86zMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043667; c=relaxed/simple;
	bh=dmw53Y2WrTCA3eyE+JBlwO6VzIAwhEkmKqb+aiS9ndc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugfX1B44IIjx65+jXPg161cT9RY93gTPCFLxy1t8/uFWTcGKfnqHjhD9MiD+rkWvpa7w2ldrfWcbSwp7px3fQB/dKMYblGT5VEU6pyQMWpVWqtj5U80xH+RLVUm7w7ie4Uj+9SW1qHUtQH0NslmSa6zwq13O85F6MVwJfWe0PC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CKm7m/Dk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CKm7m/Dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BACFC2BCB8;
	Wed,  6 May 2026 05:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778043666;
	bh=dmw53Y2WrTCA3eyE+JBlwO6VzIAwhEkmKqb+aiS9ndc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKm7m/DkgqrjHWDJZ9dJSfZAgccZB3ZGFkUkEgFLnd5ZShDlvPmFfjRuwdfdQZnRt
	 VztLO8yiMh3he0qzmXNh0yR46skKIl980r4UZ0HNI853DcEEZn7qiuBp4W+XyyQqxS
	 h+LSacq4Ga0iXAzx0iGyQ8rxLyTJDwTslZwBeA+U=
Date: Wed, 6 May 2026 07:01:04 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: David Cardenas <ldcc@proton.me>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix open parenthesis at end of line
Message-ID: <2026050635-gravitate-sprinkled-575f@gregkh>
References: <OorLKjBEmwLMB-OuQC_MerB0GkYg2fsHmJcvxPmc8EFrk7VuBlisVIa90K86InsIr2MjgjoSceOv_PUY0OfsepmQ42JdZIoSvK0pMggDfYI=@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OorLKjBEmwLMB-OuQC_MerB0GkYg2fsHmJcvxPmc8EFrk7VuBlisVIa90K86InsIr2MjgjoSceOv_PUY0OfsepmQ42JdZIoSvK0pMggDfYI=@proton.me>

On Wed, May 06, 2026 at 02:26:02AM +0000, David Cardenas wrote:
> Function declarations and conditional statements should not end
> with an opening parenthesis. Reformat affected functions and
> if statements to place the opening condition or first parameter
> on the same line as the function name or keyword
> 
> Signed-off-by: David <ldcc@proton.me>
> ---
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 179 +++++++-----------
>  1 file changed, 64 insertions(+), 115 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 6ab65e9e8..59b8f7e99 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -30,6 +30,7 @@ static u8 DeltaSwingTableIdx_2GA_N_8188E[] = {
>         0, 0, 0, 2, 2, 3, 3, 4,  4,  4,  4,  5,  5,  6,  6,
>         7, 7, 7, 7, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 11
>  };
> +

This change is not described in your changelog :(

Also, the From: line does not match your Signed-off-by: line.

thanks,

greg k-h
