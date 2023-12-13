Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB34A1C6B0
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K//NtdFU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54f4b31494fso10239245a12.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Dec 2023 23:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702453235; x=1703058035; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Ly6HERW61XKD/YdVWYbpue1eQaDfbZ8RVVo6+xYP4=;
        b=K//NtdFUqtPP16dRQZA/BZYg7j5PdWD+5F5T3p3Bo/caJqppnfly4rKDxSwvs7dkYw
         kOsUEhfc5v71hE7jj5hzOpDyWhg65CvKwoJ57j/51MjahZNsVvS/J89IERyCezkJaYCz
         dhJtiJA5PgQB6bv1y/EuDUdA89hUF/la3AAKXC3PNBjjY7EAcI9yExeXkk1QNc96TVnM
         sVj88HEFRJ1ngKV05MKda3v3IEkNW2Lq/XV9pm4cwChrNNAewumuuQsjf1toG8cmc5bk
         0leBy1PDMjksegDyyWnYnr911XNtNFvH00AzVmZTf9AW34ddCwR2eOWat62Cqt+MG1/p
         luGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702453235; x=1703058035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0Ly6HERW61XKD/YdVWYbpue1eQaDfbZ8RVVo6+xYP4=;
        b=KnPapcHymFDp8uNLZQ95iEbykZ0Arl16+46NnGVE+DGLyd1qUP5nIg3rCQ8e/RlIOn
         ZVZQxiMSRL8D7xBFu3l1tX+ABrC6nctzo4h0GOuyg/l8KsTlQjm2ly92NDzArijpwz6G
         KluqVaLmTH7x7Hn/N2BLAezOWHT44ic8nH+p2ToW09NQ4uCU2348mwCKyiSRf9ITqq70
         RAJIdVLVFI7zZ1e3prGfBqQ3aLxJyckTQuKO0rKd9fCoLEG+C+uDSWAZGSBZaSZcm9Zm
         B6EMkzt8QtyZtk0XiE8VI74RrG3mdTIf/uRvACFsGdmprxYBJrKeNymQHaTav58f7u3J
         VM0Q==
X-Gm-Message-State: AOJu0YyWzK6N/IeHNKl5JJ4SaSpMZDwgNr0mW41gSN+EYhZoL8NmztmZ
	scUkG2g0uwqXuZYsd2YSmgJYPA==
X-Google-Smtp-Source: AGHT+IGKbFjRp1ZDTn5emaNV0yLT0UtG6txFHNST+cXhdsrFy5XgkqtKPM/tRuWWTL+/CXMjVr7zSg==
X-Received: by 2002:aa7:da41:0:b0:551:dce6:6911 with SMTP id w1-20020aa7da41000000b00551dce66911mr1432774eds.10.1702453234941;
        Tue, 12 Dec 2023 23:40:34 -0800 (PST)
Received: from localhost (h1f2c.n1.ips.mtn.co.ug. [41.210.159.44])
        by smtp.gmail.com with ESMTPSA id p3-20020a50cd83000000b005522983c243sm156639edi.91.2023.12.12.23.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:40:34 -0800 (PST)
Date: Wed, 13 Dec 2023 10:40:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8192e: rename variable pHT
Message-ID: <437ac97e-ff02-455d-a5b0-677907e86cad@suswa.mountain>
References: <20231212165637.17618-1-garyrookard@fastmail.org>
 <20231212165637.17618-5-garyrookard@fastmail.org>
 <6a065daf-3639-4a87-8ab6-7018e0362900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a065daf-3639-4a87-8ab6-7018e0362900@gmail.com>

On Tue, Dec 12, 2023 at 07:56:57PM +0100, Philipp Hortmann wrote:
> On 12/12/23 17:56, Gary Rookard wrote:
> > oding style issue, Avoid CamelCase
> > rename it. pHT -> ht
> > 
> > Signed-off-by: Gary Rookard<garyrookard@fastmail.org>
> > ---
> >   drivers/staging/rtl8192e/rtl819x_HTProc.c | 20 ++++++++++----------
> >   1 file changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > index ac85151a6069..add8f58b5b1e 100644
> > --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > @@ -250,17 +250,17 @@ void ht_reset_iot_setting(struct rt_hi_throughput *ht_info)
> >   void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
> >   				  u8 *len, u8 is_encrypt, bool assoc)
> >   {
> > -	struct rt_hi_throughput *pHT = ieee->ht_info;
> > +	struct rt_hi_throughput *ht = ieee->ht_info;
> >   	struct ht_capab_ele *pCapELE = NULL;
> > -	if (!pos_ht_cap || !pHT) {
> > +	if (!pos_ht_cap || !ht) {
> >   		netdev_warn(ieee->dev,
> >   			    "%s(): posHTCap and ht_info are null\n", __func__);
> >   		return;
> >   	}
> >   	memset(pos_ht_cap, 0, *len);
> > -	if ((assoc) && (pHT->ePeerHTSpecVer == HT_SPEC_VER_EWC)) {
> > +	if ((assoc) && (ht->ePeerHTSpecVer == HT_SPEC_VER_EWC)) {
> >   		static const u8	EWC11NHTCap[] = { 0x00, 0x90, 0x4c, 0x33 };
> >   		memcpy(pos_ht_cap, EWC11NHTCap, sizeof(EWC11NHTCap));
> > @@ -275,9 +275,9 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
> >   	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
> >   		pCapELE->ChlWidth = 0;
> >   	else
> > -		pCapELE->ChlWidth = (pHT->reg_bw_40mhz ? 1 : 0);
> > +		pCapELE->ChlWidth = (ht->reg_bw_40mhz ? 1 : 0);
> 
> The last line changed with my patch:
> [PATCH 02/10] staging: rtl8192e: Remove variable ht_info->reg_bw_40mhz
> 
> It is always difficult to know which patches are accepted by the maintainer
> but you may want to look into the following mailing list to see if there
> have been any patches send in for this driver.
> https://lore.kernel.org/linux-staging/
> 
> You could apply the send in patches and build your ones on top. Then you do
> not have this issue. But when the patches you are using are not accepted you
> will run into the same issues.

Generally, it's first come, first serve.  For you, your patches have
a 95% chance of being merged.

regards,
dan carpenter
