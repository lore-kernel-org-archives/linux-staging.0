Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610FD4AEE2
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142260; cv=none; b=jb+hMtVk2+ckJSoXFO8qSe+FqCoCcE646LmZiI7vsgeuqfRMeML1pXDiD2/0Pm2npEKMEjfvmUZVnH24mG2Qbvh4tQDx4iPsROEUbGwrGXC/BJ7ItJoqjhuunw/l2rZOTzxjrXMN81xjAZ+uLVE6lLXVzsGdlGq5hpkZbH9e3yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142260; c=relaxed/simple;
	bh=vn67jnrcXDL2Y7Uu/c/3XWuBZ3gr/ImeBq5pl8zrkgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2kVIeVtsWYcOZ5QDj+tn5yPBpwyISAfxmO/0YIQZFLowSTxSmE6m7+l5d7unWQJtsJ6sGYF5LG9WQEa3oTRuufv1WcTVTvQvfynPY/JDEwXJenIzm7SqtFelv44C5fROhcpyaX+1zazhK/PifpTRnd9eW3EY7jwTT2mV8xHDmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pBXX1R8v; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBXX1R8v"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4270a3464caso2982445f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761142257; x=1761747057; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vkLs9KoLLMdMCW70UI4iz7uHdABAQO8YgtAVQOgKTXk=;
        b=pBXX1R8vC2c4p7Lw+0DrO1WvhQ1C30cMklf2Md7rb6wkb49VsE2CTF3HpcJ6tVQACw
         emlgRwGHW/g5oVALtmIc+rtkeIlgK3U3pFC02WC8ixSqg5sAxHZauXL7WfXqtndD6uan
         DUfOedEDsdQe3Gx4hDxjQW40y9jcoyARHkVFzrUP4zRuL50ZctMt5DF98BXGvsBAIu57
         +6raTLU1y5Mxpl4u6ffNSB1ZI3N8hA985KveWICclDYDbQTMkux7nGzmUeONEVeUcnXK
         lD/UgdZmQVv/782abrW5aIEsIA+bsrfnhiBSGqenXro1fI7oqeginqvVOn2a8gC8iBUL
         I0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142257; x=1761747057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkLs9KoLLMdMCW70UI4iz7uHdABAQO8YgtAVQOgKTXk=;
        b=F0SU8F2V7UaCX09/waNwWNM3HrlFMifktXWA7YjbIJabVm0k+3JldXEGnBJKj91uNm
         /DvuEHMXiNdg/fPvhazLanGXAfEvhRDqW2RijEOGXVDh4tILLHu2a13J09x7uJkVCFSa
         Vt+5zIwwlPvZR+hPJGr/G+6LDWA9jC+jRMDFdxDvTk76VHMM1/k/Zd2gNMySGsposvEv
         OTe0jhhr8FY2Z8isxHxFTlhWFd/XvIxZgC14sGR9E+iWDiO0Tn+HBnzBun3LUJd/Wt21
         O8jvl+JyUb5cq1vnzd7ZTTbkYrWfuOcTK6t93G1zMMgJejNE3BvZWWzLEspCYyLB6YjS
         yADA==
X-Forwarded-Encrypted: i=1; AJvYcCW2vC9D4q+2g0adxy52FWUYb9Hv7fXvIOianISnpzrwP48pKbzPNQPEbCo0MTH/d6gfuNa8sfkdAnZZuMys@lists.linux.dev
X-Gm-Message-State: AOJu0YzrfjeJDuqs0zassPfYLSAn/D2K48bOiiBcxiAQauI2bGqM1MFn
	P/81wrmzpPN+opQWtFgcnPNaso/ialM6EeRmjkhBfz6+exdmbVFqG5WvRuQSGaOzPTo=
