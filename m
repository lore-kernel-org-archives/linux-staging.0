Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290F3A1CD
	for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724519397; cv=none; b=rGdtyyp/voInWmdj7/jwDLotp275A10sFubecGKXVpIWsY38DHWDpf/J9cfi9Tn/LcaHH3sPZjGGfoWLul4xguheJTx7vb8VcZqV9J+dg9CKDnBNdWx4q6jMOdIULx0IqIGoN7qWhdm9uOxkkNHtCBL/n/V6i9gLLJ5Rv28EqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724519397; c=relaxed/simple;
	bh=La036WycZQy3mqYzLfhylb4KkfjLHAUpK50Cg8o1hp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqdMpUnNMW3Y4JM4J8uUeEwLj+J1efSy61gx4oEQpQcXxSxscQjZFbf+5IZtJ117M+rMBVWIDnK0waZKUb325OibUDtg/wCUNVzzNZ+rHHXZvSTAmtbahW/I/HzH5YSvS6gGpylwxvocJutfqSig+303zErZFAGtuL3rqSiw2ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBMNrf6N; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBMNrf6N"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7141e20e31cso2537439b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 10:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724519395; x=1725124195; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPJk8EyuuRtmKqUwvIeHzU/+eqZnjDPiW4lHYi002sw=;
        b=CBMNrf6NnfVAnPMOka2DvWY0bld/1g/MpExhrMFMouNhaSw7AfheJ6Gg/YK/w4yZ/L
         X3H1oDvr7RHQOzvpXZ++5208FRWt0UYBzgNPtV7o79pkPx9frcoyhYD+fVgjTa26dfcQ
         rd0BG1flQ6hU7i47avhbHf06rDICoxQ6lTiBSFK0hkYzO7DgTmmck4vzUNY0c4/iE+oK
         EFLsZcFrtlyNflSB1ylJMRqqsbqvanRyQCkfu9BXwpmCLh4mbpmRJv//dtmUnIKVegfI
         fPt2TWs9cwfgT31XhZzFjhQWABKU3fC2zGxQDKGs8gPq4bkrZXZOnMn793iy70l1q2Sc
         Duig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724519395; x=1725124195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPJk8EyuuRtmKqUwvIeHzU/+eqZnjDPiW4lHYi002sw=;
        b=LZEl/cSB1lnjfocS6D311Fv43LPxPSyo3tIu/rlJ59DX9/Dm+/RJFwKh9vsh8p+iYh
         ekORZ4S3diDJ5NFPgYzyIny+CwOhLNiZ1KkHRjVkwzCOsqKDkMICyTGsa/U3u/QeeCrx
         PZez623b9WQ3rzoULhmhjB/Iq8/kJLmtNL5iPBL+sEa5zpt2V/UX1NxzWVwyTVP4lpf9
         YIHvPUXh3p+5VWxv6QaQ2UXw8m1Qm4gmN47TLYupwjgudKxXgO/dGUkBfFqMf7xZqQii
         zfdfyTdx2ebuzSk0ewR02hLWothHbMX58VOp01kDzN+rHF5OGuPG4g/s5fzG2uYEtHn8
         qAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5/uRgUt0tWFRwWiweshXAMJwt9f8oAh5x7dAXRSDCbh7qHzm2iCRA6HuCjxo7xzpZdov//ukdBacy1Kj7@lists.linux.dev
X-Gm-Message-State: AOJu0YwQTxwlNnhn0d95JhM7jossRnfVeLaLq+Vj9YyBtvmc4c4qySiv
	ZkSv4EktByo0VFxx8ieYFkRxiWMhQKlcqICsrd8SpnQqi8x82J8K
X-Google-Smtp-Source: AGHT+IGsTpC0pTthXoZnHjqhn53xX6WlH/J3bzT8ObofnPMW8MYz5akRV1EXCigvl6F1amd2VZsX9g==
X-Received: by 2002:a05:6a00:3d10:b0:714:2069:d90e with SMTP id d2e1a72fcca58-7144588dea4mr7293669b3a.26.1724519395389;
        Sat, 24 Aug 2024 10:09:55 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.233.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143422ecedsm4714403b3a.25.2024.08.24.10.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 10:09:54 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:39:49 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com, christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in
 rtl819x_translate_scan
Message-ID: <ZsoT3eQq6muDPh5Z@embed-PC.myguest.virtualbox.org>
References: <20240823153411.74142-1-abhishektamboli9@gmail.com>
 <1c640c3d-c5db-4eb7-8a22-6d9886a1412a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c640c3d-c5db-4eb7-8a22-6d9886a1412a@stanley.mountain>

On Sat, Aug 24, 2024 at 02:21:47PM +0300, Dan Carpenter wrote:
> On Fri, Aug 23, 2024 at 09:04:11PM +0530, Abhishek Tamboli wrote:
> > diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> > index fbd4ec824084..ec0c4c5bade7 100644
> > --- a/drivers/staging/rtl8192e/rtllib_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> > @@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
> >  };
> > 
> >  #define MAX_CUSTOM_LEN 64
> > +#define MAX_PROTO_NAME_LEN 10
> >  static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  					   char *start, char *stop,
> >  					   struct rtllib_network *network,
> >  					   struct iw_request_info *info)
> >  {
> >  	char custom[MAX_CUSTOM_LEN];
> > -	char proto_name[6];
> > -	char *pname = proto_name;
> > +	char proto_name[MAX_PROTO_NAME_LEN];
> 
> In the end I think we don't want to make this buffer larger.  But if we did
> this define is really vague and slightly confusing.  I assumed it was something
> else when I read it.  It hurts readability.  It would probably be better to just
> leave it as 6 instead and add a comment.  /* Large enough to hold "N-24G" */
Okay, I'll revert the buffer size to 6.
> 
> >  	char *p;
> >  	struct iw_event iwe;
> >  	int i, j;
> > @@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  	}
> >  	/* Add the protocol name */
> >  	iwe.cmd = SIOCGIWNAME;
> > +	/* Initialise proto_name as an empty string*/
> 
> This comment doesn't add any information.  Every kernel developer knows what
> memset() does.
Sure, I'll remove it.
> > +	memset(proto_name, '\0', sizeof(proto_name));
> 
> Normally we would just say 0 instead of '\0'.  The other way to do this would
> be to initialize it at the start:
> 
> 	char proto_name[6] = "";
> 
Thanks, for the feedback. I'll do the changes.

Regards,
Abhishek
