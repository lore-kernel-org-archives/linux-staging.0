Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C528DC4;
	Tue, 31 Mar 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946289; cv=none; b=SoW1/x3f98tKOyBCYbaydRN81ZkDpGxCxuY6ApssmnCHQPztn7Whndm2dG/kc7EPUTAhY342b/xed0Odz67O2qmWxXnthaHJcArOevLefzDbMW7KB3hB32y3xOJiZLadxJ5MbSGwoARGPWLqz2b+gTd3On/6f+GWKlzzCF6FEbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946289; c=relaxed/simple;
	bh=NQwxxN/oFAXm3Y/Ma0GKkjnnWgIFeDhrQrojCGQLuok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3utyZkKkWP6S8Aj8iJzlC0X5nLP+DocXRptBvnUYPRGwy9Q/9MGDmliIbSDYFcuoerzyQhiNfjq63gUBK6V3+UsaNMblQcZVc7BGA8dRfp0vcQaPdUsRB2ldRqsHttLZMf0L76c5pjpON20XXErvoCah1RtJfXNO4f9uAYJVNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eVHMl7j2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eVHMl7j2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319AEC19423;
	Tue, 31 Mar 2026 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774946288;
	bh=NQwxxN/oFAXm3Y/Ma0GKkjnnWgIFeDhrQrojCGQLuok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVHMl7j2KnK95EXHJ0kGkLU5RvchSdhtsU5jnkV/vyd50G/hQpCFoDEejtEaZdezi
	 Jej7mSliJDxp/DV3paCTuv5XO9t9vC+3r0OO0hINswKo8oiIcVyq0xc3yRJOw9xMXg
	 D87nRkSM9B/I1gE3g6Jhh5QaTmsGJH9eD9755K7M=
Date: Tue, 31 Mar 2026 10:38:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>
Cc: dan.carpenter@linaro.org, ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	luka.gejak@linux.dev, straube.linux@gmail.com
Subject: Re: [PATCH v8] staging: rtl8723bs: remove commented-out code
Message-ID: <2026033138-astute-rotten-9d06@gregkh>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <20260328033128.27946-1-aadarshmandal9354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328033128.27946-1-aadarshmandal9354@gmail.com>

On Sat, Mar 28, 2026 at 09:01:28AM +0530, Aadarsh Mandal wrote:
> @@ -484,10 +474,7 @@ static void sdio_AggSettingRxUpdate(struct adapter *padapter)
>  
>  static void _initSdioAggregationSetting(struct adapter *padapter)
>  {
> -	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
> -
> -	/*  Tx aggregation setting */
> -/* 	sdio_AggSettingTxUpdate(padapter); */
> +	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);

Why did you reformat this line?

That's not a "remove commented-out code" change :(

thanks,

greg k-h
