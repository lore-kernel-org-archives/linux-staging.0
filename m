Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D04D38330C
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122472; cv=none; b=nOfslsqpDVUmxNFsdOzukc8ikY5TYEz5yqS6HpAmOiqyg7a2v3R6hp6TA1JLpVgtfcdZOKxsgCw7uz1aALIm3dZzH/edKp2BakyT30JBlLFhBxkKnxbIGYNEw661FBqp9hbSPtIAr0aQa1FSCWJz7WyIfGKyuNaCMff5I8K8d3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122472; c=relaxed/simple;
	bh=Xjix+ezDww45fiSmmVE27IMAovNtEODaJjUP+svzGog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnPHZNVmU+0lJWCmMcRo39iupRaq0ufyayuxD6PaNhetIqF+wAW+BChBGw25grla+nZAOiTWf/cDdb5Dok32bgNmqSgsDPu3Y5u2Y1QVCdgcMPGtX2cCdsDT4dF41Uog89azPTLcxuzskr5KO57qMqqmZ1HgvUf5lz4eOjJ5TeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L38Kx+lM; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L38Kx+lM"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e54f8c051so192320785a.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122469; x=1786727269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Dm90l7NZdmGx7A2pHb1IyR/aqBOb4q6n8ufqhFP+ZQ=;
        b=L38Kx+lM2ptxLgyEaCZUp2SMFidkoej0jzZO9LPrrwDfbArOPj6jyFwKrG77Ubx5qy
         mUagbvrU1WSvxeQ7S4zMjj6tvfh8PugB3TvocXanvll4ynsy0OHWrB07uPreEqJHuWiP
         vrRNorRlyFZbwZXRDr+awBQ4AurYdsJP3EeKY48BYSEH5z1D4hx91NM8VmeZprgyKRkg
         n31M+mm9r+wjB3VBkv/4e4XiBe7DQxHs8r3NL4Ezbd/bcTwqACG+Q5PUsoiFJbjeqyMT
         xmeOy1ZqIH+w3IycX8hMJXfzumWKFNeET37hZxQARQJdfeZ4cdAEccpfLS+cWF6+C1Zy
         04OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122469; x=1786727269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Dm90l7NZdmGx7A2pHb1IyR/aqBOb4q6n8ufqhFP+ZQ=;
        b=Rn5Y4NrAUzKwsIfDtJ7r72fPT2aiZ9nUF3iLFn/ErsFcACDEwhkTjOtwOCFxfhJKJo
         VUenzhbWO94tkJWXhjVD3f3FhLkElE63CsaFJLjGWy33tMTKbUh41P4nb2ClUv+Z+1tl
         U1ZocGzRGcxKIvGYcSxPnOzKAfXXf4UCI2H1Vt3gynTU7GqQAy/7ZflpMzKWUDRMEfzv
         3Cp0L0MURT2lcshS7VTRXOuAEiWG4VYAUhJfSQqm9jnDAIDniN2FcS/rdn6akO5UBpAg
         vembmQIVWTEoe9hnPNLETH0BG6x1HWxdSlVcKBk4dOrOyaleVd9TDtcNrVummAbIpACE
         j4Pg==
X-Forwarded-Encrypted: i=1; AHgh+RowcOkkvfJ7eOAP0lujxKKBsW+RhWNvkcTPytH2lFHs7hHtIERGfogk7+ir02Tr9AFsPJZQPzFmyXUQBzTW@lists.linux.dev
X-Gm-Message-State: AOJu0YxrmC6rHWC6yuLkGnKkNrMO8gHq/vyG8XFCSIprPjg2q3beMZiV
	LwOWSx+y3KBG6STS6UFCkH+EUyNGYjc6e4lXvG1rlpidVD+6My5cn5RO
X-Gm-Gg: AR+sD10AF316xx/DeXe0jEpMh46MX0Dz0I+jeCFSh6OFErKDzHlExqoILciE/BtPdLk
	eWO8Kihg8KhqYwBcPinlDMaYd1Furo4K7gOMZ50HJlh5iewVn9Ans9VqFRyId2PUtNKxJePNNMq
	8mLY1ZViSJIXP4JPi0K8uzZmsZPUMPdZ/mAJJreY49tuY8T9TYCI9ETgZY4QosMkLXnaZHSynAt
	9lNbiXJ32ESiVMIf5uYBeFEHjVtNd9brZizJfohwPGUsLLFyhy8BZsHKlBTy874hxQqB14GCn4s
	qjhKqEKhE8icrL56ANyetnzLjTY7GS3P6NECFaWA3jo/yMj6ZCKy8+XQXPVMxEIiQ/VTYW1Del+
	oY5yqbySVd8z1ijnvNZKa/V18GKgaeN2uur70bkfDqwK7jfHHb0Gn9k2a9FfRJeTrnbFtjuyoUn
	6wpgjbYe4hgY5xDGasVB2yo7nrBwrpzj8Np5tTw++JPJ0MgP9N5xZTUQ==
