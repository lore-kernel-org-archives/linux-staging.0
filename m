Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7367F306B31
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772692416; cv=none; b=FmEMFn7O+h08c0gqrkJxyhoiTOBHkqTA8CzwctfUFlawul89gYL5yCgCfrAqv3fNmVDpr1LTxqxDlSNepDcUesxvFkPWjKSriapZvwYuek6D2UUq6FlsLMP8Rv4H/0aDO1/rQ++IH1vKapjKPq+V2/JLdXF/2X72iOsceLR5Ayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772692416; c=relaxed/simple;
	bh=Mm1qVo+2DxvlAdhx+A7WLs2OXH8sgU4328CQSfUzaCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj2HS9wX/M5mnGFjpWnvOZtqR7YUABXzMZX4iN4ywpQ//gdjS1IUs/zgI9tf5gTD93kw8nZPLidMXpAuZgV0jsrercEEB70j4Gk9hNdvGNWcw/s97lg4vIiilm1/iphi5NlJr4IJQN1ZGO7EARUI7pk5oOBFNQG/oPWakYsOvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lYusTTRQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYusTTRQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483a2338616so48211565e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 22:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772692414; x=1773297214; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=22JObSFzsMOEogCcGGndinLAtbcQPdlYIS7F2l1n1t8=;
        b=lYusTTRQ+BGoJZHEQrBb8Cw4rlIgKXaGwzeWrVLpadWC1897Mmr4vGg41OljJ5SM3+
         wXZjUyE5IsS9EwSyhtaeinOEkVJRQ17D7DS2nSS7m3fOxHx4k3GfMsIL7G9X3cAwYffp
         F019qL1Aj6UFnLLzMcp054fismVercMFfR7G96gDM47Pwve+hd68ElXUFUwVFvI7f7Mb
         pJqKncEy0u9Vqk7IbEGrbmsflK6JMIkbnFvS2VxaQhVq3UhEvUIuoLN0ZAX1HWSSh0Qk
         /FPpucmRYEucQ+QHpmXBedllqXCvEk9Ii+8/mcK0G3o8cIKpueBIww7tLn1sZcjeHlzP
         AR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772692414; x=1773297214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22JObSFzsMOEogCcGGndinLAtbcQPdlYIS7F2l1n1t8=;
        b=RD2ul+Qpgh61QUVqDdXYwvGYuc8I3ay8E2+8moLWnCVgxmXGfY7zK3VudMGD467qL9
         fmLV9qJgw2xXx5FsloSdypN3QTaABX4rHgtJeyptD9aIQg2l+XdhQ4EKyO8iEmlHleDE
         HRMsjIxalXrkVf0qhD5K2hojTSasK37nVtTr2W7adLLkJgjQq5q7N1le8Cx/AZwsvu75
         BWGq+kJ/YOTssgho48/FsN5D5s1NdGQ24ynZonHD7jP0TEEH4qBiwGxHmZyj4jz6Digw
         rJ61oeTmpvEXyZnyD2d2aW4owMY18s5UIy6RnnzWlicRtBqkMAIagmhva9aYf2v7+2su
         6uWQ==
X-Gm-Message-State: AOJu0Yxfl8rO4odrMB1dJ6gA9iBGLL1mF/MA5cbJlbF3LKyRkODDbrjX
	EJ31MTrYAA+ZiT7pRR1IzmDIOMApLmezbGrt+mY7iRpFtFVf1/f5TiqprX+yLZZ8HzI=
X-Gm-Gg: ATEYQzymH7aJTc4XnFhyUK9wQ2bN5DvpfvrpgVfonpHcWV4SwMgctgmYX8QRfjq3rmw
	NbH+AB2ujp83pWW9qREvcpyefyBxzkGvi0BKNf7NAVSF6dRPXVytkSJ6/CwvDRF1LgvwIfNXwa3
	XaWH0SU/vOPyFXuayNMn25bLAyBBILl8lBOKXd5T56qWt0mKL7U4yDhSyfc9DvjbpCiO3QBWs8L
	u6tioMrYilnRNI9v+m26HHY+5IyGOEOKknONz2hxTWRW/4qALALzcWGn2ESWrJIGklSCz5285jG
	DehouAmeUAAGw8uZ0axWVFYQ/dL9NlnlqFnZGofB+fImB710xDOZZkqSRWY+eUnQsialyPOv7WV
	qDs1upNToicUeXRXNucH52s/fVuWlDTADNnwDXkqiEB8fh6WAojebwO284X2GjGfIW5HcbAyOQz
	WNbyRL960si1f+5KdAKAmYGHMZs8H4
X-Received: by 2002:a05:600c:1c21:b0:483:71f7:2794 with SMTP id 5b1f17b1804b1-48519866866mr82848135e9.15.1772692413809;
        Wed, 04 Mar 2026 22:33:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439bb686a32sm22625540f8f.13.2026.03.04.22.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:33:33 -0800 (PST)
Date: Thu, 5 Mar 2026 09:33:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: convert ROUND_UP_TO macro to static
 inline function
Message-ID: <aakjuiUqhYHCrSuh@stanley.mountain>
References: <20260305023000.64609-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305023000.64609-1-marusik.adamenko@gmail.com>

On Wed, Mar 04, 2026 at 06:30:00PM -0800, Mark Adamenko wrote:
> @@ -758,7 +761,7 @@ static u8 init_ctrl_async(struct dim_channel *ch, u8 type, u8 is_tx,
>  		return DIM_INIT_ERR_CHANNEL_ADDRESS;
>  
>  	if (!ch->dbr_size)
> -		ch->dbr_size = ROUND_UP_TO(hw_buffer_size, DBR_BLOCK_SIZE);
> +		ch->dbr_size = round_up_to(hw_buffer_size, DBR_BLOCK_SIZE);

We already have roundup() and round_up().  Use one of those.

regards,
dan carpenter

