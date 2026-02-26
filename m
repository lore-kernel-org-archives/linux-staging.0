Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7560839901D
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097864; cv=none; b=WKzrjT/rBK6CHpj3899g6VNSVHVM+PLV1MJA4WAv81t78kxVx88uEjELSzNHeRmiy/AnuBWMuIWHvhBpbnT/aoB43ewg+ib1muJ90jVL/GpRPyipq4JJXAPeSNKs2BwKWQUMv6IMLdQiJplTs1kWvLwJG4LUynhhEpZz+5kvKmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097864; c=relaxed/simple;
	bh=yKA7jbVMiaFWtffnJDetegTka4gNZTSWV8guGy+9b9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zepdb1BiZ1lQllh/XiLbcmN02QYubT4+i401ZiHO5oy3+GxCASGPSIb72DiUwWVVkauI3Eq5rPQhANJ9xgG9gKbSdrukxQvB/vBJXdkpFEohU2/VwWgcKN4dLOLPLgtJpWnRh8K2CJjA8QR7oR9lVjExWqR+IVsS+lIcBi8Cvq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQh7LtdH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQh7LtdH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43770c94dfaso582029f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772097862; x=1772702662; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=keY+cW4zUhb09S8chrogSqv2NyrIPeQHbnvEbaTc8a4=;
        b=BQh7LtdHL2amNSMW4ORaJ5/j1M4B8Ipo27Iy3Z038/56qCVlltAakg5NbJ/OePnCtJ
         +gsYWDq5d9bcW3MZsJQ9WlzK3P7+VymOyuVIF1PSpSKW9n33+8Uizr4hT37E1hzIuRCl
         FfC5OVS13semNBYWzkoPZWX5cK7Av6LUKklSq7BE5dWaem6L5ori1lZP57Sy256T5Lud
         Pb7ZjgaK82TWFkqC1Ywre07uqXeRP4UiH9lF6MwrzG7lJ9UwWE9/J1DXou+1+f3Jx5Ba
         Zwx9lOa0zZt64399l+7TrBHiXWFN3TjTiSWvxVJYqBwhDJXf6zv9tsPewFNAaZBAxlVi
         zfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772097862; x=1772702662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keY+cW4zUhb09S8chrogSqv2NyrIPeQHbnvEbaTc8a4=;
        b=diie0m1H2N9lHsU1uzgPLjQy/LiFnhg+5gPbZitO/+W8JtYKN8h/qEuY/FVkOsauje
         Yr2WMucSYUNDXDHSzJIRtwMRRgdz+xThLKVaBAweBZwB5ZZKqWcMCaCn1YGAUe9MA9UM
         +8SkeT3b34Q35AIIj0TtUCmhjM27R2mtopvq52zqhMXuGsfu20fmje8q6DFREiH+7TdF
         l4MFfF74YeJ4TjnFnR8b9nfXCMSKh1uMwaFEoJqFJB6cD1HNrpXiloLX7UhxsHJP3h1I
         ze3eo2VLcY4P3N4TnMi8Ym8nNlhcvzp5pecXHT7esm0jjoZnJt0kLN16EkIBplRguNJQ
         cfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNeSaJo7LYsWfcCoJkHbp+BnXCauNa/4G88zdmO5Z0K6p6NbPnTBbgMIgnJwtAON2U15BAcxfP3whJNoIG@lists.linux.dev
X-Gm-Message-State: AOJu0YyPwpBpTOF65NVOrGxd5/VG+AmB+mOEIkgMyy3cZr46SHu65UiK
	8r3RfomorM6cZKRFXEt/KQzVGhp0yiFRak4sYvDuKIhtnwFo5bDCwaVotExutY9VSAA=
X-Gm-Gg: ATEYQzzjrKkXbxi0c3I3ESnxJp73lBACrV7XkzvoVln+G6ohR6osKF7vHrM9zhEchG/
	qHyg50i/HZwNmwPDvCtL5gPEKCY0vHBaFfKnyKvCZgZ6gcS+zjdsvAq715rwjKL1NKkNRmdh6gF
	UAvja+72X0/Jsm0FAAdGozVZ17OF3XIJU84iypZQRNLjt6Hsyy143nHicYG0dmSRMFtUvSl9luf
	pkX4TK1ap2qjMFwwAP16PReDABhEoQeyVwLtlubgCYwVnS0NiGn7WuWTpgA4JsxLmBPclopruwZ
	3H/uM2xZ22nr2q5AUqM9DMojRGW93zzvcV9g/ZvtUdztdOPjzkzc5Wl6gHq6dTo/9y8ycwAS5S5
	heczI3gRg9m15BaqdyD3liLsy4yZ97f1m73eABhItnVOB2Z8B5C0BdwqCCcIyIFxy/MMNUyFxwv
	Osz5OL441cSKKUUsdJ64hJs3jekWTt
X-Received: by 2002:a5d:5f50:0:b0:436:216:98d8 with SMTP id ffacd0b85a97d-43997ed6f02mr2704213f8f.12.1772097861652;
        Thu, 26 Feb 2026 01:24:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43990c38516sm9854266f8f.30.2026.02.26.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:24:21 -0800 (PST)
Date: Thu, 26 Feb 2026 12:24:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace comparison to false with !
Message-ID: <aaARQl9x2X5iQrTD@stanley.mountain>
References: <20260223170708.9627-1-mariyam.shahid135@gmail.com>
 <2026022410-upswing-gurgle-532d@gregkh>
 <CANhxO_ghHJz-MJrZWHaqUL8uiZyrHZ=RcM5ytvxiALA_5Cq4zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANhxO_ghHJz-MJrZWHaqUL8uiZyrHZ=RcM5ytvxiALA_5Cq4zA@mail.gmail.com>

On Thu, Feb 26, 2026 at 02:13:49PM +0500, Mariyam Shahid wrote:
> On Tue, Feb 24, 2026 at 11:11 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Feb 23, 2026 at 10:07:07PM +0500, Mariyam Shahid wrote:
> > > Replace comparisons to false with their logical negation
> > > to fix checkpatch warnings.
> > >
> > > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > > index ebe73abab892..0192543cdec0 100644
> > > --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> > > +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > > @@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
> > >
> > >               rtw_ht_use_default_setting(padapter);
> > >
> > > -             if (pmlmepriv->htpriv.sgi_20m == false)
> > > +             if (!pmlmepriv->htpriv.sgi_20m)
> > >                       pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
> > >
> > > -             if (pmlmepriv->htpriv.sgi_40m == false)
> > > +             if (!pmlmepriv->htpriv.sgi_40m)
> > >                       pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
> > >
> > >               if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
> > > --
> > > 2.43.0
> > >
> >
> > This doesn't apply to my tree as someone else sent this change before
> > you and I applied it, sorry.
> >
> > thanks,
> >
> > greg k-h
> 
> Hi Greg,
> 
> Understood, thanks for letting me know.
> 
> Could you advise which tree I should be basing my staging patches on
> to avoid conflicts like this? I had been using the staging-next tree,
> but it seems changes accepted there aren't always reflected when
> someone else sends a similar patch first.
> 
> Should I be checking linux-next before submitting to make sure a fix
> hasn't already been applied or queued elsewhere?

Work against staging-next.

The other patch was probably sitting on the mailing list when you sent
yours.  It's not a big deal.

regards,
dan carpenter