X-Received: by 2002:a05:620a:a403:10b0:92e:4859:49dd with SMTP id af79cd13be357-936490e7540mr2021484685a.26.1786122469163;
        Fri, 07 Aug 2026 10:07:49 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03aeadsm191761385a.3.2026.08.07.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 10:07:48 -0700 (PDT)
Date: Fri, 7 Aug 2026 20:07:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Punnay299 <punnaysharma805@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: fix sp8870 initialization and
 hardware communication
Message-ID: <anYQ3cNFJp-YCqLr@stanley.mountain>
References: <20260807160149.41580-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807160149.41580-1-punnaysharma805@gmail.com>

On Fri, Aug 07, 2026 at 09:31:49PM +0530, Punnay299 wrote:
> Address multiple correctness issues in the sp8870 demodulator:
> - Fix BER reporting in sp8870_read_ber() by correctly ORing the upper bits.
> - Set state->initialised only after successful firmware upload in sp8870_init() to allow recovery from transient I2C failures.

The AI is too vague on this.  It needs to be spelled out more
specifically.

> - Catch partial I2C transfers (err == 0) in sp8870_firmware_upload() and return -EREMOTEIO to prevent silent firmware corruption.

Run your patch through checkpatch.
Do one thing per patch instead of three unrelated things.
If it's a real bug it needs a Fixes tag.

> 
> Signed-off-by: Punnay299 <punnaysharma805@gmail.com>

Use your real name.

> ---
>  drivers/staging/media/av7110/sp8870.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
> index 29fb4934c..def2a7f0c 100644
> --- a/drivers/staging/media/av7110/sp8870.c
> +++ b/drivers/staging/media/av7110/sp8870.c
> @@ -68,7 +68,8 @@ static int sp8870_writereg(struct sp8870_state *state, u16 reg, u16 data)
>  
>  	err = i2c_transfer(state->i2c, &msg, 1);
>  	if (err != 1) {
> -		dprintk("writereg error (err == %i, reg == 0x%02x, data == 0x%02x)\n", err, reg, data);
> +		dprintk("writereg error (err == %i, reg == 0x%02x, data == 0x%02x)\n",
> +			err, reg, data);

Don't make unrelated whitespace changes.

>  		return -EREMOTEIO;
>  	}
>  
> @@ -135,7 +136,7 @@ static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmw
>  		if (err != 1) {
>  			pr_err("%s(): firmware upload failed!\n", __func__);
>  			pr_err("%s(): i2c error (err == %i)\n", __func__, err);
> -			return err;
> +			return err < 0 ? err : -EREMOTEIO;

I'm pretty sure i2c_transfer() can't return zero in this case.
It feels like this would be a bug in i2c_transfer().

>  		}
>  		fw_pos += tx_len;
>  	}
> @@ -315,7 +316,6 @@ static int sp8870_init(struct dvb_frontend *fe)
>  	sp8870_wake_up(state);
>  	if (state->initialised)
>  		return 0;
> -	state->initialised = 1;
>  
>  	dprintk("initialising frontend...\n");
>  
> @@ -353,6 +353,8 @@ static int sp8870_init(struct dvb_frontend *fe)
>  	sp8870_writereg(state, 0x0D00, 0x010);
>  	sp8870_writereg(state, 0x0D01, 0x000);
>  
> +	state->initialised = 1;
> +
>  	return 0;
>  }
>  
> @@ -401,7 +403,7 @@ static int sp8870_read_ber(struct dvb_frontend *fe, u32 *ber)
>  	if (ret < 0)
>  		return -EIO;
>  
> -	tmp = ret << 6;
> +	tmp |= ret << 6;
>  	if (tmp >= 0x3FFF0)
>  		tmp = ~0;
>  

This feels like it probably is a Fix.  It would be better if it could
be tested.

regards,
dan carpenter

