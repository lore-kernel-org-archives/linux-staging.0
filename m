Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B617DFED
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655739; cv=none; b=GtZLLItK1wEkLuLC6mTY5XbbGZoQOcKyeNXiwswB8U9lPeK8StOMWnzNRwjahw/dO7Z8Ifvv2CZPcA11UUmXdvkaey9HPYAODoHgUD+ql53YPISj2166nPFaVyJmRB67jvr/mEFPPIO7LGXN0L64aU+muvLm9svrjKrXInV33RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655739; c=relaxed/simple;
	bh=MKojkMtdMLX6s0iPGFzxqvrccWjr566N4dfG+CDfRxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqHhH6TmLz1bl3/MAHFtmCPoEKmYYqJo+3m6BxNxXQ1mohFPIPdF2PyXdpLN5chTxBMtwO+RrgZ3pnp+A6P8/jcJo94LtgtJZxwuf1WmMRMPPeI0pl9Aw3V3IRJvX4aIFlmcv85U1YH77b7MCdSLjaHTggwj5/qd1p3aH98XI1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ra5fvee0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ra5fvee0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so54310955e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726655736; x=1727260536; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ6iSOFRFIXilBHat53kTfPhBju9nzHneKyM/B5MJoM=;
        b=ra5fvee0gkEds70+Ql1dGRy/wu5pytu7zTKD6SRvN4CrEE6+IN3rm3UhmLgxfpYfaQ
         BQOVPmDWyGwyMAtdBpTmBP5lxanB8Q8RcZL95M3VspgGEN5cgd2dG+waHhLpkMoFm6Al
         Cpm9ghFkE3rRPlRXPWuN0HXeHWfqhZDgjtl4IFLLEJ0jpjZWWoZUh0A4sPhx4rSqF3mC
         jDfidd7ou7B3evBfo46B4EmuRrTVJvfaDNSIRyupBAnlNS8xNMPjzqf4EAwTVP0exBWm
         fy5XKrjpmaKl/NImgujdWnwB/1Iineit/Ty3hQDm1XCJZykUOdinlqRomtEbciA5tAnX
         Y8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726655736; x=1727260536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ6iSOFRFIXilBHat53kTfPhBju9nzHneKyM/B5MJoM=;
        b=u4FDb9kwvACQRbFxHZd1bh8mPrBE76CtJZSZd+WvlhdY/c6d92WLCUdJ4g8BGAt/Jc
         XwNR2SM5XDVOzRjshd5/y1oBZkY2M0V7TviSgJIUJg5HGe94pz32/ngOy7crf6ctpt6D
         /XP25OIjWqUFtgLQ1dOskddh9vwfBvpWYxcYIfFgCYZWD7LoOkl2JC4d6VxshbbjCsJw
         2HU0x8dt0DrJmsNE6FV/ELs9FHqwndx3XtTYehSzQK9wTEKc1NsJ7ojVPwngFOL/R052
         9wV+kGPapQglEMGjwyfSN7EC5UzhMV3Lq29aagKNfNFYeIyTzvm0WRHMhZ6VgqVtY9Dq
         mXIA==
X-Forwarded-Encrypted: i=1; AJvYcCV8LCTigL+Uvf4OId5FaxT+yTn6Ig2dlVchWODWXQIO/grtdne9IT+/RQ290IDh0TdTnCJjZ/e30LCVDJmE@lists.linux.dev
X-Gm-Message-State: AOJu0YxUgEFxJPFeceFgtPMhHzsriE5hMTu1bzhOAvLufP18ASLT027h
	DPE+f2WeUbd2dJHxS45OVnZ2KOlWTRjYT1EkOp/Vy/DVgTnoEfLmLM4bg8mswOg=
X-Google-Smtp-Source: AGHT+IE1q6TLLgJdFrxZskiywIgmSX47WLYAFvIvk6rTFMK/4V4rT4AgiNgb5t4ooDomK9lfcGqoxw==
X-Received: by 2002:a05:600c:35d4:b0:42c:af06:718 with SMTP id 5b1f17b1804b1-42cdb57c0d1mr177198965e9.28.1726655736155;
        Wed, 18 Sep 2024 03:35:36 -0700 (PDT)
Received: from localhost ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e704f2ee4sm13314365e9.28.2024.09.18.03.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 03:35:35 -0700 (PDT)
Date: Wed, 18 Sep 2024 13:35:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: philipp hortmann <philipp.g.hortmann@gmail.com>
Cc: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
	anjan@momi.ca, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] Staging: rtl8192e: Rename variable nDataRate
Message-ID: <0a8303bc-0c11-4355-87d1-1e4dbe10f376@suswa.mountain>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
 <20240917053152.575553-2-tdavies@darkphysics.net>
 <ZunfwVt2f5DsAqlb@kernel-710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZunfwVt2f5DsAqlb@kernel-710>

On Tue, Sep 17, 2024 at 10:00:01PM +0200, philipp hortmann wrote:
> On Mon, Sep 16, 2024 at 10:31:35PM -0700, Tree Davies wrote:
> > Rename variable nDataRate to data_rate
> > to fix checkpatch warning Avoid CamelCase.
> > 
> > Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> > ---
> >  drivers/staging/rtl8192e/rtllib.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> > index d6615f787d53..21d8ea153368 100644
> > --- a/drivers/staging/rtl8192e/rtllib.h
> > +++ b/drivers/staging/rtl8192e/rtllib.h
> > @@ -1743,7 +1743,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
> >  u8 ht_c_check(struct rtllib_device *ieee, u8 *frame);
> >  void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
> >  bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
> > -u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
> > +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 data_rate);
> >  int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb);
> >  int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb);
> >  int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
> > -- 
> > 2.30.2
> >
> Hi Tree,
> 
> forget the former email.
> 
> so in this commit:
> commit ad96610acc0eb81f0342fa688e6d42fd530c328b
> Author: Gary Rookard <garyrookard@fastmail.org>
> Date:   Tue Nov 28 13:17:27 2023 -0500
> the variable was changed. But he missed to change the declaration of the function tx_count_to_data_rate().
> 
> So you change the variable accordingly in the declaration of the functiont tx_count_to_data_rate()
> 
> I assume that Greg would want you to use a fixes tag.
> 

No, no need to a Fixes tag for this sort of thing.

regards,
dan carpenter

