Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7282D9A
	for <linux-staging@lists.linux.dev>; Mon,  1 Jul 2024 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719843723; cv=none; b=WbrNN0IkvWAuDvOxUFfSxBFd3uIQeEvWFU8DiTQSbgeFGAhn3pys+yqWIAWPGFaeSAUjZesk9GGLWU3Qsgqz1kXDBMnaoh9UbivpeC+0amn7f8BJe+8as2F/GjxZNIen9Zu+rhLjxFiCR8vYJKPni02Tct4gjr7aRmdGgjFrTas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719843723; c=relaxed/simple;
	bh=LxtuEpJdzPr3oQLvmbS2EaRpqRT1WsjVufXNSet/JJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZ86BIVKQRQZma/pjPwQpspROyKcwF84ssN3AvCx6qDZ9xIOZKsvAjs9YsN6Cujdw++95ZuEor0ihqxCxq6WER/5tNz1VMX6j8AGgIkir/rQrjkZTNLrn0/9Rzr6+oDW4nR5Zfsak0rOxKBp1l42T1+A3MlcODDAmPKoghQ0zbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSmd2vgf; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSmd2vgf"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5c21a17760fso1370866eaf.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jul 2024 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719843721; x=1720448521; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K03ObKsb30WbBMyJmbDqIqKU1C0pbAUrdm8Q0M5cO7E=;
        b=VSmd2vgfJt65LIyMnFT3tIAVel1lRz5kmvVccAhESTUqgtj0fdnWE/dJuyaucBz2HQ
         sAWneqa0R2VlLUQvrtUehoTtx+sUdwQCZQ05B4f+l70yeeJd+TPvO07cvdWnkwBIIIE3
         lLVhU7ieHG7eZBM25gb7uJja1ylf+bn9yVWvP34r9EnzX6U4Hyne81d9HT0nSTqUJDnI
         FKgHVCTPJTvxFBIsDpJAHM0U4CU4KUob5qQ5Lsk2cSt09cf8UgL46ewX3nOwBdw3U1SM
         mFyC5kfOWcLjPc2rnPzyj5XFmIa4bWcikB8POjRFY9RV4wvGk1ziqrPToCz9WjbL16ll
         zxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719843721; x=1720448521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K03ObKsb30WbBMyJmbDqIqKU1C0pbAUrdm8Q0M5cO7E=;
        b=OrSt71C+pqkTmijs4B/GPHBMpCLtN1LpmBhpnrpc81aVrp19nmTDQ3U1LacbhxVDNA
         o2JVXVyRn3//8BO70A2PN6gPBU2lyMLEW+ELNB7Vu8RR2dj5lJ2s/3K1ygMkSBDNL/4X
         Ei825HdpL0vq2edyZF6wPMQnBE+b7Cmd/nzzWk6xN7XxyR6X7wRR0XoGXbpxV2XYuaBP
         WPKxyDN7cGyn5eU+dmpFvwl8Sllb6rXEZGpJqsa0YAMf2FJrNdgbNEcCqRyjgBFDE9eQ
         VMFuAkaUNjV+0sruXapZjP/9EujBJ9bT9ZrVT5l9WcLyiTmm4Q5d00hPDbPI6uKjyr2e
         LyzA==
X-Forwarded-Encrypted: i=1; AJvYcCXiAw9KUvOZXybQdf4UZICmme+TcZ1b0HtAGPe3J+qn9u9vsZSkJBZzu2cGYlaLVRATQjno/30vCSF/MgQxiZLwch+K3wvsaE0UuY/ukA==
X-Gm-Message-State: AOJu0Ywv2wFa8Z7A5BMQpOxyp1mn56geYfpRInclTAwSePd4ocyM+S40
	5Qxj0fe8oAEk0+WurLkqDDIHUS0YpGCs62ShCDsChdFR+XPnw68DsGq9Jsc6+k0=
X-Google-Smtp-Source: AGHT+IElmVojqqFPd7WLZo0rySoK5/PWWVDrfwUNFIIu56dR1A+tJUy5Ehoq4+320Cw3qTfUiDaGJQ==
X-Received: by 2002:a4a:b246:0:b0:5c4:4787:1d4 with SMTP id 006d021491bc7-5c447870301mr3948738eaf.5.1719843721139;
        Mon, 01 Jul 2024 07:22:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c414835d09sm1028326eaf.11.2024.07.01.07.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 07:22:00 -0700 (PDT)
Date: Mon, 1 Jul 2024 16:21:58 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Martyn Welch <martyn.welch@gefanuc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] staging: vme_user: Validate geoid value used for VME
 window address
Message-ID: <d5ac7346-f8ad-43b7-a794-9b7a55fedc3c@suswa.mountain>
References: <9ccf4b68-acd0-465b-a5dd-4aa4569da9ce@suswa.mountain>
 <20240625095804.11336-1-amishin@t-argos.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625095804.11336-1-amishin@t-argos.ru>

On Tue, Jun 25, 2024 at 12:58:04PM +0300, Aleksandr Mishin wrote:
> The address of VME window is either set by jumpers (VME64) or derived from
> the slot number (geographical addressing, VME64x) with the formula:
> address = slot# * 0x80000
> https://indico.cern.ch/event/68278/contributions/1234555/attachments/
> 1024465/1458672/VMEbus.pdf
> 
> slot# value can be set from module parameter 'geoid' which can contain any
> value. In this case the value of an arithmetic expression 'slot# * 0x80000'
> is a subject to overflow because its operands are not cast to a larger data
> type before performing arithmetic.
> 
> Validate the provided geoid value using the Geographic Addr Mask.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d22b8ed9a3b0 ("Staging: vme: add Tundra TSI148 VME-PCI Bridge driver")
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
> v1->v2: Move geoid validation to the probe() function as suggested by Dan

Yeah, I think this works.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

