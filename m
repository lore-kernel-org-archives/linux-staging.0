Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F182CA64
	for <linux-staging@lists.linux.dev>; Fri, 15 Dec 2023 05:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ey4/Bu+B"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3470496e2so2108655ad.1
        for <linux-staging@lists.linux.dev>; Thu, 14 Dec 2023 21:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702616766; x=1703221566; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hvpP/ygkFMYd8akAA0h2BMF7cGxl78yZ9yQVEC1m76w=;
        b=Ey4/Bu+BN1idLZYw13GozV8XbcPm5Uu+UAmaGgTy9//SK7uVkTIfvTv26ddiADZ4ZB
         LXPYLqQ7zpq+Jt3xM1RDG/71O7jRo6QeUkhDt4kvURVySXPO785ND4tAVJbgKbb8Rk8J
         xy3nGv0eLlzjtPB6PRHIDgnKmik1r4cdyfUUAhY+1vNQzJSCEXK6hwa+PJA/fBdN9BSK
         hiQPKeyJNrQk/0iL89AYv5mNaY3BI6Q7dBM2HO/o2p17MZBeIknDZ2ddwaQXaU8ZIpS7
         JGeGdwisl1gPYm2FWbCV/H90QrRqbiIAW0x053LQlX1tlAcj47j7nd6skvDBvX+r+nQw
         7P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702616766; x=1703221566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvpP/ygkFMYd8akAA0h2BMF7cGxl78yZ9yQVEC1m76w=;
        b=ECY6PJwZKwLp7vVROX9QuFTZjFZEGVW2UsvxbuFmHNYSUkn0eVirgxxBWQuw6HHdXO
         qxEE6iH/qZ17Nb4AiioigB3oEIgKUDRvXUPj/7YrHKVY20NiIG+4SUibqR3LSULwK6aa
         a9OWw9KY8jkINKIwHaknAtcJT0BKsDmQD/M/LhIv7hFXtpnVLMS9cf8LDuicUgWURf/x
         cA107u19tyl6hQegFW6KzrJr4XsUJsMDZG4A2YwPENIEqFlPn6yAKa/eQXD9YUZIb2CE
         2yHK1mVRQ+SxIF0b1WN7Q2bnuHu2OTkQzHHPuzv49Bp8sgXP/E5DuxBUFMZK7kjIS4ME
         bDPQ==
X-Gm-Message-State: AOJu0Yw1dUoyRA1XA8unjCVbMJQaNUTUfXVbF7lVsnviyUiizeqhbyF9
	XadTi/N0Je4f0MBS6A7+V2x1ug==
X-Google-Smtp-Source: AGHT+IHJ3DBkuKkdets9d837xoghatL8OwNCUq3Sx8ZFLNbuSRbWp7OiuUaSbeKx1eoJ27Otho8bIw==
X-Received: by 2002:a17:902:c406:b0:1d1:c96a:c5e with SMTP id k6-20020a170902c40600b001d1c96a0c5emr13537749plk.70.1702616766572;
        Thu, 14 Dec 2023 21:06:06 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p20-20020a170902ead400b001d0b5a97cabsm13255145pld.124.2023.12.14.21.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 21:06:06 -0800 (PST)
From: "<Tree Davies" <tdavies@darkphysics.net>
X-Google-Original-From: "<Tree Davies" <tdavies@gmail.com>
Date: Thu, 14 Dec 2023 21:06:04 -0800
To: Nathan DSilva <expitau@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	tdavies@darkphysics.net, kamrankhadijadj@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Add blank line after declarations
Message-ID: <ZXvevJ2vEEQ92rau@oatmeal.darkphysics>
References: <20231215032852.501316-1-expitau@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215032852.501316-1-expitau@gmail.com>

On Fri, Dec 15, 2023 at 03:28:52AM +0000, Nathan DSilva wrote:
> Found using checkpatch, removes one warning about line breaks after
> declarations.
> 
> This is my first patch, feedback is welcome. I am submitting this as a test
> before moving to other subsystems to (hopefully) make more meaningful
> contributions.
> 
> Signed-off-by: Nathan DSilva <expitau@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtllib_rx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
> index ecaa4dec3f94..397859c7f5b1 100644
> --- a/drivers/staging/rtl8192e/rtllib_rx.c
> +++ b/drivers/staging/rtl8192e/rtllib_rx.c
> @@ -946,6 +946,7 @@ static int rtllib_rx_data_filter(struct rtllib_device *ieee, struct ieee80211_hd
>  {
>  	u8 type, stype;
>  	u16 fc = le16_to_cpu(hdr->frame_control);
> +
>  	type = WLAN_FC_GET_TYPE(fc);
>  	stype = WLAN_FC_GET_STYPE(fc);
>  
> -- 
> 2.43.0

Hi Nathan,

Thanks for your patch, but here are few comments.

1. Your subject line looks good. Keep it.

2. Your commit message should read something like.. 'Do x to fix Y'.
There are lots of examples in the log for this driver which demonstrates this.
You don't want 'This is first patch' in the commit log.

3. For this driver, it is best to send your patches to Greg, Philipp Hortmann,
and Dan Carpenter (error27@gmail.com) looks at them sometimes too. And like you
did, cc the mailing lists.

For example, My setup usually looks like...
git send-email ./patches/*  --to=gregkh@linuxfoundation.org --to=philipp.g.hortmann@gmail.com --to=anjan@momi.ca  --cc=linux-staging@lists.linux.dev --cc=linux-kernel@vger.kernel.org

A good source of info for sending patches can be foound here:
at https://docs.kernel.org/process/submitting-patches.html
and also there is a free tutorial at:
https://trainingportal.linuxfoundation.org/courses/a-beginners-guide-to-linux-kernel-development-lfd103

I'm a newbie myself, but I'm happy to help.
Cheers
Tree



 
  




