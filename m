Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2C13A7F45
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214128; cv=none; b=T/1x4QUpd81/MQSUs/lBWA2hcxet/jhaxfd3m41RxTrjX9A+I+YeJeUhBb5C6yR5P0IHeKBd9AVwWzDacJQsLphqKW24CHAhH1TayhvqRZJbROEkqXN86dPfel+8SBtQLOQRmhmkVBGZjIvYbUUOMKWMAEpUOt4F4LQYO/6NIK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214128; c=relaxed/simple;
	bh=QF5kDQltvHnelyFQ2XXSpwWvYjyUK+bwS8EzLEwr7kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gySmqL8NL8F7+actyK3LrRYZg/A6GTRGSMG8L6w2U5yVxfTubISXNRIbo9RC+9bN2I0L4TfGEp2CRRN1GnzIg+2RLtEEHqsKTjwx7lB+2YyvYuyGoxGPNhc1pJghWZ+o7IOUGEZwPSNXoFD4jvG9+HRk8rvldc8k0zE8sS5QdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7LGXmnj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7LGXmnj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-695f539fc8cso1439598a12.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782214125; x=1782818925; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OmVTQzEC4BC7sY4y7IjkRDzK1xYASE5o0hI3FVU0Vo8=;
        b=s7LGXmnjErreK7ggeZ7HKJM0nkkdU6kA7sFuW4JtCezOyNyJoK9C7lBY8muHjuqrB/
         Sl+BtzWrggChgFAdEA7wI80Fs6tMYlPIx+gb0j3+WeyZkNns68iMNJawFiaAHZWRAIeE
         1vDQMufUC/XAxs7xYfhOup0ykwYvCTX3xg/u+N/K/LGLxWgkXpXRcdaOwOTJ83lXVjSd
         i08BZuow3OX2fsU0CeEQpnTXbDFZ+wR39xha1j2LEhST8wTOFR3vXy0XY/6E/QpXxJx/
         OlRXTR1+WRUpsw6oQfgEcnv0tY3gx3CcMJJ0skmpEVps/hVDNudLTXLgGDQJNJj7h1X2
         kocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214125; x=1782818925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmVTQzEC4BC7sY4y7IjkRDzK1xYASE5o0hI3FVU0Vo8=;
        b=FnH+/Rb5HEWvNo8JssQzTmE3P60a863BL+HO1zaiynhEjNNZfIxWDlt2lsC7Tvfk6r
         2tcBiIr0Sz5Xsd6Je3FdxNSdmDFztZgi44TT2hh8dgirkaweSCri6u69mImHSxpZwbnn
         Zwwt4Fnj1JGZEJxMydVnyTUIlX/i9wIsx5XrRvapVXOt257oM8wzpkSbeY+MfFpd8pnu
         sB1adVQE4CQ5FoakbhGXuzO8i/ABkuC6KC8+Cp3Ff+AdDikA/bnusNHCypqrWM/+Cxyp
         CloIcSiBZjzwAn33O5DXyhu2PLuxoiCsMqwn2WCLiJ4oR9Nm2KpQROJtbvT0Xag0jIPc
         vuzw==
X-Forwarded-Encrypted: i=1; AFNElJ/nskuz4qT2waJr9KJcwzZiEcRPapM8NlWzvY6EcETmhOJN5RM4tX9RvInK2tHrmBwmSDF/fp7WzCIWkNt4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1qDh7Z5Yy6IUSm9xMpgVpL3lkjoYN03DSIzR08OTw2fjRtXo6
	Vv5vYflDcpxtlVcmS+jpqro6IjJzf7V+ZGDMsv1Vgrko9IMCzYpRgHUm
X-Gm-Gg: AfdE7ckX9yA4RmTsRnZ1pJ5jW4RVHlrkNi11aPDUum9rYY4YbuMm3HF3JeWWPeQOWjI
	ieHzhaJi8Bvx3AlWMP7hBk4CmiPWeYW8QsaANGDdm227IkT+8b2LQDDYgpHfH4DZBp7oaKBGKKZ
	6oGFBqIiYY3Ic4G0cJqNHlURjQuTGeC4WsN7773m5gOawGNkTzWhL3GpNMmULin36qs5s8BBJLD
	i3Sz635Y7QoBluPYfBT0aT241GFI8AwSj5VHr7H57UbTHXPcI7lyoua1PfBVJaCWQqipeVLdb/f
	Vvk9DSvYDFvHgDdjUI/QSKjKVrN2GPRxx0NTV7MpyqW/mRxdu32sxnlvdUTzSV81u89gLIAp8J9
	YtgVBcGM/0AxUIBLUExD5FKZTrcY3/EwnGnisJNqIKOwrDFnX4HEnaeXdEs6mlnoyNo8728k4/Y
	QEMuwbpmtz
X-Received: by 2002:a17:907:bd81:b0:c08:33ca:4cc with SMTP id a640c23a62f3a-c103158cfcfmr161786166b.30.1782214125196;
        Tue, 23 Jun 2026 04:28:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49b77bsm494300266b.2.2026.06.23.04.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:28:44 -0700 (PDT)
Date: Tue, 23 Jun 2026 14:28:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: bruce ou <oubruce1234@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warnings in rtw_efuse.c
Message-ID: <ajpt5G71ap5Vzk5T@stanley.mountain>
References: <20260623075507.6157-1-oubruce1234@gmail.com>
 <ajpQD7LyfKNopii6@stanley.mountain>
 <CA+h2PQjd8D7yiF8N8R-FwtTFfT7gJH-z9jMOA84esykGP4J+bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+h2PQjd8D7yiF8N8R-FwtTFfT7gJH-z9jMOA84esykGP4J+bw@mail.gmail.com>

On Tue, Jun 23, 2026 at 07:25:55PM +0800, bruce ou wrote:
> Hi Dan,
> 
> Thank you for your review and guidance!
> 
> I have switched my local tree to the latest staging/staging-next branch
> and squashed all the CamelCase local variable cleanups in rtw_efuse.c
> into a single, comprehensive patch with a proper commit message.
> 
> I will send the new patch shortly.

Not as one patch, but as a collection of patches in a patchset.

regards,
dan carpenter