X-Gm-Gg: ASbGncu3YkVto43w5P4//XPjgKAel4qujQPpi9ANSDzNPCzWitUeOkhvOswSumZ1m06
	wD1g7IuTIdadI3A/tWDZf6Om6ZuyBlocjWZ86J4uP4/iI8bhaOaKtkodKjRyLy+jTqCW3YvjmVa
	nrKnaR6Z7ZAs7vrqpEKd5hZ2sKxWDE1zJk4xB1uVieRwZFEVgEbUhzr4a2ffSHYpzOzDIMeVxqI
	tPw/dbqfKsuznKlw+0D+Zem8JFPRELXREUxnnnFM+NVg+qMKM/PQqjGd0/ltHqVC5pLgbxpLIPa
	jhQ/Gqo8/BLT2lriq6b83yOBTfY72jlYlr7KAIKezqUN2b7GDuiT//40E2wnas0yoNfBcXyorBL
	1TwwAtY73nShhE4vA4wX/YKUUOAIUBO+YTrmQDKvD3HgSiX4Pyb2MheNBc3MUDnRLu3BbDMO/SG
	jGtIUwL3L7/h+uWNPXB0KJHPT2pMA=
X-Google-Smtp-Source: AGHT+IE6akp/2Dc2iEjje5ectRAOzvnt5Fnjh0DmNxZXmwTBAAK6Oke63zjnbBgDMPvQctvH8W4krg==
X-Received: by 2002:a5d:5849:0:b0:426:eef2:fa86 with SMTP id ffacd0b85a97d-42704d83873mr14817512f8f.11.1761142256609;
        Wed, 22 Oct 2025 07:10:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3c65sm25232989f8f.15.2025.10.22.07.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:10:56 -0700 (PDT)
Date: Wed, 22 Oct 2025 17:10:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
Message-ID: <aPjl7G7fmvqtgww1@stanley.mountain>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <aPjIJw3ahPxnDE5Q@stanley.mountain>
 <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>

On Wed, Oct 22, 2025 at 07:22:49PM +0530, Ayush Singh wrote:
> 
> On 10/22/25 5:33 PM, Dan Carpenter wrote:
> > On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
> > > diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
> > > index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
> > > --- a/drivers/staging/greybus/fw-download.c
> > > +++ b/drivers/staging/greybus/fw-download.c
> > > @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
> > >   /* This returns path of the firmware blob on the disk */
> > >   static struct fw_request *find_firmware(struct fw_download *fw_download,
> > > -					const char *tag)
> > > +					const char *tag, const char *format)
> > >   {
> > >   	struct gb_interface *intf = fw_download->connection->bundle->intf;
> > >   	struct fw_request *fw_req;
> > > @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
> > >   	}
> > >   	fw_req->firmware_id = ret;
> > > -	snprintf(fw_req->name, sizeof(fw_req->name),
> > > -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
> > > -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > -		 intf->vendor_id, intf->product_id, tag);
> > > +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
> > Change this to:
> > 
> > 	if (format[0] == '\0') {
> > 
> > In the caller, the assumption that format is at least
> > GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
> > doesn't make sense.
> 
> Ok, will do in the next version.
> 
> > > +		snprintf(fw_req->name, sizeof(fw_req->name),
> > > +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
> > > +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > +			 intf->vendor_id, intf->product_id, tag);
> > > +	} else {
> > > +		snprintf(fw_req->name, sizeof(fw_req->name),
> > > +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
> > > +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> > > +			 intf->vendor_id, intf->product_id, tag, format);
> > > +	}
> > >   	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
> > >   		 fw_req->name);
> > > @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
> > >   	struct gb_fw_download_find_firmware_request *request;
> > >   	struct gb_fw_download_find_firmware_response *response;
> > >   	struct fw_request *fw_req;
> > > -	const char *tag;
> > > +	const char *tag, *format;
> > >   	if (op->request->payload_size != sizeof(*request)) {
> > >   		dev_err(fw_download->parent,
> > We have changed the sizeof(*request) but we haven't changed
> > ->payload_size so how can this ever be true?  Did you test this change?
> 
> 
> The request originates in greybus node. The payload size here is calculate
> from the greybus message header. It is not a hard coded value. So as long as
> the node sets it correctly, it will work fine.

I guess, how was this working for other people then?  It seems like a
behavior change.

regards,
dan carpenter


