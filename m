Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2955287519
	for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691789; cv=none; b=VmDmKJh9VuTN0PIJLomeUpS24tECEOdKg2ii6MG5z358ula25w7tR9jmGqp4HwjzOIcsVBLEPrnXYc6cSSKxJyYZNAkZTPOhUmic8+Jztz95ZXtZr85GXkpl1xio0Ulg2EpS0BgC9h98XnNdrrgtT4IRfW7s3qToNEXZ4OJGWGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691789; c=relaxed/simple;
	bh=tTps1bgZeMgIyRyJgAf8j1ySEUwFTEFRO76HEfCVNHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4bo7DaQyjdW5SntuTKDnNIsR4w96SPwSqeHhKGh1/iVCPIOcnQSjMJ6wvEpr051n4Ax9jKY/9UDgY90wjOk0Um0jt3JJZg/0Mu8GW7bEuAGhmKYJGaAlekkSBetx4XeTO+k5mMcz8kaCkBf+5ontakuABPguYaKKZyV/PBSzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+lt/fmG; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+lt/fmG"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-739dcdb012fso1171973a34.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691787; x=1751296587; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IukKYGwsGkuNIehFQ5uVE+/NktpdK3jn5Mck81hCcc=;
        b=R+lt/fmGoa3mwrIuKphWWhj5MnhwfIWRoEhVdzTwvIsjdpd0YQnvV9b42Y7cq4a8OC
         wAOlhET9KNjSY6T/toH/5VZH4wOyy11WXxHTxwYMfEB153qYzUANo9xu1QISqlhmhAMR
         L0KQ7liNVEBmNHodIDcmHYcVpncN4piMdr18oadIkdPAp021PHmo+PXsFDz1tZo11DPn
         YKoS0xJskV+BBfgJ4hOxG6KBCeX5V6ZceE58G4OjqOwitMLFxlNEt7dOgIMTFDjpoJDP
         PfORtq8qtqHsWRWGf10RZKzqHQJ00JNHTp/QrVaeqqqN3CwFHkBD509ADM4elKKfjHtj
         O0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691787; x=1751296587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IukKYGwsGkuNIehFQ5uVE+/NktpdK3jn5Mck81hCcc=;
        b=MZXNw0+KpTKMNNKu9VP1uaVy6oeBwTGpxBpSFx7PW43BuymkIRuOj5OFBpckLL4KMH
         V15jSHWbFyxdO8K+MAVAru6ehf3h/7p2YO74/kedwIULn81iXVFZAvEBU98eIhEBQT/J
         HiwP3Z0EpiT1i2T+nGZTctMty9ydwY67++1H9JZ7ZJqEb/bzfBDSJ1cmiBN2WwDLw0s9
         f7rVBrEN0DK8sQ/kr9RjN3AxZ6ODOrFIZ8Ek+c9UsLpxLGyyhu+Dw3IDa/d89DlddUzf
         bjsi12VnFAV2ttVLynR0+c/nUbhual8HCRWtxyldd5XxQKhZfFOX+XvsZcXdUOiWWb6+
         HHJw==
X-Forwarded-Encrypted: i=1; AJvYcCWeF8w0PQXGkbs06fysAf/B+eWtbikKsx8NIP5hbnp2yOH72JxXmrMenjpUzb5aA4k9SyxHts70CqZdikrp@lists.linux.dev
X-Gm-Message-State: AOJu0YxeqB/js1pTBo9pgkameasau+KDW94FaLirhGq/bn9c2paC062c
	XTDltmApDcZkXLdv7TmXsKceQKvBEyxRSy+iY5frnRvqJC8Ro1e8bTfr7qBv58wFEtM=
X-Gm-Gg: ASbGncsOthPP0tejLNUKimX00+BJGlz1paAZmzeAolXqLEVi3eNCCh8sKAlaApYYzgT
	mbPAG2bCEcfNvbbUm7DlKBvRIZ9e94IguGNKL8AdiV0Tc+SAuBllrNeA2v9Ig3ljww8LOORmcML
	IgUKuY1LNJE54hZS4gyV/sIF/6Paev1CvQ6uIlJ5nziDn+uG9B7xkKnUMG2eXyEoCmaJ3+cBGcV
	K9UeLsjo5yOyxiBFh1KAtopy8RmjtMf6ZauAvY5fIojc1Piu2x0FGjgbJJ6b5+hLxN4nH3/LdPG
	+tpRqvQ6upSinQT4bP6/dM4fKnZ1Kf6B1vNDruqnMJTZ+BkIEvj5HhilPLPbn9uEdyk0qw==
X-Google-Smtp-Source: AGHT+IHlbM4+Rmaq6vOY5wWyrfoXJ+idmbhQ0NYlP+olIKnC6D1vqqLXRsoxiZ2zwA9HYjiRRt9rYA==
X-Received: by 2002:a05:6830:6991:b0:72b:9d5e:9429 with SMTP id 46e09a7af769-73a91aeec81mr9759609a34.12.1750691786969;
        Mon, 23 Jun 2025 08:16:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90b33b17sm1466219a34.30.2025.06.23.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:16:26 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:16:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kisub Choe <kisub.choe.0x1@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep(1)
Message-ID: <a775180c-3ecc-4fb9-bd8f-9f8bacba94f9@suswa.mountain>
References: <aFdAEM6GnCudvqMV@zinc>
 <efa56904-eabf-4493-b064-652d02839c6b@suswa.mountain>
 <aFlmL0DtydfsbFl0@rpi4B8Gs>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlmL0DtydfsbFl0@rpi4B8Gs>

On Mon, Jun 23, 2025 at 11:35:27PM +0900, Kisub Choe wrote:
> On Mon, Jun 23, 2025 at 01:54:01PM +0300, Dan Carpenter wrote:
> > On Sun, Jun 22, 2025 at 08:28:16AM +0900, Kisub Choe wrote:
> > > changed msleep to usleep_range to
> > > 
> > > Adhere to Linux kernel coding style.
> > > Reported by checkpatch:
> > > 
> > > WARNING: msleep < 20ms can sleep for up to 20ms;
> > > see function description of msleep().
> > > 
> > > Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
> > 
> > This type of change needs to be tested before it can be merged.
> > 
> > regards,
> > dan carpenter
> > 
> 
> Thank you for feedback.
> I understand that this type of change should be tested due to its impact
> on time-sensitive behavior.
> However, I currently don't have access to any device that uses this
> driver.
> Please let me know how you'd suggest proceeding in this case.

Just leave it as-is until someone who has the hardware can test it.

regards,
dan carpenter
